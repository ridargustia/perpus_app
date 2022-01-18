<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Bagian extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->data['module'] = 'Divisi';

    $this->load->model(array('Bagian_model'));

    $this->data['company_data']             = $this->Company_model->company_profile();
    $this->data['layout_template']          = $this->Template_model->layout();
    $this->data['skins_template']           = $this->Template_model->skins();
    $this->data['footer']                   = $this->Footer_model->footer();

    $this->data['btn_submit'] = 'Save';
    $this->data['btn_reset']  = 'Reset';
    $this->data['btn_add']    = 'Tambah Data';
    $this->data['add_action'] = base_url('admin/bagian/create');

    is_login();

    if (is_admin() and is_pegawai()) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak masuk ke halaman sebelumnya</div>');
      redirect('admin/dashboard');
    }

    if ($this->uri->segment(2) != NULL) {
      menuaccess_check();
    } elseif ($this->uri->segment(3) != NULL) {
      submenuaccess_check();
    }
  }

  function index()
  {
    is_read();

    $this->data['page_title'] = 'Data ' . $this->data['module'];

    if (is_grandadmin()) {
      $this->data['get_all'] = $this->Bagian_model->get_all();
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Bagian_model->get_all_by_instansi();
    } elseif (is_superadmin()) {
      $this->data['get_all'] = $this->Bagian_model->get_all_by_cabang();
    } elseif (is_admin()) {
      $this->data['get_all'] = $this->Bagian_model->get_all_by_divisi();
    }

    $this->load->view('back/bagian/bagian_list', $this->data);
  }

  function create()
  {
    is_create();

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/bagian/create_action';

    if (is_grandadmin()) {
      $this->data['get_all_combobox_instansi']      = $this->Instansi_model->get_all_combobox();
      $this->data['get_all_combobox_cabang']        = $this->Cabang_model->get_all_combobox();
      $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox();
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_instansi']      = $this->Instansi_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_cabang']        = $this->Cabang_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox_by_instansi($this->session->instansi_id);
    } elseif (is_superadmin()) {
        $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox_by_cabang($this->session->cabang_id);
    }

    $this->data['bagian_name'] = [
      'name'          => 'bagian_name',
      'id'            => 'bagian_name',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('bagian_name'),
    ];
    $this->data['instansi_id'] = [
      'name'          => 'instansi_id',
      'id'            => 'instansi_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilCabang()',
      'required'      => '',
    ];
    $this->data['cabang_id'] = [
      'name'          => 'cabang_id',
      'id'            => 'cabang_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilDivisi()',
      'required'      => '',
    ];
    $this->data['divisi_id'] = [
        'name'          => 'divisi_id',
        'id'            => 'divisi_id',
        'class'         => 'form-control',
        'required'      => '',
      ];    

    $this->load->view('back/bagian/bagian_add', $this->data);
  }

  function create_action()
  {
    $this->form_validation->set_rules('bagian_name', 'Nama Divisi', 'trim|required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('instansi_id');
      $cabang_id    = $this->input->post('cabang_id');
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
      $cabang_id    = $this->input->post('cabang_id');
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_superadmin()) {
      $instansi_id  = $this->session->instansi_id;
      $cabang_id    = $this->session->cabang_id;
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_admin()) {
        $instansi_id  = $this->session->instansi_id;
        $cabang_id    = $this->session->cabang_id;
        $divisi_id    = $this->session->divisi_id;
      }

    if ($this->form_validation->run() === FALSE) {
      $this->create();
    } else {
      $data = array(
        'instansi_id'     => $instansi_id,
        'cabang_id'       => $cabang_id,
        'divisi_id'       => $divisi_id,
        'bagian_name'     => $this->input->post('bagian_name'),
        'bagian_slug'     => strtolower(url_title($this->input->post('bagian_name'))),
        'created_by'      => $this->session->username,
      );

      $this->Bagian_model->insert($data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
      redirect('admin/bagian');
    }
  }

  function update($id)
  {
    is_update();

    $this->data['bagian']     = $this->Bagian_model->get_by_id($id);

    if ($this->data['bagian']) {
      if (!is_grandadmin() and !is_masteradmin() and !is_superadmin() and !is_admin() and $this->data['bagian']->instansi_id != $this->session->instansi_id and $this->data['bagian']->cabang_id != $this->session->cabang_id and $this->data['bagian']->divisi_id != $this->session->divisi_id) {
        $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak mengganti data orang lain</div>');
        redirect('admin/bagian');
      }

      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/bagian/update_action';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_instansi']      = $this->Instansi_model->get_all_combobox();
        $this->data['get_all_combobox_cabang']        = $this->Cabang_model->get_all_combobox_update($this->data['bagian']->instansi_id);
        $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox_update($this->data['bagian']->cabang_id);
      } elseif (is_masteradmin()) {        
        $this->data['get_all_combobox_cabang']        = $this->Cabang_model->get_all_combobox_update_by_instansi($this->data['bagian']->instansi_id);
        $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox_update_by_cabang($this->data['bagian']->cabang_id);
      } elseif(is_superadmin()){
        $this->data['get_all_combobox_divisi']        = $this->Divisi_model->get_all_combobox_update_by_cabang($this->data['bagian']->cabang_id);
      }

      $this->data['id_bagian'] = [
        'name'          => 'id_bagian',
        'type'          => 'hidden',
      ];
      $this->data['bagian_name'] = [
        'name'          => 'bagian_name',
        'id'            => 'bagian_name',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['instansi_id'] = [
        'name'          => 'instansi_id',
        'id'            => 'instansi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilCabang()',
        'required'      => '',
      ];
      $this->data['cabang_id'] = [
        'name'          => 'cabang_id',
        'id'            => 'cabang_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilDivisi()',
        'required'      => '',
      ];
      $this->data['divisi_id'] = [
        'name'          => 'divisi_id',
        'id'            => 'divisi_id',
        'class'         => 'form-control',
        'required'      => '',
      ];

      $this->load->view('back/bagian/bagian_edit', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/bagian');
    }
  }

  function update_action()
  {
    $this->form_validation->set_rules('bagian_name', 'Nama Divisi', 'trim|required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('instansi_id');
      $cabang_id    = $this->input->post('cabang_id');
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
      $cabang_id    = $this->input->post('cabang_id');
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_superadmin()) {
      $instansi_id  = $this->session->instansi_id;
      $cabang_id    = $this->session->cabang_id;
      $divisi_id    = $this->input->post('divisi_id');
    } elseif (is_admin()) {
        $instansi_id  = $this->session->instansi_id;
        $cabang_id    = $this->session->cabang_id;
        $divisi_id    = $this->session->divisi_id;
    }

    if ($this->form_validation->run() === FALSE) {
      $this->update($this->input->post('id_bagian'));
    } else {
      $data = array(
        'instansi_id'     => $instansi_id,
        'cabang_id'       => $cabang_id,
        'divisi_id'       => $divisi_id,
        'bagian_name'     => $this->input->post('bagian_name'),
        'bagian_slug'     => strtolower(url_title($this->input->post('bagian_name'))),
        'modified_by'     => $this->session->username,
      );

      $this->Bagian_model->update($this->input->post('id_bagian'), $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
      redirect('admin/bagian');
    }
  }

  function delete($id)
  {
    is_delete();
    $delete = $this->Bagian_model->get_by_id($id);

    if ($delete) {
      $data = array(
        'is_delete_bagian'   => '1',
        'deleted_by'        => $this->session->username,
        'deleted_at'        => date('Y-m-d H:i:a'),
      );

      $this->Bagian_model->soft_delete($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus</div>');
      redirect('admin/bagian');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/bagian');
    }
  }

  function delete_permanent($id)
  {
    is_delete();

    $delete = $this->Bagian_model->get_by_id($id);

    if ($delete) {
      $this->Bagian_model->delete($id);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus permanen</div>');
      redirect('admin/bagian/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/bagian');
    }
  }

  function deleted_list()
  {
    is_restore();

    $this->data['page_title'] = 'Recycle Bin ' . $this->data['module'];

    if (is_grandadmin()) {
      $this->data['get_all_deleted'] = $this->Bagian_model->get_all_deleted();
    } elseif (is_masteradmin()) {
      $this->data['get_all_deleted'] = $this->Bagian_model->get_all_deleted_by_instansi();
    } elseif (is_superadmin()) {
      $this->data['get_all_deleted'] = $this->Bagian_model->get_all_deleted_by_cabang();
    } elseif (is_admin()) {
      $this->data['get_all_deleted'] = $this->Bagian_model->get_all_deleted_by_divisi();
    }

    $this->load->view('back/bagian/bagian_deleted_list', $this->data);
  }

  function restore($id)
  {
    is_restore();

    $row = $this->Bagian_model->get_by_id($id);

    if ($row) {
      $data = array(
        'is_delete_bagian'   => '0',
        'deleted_by'        => NULL,
        'deleted_at'        => NULL,
      );

      $this->Bagian_model->update($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dikembalikan</div>');
      redirect('admin/bagian/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/bagian');
    }
  }

  function pilih_bagian()
  {
    $this->data['bagian'] = $this->Bagian_model->get_bagian_by_divisi_combobox($this->uri->segment(4));
    $this->load->view('back/bagian/v_bagian', $this->data);
  }
}

<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pengembalian extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->data['module'] = 'Pengembalian';

    $this->load->model(array('Pengembalian_model', 'Arsip_model', 'Peminjaman_model', 'Anggota_model'));

    $this->data['company_data']             = $this->Company_model->company_profile();
    $this->data['layout_template']          = $this->Template_model->layout();
    $this->data['skins_template']           = $this->Template_model->skins();
    $this->data['footer']                   = $this->Footer_model->footer();

    $this->data['get_all_combobox_instansi']  = $this->Instansi_model->get_all_combobox();

    $this->data['btn_submit'] = 'Save';
    $this->data['btn_reset']  = 'Reset';
    $this->data['btn_add']    = 'Tambah Data';
    $this->data['add_action'] = base_url('admin/pengembalian/create');

    is_login();

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
      $this->data['get_all'] = $this->Pengembalian_model->get_all();
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Pengembalian_model->get_all_by_instansi();
    }

    $this->load->view('back/pengembalian/pengembalian_list', $this->data);
  }

  function create()
  {
    is_create();

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/pengembalian/create_action';

    if (is_grandadmin()) {
      $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
      // $this->data['get_all_combobox_arsip_peminjaman']      = $this->Peminjaman_model->get_all_combobox_arsip_peminjaman();
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_anggota']     = $this->Anggota_model->get_all_combobox_by_instansi($this->session->instansi_id);
      // $this->data['get_all_combobox_arsip_peminjaman']      = $this->Peminjaman_model->get_all_combobox_arsip_peminjaman_by_instansi($this->session->instansi_id);
    }

    $this->data['instansi_id'] = [
      'name'          => 'instansi_id',
      'id'            => 'instansi_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilNoInduk()',
    ];
    $this->data['no_induk'] = [
      'name'          => 'no_induk',
      'id'            => 'no_induk',
      'class'         => 'form-control',
    ];
    $this->data['anggota_id'] = [
      'name'          => 'anggota_id',
      'id'            => 'anggota_id',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['anggota_name'] = [
      'name'          => 'anggota_name',
      'id'            => 'anggota_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    // $this->data['id_anggota'] = [
    //   'name'          => 'id_anggota',
    //   'id'            => 'id_anggota',
    //   'type'          => 'hidden',
    //   'onChange'      => 'tampilBukuDipinjam()',
    // ];
    // $this->data['arsip_id'] = [
    //   'name'          => 'arsip_id',
    //   'id'            => 'arsip_id',
    //   'class'         => 'form-control',
    //   'type'          => 'hidden',
    //   'required'      => '',
    // ];
    // $this->data['peminjaman_id'] = [
    //   'name'          => 'peminjaman_id',
    //   'id'            => 'peminjaman_id',
    //   'class'         => 'form-control',
    //   'required'      => '',
    // ];

    $this->load->view('back/pengembalian/pengembalian_add', $this->data);
  }

  function create_action()
  {
    $this->form_validation->set_rules('tgl_kembali', 'Tanggal Pengembalian', 'trim|required');
    $this->form_validation->set_rules('peminjaman_id', 'Judul Buku yang Dipinjam', 'trim|required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    $data_peminjaman = $this->Peminjaman_model->get_by_id($this->input->post('peminjaman_id'));

    if ($this->form_validation->run() === FALSE) {
      $this->create();
    } else {
      $data = array(
        'tgl_kembali'         => $this->input->post('tgl_kembali'),
        'peminjaman_id'       => $this->input->post('peminjaman_id'),
        'arsip_id'            => $this->input->post('arsip_id'),
        'anggota_id'          => $data_peminjaman->anggota_id,
        'instansi_id'         => $data_peminjaman->instansi_id,
        'created_by'          => $this->session->username,
      );

      $this->Pengembalian_model->insert($data);

      write_log();

      // menambah qty buku
      $data_buku = $this->Arsip_model->get_by_id($this->input->post('arsip_id'));

      $stok_result = $data_buku->qty + 1;

      $this->db->where('id_arsip', $this->input->post('arsip_id'));
      $this->db->update('arsip', array('qty' => $stok_result));

      write_log();

      // mengganti status is_kembali peminjaman buku
      $this->db->where('id_peminjaman', $this->input->post('peminjaman_id'));
      $this->db->update('peminjaman', array('is_kembali' => '1'));

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data saved succesfully</div>');
      redirect('admin/pengembalian');
    }
  }

  function update($id)
  {
    is_update();

    $this->data['pengembalian']     = $this->Pengembalian_model->get_by_id($id);

    if ($this->data['pengembalian']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/pengembalian/update_action';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_arsip_peminjaman']      = $this->Peminjaman_model->get_all_combobox_arsip_peminjaman();
      } elseif (is_masteradmin()) {
        $this->data['get_all_combobox_arsip_peminjaman']      = $this->Peminjaman_model->get_all_combobox_arsip_peminjaman_by_instansi($this->session->instansi_id);
      } 

      $this->data['id_pengembalian'] = [
        'name'          => 'id_pengembalian',
        'type'          => 'hidden',
      ];
      $this->data['arsip_id'] = [
        'name'          => 'arsip_id',
        'type'          => 'hidden',
      ];
      $this->data['id_peminjaman'] = [
        'name'          => 'id_peminjaman',
        'type'          => 'hidden',
      ];
      $this->data['tgl_kembali'] = [
        'name'          => 'tgl_kembali',
        'id'            => 'tgl_kembali',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['peminjaman_id'] = [
        'name'          => 'peminjaman_id',
        'id'            => 'peminjaman_id',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['anggota_id'] = [
        'name'          => 'anggota_id',
        'id'            => 'anggota_id',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['no_induk'] = [
        'name'          => 'no_induk',
        'id'            => 'no_induk',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['gender'] = [
        'name'          => 'gender',
        'id'            => 'gender',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['instansi_id'] = [
        'name'          => 'instansi_id',
        'id'            => 'instansi_id',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['address'] = [
        'name'          => 'address',
        'id'            => 'address',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['no_arsip'] = [
        'name'          => 'no_arsip',
        'id'            => 'no_arsip',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];

      $this->load->view('back/pengembalian/pengembalian_edit', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/pengembalian');
    }
  }

  function update_action()
  {
    $this->form_validation->set_rules('tgl_kembali', 'Tanggal Pengembalian', 'trim|required');
    // $this->form_validation->set_rules('arsip_id', 'Nama Arsip', 'trim|required');
    // $this->form_validation->set_rules('user_id', 'Nama Peminjam', 'trim|required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');
    
    $data_peminjaman = $this->Peminjaman_model->get_peminjaman_for_update_pengembalian($this->input->post('peminjaman_id'));
    
    if ($this->form_validation->run() === FALSE) {
      $this->update($this->input->post('id_pengembalian'));
    } else {
      if ($this->input->post('peminjaman_id') == NULL) {
        $data = array(
          'tgl_kembali'         => $this->input->post('tgl_kembali'),
          'modified_by'         => $this->session->username,
        );

        $this->Pengembalian_model->update($this->input->post('id_pengembalian'), $data);

        write_log();
      } else {
        $data = array(
          'tgl_kembali'         => $this->input->post('tgl_kembali'),
          'peminjaman_id'       => $this->input->post('peminjaman_id'),
          'arsip_id'            => $data_peminjaman->arsip_id,
          'anggota_id'          => $data_peminjaman->anggota_id,
          'instansi_id'         => $data_peminjaman->instansi_id,
          'modified_by'         => $this->session->username,
        );

        $this->Pengembalian_model->update($this->input->post('id_pengembalian'), $data);

        write_log();

        // ubah buku baru dengan menambah qty buku
        $data_buku = $this->Arsip_model->get_by_id($data_peminjaman->arsip_id);

        $stok_result = $data_buku->qty + 1;

        $this->db->where('id_arsip', $data_peminjaman->arsip_id);
        $this->db->update('arsip', array('qty' => $stok_result));

        write_log();

        // ubah buku lama dengan mengurangi qty buku
        $data_buku_lama = $this->Arsip_model->get_by_id($this->input->post('arsip_id'));

        $stok_result_buku_lama = $data_buku_lama->qty - 1;

        $this->db->where('id_arsip', $this->input->post('arsip_id'));
        $this->db->update('arsip', array('qty' => $stok_result_buku_lama));

        write_log();

        // mengganti status is_kembali peminjaman buku baru
        $this->db->where('id_peminjaman', $data_peminjaman->id_peminjaman);
        $this->db->update('peminjaman', array('is_kembali' => '1'));

        // mengganti status is_kembali peminjaman buku lama
        $this->db->where('id_peminjaman', $this->input->post('id_peminjaman'));
        $this->db->update('peminjaman', array('is_kembali' => '0'));

        write_log();
      }

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data saved succesfully</div>');
      redirect('admin/pengembalian');
    }
  }

  function delete($id)
  {
    is_delete();

    $delete = $this->Pengembalian_model->get_by_id($id);

    if ($delete) {
      $data = array(
        'is_delete_pengembalian'   => '1',
        'deleted_by'  => $this->session->username,
        'deleted_at'  => date('Y-m-d H:i:a'),
      );

      $this->Pengembalian_model->soft_delete($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus</div>');
      redirect('admin/pengembalian');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/pengembalian');
    }
  }

  function delete_permanent($id)
  {
    is_delete();

    $delete = $this->Pengembalian_model->get_by_id($id);

    if ($delete) {
      $this->Pengembalian_model->delete($id);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus secara permanen</div>');
      redirect('admin/pengembalian/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/pengembalian');
    }
  }

  function deleted_list()
  {
    is_restore();

    $this->data['page_title'] = 'Deleted ' . $this->data['module'] . ' List';

    if (is_grandadmin()) {
      $this->data['get_all_deleted'] = $this->Pengembalian_model->get_all_deleted();
    } elseif (is_masteradmin()) {
      $this->data['get_all_deleted'] = $this->Pengembalian_model->get_all_deleted_by_instansi();
    } 

    $this->load->view('back/pengembalian/pengembalian_deleted_list', $this->data);
  }

  function restore($id)
  {
    is_restore();

    $row = $this->Pengembalian_model->get_by_id($id);

    if ($row) {
      $data = array(
        'is_delete_pengembalian'   => '0',
        'deleted_by'  => NULL,
        'deleted_at'  => NULL,
      );

      $this->Pengembalian_model->update($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data restored successfully</div>');
      redirect('admin/pengembalian/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">No data found</div>');
      redirect('admin/pengembalian');
    }
  }

  function get_anggota($id_anggota = '')
  {
    $data = $this->db->get_where('anggota', array('id_anggota' => $id_anggota));

    if ($data->num_rows() != 0) {
        $output['success'] = 1;

        $output['id_anggota']    = $data->row()->id_anggota;
        $output['no_induk']      = $data->row()->no_induk;
        $output['anggota_name']  = $data->row()->anggota_name;
    } else {
        $output['success'] = 0;
    }

    echo json_encode($output);
  }

  function tampil_buku_dipinjam($id)
  {
    $this->data['buku_dipinjam'] = $this->Peminjaman_model->get_all_by_anggota($id);

    $this->load->view('back/peminjaman/V_peminjaman_list', $this->data);
  }

  function get_peminjaman($no_induk = '')
  {
    $this->db->join('anggota', 'peminjaman.anggota_id = anggota.id_anggota');
    $this->db->join('instansi', 'peminjaman.instansi_id = instansi.id_instansi');
    $this->db->join('arsip', 'peminjaman.arsip_id = arsip.id_arsip');

    $data = $this->db->get_where('peminjaman', array('anggota_id' => $no_induk));

    if ($data->num_rows() != 0) {
      $output['success'] = 1;

      $output['id_anggota']     = $data->row()->anggota_id;
      $output['anggota_name']   = $data->row()->anggota_name;
      $output['no_induk']       = $data->row()->no_induk;
    } else {
      $output['success'] = 0;
    }

    echo json_encode($output);
  }
}

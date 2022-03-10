<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Peminjaman extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->data['module'] = 'Peminjaman';

    $this->load->model(array('Peminjaman_model', 'Pengembalian_model', 'Arsip_model', 'Anggota_model'));

    $this->data['company_data']             = $this->Company_model->company_profile();
    $this->data['layout_template']          = $this->Template_model->layout();
    $this->data['skins_template']           = $this->Template_model->skins();
    $this->data['footer']                   = $this->Footer_model->footer();

    $this->data['btn_submit'] = 'Save';
    $this->data['btn_reset']  = 'Reset';
    $this->data['btn_add']    = 'Tambah Data';
    $this->data['add_action'] = base_url('admin/peminjaman/create');

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
      $this->data['get_all'] = $this->Peminjaman_model->get_all();
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Peminjaman_model->get_all_by_instansi();
    }

    $this->load->view('back/peminjaman/peminjaman_list', $this->data);
  }

  function create()
  {
    is_create();

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/peminjaman/create_action';

    if (is_grandadmin()) {
      $this->data['get_all_combobox_arsip_available']     = $this->Arsip_model->get_all_combobox_arsip_available();
      $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_user']                = $this->Auth_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_arsip_available']     = $this->Arsip_model->get_all_combobox_arsip_available_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_anggota']     = $this->Anggota_model->get_all_combobox_by_instansi($this->session->instansi_id);
    } 

    $this->data['tgl_peminjaman'] = [
      'name'          => 'tgl_peminjaman',
      'id'            => 'tgl_peminjaman',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('tgl_peminjaman'),
    ];
    $this->data['tgl_kembali'] = [
      'name'          => 'tgl_kembali',
      'id'            => 'tgl_kembali',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('tgl_kembali'),
    ];
    $this->data['arsip_id'] = [
      'name'          => 'arsip_id',
      'id'            => 'arsip_id',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['no_induk'] = [
      'name'          => 'no_induk',
      'id'            => 'no_induk',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['instansi_id'] = [
      'name'          => 'instansi_id',
      'id'            => 'instansi_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilArsip(), tampilNoInduk()',
      'required'      => '',
    ];
    $this->data['anggota_name'] = [
      'name'          => 'anggota_name',
      'id'            => 'anggota_name',
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
    $this->data['angkatan'] = [
      'name'          => 'angkatan',
      'id'            => 'angkatan',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['address'] = [
      'name'          => 'address',
      'id'            => 'address',
      'class'         => 'form-control',
      'rows'          => '2',
      'required'      => '',
      'readonly'      => '',
    ];

    $this->load->view('back/peminjaman/peminjaman_add', $this->data);
  }

  function create_action()
  {
    $this->form_validation->set_rules('tgl_peminjaman', 'Tanggal Peminjaman', 'trim|required');
    $this->form_validation->set_rules('tgl_kembali', 'Tanggal Pengembalian', 'trim|required');
    $this->form_validation->set_rules('arsip_id', 'Judul Buku yang Dipinjam', 'trim|required');
    $this->form_validation->set_rules('no_induk', 'No Induk Peminjam', 'required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    // $data_user = $this->Auth_model->get_by_id($this->input->post('user_id'));

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('instansi_id');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
    } 

    if ($this->form_validation->run() === FALSE) {
      $this->create();
    } else {
      $data = array(
        'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
        'tgl_kembali'       => $this->input->post('tgl_kembali'),
        'arsip_id'          => $this->input->post('arsip_id'),
        'anggota_id'        => $this->input->post('no_induk'),
        'instansi_id'       => $instansi_id,
        'created_by'        => $this->session->username,
      );
      // var_dump($this->input->post('no_induk'));
      // die();
      $this->Peminjaman_model->insert($data);
      write_log();

      $data_buku = $this->Arsip_model->get_by_id($this->input->post('arsip_id'));

      $stok_result = $data_buku->qty - 1;

      // mengurangi qty buku karena buku sedang dipinjam
      $this->db->where('id_arsip', $this->input->post('arsip_id'));
      $this->db->update('arsip', array('qty' => $stok_result));

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
      redirect('admin/peminjaman');
    }
  }

  function update($id)
  {
    is_update();

    $this->data['peminjaman']           = $this->Peminjaman_model->get_by_id($id);

    if ($this->data['peminjaman']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/peminjaman/update_action';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_user']                = $this->Auth_model->get_all_combobox();
        $this->data['get_all_combobox_arsip_available']     = $this->Arsip_model->get_all_combobox_arsip_available();
        $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
        
      } elseif (is_masteradmin()) {
        $this->data['get_all_combobox_anggota']                = $this->Anggota_model->get_all_combobox_by_instansi($this->session->instansi_id);
        $this->data['get_all_combobox_arsip_available']     = $this->Arsip_model->get_all_combobox_arsip_available_by_instansi($this->session->instansi_id);
      }

      $this->data['id_peminjaman'] = [
        'name'          => 'id_peminjaman',
        'type'          => 'hidden',
      ];
      $this->data['tgl_peminjaman'] = [
        'name'          => 'tgl_peminjaman',
        'id'            => 'tgl_peminjaman',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['tgl_kembali'] = [
        'name'          => 'tgl_kembali',
        'id'            => 'tgl_kembali',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['no_induk'] = [
        'name'          => 'no_induk',
        'id'            => 'no_induk',
        'class'         => 'form-control',
      ];
      $this->data['new_arsip'] = [
        'name'          => 'new_arsip',
        'id'            => 'new_arsip',
        'class'         => 'form-control',
      ];
      $this->data['instansi_id'] = [
        'name'          => 'instansi_id',
        'id'            => 'instansi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilArsip(), tampilNoInduk()',
        'required'      => '',
      ];
      $this->data['anggota_name'] = [
        'name'          => 'anggota_name',
        'id'            => 'anggota_name',
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
      $this->data['angkatan'] = [
        'name'          => 'angkatan',
        'id'            => 'angkatan',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['address'] = [
        'name'          => 'address',
        'id'            => 'address',
        'class'         => 'form-control',
        'rows'          => '2',
        'required'      => '',
        'readonly'      => '',
      ];

      $this->load->view('back/peminjaman/peminjaman_edit', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/peminjaman');
    }
  }

  function update_action()
  {
    $this->form_validation->set_rules('tgl_peminjaman', 'Tanggal Peminjaman', 'trim|required');
    $this->form_validation->set_rules('tgl_kembali', 'Tanggal Pengembalian', 'trim|required');

    $this->form_validation->set_message('required', '{field} wajib diisi');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    $data_anggota = $this->Anggota_model->get_by_id($this->input->post('no_induk'));

    if ($this->form_validation->run() === FALSE) {
      $this->update($this->input->post('id_peminjaman'));
    } else {
      // jika nilai arsip baru tidak diisi, maka isikan dengan nilai dari current arsip
      if ($this->input->post('new_arsip') == NULL) {
        // echo "ARSIP BARU KOSONG";

        $data = array(
          'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
          'tgl_kembali'       => $this->input->post('tgl_kembali'),
          'modified_by'       => $this->session->username,
        );
      }
      // tapi jika nilai arsip baru diisi maka masukkan nilai new_arsip
      else {
        $data = array(
          'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
          'tgl_kembali'       => $this->input->post('tgl_kembali'),
          'anggota_id'           => $this->input->post('no_induk'),
          'arsip_id'          => $this->input->post('new_arsip'),
          'instansi_id'       => $data_anggota->instansi_id,
          'modified_by'       => $this->session->username,
        );

        $data_buku = $this->Arsip_model->get_by_id($this->input->post('new_arsip'));

        $stok_result_buku_baru = $data_buku->qty - 1;

        // mengurangi qty buku karena buku sedang dipinjam
        $this->db->where('id_arsip', $this->input->post('new_arsip'));
        $this->db->update('arsip', array('qty' => $stok_result_buku_baru));

        write_log();

        // ubah arsip lama / saat ini menjadi tersedia
        $data_buku_lama = $this->Arsip_model->get_by_id($this->input->post('current_arsip'));

        $stok_result_buku_lama = $data_buku_lama->qty + 1;

        $this->db->where('id_arsip', $this->input->post('current_arsip'));
        $this->db->update('arsip', array('qty' => $stok_result_buku_lama));

        write_log();
      }

      $this->Peminjaman_model->update($this->input->post('id_peminjaman'), $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
      redirect('admin/peminjaman');
    }
  }

  function delete($id)
  {
    is_delete();

    $delete = $this->Peminjaman_model->get_by_id($id);

    if ($delete) {
      $data = array(
        'is_delete_peminjaman'   => '1',
        'deleted_by'  => $this->session->username,
        'deleted_at'  => date('Y-m-d H:i:a'),
      );

      $this->Peminjaman_model->soft_delete($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus</div>');
      redirect('admin/peminjaman');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/peminjaman');
    }
  }

  function delete_permanent($id)
  {
    is_delete();

    $delete = $this->Peminjaman_model->get_by_id($id);

    if ($delete) {

      $data_buku = $this->Arsip_model->get_by_id($delete->arsip_id);

      $stok_result_buku = $data_buku->qty + 1;

      $this->db->where('id_arsip', $delete->arsip_id);
      $this->db->update('arsip', array('qty' => $stok_result_buku));

      $this->Peminjaman_model->delete($id);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus secara permanen</div>');
      redirect('admin/peminjaman/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Tidak ada data yang ditemukan</div>');
      redirect('admin/peminjaman');
    }
  }

  function deleted_list()
  {
    is_restore();

    $this->data['page_title'] = 'Deleted ' . $this->data['module'] . ' List';

    if (is_grandadmin()) {
      $this->data['get_all_deleted'] = $this->Peminjaman_model->get_all_deleted();
    } elseif (is_masteradmin()) {
      $this->data['get_all_deleted'] = $this->Peminjaman_model->get_all_deleted_by_instansi();
    } 
   
    $this->load->view('back/peminjaman/peminjaman_deleted_list', $this->data);
  }

  function restore($id)
  {
    is_restore();

    $row = $this->Peminjaman_model->get_by_id($id);

    if ($row) {
      $data = array(
        'is_delete_peminjaman'   => '0',
        'deleted_by'  => NULL,
        'deleted_at'  => NULL,
      );

      $this->Peminjaman_model->update($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data restored successfully</div>');
      redirect('admin/peminjaman/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">No data found</div>');
      redirect('admin/peminjaman');
    }
  }

  function set_kembali($id)
  {
    $row = $this->Peminjaman_model->get_by_id($id);

    if ($row) {
      if ($row->is_kembali == '1') {
        $this->session->set_flashdata('message', '<div class="alert alert-success">Arsip Telah Dikembalikan</div>');
        redirect('admin/pengembalian');
      } else {
        $data_peminjaman = array(
          'is_kembali'    => '1',
        );

        $this->Peminjaman_model->update($id, $data_peminjaman);

        write_log();

        // menambah qty buku
        $data_buku = $this->Arsip_model->get_by_id($row->arsip_id);

        $stok_result = $data_buku->qty + 1;
        
        $this->db->where('id_arsip', $row->arsip_id);
        $this->db->update('arsip', array('qty' => $stok_result));

        write_log();

        $data_pengembalian = array(
          'tgl_kembali'   => date('Y-m-d'),
          'peminjaman_id' => $id,
          'arsip_id'      => $row->arsip_id,
          'anggota_id'       => $row->anggota_id,
          'instansi_id'   => $row->instansi_id,
          'created_by'    => $this->session->username,
        );

        $this->Pengembalian_model->insert($data_pengembalian);

        write_log();

        $this->session->set_flashdata('message', '<div class="alert alert-success">Buku Telah Dikembalikan</div>');
        redirect('admin/pengembalian');
      }
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">No data found</div>');
      redirect('admin/peminjaman');
    }
  }

  // function choose_arsip_dipinjam()
  // {
  //   $this->data['arsip']  = $this->Peminjaman_model->get_all_combobox_peminjaman($this->uri->segment(4));
  //   $this->load->view('back/peminjaman/form_arsip', $this->data);
  // }

  function get_cabang_divisi_instansi_by_user($user_id = '')
  {
    $this->db->join('instansi', 'users.instansi_id = instansi.id_instansi');
    $this->db->join('cabang', 'users.cabang_id = cabang.id_cabang');
    $this->db->join('divisi', 'users.divisi_id = divisi.id_divisi');

    $data_user = $this->db->get_where('users', array('id_users' => $user_id, 'is_delete' => '0'));

    if ($data_user->num_rows() != 0) {
      $output['success'] = 1;

      $output['instansi_name']  = $data_user->row()->instansi_name;
      $output['cabang_name']    = $data_user->row()->cabang_name;
      $output['divisi_name']    = $data_user->row()->divisi_name;
    } else {
      $output['success'] = 0;
    }

    echo json_encode($output);
  }

  function get_peminjaman($peminjaman_id = '')
  {
    $this->db->join('users', 'peminjaman.user_id = users.id_users');
    $this->db->join('bagian', 'peminjaman.bagian_id = bagian.id_bagian');
    $this->db->join('divisi', 'peminjaman.divisi_id = divisi.id_divisi');
    $this->db->join('cabang', 'peminjaman.cabang_id = cabang.id_cabang');
    $this->db->join('instansi', 'peminjaman.instansi_id = instansi.id_instansi');

    $data = $this->db->get_where('peminjaman', array('id_peminjaman' => $peminjaman_id, 'is_kembali' => 0));

    if ($data->num_rows() != 0) {
      $output['success'] = 1;

      $output['arsip_id']       = $data->row()->arsip_id;
      $output['name']           = $data->row()->name;
      $output['bagian_name']    = $data->row()->bagian_name;
      $output['divisi_name']    = $data->row()->divisi_name;
      $output['cabang_name']    = $data->row()->cabang_name;
      $output['instansi_name']  = $data->row()->instansi_name;
    } else {
      $output['success'] = 0;
    }

    echo json_encode($output);
  }

  function get_divisi_by_peminjam()
  {
    $this->data['divisi']  = $this->Divisi_model->get_all_combobox_by_user($this->uri->segment(4));
    $this->load->view('back/peminjaman/form_divisi', $this->data);
  }
}

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
    $this->data['btn_back']    = 'Kembali';
    $this->data['btn_edit']    = 'Edit';
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

    //TODO Deklarasi array
    $data_array = array();
    $result = array();

    //TODO Buat variabel title
    $this->data['page_title'] = 'Data ' . $this->data['module'];

    //TODO Get data pengembalian berdasarkan usertype
    if (is_grandadmin()) {
      //? Jika user grandadmin maka get all pengembalian
      $get_all = $this->Pengembalian_model->get_all();
    } elseif (is_masteradmin()) {
      //? Jika user masteradmin maka get all pengembalian berdasarkan instansi
      $get_all = $this->Pengembalian_model->get_all_by_instansi();
    }

    //TODO Input ke variabel array
    foreach ($get_all as $data) {
      array_push($data_array, $data->anggota_id);
    }

    //TODO Sortir id anggota bersifat unik
    $anggota_id = array_unique($data_array);

    for ($i = 0; $i < count($data_array); $i++) {
      //TODO Menghilangkan value array yang NULL
      //? Jika value tidak null maka push ke array result
      if ($anggota_id[$i] != NULL) {
        array_push($result, $anggota_id[$i]);
      }
    }

    $array_anggota = array();
    for ($i = 0; $i < count($result); $i++) {
      //TODO Get data pengembalian berdasarkan id anggota dalam bentuk array
      $data_anggota = $this->Anggota_model->get_by_id_for_pengembalian_list($result[$i]);

      //TODO Pembuatan array of object
      //? Jika data tidak kosong maka eksekusi
      if ($data_anggota) {
        array_push($array_anggota, $data_anggota);
      }
    }

    //TODO Deklarasi Array
    $this->data['get_all'] = array();
    //TODO Memisahkan array per anggota
    for ($i = 0; $i < count($array_anggota); $i++) {
      //TODO Deklarasi array untuk pengecekan tgl_kembali agar bersifat unik
      $array[$i] = array();
      for ($j = 0; $j < count($array_anggota[$i]); $j++) {
        //TODO Seleksi array data tgl kembali secara unik
        //? Jika variabel array[i] tidak memiliki value yang dicek maka lakukan push
        if (!in_array($array_anggota[$i][$j]->tgl_kembali, $array[$i], true)) {
          array_push($array[$i], $array_anggota[$i][$j]->tgl_kembali);
          //TODO Get data pengembalian berdasarkan id anggota dan tgl kembali
          $get_pengembalian =  $this->Anggota_model->get_by_id_and_tgl_kembali_for_pengembalian_list($array_anggota[$i][$j]->id_anggota, $array_anggota[$i][$j]->tgl_kembali);

          //TODO Pembuatan array of object
          //? Jika data tidak kosong maka eksekusi
          if ($get_pengembalian) {
            array_push($this->data['get_all'], $get_pengembalian);
          }
        }
      }
    }

    //TODO Load view dengan mengirim data
    $this->load->view('back/pengembalian/pengembalian_list', $this->data);
  }

  function detail($id_anggota)
  {
    $this->data['page_title'] = 'Detail ' . $this->data['module'];

    $this->data['get_pengembalian'] = $this->Pengembalian_model->get_pengembalian_by_anggota($id_anggota);

    $this->data['get_user'] = $this->Anggota_model->get_by_id_for_detail_pengembalian($id_anggota);

    // var_dump($this->data['get_user']); die();

    $this->load->view('back/pengembalian/pengembalian_detail', $this->data);
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

      $this->data['current_arsip_name'] = [
        'name'          => 'current_arsip_name',
        'id'            => 'current_arsip_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_no_arsip'] = [
        'name'          => 'current_no_arsip',
        'id'            => 'current_no_arsip',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_penulis_buku'] = [
        'name'          => 'current_penulis_buku',
        'id'            => 'current_penulis_buku',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_penerbit'] = [
        'name'          => 'current_penerbit',
        'id'            => 'current_penerbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_kota_penerbit'] = [
        'name'          => 'current_kota_penerbit',
        'id'            => 'current_kota_penerbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_lokasi_name'] = [
        'name'          => 'current_lokasi_name',
        'id'            => 'current_lokasi_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_rak_name'] = [
        'name'          => 'current_rak_name',
        'id'            => 'current_rak_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_baris_name'] = [
        'name'          => 'current_baris_name',
        'id'            => 'current_baris_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_tahun_terbit'] = [
        'name'          => 'current_tahun_terbit',
        'id'            => 'current_tahun_terbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_instansi_name'] = [
        'name'          => 'current_instansi_name',
        'id'            => 'current_instansi_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['tgl_kembali'] = [
        'name'          => 'tgl_kembali',
        'id'            => 'tgl_kembali',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_anggota_name'] = [
        'name'          => 'current_anggota_name',
        'id'            => 'current_anggota_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_no_induk'] = [
        'name'          => 'current_no_induk',
        'id'            => 'current_no_induk',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_gender'] = [
        'name'          => 'current_gender',
        'id'            => 'current_gender',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_angkatan'] = [
        'name'          => 'current_angkatan',
        'id'            => 'current_angkatan',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['current_address'] = [
        'name'          => 'current_address',
        'id'            => 'current_address',
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

  function update_anggota($id)
  {
    is_update();

    $this->data['pengembalian']     = $this->Pengembalian_model->get_by_id($id);

    if ($this->data['pengembalian']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/pengembalian/update_action';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
      } elseif (is_masteradmin()) {
        $this->data['get_all_combobox_anggota']     = $this->Anggota_model->get_all_combobox_by_instansi($this->session->instansi_id);
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

      $this->load->view('back/pengembalian/pengembalian_edit_anggota', $this->data);
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

  function delete_pengembalian_by_anggota($id_anggota)
  {
    $delete = $this->Pengembalian_model->get_pengembalian_by_anggota($id_anggota);

    if ($delete) {
      foreach ($delete as $data) {
        $data_pengembalian = array(
          'is_delete_pengembalian'   => '1',
          'deleted_by'  => $this->session->username,
          'deleted_at'  => date('Y-m-d H:i:a'),
        );

        $this->Pengembalian_model->soft_delete($data->id_pengembalian, $data_pengembalian);
      }

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

  function update_tampil_buku_dipinjam($id)
  {
    $this->data['buku_dipinjam'] = $this->Peminjaman_model->get_all_by_anggota($id);

    $this->data['pengembalian'] = $this->Pengembalian_model->get_by_id($this->input->post('id_pengembalian'));

    $this->load->view('back/peminjaman/V_update_peminjaman_list', $this->data);
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

  function verifikasi_buku($id_peminjaman)
  {
    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/pengembalian/verifikasi_action';

    $this->data['data_peminjaman'] = $this->Peminjaman_model->get_by_id($id_peminjaman);

    $this->data['arsip_id'] = [
      'name'  => 'arsip_id',
      'id'    => 'arsip_id',
      'type'  => 'hidden'
    ];
    $this->data['peminjaman_id'] = [
      'name'  => 'peminjaman_id',
      'id'    => 'peminjaman_id',
      'type'  => 'hidden'
    ];
    $this->data['anggota_id'] = [
      'name'  => 'anggota_id',
      'id'    => 'anggota_id',
      'type'  => 'hidden'
    ];

    $this->load->view('back/pengembalian/scan_verifikasi_buku', $this->data);
  }

  function verifikasi_action()
  {
    $string_kode = $this->input->post('id_qrcode');
    $id_qrcode = explode("/", $string_kode);

    $arsip_id = $this->input->post('arsip_id');
    $id_peminjaman = $this->input->post('peminjaman_id');
    $anggota_id = $this->input->post('anggota_id');

    if ($id_qrcode[1] == 'book') {
      if ($id_qrcode[0] == $arsip_id) {
        $data_peminjaman = $this->Peminjaman_model->get_by_id($id_peminjaman);

        $data = array(
          'tgl_kembali'         => date('Y-m-d'),
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

        //NOTIFIKASI SUKSES
        $this->session->set_flashdata('message', '<div class="alert alert-success">Authentication Success</div>');
        $this->session->set_flashdata('anggota_id', $anggota_id);
        redirect('admin/pengembalian/create');
      } else {
        //NOTIFIKASI FAILED
        $this->session->set_flashdata('message', '<div class="alert alert-danger">Authentication Failed</div>');
        $this->session->set_flashdata('anggota_id', $anggota_id);
        redirect('admin/pengembalian/create');
      }
    } elseif ($id_qrcode[1] == 'anggota') {
      //NOTIFIKASI FAILED
    }
  }

  function update_verifikasi_buku($id_pengembalian, $id_peminjaman)
  {
    $this->data['page_title'] = 'Update Data ' . $this->data['module'];
    $this->data['action']     = 'admin/pengembalian/update_verifikasi_action';

    $this->data['data_peminjaman'] = $this->Peminjaman_model->get_by_id($id_peminjaman);

    $this->data['data_pengembalian'] = $this->Pengembalian_model->get_by_id($id_pengembalian);

    $this->data['arsip_id'] = [
      'name'  => 'arsip_id',
      'id'    => 'arsip_id',
      'type'  => 'hidden'
    ];
    $this->data['peminjaman_id'] = [
      'name'  => 'peminjaman_id',
      'id'    => 'peminjaman_id',
      'type'  => 'hidden'
    ];
    $this->data['anggota_id'] = [
      'name'  => 'anggota_id',
      'id'    => 'anggota_id',
      'type'  => 'hidden'
    ];
    $this->data['pengembalian_id'] = [
      'name'  => 'pengembalian_id',
      'id'    => 'pengembalian_id',
      'type'  => 'hidden'
    ];
    $this->data['current_arsip_id'] = [
      'name'  => 'current_arsip_id',
      'id'    => 'current_arsip_id',
      'type'  => 'hidden'
    ];
    $this->data['current_peminjaman_id'] = [
      'name'  => 'current_peminjaman_id',
      'id'    => 'current_peminjaman_id',
      'type'  => 'hidden'
    ];

    $this->load->view('back/pengembalian/update_scan_verifikasi_buku', $this->data);
  }

  function update_verifikasi_action()
  {
    $data_peminjaman = $this->Peminjaman_model->get_by_id($this->input->post('peminjaman_id'));

    $string_kode = $this->input->post('id_qrcode');
    $id_qrcode = explode("/", $string_kode);

    $anggota_id = $this->input->post('anggota_id');

    if ($id_qrcode[1] == 'book') {
      if ($id_qrcode[0] == $data_peminjaman->arsip_id) {
        $data = array(
          'peminjaman_id'       => $this->input->post('peminjaman_id'),
          'arsip_id'            => $data_peminjaman->arsip_id,
          'anggota_id'          => $data_peminjaman->anggota_id,
          'instansi_id'         => $data_peminjaman->instansi_id,
          'modified_by'          => $this->session->username,
        );

        $this->Pengembalian_model->update($this->input->post('pengembalian_id'), $data);

        write_log();

        // menambah qty buku untuk buku baru
        $data_buku = $this->Arsip_model->get_by_id($data_peminjaman->arsip_id);

        $stok_result = $data_buku->qty + 1;

        $this->db->where('id_arsip', $data_peminjaman->arsip_id);
        $this->db->update('arsip', array('qty' => $stok_result));

        write_log();

        //mengganti status is_kembali peminjaman buku baru
        $this->db->where('id_peminjaman', $this->input->post('peminjaman_id'));
        $this->db->update('peminjaman', array('is_kembali' => '1'));

        //mengganti status is_kembali peminjaman buku lama
        $this->db->where('id_peminjaman', $this->input->post('current_peminjaman_id'));
        $this->db->update('peminjaman', array('is_kembali' => '0'));

        write_log();

        // ubah buku lama dengan mengurangi qty buku
        $data_buku_lama = $this->Arsip_model->get_by_id($this->input->post('current_arsip_id'));

        $stok_result_buku_lama = $data_buku_lama->qty - 1;

        $this->db->where('id_arsip', $this->input->post('current_arsip_id'));
        $this->db->update('arsip', array('qty' => $stok_result_buku_lama));

        write_log();

        //NOTIFIKASI SUKSES
        $this->session->set_flashdata('message', '<div class="alert alert-success">Authentication Success</div>');
        redirect('admin/pengembalian/update/' . $this->input->post('pengembalian_id'));
      } else {
        //NOTIFIKASI FAILED
        $this->session->set_flashdata('message', '<div class="alert alert-danger">Authentication Failed</div>');
        $this->session->set_flashdata('anggota_id', $anggota_id);
        redirect('admin/pengembalian/update_anggota/' . $this->input->post('pengembalian_id'));
      }
    } elseif ($id_qrcode[1] == 'anggota') {
      //NOTIFIKASI FAILED
    }
  }
}

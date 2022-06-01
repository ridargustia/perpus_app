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
    $this->data['btn_next']    = 'Selanjutnya';
    $this->data['btn_back']    = 'Kembali';
    $this->data['btn_edit']    = 'Edit';
    $this->data['add_book_action'] = base_url('admin/peminjaman/create_book');

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
    $data_array = array();
    $result = array();

    // if (is_grandadmin()) {
    //   $this->data['get_all'] = $this->Peminjaman_model->get_all();
    // } elseif (is_masteradmin()) {
    //   $this->data['get_all'] = $this->Peminjaman_model->get_all_by_instansi();
    // }

    if (is_grandadmin()) {
      $get_all = $this->Peminjaman_model->get_all();
    } elseif (is_masteradmin()) {
      $get_all = $this->Peminjaman_model->get_all_by_instansi();
    }

    foreach ($get_all as $data) {
      array_push($data_array, $data->anggota_id);
    }
    $anggota_id = array_unique($data_array);

    for ($i = 0; $i < count($data_array); $i++) {
      if ($anggota_id[$i] != NULL) {
        array_push($result, $anggota_id[$i]);
      }
    }

    $this->data['get_all'] = array();
    for ($i = 0; $i < count($result); $i++) {
      $data_anggota = $this->Anggota_model->get_by_id_for_peminjaman_list($result[$i]);
      if ($data_anggota) {
        array_push($this->data['get_all'], $data_anggota);
      }
    }

    // var_dump($this->data['get_all']); die();

    $this->load->view('back/peminjaman/peminjaman_list', $this->data);
  }

  function detail($id_anggota)
  {
    $this->data['page_title'] = 'Detail ' . $this->data['module'];

    $this->data['get_peminjaman'] = $this->Peminjaman_model->get_peminjaman_by_anggota($id_anggota);

    $this->data['get_user'] = $this->Anggota_model->get_by_id_for_detail_peminjaman($id_anggota);

    // var_dump($this->data['get_user']); die();

    $this->load->view('back/peminjaman/peminjaman_detail', $this->data);
  }

  function create_book()
  {
    is_create();

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/peminjaman/create_anggota';

    if (is_grandadmin()) {
      $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_arsip_available']     = $this->Arsip_model->get_all_combobox_arsip_available_by_instansi($this->session->instansi_id);
    }

    $this->data['id_arsip'] = [
      'name'          => 'id_arsip',
      'id'            => 'id_arsip',
      'type'          => 'hidden',
      'required'      => '',
    ];
    $this->data['instansi_id'] = [
      'name'          => 'instansi_id',
      'id'            => 'instansi_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilArsip()',
    ];
    $this->data['arsip_id'] = [
      'name'          => 'arsip_id',
      'id'            => 'arsip_id',
      'class'         => 'form-control',
    ];
    $this->data['no_induk'] = [
      'name'          => 'no_induk',
      'id'            => 'no_induk',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['arsip_name'] = [
      'name'          => 'arsip_name',
      'id'            => 'arsip_name',
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
    $this->data['penulis_buku'] = [
      'name'          => 'penulis_buku',
      'id'            => 'penulis_buku',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['penerbit'] = [
      'name'          => 'penerbit',
      'id'            => 'penerbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['kota_penerbit'] = [
      'name'          => 'kota_penerbit',
      'id'            => 'kota_penerbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['lokasi_name'] = [
      'name'          => 'lokasi_name',
      'id'            => 'lokasi_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['rak_name'] = [
      'name'          => 'rak_name',
      'id'            => 'rak_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['baris_name'] = [
      'name'          => 'baris_name',
      'id'            => 'baris_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['tahun_terbit'] = [
      'name'          => 'tahun_terbit',
      'id'            => 'tahun_terbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];

    $this->load->view('back/peminjaman/peminjaman_add_buku', $this->data);
  }

  function create_anggota()
  {
    is_create();

    if ($this->input->post('id_arsip') == null) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data buku harus diisi terlebih dahulu.</div>');
      redirect('admin/peminjaman/create_book');
    }

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/peminjaman/create_action';
    $this->data['id_buku'] = $this->input->post('id_arsip');

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
    $this->data['tgl_peminjaman'] = [
      'name'          => 'tgl_peminjaman',
      'id'            => 'tgl_peminjaman',
      'class'         => 'form-control',
      'readonly'      => '',
    ];
    $this->data['tgl_kembali'] = [
      'name'          => 'tgl_kembali',
      'id'            => 'tgl_kembali',
      'class'         => 'form-control',
      'readonly'      => '',
    ];
    $this->data['id_arsip'] = [
      'name'          => 'id_arsip',
      'type'          => 'hidden',
    ];
    $this->data['id_anggota'] = [
      'name'          => 'id_anggota',
      'id'            => 'id_anggota',
      'type'          => 'hidden',
    ];
    $this->data['id_instansi'] = [
      'name'          => 'id_instansi',
      'id'            => 'id_instansi',
      'type'          => 'hidden',
    ];

    $this->load->view('back/peminjaman/peminjaman_add_anggota', $this->data);
  }

  function create_action()
  {
    if ($this->input->post('id_anggota') == null) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Gagal disimpan. Data anggota harus diisi.</div>');
      redirect('admin/peminjaman');
    }

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('id_instansi');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
    }

    $data = array(
      'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
      'tgl_kembali'       => $this->input->post('tgl_kembali'),
      'arsip_id'          => $this->input->post('id_arsip'),
      'anggota_id'        => $this->input->post('id_anggota'),
      'instansi_id'       => $instansi_id,
      'created_by'        => $this->session->username,
    );
    // var_dump($data);
    // die();
    $this->Peminjaman_model->insert($data);
    write_log();

    $data_buku = $this->Arsip_model->get_by_id($this->input->post('id_arsip'));

    $stok_result = $data_buku->qty - 1;

    // mengurangi qty buku karena buku sedang dipinjam
    $this->db->where('id_arsip', $this->input->post('id_arsip'));
    $this->db->update('arsip', array('qty' => $stok_result));

    write_log();

    $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
    redirect('admin/peminjaman');
  }

  function update($id)
  {
    is_update();

    $this->data['peminjaman']           = $this->Peminjaman_model->get_by_id($id);

    if ($this->data['peminjaman']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/peminjaman/update_action';

      $this->data['id_peminjaman'] = [
        'name'          => 'id_peminjaman',
        'type'          => 'hidden',
      ];
      $this->data['tgl_peminjaman'] = [
        'name'          => 'tgl_peminjaman',
        'id'            => 'tgl_peminjaman',
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
      $this->data['current_instansi_name'] = [
        'name'          => 'current_instansi_name',
        'id'            => 'current_instansi_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];

      $this->load->view('back/peminjaman/peminjaman_edit', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/peminjaman');
    }
  }

  function update_book($id)
  {
    $this->data['peminjaman']           = $this->Peminjaman_model->get_by_id($id);

    if ($this->data['peminjaman']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/peminjaman/update_anggota';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_instansi']            = $this->Instansi_model->get_all_combobox();
      } elseif (is_masteradmin()) {
        $this->data['get_all_combobox_arsip_available']                = $this->Arsip_model->get_all_combobox_arsip_available_by_instansi($this->session->instansi_id);
      }

      $this->data['current_arsip'] = [
        'name'          => 'current_arsip',
        'id'            => 'current_arsip',
        'type'          => 'hidden',
      ];
      $this->data['new_arsip'] = [
        'name'          => 'new_arsip',
        'id'            => 'new_arsip',
        'type'          => 'hidden',
      ];
      $this->data['id_peminjaman'] = [
        'name'          => 'id_peminjaman',
        'id'            => 'id_peminjaman',
        'type'          => 'hidden',
      ];
      $this->data['instansi_id'] = [
        'name'          => 'instansi_id',
        'id'            => 'instansi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilArsip()',
      ];
      $this->data['arsip_id'] = [
        'name'          => 'arsip_id',
        'id'            => 'arsip_id',
        'class'         => 'form-control',
      ];
      $this->data['arsip_name'] = [
        'name'          => 'arsip_name',
        'id'            => 'arsip_name',
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
      $this->data['penulis_buku'] = [
        'name'          => 'penulis_buku',
        'id'            => 'penulis_buku',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['penerbit'] = [
        'name'          => 'penerbit',
        'id'            => 'penerbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['kota_penerbit'] = [
        'name'          => 'kota_penerbit',
        'id'            => 'kota_penerbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['lokasi_name'] = [
        'name'          => 'lokasi_name',
        'id'            => 'lokasi_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['rak_name'] = [
        'name'          => 'rak_name',
        'id'            => 'rak_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['baris_name'] = [
        'name'          => 'baris_name',
        'id'            => 'baris_name',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];
      $this->data['tahun_terbit'] = [
        'name'          => 'tahun_terbit',
        'id'            => 'tahun_terbit',
        'class'         => 'form-control',
        'required'      => '',
        'readonly'      => '',
      ];

      $this->load->view('back/peminjaman/peminjaman_edit_buku', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/peminjaman');
    }
  }

  function update_anggota()
  {
    $this->data['peminjaman']           = $this->Peminjaman_model->get_by_id($this->input->post('id_peminjaman'));

    if ($this->data['peminjaman']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/peminjaman/update_action';
      $this->data['current_buku'] = $this->input->post('current_arsip');
      $this->data['new_buku'] = $this->input->post('new_arsip');
      $this->data['peminjaman_id'] = $this->input->post('id_peminjaman');

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
      $this->data['tgl_peminjaman'] = [
        'name'          => 'tgl_peminjaman',
        'id'            => 'tgl_peminjaman',
        'class'         => 'form-control',
        'readonly'      => '',
      ];
      $this->data['tgl_kembali'] = [
        'name'          => 'tgl_kembali',
        'id'            => 'tgl_kembali',
        'class'         => 'form-control',
        'readonly'      => '',
      ];
      $this->data['id_anggota'] = [
        'name'          => 'id_anggota',
        'id'            => 'id_anggota',
        'type'          => 'hidden',
      ];
      $this->data['id_peminjaman'] = [
        'name'          => 'id_peminjaman',
        'id'            => 'id_peminjaman',
        'type'          => 'hidden',
      ];
      $this->data['new_arsip'] = [
        'name'          => 'new_arsip',
        'id'            => 'new_arsip',
        'type'          => 'hidden',
      ];
      $this->data['current_arsip'] = [
        'name'          => 'current_arsip',
        'id'            => 'current_arsip',
        'type'          => 'hidden',
      ];

      $this->load->view('back/peminjaman/peminjaman_edit_anggota', $this->data);
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

    $data_anggota = $this->Anggota_model->get_by_id($this->input->post('id_anggota'));

    if ($this->form_validation->run() === FALSE) {
      $this->update($this->input->post('id_peminjaman'));
    } else {
      // jika nilai arsip baru tidak diisi, maka isikan dengan nilai dari current arsip
      if ($this->input->post('new_arsip') == NULL) {
        // echo "ARSIP BARU KOSONG";
        $data = array(
          'anggota_id'        => $this->input->post('id_anggota'),
          'instansi_id'       => $data_anggota->instansi_id,
          'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
          'tgl_kembali'       => $this->input->post('tgl_kembali'),
          'modified_by'       => $this->session->username,
        );
      }
      // tapi jika nilai arsip baru diisi maka masukkan nilai new_arsip
      else {
        $new_arsip = (int) $this->input->post('new_arsip');
        $id_anggota = (int) $this->input->post('id_anggota');

        $data = array(
          'tgl_peminjaman'    => $this->input->post('tgl_peminjaman'),
          'tgl_kembali'       => $this->input->post('tgl_kembali'),
          'anggota_id'        => $id_anggota,
          'arsip_id'          => $new_arsip,
          'instansi_id'       => $data_anggota->instansi_id,
          'modified_by'       => $this->session->username,
        );

        $data_buku = $this->Arsip_model->get_by_id($this->input->post('new_arsip'));

        if ($data_buku->qty > 0) {
          $stok_result_buku_baru = $data_buku->qty - 1;
        } else {
          $this->session->set_flashdata('message', '<div class="alert alert-danger">Stok buku dengan judul <b>"' . $data_buku->arsip_name . '"</b> saat ini sedang kosong.</div>');
          redirect('admin/peminjaman/update_book/' . $this->input->post('id_peminjaman'));
        }

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
      redirect('admin/peminjaman/detail/' . $this->input->post('id_anggota'));
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
      redirect('admin/peminjaman/detail/' . $delete->anggota_id);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/peminjaman/detail/' . $delete->anggota_id);
    }
  }

  function delete_peminjaman_by_anggota($id_anggota)
  {
    $delete = $this->Peminjaman_model->get_peminjaman_by_anggota($id_anggota);

    if ($delete) {
      foreach ($delete as $data) {
        $data_peminjaman = array(
          'is_delete_peminjaman'   => '1',
          'deleted_by'  => $this->session->username,
          'deleted_at'  => date('Y-m-d H:i:a'),
        );

        $this->Peminjaman_model->soft_delete($data->id_peminjaman, $data_peminjaman);
      }

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
          'anggota_id'    => $row->anggota_id,
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
    $this->db->join('anggota', 'peminjaman.anggota_id = anggota.id_anggota');
    $this->db->join('instansi', 'peminjaman.instansi_id = instansi.id_instansi');
    $this->db->join('arsip', 'peminjaman.arsip_id = arsip.id_arsip');

    $data = $this->db->get_where('peminjaman', array('id_peminjaman' => $peminjaman_id, 'is_kembali' => 0));

    if ($data->num_rows() != 0) {
      if ($data->row()->gender == '1') {
        $gender = "Laki-laki";
      } elseif ($data->row()->gender == '2') {
        $gender = "Perempuan";
      }

      $output['success'] = 1;

      $output['arsip_id']       = $data->row()->arsip_id;
      $output['anggota_name']   = $data->row()->anggota_name;
      $output['no_induk']       = $data->row()->no_induk;
      $output['gender']         = $gender;
      $output['address']        = $data->row()->address;
      $output['instansi_name']  = $data->row()->instansi_name;
      $output['no_arsip']       = $data->row()->no_arsip;
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

  function scan_qrcode()
  {
    $this->data['page_title'] = 'Scan QR Code ' . $this->data['module'];
    $this->data['action']     = 'admin/peminjaman/get_qrcode_buku';

    $this->load->view('back/peminjaman/peminjaman_scanqrcode', $this->data);
  }

  function get_qrcode_buku()
  {
    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/peminjaman/create_action';

    if (is_grandadmin()) {
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_anggota']     = $this->Anggota_model->get_all_combobox_by_instansi($this->session->instansi_id);
    }

    $id = $this->input->post('id_arsip');

    $cek_id = $this->Arsip_model->cek_id($id);

    if (!$cek_id) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data QR Code not found</div>');
      redirect('admin/peminjaman/create');
    }

    $this->data['buku'] = $cek_id;

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
    $this->data['arsip_name'] = [
      'name'          => 'arsip_name',
      'id'            => 'arsip_name',
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
    $this->data['penulis_buku'] = [
      'name'          => 'penulis_buku',
      'id'            => 'penulis_buku',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['penerbit'] = [
      'name'          => 'penerbit',
      'id'            => 'penerbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['kota_penerbit'] = [
      'name'          => 'kota_penerbit',
      'id'            => 'kota_penerbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['lokasi_name'] = [
      'name'          => 'lokasi_name',
      'id'            => 'lokasi_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['rak_name'] = [
      'name'          => 'rak_name',
      'id'            => 'rak_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['baris_name'] = [
      'name'          => 'baris_name',
      'id'            => 'baris_name',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['tahun_terbit'] = [
      'name'          => 'tahun_terbit',
      'id'            => 'tahun_terbit',
      'class'         => 'form-control',
      'required'      => '',
      'readonly'      => '',
    ];
    $this->data['no_induk'] = [
      'name'          => 'no_induk',
      'id'            => 'no_induk',
      'class'         => 'form-control',
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

    $this->session->set_flashdata('message', '<div class="alert alert-success">Data QR Code buku ditemukan</div>');
    $this->load->view('back/peminjaman/peminjaman_add', $this->data);
  }

  function get_buku($id_arsip = '')
  {
    $this->db->join('lokasi', 'arsip.lokasi_id = lokasi.id_lokasi');
    $this->db->join('rak', 'arsip.rak_id = rak.id_rak');
    $this->db->join('baris', 'arsip.baris_id = baris.id_baris');

    $data = $this->db->get_where('arsip', array('id_arsip' => $id_arsip));

    if ($data->num_rows() != 0) {
      $output['success'] = 1;

      $output['id_arsip']       = $data->row()->id_arsip;
      $output['arsip_name']       = $data->row()->arsip_name;
      $output['no_arsip']           = $data->row()->no_arsip;
      $output['penulis_buku']    = $data->row()->penulis_buku;
      $output['penerbit']    = $data->row()->penerbit;
      $output['kota_penerbit']  = $data->row()->kota_penerbit;
      $output['lokasi_name']  = $data->row()->lokasi_name;
      $output['rak_name']  = $data->row()->rak_name;
      $output['baris_name']  = $data->row()->baris_name;
      $output['tahun_terbit']  = $data->row()->tahun_terbit;
    } else {
      $output['success'] = 0;
    }

    echo json_encode($output);
  }

  function get_anggota($id_anggota = '')
  {
    $data = $this->db->get_where('anggota', array('id_anggota' => $id_anggota));

    if ($data->num_rows() != 0) {
      if ($data->row()->gender == '1') {
        $gender = "Laki-laki";
      } elseif ($data->row()->gender == '2') {
        $gender = "Perempuan";
      }

      $output['success'] = 1;

      $output['id_anggota']       = $data->row()->id_anggota;
      $output['anggota_name']       = $data->row()->anggota_name;
      $output['gender']           = $gender;
      $output['angkatan']    = $data->row()->angkatan;
      $output['address']    = $data->row()->address;
      $output['instansi_id']    = $data->row()->instansi_id;
      $output['tgl_peminjaman']    = date('Y-m-d');
      $output['tgl_kembali']    = date('Y-m-d', strtotime('+7 days', strtotime(date('Y-m-d'))));
    } else {
      $output['success'] = 0;
    }

    echo json_encode($output);
  }

  function print_invoice_coba($id_anggota)
  {
    $data_peminjaman = $this->Peminjaman_model->get_peminjaman_by_anggota($id_anggota);

    // var_dump($data_peminjaman); die();

    require FCPATH . '/vendor/autoload.php';
    require FCPATH . '/vendor/setasign/fpdf/fpdf.php';

    $pdf = new FPDF('P', 'mm', array(75, 110));
    $pdf->AddPage();

    $pdf->SetFont('Arial', 'B', 14);
    $pdf->Cell(189, 5, 'PERPUSTAKAAN', 0, 1, 'C');
    $pdf->Cell(189, 8, 'JAYA ABADI', 0, 1, 'C');

    $pdf->SetFont('Arial', '', 14);
    $pdf->Cell(189, 5, 'JL. Selalu Bahagia', 0, 1, 'C');
    // $pdf->Cell(25 ,5,'Date',0,0);
    // $pdf->Cell(34 ,5,'01 Januari 2020',0,1);//end of line

    $pdf->SetLineWidth(1);
    $pdf->Line(10, 30, 199, 30);
    $pdf->SetLineWidth(0);
    $pdf->Line(10, 31, 199, 31);

    // $pdf->Cell(130 ,5,'Jakarta, Indonesia, 32122',0,0);
    // $pdf->Cell(25 ,5,'Invoice #',0,0);
    // $pdf->Cell(34 ,5,'1234567',0,1);//end of line

    // $pdf->Cell(130 ,5,'Phone 021121212',0,0);
    // $pdf->Cell(59 ,5,'',0,1);

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(189, 5, '', 0, 1); //end of line

    //billing address
    $pdf->SetFont('Arial', '', 12);
    $pdf->Cell(189, 10, 'KARTU PEMINJAMAN DAN PENGEMBALIAN BUKU', 0, 1, 'C'); //end of line

    //add dummy cell at beginning of each line for indentation
    $pdf->Cell(37, 6, 'No Induk Anggota', 0, 0);
    $pdf->Cell(5, 6, ':', 0, 0);
    $pdf->Cell(147, 6, '1600018161', 0, 1);
    $pdf->Cell(37, 6, 'Nama Anggota', 0, 0);
    $pdf->Cell(5, 6, ':', 0, 0);
    $pdf->Cell(147, 6, 'Ridar Gustia Priatama', 0, 1);
    $pdf->Cell(37, 6, 'Tanggal', 0, 0);
    $pdf->Cell(5, 6, ':', 0, 0);
    $pdf->Cell(147, 6, '12 Mei 2022', 0, 1);

    $pdf->Cell(189, 5, '', 0, 1); //end of line

    //Ujicoba invoice contents
    // while($hasil=mysqli_fetch_array($data)){
    //   $cellWidth=20; //lebar sel
    //   $cellHeight=1; //tinggi sel satu baris normal

    //   //periksa apakah teksnya melibihi kolom?
    //   if($pdf->GetStringWidth($hasil['pesan']) < $cellWidth){
    //     //jika tidak, maka tidak melakukan apa-apa
    //     $line=1;
    //   }else{
    //     //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
    //     //dengan memisahkan teks agar sesuai dengan lebar sel
    //     //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel

    //     $textLength=strlen($hasil['pesan']);	//total panjang teks
    //     $errMargin=5;		//margin kesalahan lebar sel, untuk jaga-jaga
    //     $startChar=0;		//posisi awal karakter untuk setiap baris
    //     $maxChar=0;			//karakter maksimum dalam satu baris, yang akan ditambahkan nanti
    //     $textArray=array();	//untuk menampung data untuk setiap baris
    //     $tmpString="";		//untuk menampung teks untuk setiap baris (sementara)

    //     while($startChar < $textLength){ //perulangan sampai akhir teks
    //       //perulangan sampai karakter maksimum tercapai
    //       while(
    //       $pdf->GetStringWidth( $tmpString ) < ($cellWidth-$errMargin) &&
    //       ($startChar+$maxChar) < $textLength ) {
    //         $maxChar++;
    //         $tmpString=substr($hasil['pesan'],$startChar,$maxChar);
    //       }
    //       //pindahkan ke baris berikutnya
    //       $startChar=$startChar+$maxChar;
    //       //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
    //       array_push($textArray,$tmpString);
    //       //reset variabel penampung
    //       $maxChar=0;
    //       $tmpString='';

    //     }
    //     //dapatkan jumlah baris
    //     $line=count($textArray);
    //   }

    //   //tulis selnya
    //   $pdf->SetFillColor(255,255,255);
    //   $pdf->Cell(1,($line * $cellHeight),$no++,1,0,'C',true); //sesuaikan ketinggian dengan jumlah garis
    //   $pdf->Cell(4,($line * $cellHeight),$hasil['tanggal'],1,0); //sesuaikan ketinggian dengan jumlah garis

    //   //memanfaatkan MultiCell sebagai ganti Cell
    //   //atur posisi xy untuk sel berikutnya menjadi di sebelahnya.
    //   //ingat posisi x dan y sebelum menulis MultiCell
    //   $xPos=$pdf->GetX();
    //   $yPos=$pdf->GetY();
    //   $pdf->MultiCell($cellWidth,$cellHeight,$hasil['pesan'],1);

    //   //kembalikan posisi untuk sel berikutnya di samping MultiCell
    //   //dan offset x dengan lebar MultiCell
    //   $pdf->SetXY($xPos + $cellWidth , $yPos);

    //   $pdf->Cell(3,($line * $cellHeight),$hasil['pengirim'],1,1); //sesuaikan ketinggian dengan jumlah garis
    // }


    // Kolom tgl peminjaman=================================================================
    $cellWidthTglPeminjaman = 25; //lebar sel
    $cellHeightTglPeminjaman = 5; //tinggi sel satu baris normal

    //periksa apakah teksnya melibihi kolom?
    if ($pdf->GetStringWidth('Tgl Peminjaman') < $cellWidthTglPeminjaman) {
      //jika tidak, maka tidak melakukan apa-apa
      $lineTglPeminjaman = 1;
    } else {
      //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
      //dengan memisahkan teks agar sesuai dengan lebar sel
      //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel

      $textLengthTglPeminjaman = strlen('Tgl Peminjaman');  //total panjang teks
      $errMarginTglPeminjaman = 5;    //margin kesalahan lebar sel, untuk jaga-jaga
      $startCharTglPeminjaman = 0;    //posisi awal karakter untuk setiap baris
      $maxCharTglPeminjaman = 0;      //karakter maksimum dalam satu baris, yang akan ditambahkan nanti
      $textArrayTglPeminjaman = array();  //untuk menampung data untuk setiap baris
      $tmpStringTglPeminjaman = "";    //untuk menampung teks untuk setiap baris (sementara)

      while ($startCharTglPeminjaman < $textLengthTglPeminjaman) { //perulangan sampai akhir teks
        //perulangan sampai karakter maksimum tercapai
        while (
          $pdf->GetStringWidth($tmpStringTglPeminjaman) < ($cellWidthTglPeminjaman - $errMarginTglPeminjaman) &&
          ($startCharTglPeminjaman + $maxCharTglPeminjaman) < $textLengthTglPeminjaman
        ) {
          $maxCharTglPeminjaman++;
          $tmpStringTglPeminjaman = substr('Tgl Peminjaman', $startCharTglPeminjaman, $maxCharTglPeminjaman);
        }
        //pindahkan ke baris berikutnya
        $startCharTglPeminjaman = $startCharTglPeminjaman + $maxCharTglPeminjaman;
        //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
        array_push($textArrayTglPeminjaman, $tmpStringTglPeminjaman);
        //reset variabel penampung
        $maxCharTglPeminjaman = 0;
        $tmpStringTglPeminjaman = '';
      }
      //dapatkan jumlah baris
      $lineTglPeminjaman = count($textArrayTglPeminjaman);
    }
    // End kolom tgl peminjaman=================================================================

    // Kolom tgl Pengembalian=================================================================
    $cellWidthTglPengembalian = 25; //lebar sel
    $cellHeightTglPengembalian = 5; //tinggi sel satu baris normal

    //periksa apakah teksnya melibihi kolom?
    if ($pdf->GetStringWidth('Tgl Pengembalian') < $cellWidthTglPengembalian) {
      //jika tidak, maka tidak melakukan apa-apa
      $lineTglPengembalian = 1;
    } else {
      //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
      //dengan memisahkan teks agar sesuai dengan lebar sel
      //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel

      $textLengthTglPengembalian = strlen('Tgl Pengembalian');  //total panjang teks
      $errMarginTglPengembalian = 5;    //margin kesalahan lebar sel, untuk jaga-jaga
      $startCharTglPengembalian = 0;    //posisi awal karakter untuk setiap baris
      $maxCharTglPengembalian = 0;      //karakter maksimum dalam satu baris, yang akan ditambahkan nanti
      $textArrayTglPengembalian = array();  //untuk menampung data untuk setiap baris
      $tmpStringTglPengembalian = "";    //untuk menampung teks untuk setiap baris (sementara)

      while ($startCharTglPengembalian < $textLengthTglPengembalian) { //perulangan sampai akhir teks
        //perulangan sampai karakter maksimum tercapai
        while (
          $pdf->GetStringWidth($tmpStringTglPengembalian) < ($cellWidthTglPengembalian - $errMarginTglPengembalian) &&
          ($startCharTglPengembalian + $maxCharTglPengembalian) < $textLengthTglPengembalian
        ) {
          $maxCharTglPengembalian++;
          $tmpStringTglPengembalian = substr('Tgl Pengembalian', $startCharTglPengembalian, $maxCharTglPengembalian);
        }
        //pindahkan ke baris berikutnya
        $startCharTglPengembalian = $startCharTglPengembalian + $maxCharTglPengembalian;
        //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
        array_push($textArrayTglPengembalian, $tmpStringTglPengembalian);
        //reset variabel penampung
        $maxCharTglPengembalian = 0;
        $tmpStringTglPengembalian = '';
      }
      //dapatkan jumlah baris
      $lineTglPengembalian = count($textArrayTglPengembalian);
    }
    // End kolom tgl Pengembalian=================================================================

    // Kolom Paraf Petugas=================================================================
    $cellWidthParaf = 17; //lebar sel
    $cellHeightParaf = 5; //tinggi sel satu baris normal

    //periksa apakah teksnya melibihi kolom?
    if ($pdf->GetStringWidth('Paraf Petugas') < $cellWidthParaf) {
      //jika tidak, maka tidak melakukan apa-apa
      $lineParaf = 1;
    } else {
      //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
      //dengan memisahkan teks agar sesuai dengan lebar sel
      //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel

      $textLengthParaf = strlen('Paraf Petugas');  //total panjang teks
      $errMarginParaf = 5;    //margin kesalahan lebar sel, untuk jaga-jaga
      $startCharParaf = 0;    //posisi awal karakter untuk setiap baris
      $maxCharParaf = 0;      //karakter maksimum dalam satu baris, yang akan ditambahkan nanti
      $textArrayParaf = array();  //untuk menampung data untuk setiap baris
      $tmpStringParaf = "";    //untuk menampung teks untuk setiap baris (sementara)

      while ($startCharParaf < $textLengthParaf) { //perulangan sampai akhir teks
        //perulangan sampai karakter maksimum tercapai
        while (
          $pdf->GetStringWidth($tmpStringParaf) < ($cellWidthParaf - $errMarginParaf) &&
          ($startCharParaf + $maxCharParaf) < $textLengthParaf
        ) {
          $maxCharParaf++;
          $tmpStringParaf = substr('Paraf Petugas', $startCharParaf, $maxCharParaf);
        }
        //pindahkan ke baris berikutnya
        $startCharParaf = $startCharParaf + $maxCharParaf;
        //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
        array_push($textArrayParaf, $tmpStringParaf);
        //reset variabel penampung
        $maxCharParaf = 0;
        $tmpStringParaf = '';
      }
      //dapatkan jumlah baris
      $lineParaf = count($textArrayParaf);
    }
    // End kolom Paraf Petugas=================================================================

    //tulis selnya
    $pdf->SetFont('Arial', 'B', 9);
    $pdf->SetFillColor(255, 255, 255);
    $pdf->Cell(10, ($lineTglPeminjaman * $cellHeightTglPeminjaman), 'No', 1, 0, 'C', true); //sesuaikan ketinggian dengan jumlah garis

    //memanfaatkan MultiCell sebagai ganti Cell
    //atur posisi xy untuk sel berikutnya menjadi di sebelahnya.
    //ingat posisi x dan y sebelum menulis MultiCell
    $xPos = $pdf->GetX();
    $yPos = $pdf->GetY();
    $pdf->MultiCell($cellWidthTglPeminjaman, $cellHeightTglPeminjaman, 'Tgl Peminjaman', 1, 'C');

    //kembalikan posisi untuk sel berikutnya di samping MultiCell
    //dan offset x dengan lebar MultiCell
    $pdf->SetXY($xPos + $cellWidthTglPeminjaman, $yPos);

    $pdf->Cell(53, ($lineTglPeminjaman * $cellHeightTglPeminjaman), 'Judul Buku', 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis
    $pdf->Cell(35, ($lineTglPeminjaman * $cellHeightTglPeminjaman), 'Label Buku', 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis

    //memanfaatkan MultiCell sebagai ganti Cell
    //atur posisi xy untuk sel berikutnya menjadi di sebelahnya.
    //ingat posisi x dan y sebelum menulis MultiCell
    $xPos = $pdf->GetX();
    $yPos = $pdf->GetY();
    $pdf->MultiCell($cellWidthTglPengembalian, $cellHeightTglPengembalian, 'Tgl Pengembalian', 1, 'C');

    //kembalikan posisi untuk sel berikutnya di samping MultiCell
    //dan offset x dengan lebar MultiCell
    $pdf->SetXY($xPos + $cellWidthTglPengembalian, $yPos);

    //memanfaatkan MultiCell sebagai ganti Cell
    //atur posisi xy untuk sel berikutnya menjadi di sebelahnya.
    //ingat posisi x dan y sebelum menulis MultiCell
    $xPos = $pdf->GetX();
    $yPos = $pdf->GetY();
    $pdf->MultiCell($cellWidthParaf, $cellHeightParaf, 'Paraf Petugas', 1, 'C');

    //kembalikan posisi untuk sel berikutnya di samping MultiCell
    //dan offset x dengan lebar MultiCell
    $pdf->SetXY($xPos + $cellWidthParaf, $yPos);

    $pdf->Cell(23, ($lineTglPengembalian * $cellHeightTglPengembalian), 'Keterangan', 1, 1, 'C'); //sesuaikan ketinggian dengan jumlah garis

    //Data Peminjaman===========================================================

    $no = 1;
    foreach ($data_peminjaman as $row) {
      $cellWidth = 53; //lebar sel
      $cellHeight = 8; //tinggi sel satu baris normal

      //periksa apakah teksnya melibihi kolom?
      if ($pdf->GetStringWidth($row->arsip_name) < $cellWidth) {
        //jika tidak, maka tidak melakukan apa-apa
        $line = 1;
      } else {
        //jika ya, maka hitung ketinggian yang dibutuhkan untuk sel akan dirapikan
        //dengan memisahkan teks agar sesuai dengan lebar sel
        //lalu hitung berapa banyak baris yang dibutuhkan agar teks pas dengan sel

        $textLength = strlen($row->arsip_name);  //total panjang teks
        $errMargin = 1;    //margin kesalahan lebar sel, untuk jaga-jaga
        $startChar = 0;    //posisi awal karakter untuk setiap baris
        $maxChar = 0;      //karakter maksimum dalam satu baris, yang akan ditambahkan nanti
        $textArray = array();  //untuk menampung data untuk setiap baris
        $tmpString = "";    //untuk menampung teks untuk setiap baris (sementara)

        while ($startChar < $textLength) { //perulangan sampai akhir teks
          //perulangan sampai karakter maksimum tercapai
          while (
            $pdf->GetStringWidth($tmpString) < ($cellWidth - $errMargin) &&
            ($startChar + $maxChar) < $textLength
          ) {
            $maxChar++;
            $tmpString = substr($row->arsip_name, $startChar, $maxChar);
          }
          //pindahkan ke baris berikutnya
          $startChar = $startChar + $maxChar;
          //kemudian tambahkan ke dalam array sehingga kita tahu berapa banyak baris yang dibutuhkan
          array_push($textArray, $tmpString);
          //reset variabel penampung
          $maxChar = 0;
          $tmpString = '';
        }
        //dapatkan jumlah baris
        $line = count($textArray);
      }
      // End kolom Judul Buku=============================================

      //tulis selnya
      $pdf->SetFont('Arial', '', 9);
      $pdf->SetFillColor(255, 255, 255);
      $pdf->Cell(10, ($line * $cellHeight), $no++, 1, 0, 'C', true); //sesuaikan ketinggian dengan jumlah garis
      $pdf->Cell(25, ($line * $cellHeight), $row->tgl_peminjaman, 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis

      //memanfaatkan MultiCell sebagai ganti Cell
      //atur posisi xy untuk sel berikutnya menjadi di sebelahnya.
      //ingat posisi x dan y sebelum menulis MultiCell
      $xPos = $pdf->GetX();
      $yPos = $pdf->GetY();
      $pdf->MultiCell($cellWidth, $cellHeight, $row->arsip_name, 1);

      //kembalikan posisi untuk sel berikutnya di samping MultiCell
      //dan offset x dengan lebar MultiCell
      $pdf->SetXY($xPos + $cellWidth, $yPos);

      $pdf->Cell(35, ($line * $cellHeight), $row->no_arsip, 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis
      $pdf->Cell(25, ($line * $cellHeight), $row->tgl_kembali, 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis
      $pdf->Cell(17, ($line * $cellHeight), '', 1, 0, 'C'); //sesuaikan ketinggian dengan jumlah garis
      $pdf->Cell(23, ($line * $cellHeight), '', 1, 1, 'C'); //sesuaikan ketinggian dengan jumlah garis
    }


    // //Invoice Contents
    // $pdf->SetFont('Arial','B',12);
    // $pdf->Cell(10 ,5,'No',1,0,'L');
    // $pdf->Cell(35 ,5,'Tgl Peminjaman',1,0,'C');
    // $pdf->Cell(25 ,5,'Judul Buku',1,0);
    // $pdf->Cell(25 ,5,'Label',1,0);
    // $pdf->Cell(25 ,5,'Tgl Pengembalian',1,0);
    // $pdf->Cell(25 ,5,'Paraf Petugas',1,0);
    // $pdf->Cell(34 ,5,'Keterangan',1,1);

    // $pdf->SetFont('Arial','',12);

    // $pdf->Cell(100 ,5,'Produk A',1,0);
    // $pdf->Cell(30 ,5,'Rp 100.000',1,0);
    // $pdf->Cell(25 ,5,2,1,0);
    // $pdf->Cell(34 ,5,'Rp 200.000',1,1,'R');

    // $pdf->Cell(100 ,5,'Produk B',1,0);
    // $pdf->Cell(30 ,5,'Rp 100.000',1,0);
    // $pdf->Cell(25 ,5,3,1,0);
    // $pdf->Cell(34 ,5,'Rp 300.000',1,1,'R');

    // $pdf->Cell(100 ,5,'',0,0);
    // $pdf->Cell(55 ,5,'Subtotal',0,0);
    // $pdf->Cell(34 ,5,'Rp 500.000',1,1,'R');//end of line

    // $pdf->Cell(100 ,5,'',0,0);
    // $pdf->Cell(55 ,5,'Biaya Pengiriman',0,0);
    // $pdf->Cell(34 ,5,'Rp 10.000',1,1,'R');//end of line

    // $pdf->Cell(100 ,5,'',0,0);
    // $pdf->Cell(55 ,5,'Total',0,0);
    // $pdf->Cell(34 ,5,'Rp 510.000',1,1,'R');//end of line

    // $pdf->Cell(100 ,5,'',0,0);
    // $pdf->Cell(55 ,5,'PPN',0,0);
    // $pdf->Cell(34 ,5,'Rp 5.100',1,1,'R');//end of line

    // $pdf->Cell(100 ,5,'',0,0);
    // $pdf->Cell(55 ,5,'Grandtotal',0,0);
    // $pdf->Cell(34 ,5,'Rp 515.100',1,1,'R');//end of line

    $pdf->Output();
  }

  function print_invoice($id_anggota)
  {
    //TODO Get data-data yang dibutuhkan untuk ditampilkan ke struk peminjaman
    $data_peminjaman = $this->Peminjaman_model->get_peminjaman_by_anggota($id_anggota);
    $data_anggota = $this->Anggota_model->get_by_id_for_print_invoice($id_anggota);
    $total_rows_by_anggota = $this->Peminjaman_model->total_rows_by_anggota($id_anggota);

    //TODO Import library FPDF
    require FCPATH . '/vendor/autoload.php';
    require FCPATH . '/vendor/setasign/fpdf/fpdf.php';

    //TODO Rancang template struk peminjaman dengan ekstensi PDF
    $pdf = new FPDF('P', 'mm', array(75, 121));
    $pdf->SetTitle('Struk Peminjaman Buku - ' . $data_anggota->no_induk);
    $pdf->SetTopMargin(5);
    $pdf->SetLeftMargin(5);
    $pdf->AddPage();

    $pdf->SetFont('Arial', 'B', 8);
    $pdf->Cell(65, 3, 'PERPUSTAKAAN', 0, 1, 'C');
    $pdf->Cell(65, 3, strtoupper($data_anggota->instansi_name), 0, 1, 'C');

    $pdf->SetFont('Arial', '', 7);
    // $pdf->Cell(65 ,3,'JL. Selalu Bahagia',0,1, 'C');
    // $pdf->SetLineWidth(0);
    // $pdf->Line(5,15,70,15);
    $pdf->Cell(65, 2, '-----------------------------------------------------------------------------', 0, 1, 'L');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 2, '', 0, 1); //end of line

    $pdf->Cell(65, 3, 'STRUK PEMINJAMAN BUKU', 0, 1, 'C');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 3, '', 0, 1); //end of line

    $pdf->Cell(32.5, 3, $data_anggota->no_induk, 0, 0, 'L');
    $pdf->Cell(32.5, 3, date('d/m/Y'), 0, 1, 'R');
    $pdf->Cell(32.5, 3, $data_anggota->anggota_name, 0, 0, 'L');
    $pdf->Cell(32.5, 3, 'Petugas : ' . $this->session->username, 0, 1, 'R');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 1, '', 0, 1); //end of line

    // $pdf->SetLineWidth(0);
    // $pdf->Line(5,31,70,31);
    $pdf->Cell(65, 2, '-----------------------------------------------------------------------------', 0, 1, 'L');

    $pdf->Cell(34, 3, 'Buku', 0, 0, 'L');
    $pdf->Cell(15, 3, 'Tgl Pinjam', 0, 0, 'R');
    $pdf->Cell(16, 3, 'Tgl Kembali', 0, 1, 'R');

    // $pdf->SetLineWidth(0);
    // $pdf->Line(5,36,70,36);
    $pdf->Cell(65, 2, '-----------------------------------------------------------------------------', 0, 1, 'L');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 1, '', 0, 1); //end of line

    foreach ($data_peminjaman as $data) {
      $pdf->Cell(35, 3, $data->arsip_name, 0, 0, 'L');
      $pdf->Cell(15, 3, datetime_indo4($data->tgl_peminjaman), 0, 0, 'R');
      $pdf->Cell(15, 3, datetime_indo4($data->tgl_kembali), 0, 1, 'R');
    }

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 1, '', 0, 1); //end of line

    // $pdf->SetLineWidth(0);
    // $pdf->Line(5,52,70,52);
    $pdf->Cell(65, 2, '-----------------------------------------------------------------------------', 0, 1, 'L');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 1, '', 0, 1); //end of line

    $pdf->Cell(24, 3, '', 0, 0, 'R');
    $pdf->Cell(26, 3, 'Total Buku', 0, 0, 'L');
    $pdf->Cell(15, 3, $total_rows_by_anggota . ' pcs', 0, 1, 'R');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 9, '', 0, 1); //end of line

    // $pdf->SetLineWidth(0);
    // $pdf->Line(5,72,28,72);

    $pdf->Cell(65, 3, '---------------------------- PERATURAN ----------------------------', 0, 1, 'C');

    // $pdf->SetLineWidth(0);
    // $pdf->Line(47,72,70,72);

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 1, '', 0, 1); //end of line

    $pdf->Cell(65, 3, '* Jumlah buku yang dipinjam max 4 pcs', 0, 1, 'L');
    $pdf->Cell(65, 3, '* 1 judul buku max pinjam 1 pcs', 0, 1, 'L');
    $pdf->Cell(65, 3, '* Lama peminjaman max selama 7 hari', 0, 1, 'L');
    $pdf->Cell(65, 3, '* Denda Rp 2.500,- / buku * lama keterlambatan(hari)', 0, 1, 'L');

    //make a dummy empty cell as a vertical spacer
    $pdf->Cell(65, 5, '', 0, 1); //end of line

    $pdf->Cell(65, 3, '--Terimakasih atas kunjungan anda--', 0, 1, 'C');
    $pdf->Cell(65, 3, '--Selamat Membaca--', 0, 1, 'C');

    $pdf->Output('I', 'Struk Peminjaman Buku - ' . $data_anggota->no_induk . '.pdf');
  }
}

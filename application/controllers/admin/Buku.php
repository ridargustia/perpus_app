<?php
defined('BASEPATH') or exit('No direct script access allowed');

require 'vendor/autoload.php';

class Buku extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->data['module'] = 'Buku';

    $this->load->model(array(
      'Arsip_model', 'Baris_model', 'Box_model', 'File_model', 'Jenis_model', 'Map_model', 'Rak_model', 'Token_model', 'Bahasa_model'
    ));

    //Deklarasi Library
    $this->load->library('Ciqrcode');

    $this->data['company_data']             = $this->Company_model->company_profile();
    $this->data['layout_template']          = $this->Template_model->layout();
    $this->data['skins_template']           = $this->Template_model->skins();
    $this->data['footer']                   = $this->Footer_model->footer();

    $this->data['btn_submit'] = 'Save';
    $this->data['btn_reset']  = 'Reset';
    $this->data['btn_add']    = 'Tambah Data';
    $this->data['add_action'] = base_url('admin/buku/create');

    is_login();

    if (is_user()) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak masuk ke halaman sebelumnya</div>');
      redirect('home');
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
      $this->data['get_all'] = $this->Arsip_model->get_all();
      $this->load->view('back/arsip/arsip_list_grandadmin', $this->data);
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_by_instansi();
      $this->load->view('back/arsip/arsip_list_masteradmin', $this->data);
    } 
  }

  function aktif()
  {
    is_read();

    $this->data['page_title'] = 'Data ' . $this->data['module'] . ' Aktif';

    if (is_grandadmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_aktif();
      $this->load->view('back/arsip/arsip_list_grandadmin', $this->data);
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_aktif_by_instansi();
      $this->load->view('back/arsip/arsip_list_masteradmin', $this->data);
    } elseif (is_superadmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_aktif_by_cabang();
      $this->load->view('back/arsip/arsip_list_superadmin', $this->data);
    } elseif (is_admin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_aktif_by_divisi();
      $this->load->view('back/arsip/arsip_list_admin', $this->data);
    } elseif (is_pegawai()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_aktif_by_bagian();
      $this->load->view('back/arsip/arsip_list_pegawai', $this->data);
    }
  }

  function inaktif()
  {
    is_read();

    $this->data['page_title'] = 'Data ' . $this->data['module'] . ' InAktif';

    if (is_grandadmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_inaktif();
      $this->load->view('back/arsip/arsip_list_grandadmin', $this->data);
    } elseif (is_masteradmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_inaktif_by_instansi();
      $this->load->view('back/arsip/arsip_list_masteradmin', $this->data);
    } elseif (is_superadmin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_inaktif_by_cabang();
      $this->load->view('back/arsip/arsip_list_superadmin', $this->data);
    } elseif (is_admin()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_inaktif_by_divisi();
      $this->load->view('back/arsip/arsip_list_admin', $this->data);
    } elseif (is_pegawai()) {
      $this->data['get_all'] = $this->Arsip_model->get_all_inaktif_by_bagian();
      $this->load->view('back/arsip/arsip_list_pegawai', $this->data);
    }
  }

  function detail($id)
  {
    $this->data['detail_arsip']   = $this->Arsip_model->get_detail($id);
    $this->data['file_upload']    = $this->File_model->get_by_arsip_id($id);
    
    $instansi                     = $this->Instansi_model->get_by_id($this->data['detail_arsip']->instansi_id);
    $this->data['instansiName']   = $instansi->instansi_name;

    $row = $this->data['detail_arsip'];

    // GrandAdmin bisa akses ke semua data
    // MasterAdmin akses ke data instansinya saja
    // SuperAdmin akses ke data cabangnya saja
    // Admin akses data divisinya saja
    if (is_masteradmin() && $row->instansi_id != $this->session->instansi_id) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak melihat data orang lain</div>');
      redirect('admin/buku');
    } elseif ($this->data['detail_arsip']) {
      $this->data['page_title']   = 'Detail Buku';
      $this->data['arsip_files']  = $this->Arsip_model->get_files_id_result($this->data['detail_arsip']->id_arsip);

      $this->load->view('back/arsip/arsip_detail', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/buku');
    }
  }

  function create()
  {
    is_create();

    $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
    $this->data['action']     = 'admin/buku/create_action';

    $this->data['get_all_jenis_arsip'] = $this->Jenis_model->get_all();

    if (is_grandadmin()) {
      $this->data['get_all_combobox_lokasi']    = $this->Lokasi_model->get_all_combobox();
      $this->data['get_all_combobox_instansi']  = $this->Instansi_model->get_all_combobox();
      $this->data['get_all_combobox_cabang']    = $this->Cabang_model->get_all_combobox();
      $this->data['get_all_combobox_divisi']    = $this->Divisi_model->get_all_combobox();
      $this->data['get_all_combobox_user']      = $this->Auth_model->get_all_combobox();
      $this->data['get_all_combobox_rak']       = $this->Rak_model->get_all_combobox();
      $this->data['get_all_combobox_box']       = $this->Box_model->get_all_combobox();
      $this->data['get_all_combobox_map']       = $this->Map_model->get_all_combobox();
      // $this->data['get_all_combobox_baris']     = $this->Baris_model->get_all_combobox();
      $this->data['get_all_combobox_bahasa']    = $this->Bahasa_model->get_all_combobox();
    } elseif (is_masteradmin()) {
      $this->data['get_all_combobox_lokasi']    = $this->Lokasi_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_cabang']    = $this->Cabang_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_divisi']    = $this->Divisi_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_user']      = $this->Auth_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_rak']       = $this->Rak_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_box']       = $this->Box_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_map']       = $this->Map_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_baris']     = $this->Baris_model->get_all_combobox_by_instansi($this->session->instansi_id);
      $this->data['get_all_combobox_bahasa']    = $this->Bahasa_model->get_all_combobox();
    } 

    $this->data['instansi_id'] = [
      'name'          => 'instansi_id',
      'id'            => 'instansi_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilLokasi()',
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
      'onChange'      => 'tampilBagian(); tampilLokasi(); tampilRak(); tampilBox(); tampilMap(); tampilBaris()',
      'required'      => ''
    ];
    $this->data['bagian_id'] = [
      'name'          => 'bagian_id',
      'id'            => 'bagian_id',
      'class'         => 'form-control',
      'onChange'      => 'tampilKepemilikanArsip()',
      'required'      => ''
    ];
    $this->data['lokasi_id'] = [
      'name'          => 'lokasi_id',
      'id'            => 'lokasi_id',
      'class'         => 'form-control',
      'required'      => '',
      'onChange'      => 'tampilRak();'
    ];
    $this->data['user_id'] = [
      'name'          => 'user_id',
      'id'            => 'user_id',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['rak_id'] = [
      'name'          => 'rak_id',
      'id'            => 'rak_id',
      'class'         => 'form-control',
      'required'      => '',
      'onChange'      => 'tampilBaris();'
    ];
    $this->data['box_id'] = [
      'name'          => 'box_id',
      'id'            => 'box_id',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
    ];
    $this->data['map_id'] = [
      'name'          => 'map_id',
      'id'            => 'map_id',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
    ];
    $this->data['baris_id'] = [
      'name'          => 'baris_id',
      'id'            => 'baris_id',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['no_arsip'] = [
      'name'          => 'no_arsip',
      'id'            => 'no_arsip',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'onChange'      => 'checkNoArsip()',
      'required'      => '',
      'value'         => $this->form_validation->set_value('no_arsip'),
    ];
    $this->data['arsip_name'] = [
      'name'          => 'arsip_name',
      'id'            => 'arsip_name',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'onChange'      => 'checkArsipName()',
      'required'      => '',
      'value'         => $this->form_validation->set_value('arsip_name'),
    ];
    $this->data['deskripsi_arsip'] = [
      'name'          => 'deskripsi_arsip',
      'id'            => 'deskripsi_arsip',
      'class'         => 'form-control',
      'rows'          => '5',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('deskripsi_arsip'),
    ];
    $this->data['jenis_arsip_id'] = [
      'name'          => 'jenis_arsip_id[]',
      'id'            => 'jenis_arsip_id',
      'class'         => 'form-control select2',
      'multiple'      => '',
      'required'      => '',
    ];
    $this->data['tahun_terbit'] = [
      'name'          => 'tahun_terbit',
      'id'            => 'tahun_terbit',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'value'         => $this->form_validation->set_value('tahun_terbit'),
    ];
    $this->data['status_file'] = [
      'name'          => 'status_file',
      'id'            => 'status_file',
      'class'         => 'form-control',
    ];
    $this->data['email'] = [
      'name'          => 'email',
      'id'            => 'email',
      'class'         => 'form-control',
    ];
    $this->data['folder_name'] = [
      'name'          => 'folder_name',
      'id'            => 'folder_name',
      'class'         => 'form-control',
      'readonly'      => '',
    ];
    $this->data['keterangan'] = [
      'name'          => 'keterangan',
      'id'            => 'keterangan',
      'class'         => 'form-control',
    ];
    $this->data['keterangan_value'] = [
      '1'          => 'Permanen',
      '2'          => 'Musnah',
    ];
    $this->data['penulis_buku'] = [
      'name'          => 'penulis_buku',
      'id'            => 'penulis_buku',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('penulis_buku'),
    ];
    $this->data['jumlah_halaman'] = [
      'name'          => 'jumlah_halaman',
      'id'            => 'jumlah_halaman',
      'class'         => 'form-control',
      'autocomplete'  => 'off',
      'required'      => '',
      'value'         => $this->form_validation->set_value('jumlah_halaman'),
    ];
    $this->data['bahasa_id'] = [
      'name'          => 'bahasa_id',
      'id'            => 'bahasa_id',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['tema_buku'] = [
      'name'          => 'tema_buku',
      'id'            => 'tema_buku',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['kota_penerbit'] = [
      'name'          => 'kota_penerbit',
      'id'            => 'kota_penerbit',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['penerbit'] = [
      'name'          => 'penerbit',
      'id'            => 'penerbit',
      'class'         => 'form-control',
      'required'      => '',
    ];
    $this->data['qty'] = [
      'name'          => 'qty',
      'id'            => 'qty',
      'class'         => 'form-control',
      'required'      => '',
    ];

    $this->load->view('back/arsip/arsip_add', $this->data);
  }

  function create_action()
  {
    $this->form_validation->set_rules('no_arsip', 'Nomor/Label Buku', 'trim|required');
    $this->form_validation->set_rules('arsip_name', 'Judul Buku', 'trim|required');
    $this->form_validation->set_rules('lokasi_id', 'Lokasi Buku', 'required');
    $this->form_validation->set_rules('rak_id', 'Rak', 'required');
    $this->form_validation->set_rules('baris_id', 'Baris', 'required');
    $this->form_validation->set_rules('penulis_buku', 'Penulis Buku', 'required');
    $this->form_validation->set_rules('jumlah_halaman', 'Jumlah Halaman', 'required|is_numeric');
    $this->form_validation->set_rules('bahasa_id', 'Bahasa', 'required');
    $this->form_validation->set_rules('tema_buku', 'Tema/Topik Buku', 'required');
    $this->form_validation->set_rules('penerbit', 'Penerbit', 'required');
    $this->form_validation->set_rules('kota_penerbit', 'Kota Penerbit', 'required');
    $this->form_validation->set_rules('qty', 'Jumlah/Stok Buku', 'required|is_numeric');

    $this->form_validation->set_message('required', '{field} wajib diisi');
    $this->form_validation->set_message('is_unique', '{field} sudah ada, ganti dengan yang lain');
    $this->form_validation->set_message('is_numeric', '{field} harus berisi angka');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('instansi_id');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
    } 
    
    if ($this->form_validation->run() === FALSE) {
      $this->create();
    } else {
      //Membuat kode/inisial penulis buku
      $convert_to_array = explode(" ", $this->input->post('penulis_buku'));
      $count_array = count($convert_to_array);
      $there_is = false;

      for($i = 0; $i < $count_array; $i++) {
        if($convert_to_array[$i] == 'dan' or $convert_to_array[$i] == 'dkk.' or $convert_to_array[$i] == 'dkk'){
          $last_name = $convert_to_array[$i-1];
          $there_is = true;
        } 
      }

      if ($there_is == false) {
        $last_name = $convert_to_array[$count_array-1];
      }
      
      $kode_label_penulis = substr($last_name, 0, 3);

      $kode_penulis = strtoupper($kode_label_penulis);

      //Membuat inisial judul buku (mengambil huruf depan)
      $inisial_judul = strtolower(substr($this->input->post('arsip_name'), 0, 1));

      //Digabung jadi satu kalimat
      $label_buku = strtoupper($this->input->post('no_arsip')) . ' ' . $kode_penulis . ' ' . $inisial_judul;

      if ($this->input->post('tahun_terbit') == NULL) {
        $tahun_terbit = '-';
      } else {
        $tahun_terbit = $this->input->post('tahun_terbit');
      }

      $bahasa = $this->Bahasa_model->get_by_id($this->input->post('bahasa_id'));

      $created_at = date('Y-m-d H:i:s');

      $deskripsi = 'Oleh '.$this->input->post('penulis_buku').'. Terdiri dari '.$this->input->post('jumlah_halaman').' halaman berbahasa '.$bahasa->bahasa.' tentang "'.$this->input->post('tema_buku').'". Diterbitkan di '.$this->input->post('kota_penerbit').' oleh '.$this->input->post('penerbit').' pada tahun '.$this->input->post('tahun_terbit').' dan kemudian menjadi koleksi perpustakaan sejak '.datetime_indo3($created_at);
      // var_dump($_FILES['cover']['size']); die();
      if ($_FILES['cover']['size'] > 2000000) {
        $this->session->set_flashdata('message', '<div class="alert alert-danger alert">Ukuran gambar tidak boleh lebih dari 2 MB</div>');
        redirect(base_url('admin/buku'));
      }

      if ($_FILES['cover']['error'] <> 4) {
        $nmfile = strtolower(url_title($this->input->post('arsip_name'))) . date('YmdHis');

        $config['upload_path']      = './assets/images/cover_buku/';
        $config['allowed_types']    = 'jpg|jpeg|png';
        $config['max_size']         = 2048; // 2Mb
        $config['file_name']        = $nmfile;

        $this->load->library('upload', $config);
        
        if (!$this->upload->do_upload('cover')) {
          $error = array('error' => $this->upload->display_errors());
          $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');

          $this->create();
        } else {
          $cover = $this->upload->data();

          $config['image_library']    = 'gd2';
          $config['source_image']     = './assets/images/cover_buku/' . $cover['file_name'] . '';
          $config['create_thumb']     = TRUE;
          $config['maintain_ratio']   = TRUE;
          $config['width']            = 250;
          $config['height']           = 250;

          $this->load->library('image_lib', $config);
          $this->image_lib->resize();

          $data = array(
            'instansi_id'                     => $instansi_id,
            'lokasi_id'                       => $this->input->post('lokasi_id'),
            'rak_id'                          => $this->input->post('rak_id'),
            'baris_id'                        => $this->input->post('baris_id'),
            'no_arsip'                        => $label_buku,
            'arsip_name'                      => $this->input->post('arsip_name'),
            'penulis_buku'                    => $this->input->post('penulis_buku'),
            'jumlah_halaman'                  => $this->input->post('jumlah_halaman'),
            'bahasa_id'                       => $this->input->post('bahasa_id'),
            'tema_buku'                       => $this->input->post('tema_buku'),
            'penerbit'                        => $this->input->post('penerbit'),
            'kota_penerbit'                   => $this->input->post('kota_penerbit'),
            'tahun_terbit'                    => $this->input->post('tahun_terbit'),
            'deskripsi_arsip'                 => $deskripsi,
            'is_available'                    => '1',
            'status_file'                     => $this->input->post('status_file'),
            'qty'                             => $this->input->post('qty'),
            'created_by'                      => $this->session->userdata('username'),
            'cover_buku'                      => $this->upload->data('file_name'),
            'cover_buku_thumb'                => $nmfile . '_thumb' . $this->upload->data('file_ext'),
          );
          
          // eksekusi query INSERT
          $this->Arsip_model->insert($data);

          $arsip_id = $this->db->insert_id();

          write_log();
        }
      } else {
        $data = array(
          'instansi_id'                     => $instansi_id,
          'lokasi_id'                       => $this->input->post('lokasi_id'),
          'rak_id'                          => $this->input->post('rak_id'),
          'baris_id'                        => $this->input->post('baris_id'),
          'no_arsip'                        => $label_buku,
          'arsip_name'                      => $this->input->post('arsip_name'),
          'penulis_buku'                    => $this->input->post('penulis_buku'),
          'jumlah_halaman'                  => $this->input->post('jumlah_halaman'),
          'bahasa_id'                       => $this->input->post('bahasa_id'),
          'tema_buku'                       => $this->input->post('tema_buku'),
          'penerbit'                        => $this->input->post('penerbit'),
          'kota_penerbit'                   => $this->input->post('kota_penerbit'),
          'tahun_terbit'                    => $this->input->post('tahun_terbit'),
          'deskripsi_arsip'                 => $deskripsi,
          'is_available'                    => '1',
          'status_file'                     => $this->input->post('status_file'),
          'qty'                             => $this->input->post('qty'),
          'created_by'                      => $this->session->userdata('username'),
        );

        // eksekusi query INSERT
        $this->Arsip_model->insert($data);

        $arsip_id = $this->db->insert_id();

        write_log();
      }

      $instansi     = $this->Instansi_model->get_by_id($instansi_id);
      $instansiName = $instansi->instansi_name;
      // $nmfile       = strtolower(url_title($instansiName . '-' . $this->input->post('arsip_name'))) . '-' . date('YmdHis');

      // kalau upload foto tambahan
      if (!empty($_FILES['file_upload']['name'])) {
        $filesCount = count($_FILES['file_upload']['name']);

        for ($i = 0; $i < $filesCount; $i++) {
          // File upload configuration
          // atur lokasi upload berdasarkan nama instansi
          $config2['upload_path'] = './assets/file_arsip/' . $instansiName;
          if (!is_dir($config2['upload_path'])) {
            mkdir($config2['upload_path'], 0777, TRUE);
          }

          $config2['allowed_types']  = 'txt|pdf|ppt|pptx|xls|xlsx|doc|docx|jpg|jpeg|png|zip|rar';

          $_FILES['file']['name']       = $_FILES['file_upload']['name'][$i];
          $_FILES['file']['type']       = $_FILES['file_upload']['type'][$i];
          $_FILES['file']['tmp_name']   = $_FILES['file_upload']['tmp_name'][$i];
          $_FILES['file']['error']      = $_FILES['file_upload']['error'][$i];
          $_FILES['file']['size']       = $_FILES['file_upload']['size'][$i];

          // Load and initialize upload library
          $this->load->library('upload', $config2);
          $this->upload->initialize($config2);

          // Upload file to server
          if (!$this->upload->do_upload('file')) {
            //file gagal diupload -> kembali ke form tambah
            $error = array('error' => $this->upload->display_errors());
            $this->session->set_flashdata('message', '<div class="col-lg-12"><div class="alert alert-danger alert">' . $error['error'] . '</div></div>');

            $this->create();
          } else {
            // Uploaded file data
            $fileData = $this->upload->data();

            $datas = array(
              'arsip_id'        => $arsip_id,
              'file_upload'     => $fileData['file_name'],
              'created_by'      => $this->session->userdata('username'),
            );

            // Insert files data into the database
            $this->Arsip_model->insert_files($datas);
          }
        }
      }

      $this->session->set_flashdata('message', '<div class="alert alert-success alert">Data berhasil disimpan</div>');
      redirect(base_url('admin/buku'));
    }
  }

  function update($id)
  {
    is_update();

    $this->data['arsip']                  = $this->Arsip_model->get_by_id($id);
    $this->data['file_upload']            = $this->File_model->get_by_arsip_id($id);
    // var_dump($this->data['arsip']);
    // die();
    $instansi                     = $this->Instansi_model->get_by_id($this->data['arsip']->instansi_id);
    $this->data['instansiName']   = $instansi->instansi_name;

    $row = $this->data['arsip'];

    // GrandAdmin bisa akses ke semua data
    // MasterAdmin akses ke data instansinya saja
    // SuperAdmin akses ke data cabangnya saja
    // Admin akses data divisinya saja
    if (is_masteradmin() && $row->instansi_id != $this->session->instansi_id) {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak mengubah data orang lain</div>');
      redirect('admin/buku');
    } elseif ($this->data['arsip']) {
      $this->data['page_title'] = 'Update Data ' . $this->data['module'];
      $this->data['action']     = 'admin/buku/update_action';

      if (is_grandadmin()) {
        $this->data['get_all_combobox_instansi']    = $this->Instansi_model->get_all_combobox();
        $this->data['get_all_combobox_lokasi']      = $this->Lokasi_model->get_all_combobox_by_instansi($this->data['arsip']->instansi_id);
        $this->data['get_all_combobox_rak']         = $this->Rak_model->get_all_combobox_by_lokasi($this->data['arsip']->lokasi_id);
        $this->data['get_all_combobox_baris']       = $this->Baris_model->get_all_combobox_by_rak($this->data['arsip']->rak_id);
        $this->data['get_all_combobox_bahasa']    = $this->Bahasa_model->get_all_combobox();
      } elseif (is_masteradmin()) {
        $this->data['get_all_combobox_lokasi']      = $this->Lokasi_model->get_all_combobox_by_instansi($this->session->instansi_id);
        $this->data['get_all_combobox_rak']         = $this->Rak_model->get_all_combobox_by_lokasi($this->data['arsip']->lokasi_id);
        $this->data['get_all_combobox_baris']       = $this->Baris_model->get_all_combobox_by_rak($this->data['arsip']->rak_id);
        $this->data['get_all_combobox_bahasa']    = $this->Bahasa_model->get_all_combobox();
      }

      $this->data['id_arsip'] = [
        'name'          => 'id_arsip',
        'type'          => 'hidden',
      ];
      $this->data['no_arsip'] = [
        'name'          => 'no_arsip',
        'id'            => 'no_arsip',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['arsip_name'] = [
        'name'          => 'arsip_name',
        'id'            => 'arsip_name',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['rak_id'] = [
        'name'          => 'rak_id',
        'id'            => 'rak_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilBaris()',
        'required'      => '',
      ];
      $this->data['baris_id'] = [
        'name'          => 'baris_id',
        'id'            => 'baris_id',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['lokasi_id'] = [
        'name'          => 'lokasi_id',
        'id'            => 'lokasi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilRak()',
        'autocomplete'  => 'off',
        'autofocus'     => '',
        'required'      => '',
      ];
      $this->data['deskripsi_arsip'] = [
        'name'          => 'deskripsi_arsip',
        'id'            => 'deskripsi_arsip',
        'class'         => 'form-control',
        'rows'          => '5',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['instansi_id'] = [
        'name'          => 'instansi_id',
        'id'            => 'instansi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilLokasi()',
        'required'      => ''
      ];
      $this->data['lokasi_id'] = [
        'name'          => 'lokasi_id',
        'id'            => 'lokasi_id',
        'class'         => 'form-control',
        'onChange'      => 'tampilRak()',
        'required'      => ''
      ];
      $this->data['status_file'] = [
        'name'          => 'status_file',
        'id'            => 'status_file',
        'class'         => 'form-control',
      ];
      $this->data['penulis_buku'] = [
        'name'          => 'penulis_buku',
        'id'            => 'penulis_buku',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['jumlah_halaman'] = [
        'name'          => 'jumlah_halaman',
        'id'            => 'jumlah_halaman',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];
      $this->data['bahasa_id'] = [
        'name'          => 'bahasa_id',
        'id'            => 'bahasa_id',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['tema_buku'] = [
        'name'          => 'tema_buku',
        'id'            => 'tema_buku',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['kota_penerbit'] = [
        'name'          => 'kota_penerbit',
        'id'            => 'kota_penerbit',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['penerbit'] = [
        'name'          => 'penerbit',
        'id'            => 'penerbit',
        'class'         => 'form-control',
        'required'      => '',
      ];
      $this->data['tahun_terbit'] = [
        'name'          => 'tahun_terbit',
        'id'            => 'tahun_terbit',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
      ];
      $this->data['qty'] = [
        'name'          => 'qty',
        'id'            => 'qty',
        'class'         => 'form-control',
        'autocomplete'  => 'off',
        'required'      => '',
      ];

      $this->load->view('back/arsip/arsip_edit', $this->data);
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/buku');
    }
  }

  function update_action()
  {
    $this->form_validation->set_rules('lokasi_id', 'Lokasi Arsip', 'required');
    $this->form_validation->set_rules('rak_id', 'Rak', 'required');
    $this->form_validation->set_rules('baris_id', 'Baris', 'required');
    $this->form_validation->set_rules('arsip_name', 'Nama Arsip', 'trim|required');
    $this->form_validation->set_rules('qty', 'Jumlah/Stok Buku', 'required|is_numeric');

    $this->form_validation->set_message('required', '{field} wajib diisi');
    $this->form_validation->set_message('is_numeric', '{field} harus berisi angka');

    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

    if (is_grandadmin()) {
      $instansi_id  = $this->input->post('instansi_id');
    } elseif (is_masteradmin()) {
      $instansi_id  = $this->session->instansi_id;
    } 

    if ($this->form_validation->run() === FALSE) {
      $this->update($this->input->post('id_arsip'));
    } else {
      //Membuat kode/inisial penulis buku
      $convert_to_array = explode(" ", $this->input->post('penulis_buku'));

      $count_array = count($convert_to_array);
      $there_is = false;

      for($i = 0; $i < $count_array; $i++) {
        if($convert_to_array[$i] == 'dan' or $convert_to_array[$i] == 'dkk.' or $convert_to_array[$i] == 'dkk'){
          $last_name = $convert_to_array[$i-1];
          $there_is = true;
        } 
      }

      if ($there_is == false) {
        $last_name = $convert_to_array[$count_array-1];
      }
      
      $kode_label_penulis = substr($last_name, 0, 3);

      $kode_penulis = strtoupper($kode_label_penulis);

      //Membuat inisial judul buku (mengambil huruf depan)
      $inisial_judul = strtolower(substr($this->input->post('arsip_name'), 0, 1));

      //Digabung jadi satu kalimat
      $label_buku = strtoupper($this->input->post('no_arsip')) . ' ' . $kode_penulis . ' ' . $inisial_judul;

      if ($this->input->post('tahun_terbit') == NULL) {
        $tahun_terbit = '-';
      } else {
        $tahun_terbit = $this->input->post('tahun_terbit');
      }

      $bahasa = $this->Bahasa_model->get_by_id($this->input->post('bahasa_id'));

      $data_arsip = $this->Arsip_model->get_detail($this->input->post('id_arsip'));
      $created_at = $data_arsip->waktu_dibuat;

      $deskripsi = 'Oleh '.$this->input->post('penulis_buku').'. Terdiri dari '.$this->input->post('jumlah_halaman').' halaman berbahasa '.$bahasa->bahasa.' tentang "'.$this->input->post('tema_buku').'". Diterbitkan di '.$this->input->post('kota_penerbit').' oleh '.$this->input->post('penerbit').' pada tahun '.$this->input->post('tahun_terbit').' dan kemudian menjadi koleksi perpustakaan sejak '.datetime_indo3($created_at);

      if ($_FILES['cover']['size'] > 2000000) {
        $this->session->set_flashdata('message', '<div class="alert alert-danger alert">Ukuran cover tidak boleh lebih dari 2 MB</div>');
        redirect(base_url('admin/buku'));
      }

      if ($_FILES['cover']['error'] <> 4) {
        $nmfile = strtolower(url_title($this->input->post('arsip_name'))) . date('YmdHis');

        $config['upload_path']      = './assets/images/cover_buku/';
        $config['allowed_types']    = 'jpg|jpeg|png';
        $config['max_size']         = 2048; // 2Mb
        $config['file_name']        = $nmfile;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('cover')) {
          $error = array('error' => $this->upload->display_errors());
          $this->session->set_flashdata('message', '<div class="alert alert-danger">' . $error['error'] . '</div>');

          $this->update($this->input->post('id_arsip'));
        } else {
          $cover = $this->upload->data();

          $config['image_library']    = 'gd2';
          $config['source_image']     = './assets/images/cover_buku/' . $cover['file_name'] . '';
          $config['create_thumb']     = TRUE;
          $config['maintain_ratio']   = TRUE;
          $config['width']            = 250;
          $config['height']           = 250;

          $this->load->library('image_lib', $config);
          $this->image_lib->resize();

          $delete = $this->Arsip_model->get_by_id($this->input->post('id_arsip'));

          $dir        = "./assets/images/cover_buku/" . $delete->cover_buku;
          $dir_thumb  = "./assets/images/cover_buku/" . $delete->cover_buku_thumb;

          if (is_file($dir)) {
            unlink($dir);
            unlink($dir_thumb);
          }

          $data = array(
            'instansi_id'                     => $instansi_id,
            'lokasi_id'                       => $this->input->post('lokasi_id'),
            'rak_id'                          => $this->input->post('rak_id'),
            'baris_id'                        => $this->input->post('baris_id'),
            'no_arsip'                        => $label_buku,
            'arsip_name'                      => $this->input->post('arsip_name'),
            'penulis_buku'                    => $this->input->post('penulis_buku'),
            'jumlah_halaman'                  => $this->input->post('jumlah_halaman'),
            'bahasa_id'                       => $this->input->post('bahasa_id'),
            'tema_buku'                       => $this->input->post('tema_buku'),
            'penerbit'                        => $this->input->post('penerbit'),
            'kota_penerbit'                   => $this->input->post('kota_penerbit'),
            'tahun_terbit'                    => $this->input->post('tahun_terbit'),
            'deskripsi_arsip'                 => $deskripsi,
            'status_file'                     => $this->input->post('status_file'),
            'qty'                             => $this->input->post('qty'),
            'modified_by'                     => $this->session->userdata('username'),
            'cover_buku'                      => $this->upload->data('file_name'),
            'cover_buku_thumb'                => $nmfile . '_thumb' . $this->upload->data('file_ext'),
          );

          // eksekusi query UPDATE
          $this->Arsip_model->update($this->input->post('id_arsip'), $data);

          write_log();
        }
      } else {
        $data = array(
          'instansi_id'                     => $instansi_id,
          'lokasi_id'                       => $this->input->post('lokasi_id'),
          'rak_id'                          => $this->input->post('rak_id'),
          'baris_id'                        => $this->input->post('baris_id'),
          'no_arsip'                        => $label_buku,
          'arsip_name'                      => $this->input->post('arsip_name'),
          'penulis_buku'                    => $this->input->post('penulis_buku'),
          'jumlah_halaman'                  => $this->input->post('jumlah_halaman'),
          'bahasa_id'                       => $this->input->post('bahasa_id'),
          'tema_buku'                       => $this->input->post('tema_buku'),
          'penerbit'                        => $this->input->post('penerbit'),
          'kota_penerbit'                   => $this->input->post('kota_penerbit'),
          'tahun_terbit'                    => $this->input->post('tahun_terbit'),
          'deskripsi_arsip'                 => $deskripsi,
          'status_file'                     => $this->input->post('status_file'),
          'qty'                             => $this->input->post('qty'),
          'modified_by'                     => $this->session->userdata('username'),
        );

        // eksekusi query UPDATE
        $this->Arsip_model->update($this->input->post('id_arsip'), $data);

        write_log();
      }

      $instansi     = $this->Instansi_model->get_by_id($instansi_id);
      $instansiName = $instansi->instansi_name;

      // kalau upload foto tambahan
      if (!empty($_FILES['file_upload']['name'])) {
        $filesCount = count($_FILES['file_upload']['name']);

        for ($i = 0; $i < $filesCount; $i++) {
          // File upload configuration          
          // atur lokasi upload berdasarkan nama instansi
          $config2['upload_path'] = './assets/file_arsip/' . $instansiName;
          if (!is_dir($config2['upload_path'])) {
            mkdir($config2['upload_path'], 0777, TRUE);
          }

          $config2['allowed_types']  = 'txt|pdf|ppt|pptx|xls|xlsx|doc|docx|jpg|jpeg|png|zip|rar';

          $_FILES['file']['name']       = $_FILES['file_upload']['name'][$i];
          $_FILES['file']['type']       = $_FILES['file_upload']['type'][$i];
          $_FILES['file']['tmp_name']   = $_FILES['file_upload']['tmp_name'][$i];
          $_FILES['file']['error']      = $_FILES['file_upload']['error'][$i];
          $_FILES['file']['size']       = $_FILES['file_upload']['size'][$i];

          // Load and initialize upload library
          $this->load->library('upload', $config2);
          $this->upload->initialize($config2);

          // Upload file to server
          if (!$this->upload->do_upload('file')) {
            //file gagal diupload -> kembali ke form tambah
            $error = array('error' => $this->upload->display_errors());
            $this->session->set_flashdata('message', '<div class="col-lg-12"><div class="alert alert-danger alert">' . $error['error'] . '</div></div>');

            $this->update($this->input->post('id_arsip'));
          } else {
            // Uploaded file data
            $fileData = $this->upload->data();

            $datas = array(
              'arsip_id'        => $this->input->post('id_arsip'),
              'file_upload'     => $fileData['file_name'],
              'created_by'      => $this->session->userdata('username'),
            );

            // Insert files data into the database
            $this->Arsip_model->insert_files($datas);
          }
        }
      }

      $this->session->set_flashdata('message', '<div class="alert alert-success alert">Data berhasil disimpan</div>');
      redirect(base_url('admin/buku'));
    }
  }

  function delete($id)
  {
    is_delete();

    $delete = $this->Arsip_model->get_by_id($id);

    if ($delete) {
      $data = array(
        'is_delete'   => '1',
        'deleted_by'  => $this->session->username,
        'deleted_at'  => date('Y-m-d H:i:a'),
      );

      $this->Arsip_model->soft_delete($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus</div>');
      redirect('admin/buku');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/buku');
    }
  }

  public function ajax_delete($id)
  {
    $row = $this->Arsip_model->get_by_id_for_ajax_delete($id);
    
    if ($row) {
      $instansi     = $this->Instansi_model->get_by_id($row->instansi_id);
      $instansiName = $instansi->instansi_name;

      // ambil detail arsip_files        
      $this->db->from('arsip_files');
      $this->db->where('arsip_id', $id);
      $query = $this->db->get();

      foreach ($query->result() as $row) {
        $file_name         = "assets/file_arsip/" . $instansiName . "/" . $row->file_upload;

        // Hapus file
        unlink($file_name);
      }

      $this->Arsip_model->delete_by_id($id);

      // hapus data tabel arsip_files
      $this->db->where('arsip_id', $id);
      $this->db->delete('arsip_files');

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus permanen beserta filenya</div>');
      redirect('admin/buku/deleted_list');
    }
    
  }

  public function delete_files_by_id($id)
  {
    $data = $this->File_model->get_by_id($id);

    $instansi     = $this->Instansi_model->get_by_id($data->instansi_id);
    $instansiName = $instansi->instansi_name;

    if ($data) {
      // menyimpan lokasi gambar dalam variable
      $file_name         = "assets/file_arsip/" . $instansiName . "/" . $data->file_upload;

      // Hapus foto
      unlink($file_name);

      $this->File_model->delete_by_id($id);

      $this->session->set_flashdata('message', '
      <div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
        File berhasil dihapus
      </div>');
      redirect('admin/buku/update/' . $data->arsip_id);
    } else {
      $this->session->set_flashdata('message', '
        <div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
					File tidak ditemukan
        </div>');
      redirect('admin/buku/update/' . $data->arsip_id);
    }
  }

  function deleted_list()
  {
    is_restore();

    $this->data['page_title'] = 'Recycle Bin ' . $this->data['module'];

    if (is_grandadmin()) {
      $this->data['get_all_deleted'] = $this->Arsip_model->get_all_deleted();
      $this->load->view('back/arsip/arsip_deleted_list_grandadmin', $this->data);
    } elseif (is_masteradmin()) {
      $this->data['get_all_deleted'] = $this->Arsip_model->get_all_deleted_by_instansi();
      $this->load->view('back/arsip/arsip_deleted_list_masteradmin', $this->data);
    } 
  }

  function restore($id)
  {
    is_restore();

    $row = $this->Arsip_model->get_by_id_for_restore($id);

    if ($row) {
      $data = array(
        'is_delete'   => '0',
        'deleted_by'  => NULL,
        'deleted_at'  => NULL,
      );

      $this->Arsip_model->update($id, $data);

      write_log();

      $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dikembalikan</div>');
      redirect('admin/buku/deleted_list');
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
      redirect('admin/buku');
    }
    
  }

  function pilih_arsip()
  {
    $this->data['arsip']  = $this->Arsip_model->get_all_combobox_by_divisi($this->uri->segment(4));
    $this->load->view('back/arsip/v_arsip', $this->data);
  }

  function pilih_arsip_available()
  {
    $this->data['arsip']  = $this->Arsip_model->get_all_combobox_arsip_available_by_instansi($this->uri->segment(4));

    $this->load->view('back/arsip/v_arsip', $this->data);
  }

  function form_empty()
  {
    if (is_grandadmin()) {
      $this->load->view('back/arsip/v_arsip_empty');
    } 
  }

  function check_no_arsip()
  {
    $no_arsip = $this->input->post('no_arsip');
    $instansi_id = $this->input->post('instansi_id');
    $lokasi_id = $this->input->post('lokasi_id');

    $check_no_arsip     = $this->Arsip_model->get_no_arsip_by_lokasi($no_arsip, $instansi_id, $lokasi_id);

    if ($check_no_arsip) {
      // var_dump($check_no_arsip);
      echo "<div class='text-red'>Nomor/Label Buku telah ada, silahkan ganti yang lain</div>";
    } else {
      // var_dump($check_no_arsip);
      echo "<div class='text-green'>Nomor/Label Buku tersedia</div>";
    }
  }

  function check_arsip_name()
  {
    $arsip_name = $this->input->post('arsip_name');
    $instansi_id = $this->input->post('instansi_id');
    $lokasi_id = $this->input->post('lokasi_id');

    $check_arsip_name     = $this->Arsip_model->get_arsip_name_by_lokasi($arsip_name, $instansi_id, $lokasi_id);

    if ($check_arsip_name) {
      // var_dump($check_no_arsip);
      echo "<div class='text-red'>Judul Buku telah ada, silahkan ganti yang lain</div>";
    } else {
      // var_dump($check_no_arsip);
      echo "<div class='text-green'>Judul Buku tersedia</div>";
    }
  }

  function print($id)
  {
    $this->data['buku'] = $this->Arsip_model->get_by_id($id);

    $this->data['label_buku'] = explode(" ", $this->data['buku']->no_arsip);

    $this->load->view('back/arsip/print_label', $this->data);
  }

  function render_qrcode($id)
  {
    $id_qrcode = $id . '/book';
    
    QRcode::png(
      $id_qrcode,
      $outfile = false,
      $level = QR_ECLEVEL_H,
      $size = 3,
      $margin = 1
    );
  }

  function ajax_label($id)
  {
      $this->data['buku'] = $this->Arsip_model->get_by_id($id);

      $this->data['label_buku'] = explode(" ", $this->data['buku']->no_arsip);

      $this->load->view('back/arsip/print_label', $this->data);
  }

  function ajax_preview_cover($id)
  {
      $this->data['buku'] = $this->Arsip_model->get_by_id($id);

      $this->load->view('back/arsip/preview_cover', $this->data);
  }
}

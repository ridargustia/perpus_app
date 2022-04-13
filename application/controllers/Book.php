<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Book extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->data['module'] = 'Book';

    $this->load->helper(array('highlight'));

    $this->load->model(array('Arsip_model', 'File_model', 'Rak_model', 'Baris_model', 'Kategori_model'));
    
    $this->data['company_data']      = $this->Company_model->company_profile();
    $this->data['footer']            = $this->Footer_model->footer();

    // if (is_grandadmin()) {
    //   $this->data['get_all_instansi'] = $this->Instansi_model->get_all_active();
    // } elseif (is_masteradmin()) {
    //   $this->data['get_all_cabang']   = $this->Cabang_model->get_all_by_instansi();
    // } elseif (is_superadmin()) {
    //   $this->data['get_all_divisi']   = $this->Divisi_model->get_all_by_cabang();
    // } else {
    //   $this->data['get_all_bagian']   = $this->Bagian_model->get_all_by_divisi();
    // }

    
    // is_active_instansi_front();
  }

  function cari_book()
  {
    $this->data['page_title']       = 'Hasil Pencarian';

    $search_form  = $this->input->get('search_form');
    $this->data['search_form'] = $this->input->get('search_form');

    if ($search_form == NULL) {
      $this->data['hasil_pencarian']  = $this->Arsip_model->get_all_front();
    }
    // jika form pencarian DIISI dan CABANG KOSONG
    elseif ($search_form != NULL) {
      $this->data['hasil_pencarian']  = $this->Arsip_model->cari_all_book_by_instansi_with_searchFormNotNull($search_form);
    }
   
    foreach ($this->data['hasil_pencarian'] as $row) {
      $total_eksemplar = $total_eksemplar + $row->qty;
    }
    
    $this->data['total_eksemplar'] = $total_eksemplar;

    $this->load->view('front/arsip/hasil_pencarian', $this->data);
  }

  function detail($id, $search_form='')
  {
    $this->data['page_title']   = 'Detail Buku';

    $this->data['detail_arsip']   = $this->Arsip_model->get_by_id_front($id);
    $this->data['file_upload']    = $this->File_model->get_by_arsip_id($id);

    $instansi                     = $this->Instansi_model->get_by_id($this->data['detail_arsip']->instansi_id);
    $this->data['instansiName']   = $instansi->instansi_name;

    $row = $this->data['detail_arsip'];

    $this->data['search_form'] = $search_form;

    if ($this->data['detail_arsip'] == TRUE) {
      if (is_masteradmin() && $row->instansi_id != $this->session->instansi_id) {
        $this->session->set_flashdata('message', '<div class="alert alert-danger">Anda tidak berhak melihat data orang lain</div>');
        redirect('home');
      } else {
        $this->data['arsip_files']  = $this->Arsip_model->get_files_id_result($this->uri->segment(3));

        $this->load->view('front/arsip/detail_arsip', $this->data);
      }
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger"><i class="fa fa-bullhorn"></i> Arsip yang Anda cari tidak ditemukan!</div>');
      redirect('home');
    }
  }

  function ajax_preview_cover($id)
  {
      $this->data['buku'] = $this->Arsip_model->get_by_id($id);

      $this->load->view('back/arsip/preview_cover', $this->data);
  }
}

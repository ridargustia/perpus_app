<?php 

defined('BASEPATH') or exit('No direct script access allowed');

class Anggota extends CI_Controller
{
    //FUNCTION CONSTRUCTOR
    public function __construct()
    {
        parent::__construct();

        $this->data['module'] = 'Anggota';

        $this->load->model(array('Anggota_model'));

        //Deklarasi Library
        $this->load->library('Ciqrcode');

        $this->data['company_data']             = $this->Company_model->company_profile();
        $this->data['layout_template']          = $this->Template_model->layout();
        $this->data['skins_template']           = $this->Template_model->skins();
        $this->data['footer']                   = $this->Footer_model->footer();

        $this->data['btn_submit'] = 'Save';
        $this->data['btn_reset']  = 'Reset';
        $this->data['btn_add']    = 'Tambah Data';
        $this->data['add_action'] = base_url('admin/anggota/create');

        is_login();

        if ($this->uri->segment(2) != NULL) {
            menuaccess_check();
        } elseif ($this->uri->segment(3) != NULL) {
            submenuaccess_check();
        }
    }

    //MENAMPILKAN DATA ANGGOTA PADA INTERFACE (GET DATA)
    function index() 
    {
        is_read();

        $this->data['page_title'] = 'Data ' . $this->data['module'];

        if (is_grandadmin()) {
            $this->data['get_all'] = $this->Anggota_model->get_all();
        } elseif (is_masteradmin()) {
            $this->data['get_all'] = $this->Anggota_model->get_all_by_instansi();
        }

        $this->load->view('back/anggota/anggota_list', $this->data);
    }

    //FITUR TAMBAH DATA ANGGOTA (MENAMPILKAN FORM)
    function create()
    {
        is_create();

        $this->data['page_title'] = 'Tambah Data ' . $this->data['module'];
        $this->data['action'] = 'admin/anggota/create_action';

        if (is_grandadmin()) {
            $this->data['get_all_combobox_instansi']  = $this->Instansi_model->get_all_combobox();
        }

        $this->data['instansi_id'] = [
            'name'          => 'instansi_id',
            'id'            => 'instansi_id',
            'class'         => 'form-control',
            'autocomplete'  => 'off',
            'required'      => '',
        ];
        $this->data['no_induk'] = [
            'name'          => 'no_induk',
            'id'            => 'no_induk',
            'class'         => 'form-control',
            'autocomplete'  => 'off',
            'required'      => '',
        ];
        $this->data['anggota_name'] = [
            'name'          => 'anggota_name',
            'id'            => 'anggota_name',
            'class'         => 'form-control',
            'autocomplete'  => 'off',
            'required'      => '',
        ];
        $this->data['gender'] = [
            'name'          => 'gender',
            'id'            => 'gender',
            'class'         => 'form-control',
        ];
        $this->data['gender_value'] = [
            '1'             => 'Laki-Laki',
            '2'             => 'Perempuan',
        ];
        $this->data['angkatan'] = [
            'name'          => 'angkatan',
            'id'            => 'angkatan',
            'class'         => 'form-control',
            'autocomplete'  => 'off',
        ];
        $this->data['address'] = [
            'name'          => 'address',
            'id'            => 'address',
            'class'         => 'form-control',
            'autocomplete'  => 'off',
            'required'      => '',
            'rows'          => '5',
        ];

        $this->load->view('back/anggota/anggota_add', $this->data);
    }

    //FUNCTION UNTUK MENJALANKAN FITUR SIMPAN DATA ANGGOTA BARU
    function create_action()
    {
        if (is_grandadmin()) {
            $this->form_validation->set_rules('instansi_id', 'Instansi', 'required');
        }
        $this->form_validation->set_rules('no_induk', 'No Induk Mahasiswa', 'trim|required|is_unique[anggota.no_induk]');
        $this->form_validation->set_rules('anggota_name', 'Nama Anggota', 'trim|required|is_unique[anggota.anggota_name]');
        $this->form_validation->set_rules('angkatan', 'Angkatan', 'required');
        $this->form_validation->set_rules('address', 'Alamat', 'trim|required');

        $this->form_validation->set_message('required', '{field} wajib diisi');
        $this->form_validation->set_message('is_unique', '{field} sudah ada, silahkan ganti yang lain');

        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

        if (is_grandadmin()) {
            $instansi_id = $this->input->post('instansi_id');
        } elseif (is_masteradmin()){
            $instansi_id = $this->session->instansi_id;
        }

        if ($this->form_validation->run() === FALSE) {
            $this->create();
        } else {
            $data = array(
                'no_induk'      => $this->input->post('no_induk'),
                'anggota_name'  => $this->input->post('anggota_name'),
                'instansi_id'   => $instansi_id,
                'gender'        => $this->input->post('gender'),
                'angkatan'      => $this->input->post('angkatan'),
                'address'       => $this->input->post('address'),
                'created_by'    => $this->session->username,
            );

            $this->Anggota_model->insert($data);

            write_log();

            $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
            redirect('admin/anggota');
        }
    }

    //TAMPILAN FORM UPDATE DATA ANGGOTA
    function update($id)
    {
        is_update();

        $this->data['anggota'] = $this->Anggota_model->get_by_id($id);

        if ($this->data['anggota']) {
            $this->data['page_title'] = 'Update Data ' . $this->data['module'];
            $this->data['action'] = 'admin/anggota/update_action';

            if (is_grandadmin()) {
                $this->data['get_all_combobox_instansi']  = $this->Instansi_model->get_all_combobox();
            }

            $this->data['id_anggota'] = [
                'name'          => 'id_anggota',
                'type'          => 'hidden',
            ];
            $this->data['instansi_id'] = [
                'name'          => 'instansi_id',
                'id'            => 'instansi_id',
                'class'         => 'form-control',
                'autocomplete'  => 'off',
                'required'      => '',
            ];
            $this->data['no_induk'] = [
                'name'          => 'no_induk',
                'id'            => 'no_induk',
                'class'         => 'form-control',
                'autocomplete'  => 'off',
                'required'      => '',
            ];
            $this->data['anggota_name'] = [
                'name'          => 'anggota_name',
                'id'            => 'anggota_name',
                'class'         => 'form-control',
                'autocomplete'  => 'off',
                'required'      => '',
            ];
            $this->data['gender'] = [
                'name'          => 'gender',
                'id'            => 'gender',
                'class'         => 'form-control',
            ];
            $this->data['gender_value'] = [
                '1'             => 'Laki-Laki',
                '2'             => 'Perempuan',
            ];
            $this->data['angkatan'] = [
                'name'          => 'angkatan',
                'id'            => 'angkatan',
                'class'         => 'form-control',
                'autocomplete'  => 'off',
            ];
            $this->data['address'] = [
                'name'          => 'address',
                'id'            => 'address',
                'class'         => 'form-control',
                'autocomplete'  => 'off',
                'required'      => '',
                'rows'          => '5',
            ];
    
            $this->load->view('back/anggota/anggota_edit', $this->data);
        } else {
            //DATA TIDAK DITEMUKAN
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('admin/anggota');
        }
    }

    function update_action()
    {
        if (is_grandadmin()) {
            $this->form_validation->set_rules('instansi_id', 'Instansi', 'required');
        }
        $this->form_validation->set_rules('angkatan', 'Angkatan', 'required');
        $this->form_validation->set_rules('address', 'Alamat', 'trim|required');

        $this->form_validation->set_message('required', '{field} wajib diisi');
        
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');

        if (is_grandadmin()) {
            $instansi_id = $this->input->post('instansi_id');
        } elseif (is_masteradmin()){
            $instansi_id = $this->session->instansi_id;
        }

        if ($this->form_validation->run() === FALSE) {
            $this->update($this->input->post('id_anggota'));
        } else {
            $data = array(
                'no_induk'      => $this->input->post('no_induk'),
                'anggota_name'  => $this->input->post('anggota_name'),
                'instansi_id'   => $instansi_id,
                'gender'        => $this->input->post('gender'),
                'angkatan'      => $this->input->post('angkatan'),
                'address'       => $this->input->post('address'),
                'modified_by'    => $this->session->username,
            );

            $this->Anggota_model->update($this->input->post('id_anggota'), $data);

            write_log();

            $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil disimpan</div>');
            redirect('admin/anggota');
        }
    }

    function delete($id)
    {
        is_delete();

        $delete = $this->Anggota_model->get_by_id($id);

        if ($delete) {
            $data = array(
                'is_delete'         => '1',
                'deleted_by'        => $this->session->username,
                'deleted_at'        => date('Y-m-d H:i:a'),
            );

            $this->Anggota_model->soft_delete($id, $data);

            write_log();

            $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus</div>');
            redirect('admin/anggota');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('admin/anggota');
        }
    }

    function delete_permanent($id)
    {
        is_delete();

        $delete = $this->Anggota_model->get_by_id($id);

        if ($delete) {
            $this->Anggota_model->delete($id);

            write_log();

            $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dihapus permanen</div>');
            redirect('admin/anggota/deleted_list');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('admin/anggota');
        }
    }

    function deleted_list()
    {
        is_restore();

        $this->data['page_title'] = 'Recycle Bin ' . $this->data['module'];

        if (is_grandadmin()) {
            $this->data['get_all_deleted'] = $this->Anggota_model->get_all_deleted();
        } elseif (is_masteradmin()) {
            $this->data['get_all_deleted'] = $this->Anggota_model->get_all_deleted_by_instansi();
        } 

        $this->load->view('back/anggota/anggota_deleted_list', $this->data);
    }

    function restore($id)
    {
        is_restore();

        $row = $this->Anggota_model->get_by_id($id);

        if ($row) {
            $data = array(
                'is_delete'         => '0',
                'deleted_by'        => NULL,
                'deleted_at'        => NULL,
            );

            $this->Anggota_model->update($id, $data);

            write_log();

            $this->session->set_flashdata('message', '<div class="alert alert-success">Data berhasil dikembalikan</div>');
            redirect('admin/anggota/deleted_list');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger">Data tidak ditemukan</div>');
            redirect('admin/anggota');
        }
    }

    function pilih_anggota()
    {
        $this->data['anggota']  = $this->Anggota_model->get_all_combobox_by_instansi($this->uri->segment(4));
        $this->load->view('back/anggota/v_anggota', $this->data);
    }

    function form_empty()
    {
        $this->load->view('back/anggota/v_anggota_empty');
    }

    function get_anggota($id_anggota = '')
    {
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi');

        $data = $this->db->get_where('anggota', array('id_anggota' => $id_anggota));

        if ($data->num_rows() != 0) {
            if ($data->row()->gender == '1') {
                $gender = "Laki-laki";
            } elseif ($data->row()->gender == '2') {
                $gender = "Perempuan";
            }

            $output['success'] = 1;

            $output['anggota_name']       = $data->row()->anggota_name;
            $output['gender']           = $gender;
            $output['angkatan']    = $data->row()->angkatan;
            $output['address']    = $data->row()->address;
            $output['instansi_name']  = $data->row()->instansi_name;
        } else {
            $output['success'] = 0;
        }

        echo json_encode($output);
    }

    function ajax_label($id)
    {
        $this->data['anggota'] = $this->Anggota_model->get_by_id($id);

        $this->load->view('back/anggota/print_qrcode', $this->data);
    }

    function render_qrcode($id)
    {
        $id_qrcode = $id . '/anggota';
        
        QRcode::png(
        $id_qrcode,
        $outfile = false,
        $level = QR_ECLEVEL_H,
        $size = 4,
        $margin = 2
        );
    }
}

?>
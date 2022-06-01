<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Anggota_model extends CI_Model
{
    public $table   = 'anggota';
    public $id      = 'id_anggota';
    public $order   = 'DESC';

    function get_all()
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, anggota.gender, anggota.angkatan, anggota.address, anggota.created_by as created_by_anggota
        ');

        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('is_delete', '0');

        $this->db->order_by($this->id, $this->order);

        return $this->db->get($this->table)->result();
    }

    function get_all_by_instansi()
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, anggota.gender, anggota.angkatan, anggota.address, anggota.created_by as created_by_anggota
        ');

        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('anggota.is_delete', '0');
        $this->db->where('anggota.instansi_id', $this->session->instansi_id);

        $this->db->order_by($this->id, $this->order);

        return $this->db->get($this->table)->result();
    }

    function get_all_combobox_by_instansi($instansi_id)
    {
        $this->db->where('anggota.instansi_id', $instansi_id);
        $this->db->where('anggota.is_delete', 0);

        $this->db->order_by('no_induk');

        $data = $this->db->get($this->table);

        if ($data->num_rows() > 0) {
            foreach ($data->result_array() as $row) {
                $result[''] = '- Silahkan Pilih No Induk Anggota -';
                $result[$row['id_anggota']] = $row['no_induk'];
            }
        } else {
            $result[''] = '- No Induk Tidak Tersedia -';
        }
        return $result;
    }

    function get_all_deleted()
    {
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('is_delete', '1');

        $this->db->order_by($this->id, $this->order);

        return $this->db->get($this->table)->result();
    }

    function get_all_deleted_by_instansi()
    {
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('anggota.instansi_id', $this->session->instansi_id);
        $this->db->where('is_delete', '1');

        $this->db->order_by($this->id, $this->order);

        return $this->db->get($this->table)->result();
    }

    function get_by_id_for_detail_peminjaman($id)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, anggota.gender, anggota.angkatan, anggota.address
        ');

        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('anggota.is_delete', '0');

        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    function get_by_id_for_detail_pengembalian($id)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, anggota.gender, anggota.angkatan, anggota.address
        ');

        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('anggota.is_delete', '0');

        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    function get_by_id_for_peminjaman_list($id_anggota)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, peminjaman.is_delete_peminjaman, peminjaman.is_kembali
        ');

        $this->db->join('anggota', 'peminjaman.anggota_id = anggota.id_anggota', 'left');
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('peminjaman.anggota_id', $id_anggota);
        $this->db->where('is_delete_peminjaman', '0');
        $this->db->where('is_kembali', '0');

        return $this->db->get('peminjaman')->row();
    }

    function get_by_id_for_pengembalian_list($id_anggota)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, pengembalian.tgl_kembali, pengembalian.is_delete_pengembalian
        ');

        $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'left');
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('pengembalian.anggota_id', $id_anggota);
        // $this->db->where('pengembalian.tgl_kembali', $id_anggota);
        $this->db->where('is_delete_pengembalian', '0');

        return $this->db->get('pengembalian')->result();
    }

    function get_by_id_and_tgl_kembali_for_pengembalian_list($id_anggota, $tgl_kembali)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name, pengembalian.tgl_kembali, pengembalian.is_delete_pengembalian
        ');

        $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'left');
        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('pengembalian.anggota_id', $id_anggota);
        $this->db->where('pengembalian.tgl_kembali', $tgl_kembali);
        $this->db->where('is_delete_pengembalian', '0');

        return $this->db->get('pengembalian')->row();
    }

    function get_by_id_for_print_invoice($id_anggota)
    {
        $this->db->select('
            anggota.id_anggota, anggota.no_induk, anggota.anggota_name, instansi.instansi_name
        ');

        $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi', 'left');

        $this->db->where('anggota.id_anggota', $id_anggota);

        return $this->db->get($this->table)->row();
    }

    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    function soft_delete($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }
}

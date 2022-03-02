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

?>
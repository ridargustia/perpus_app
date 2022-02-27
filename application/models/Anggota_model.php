<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Anggota_model extends CI_Model
{
    public $table   = 'anggota';
    public $id      = 'id_anggota';
    public $order   = 'DESC';

    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }
}

?>
<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Bahasa_model extends CI_Model
{
    public $table   = 'bahasa';
    public $id      = 'id_bahasa';
    public $order   = 'DESC';

    function get_all()
    {

    }

    function get_all_combobox()
    {
        $this->db->order_by('bahasa');

        $data = $this->db->get($this->table);

        if ($data->num_rows() > 0) {
            foreach ($data->result_array() as $row) {
                $result[''] = '- Silahkan Pilih Bahasa -';
                $result[$row['id_bahasa']] = $row['bahasa'];
            }
            return $result;
        }
    }

    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }
}

?>
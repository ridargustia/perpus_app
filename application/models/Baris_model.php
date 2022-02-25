<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Baris_model extends CI_Model
{

  public $table = 'baris';
  public $id    = 'id_baris';
  public $order = 'DESC';

  function get_all()
  {
    $this->db->select('
      baris.id_baris, baris.baris_name, rak.rak_name, lokasi.lokasi_name,instansi.instansi_name, baris.created_by as created_by_baris
    ');
    
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('lokasi', 'baris.lokasi_id = lokasi.id_lokasi', 'left');
    $this->db->join('rak', 'baris.rak_id = rak.id_rak', 'left');

    $this->db->where('is_delete_baris', '0');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_by_instansi()
  {
    $this->db->select('
      baris.id_baris, baris.baris_name, instansi.instansi_name, lokasi.lokasi_name, rak.rak_name, baris.created_by as created_by_baris
    ');
    
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('lokasi', 'baris.lokasi_id = lokasi.id_lokasi', 'left');
    $this->db->join('rak', 'baris.rak_id = rak.id_rak', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_by_cabang()
  {
    $this->db->select('
      baris.id_baris, baris.baris_name, cabang.cabang_name, instansi.instansi_name, baris.created_by as created_by_baris, divisi.divisi_name
    ');
    
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');
    $this->db->join('divisi', 'baris.divisi_id = divisi.id_divisi', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('baris.cabang_id', $this->session->cabang_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_by_divisi()
  {
    $this->db->select('
      baris.id_baris, baris.baris_name, cabang.cabang_name, instansi.instansi_name, baris.created_by as created_by_baris, divisi.divisi_name
    ');
    
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');
    $this->db->join('divisi', 'baris.divisi_id = divisi.id_divisi', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('baris.cabang_id', $this->session->cabang_id);
    $this->db->where('baris.divisi_id', $this->session->divisi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_combobox()
  {
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_baris_by_instansi_combobox($instansi_id)
  {
    $this->db->where('instansi_id', $instansi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $sql = $this->db->get('baris');

    if ($sql->num_rows() > 0) {
      foreach ($sql->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = ucwords(strtolower($row['baris_name']));
      }
    } else {
      $result['-'] = '- Belum Ada Baris -';
    }
    return $result;
  }

  function get_baris_by_cabang_combobox($cabang_id)
  {
    $this->db->where('cabang_id', $cabang_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $sql = $this->db->get('baris');

    if ($sql->num_rows() > 0) {
      foreach ($sql->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = ucwords(strtolower($row['baris_name']));
      }
    } else {
      $result['-'] = '- Belum Ada Baris -';
    }
    return $result;
  }

  function get_baris_by_divisi_combobox($divisi_id)
  {
    $this->db->where('divisi_id', $divisi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $sql = $this->db->get('baris');

    if ($sql->num_rows() > 0) {
      foreach ($sql->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = ucwords(strtolower($row['baris_name']));
      }
    } else {
      $result['-'] = '- Belum Ada Baris -';
    }
    return $result;
  }

  function get_baris_by_rak_combobox($rak_id)
  {
    $this->db->where('rak_id', $rak_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $sql = $this->db->get('baris');

    if ($sql->num_rows() > 0) {
      foreach ($sql->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = ucwords(strtolower($row['baris_name']));
      }
    } else {
      $result['-'] = '- Belum Ada Baris -';
    }
    return $result;
  }

  function get_all_combobox_by_instansi($instansi_id)
  {
    $this->db->where('instansi_id', $instansi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_all_combobox_by_cabang($cabang_id)
  {
    $this->db->where('cabang_id', $cabang_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_all_combobox_by_divisi($divisi_id)
  {
    $this->db->where('divisi_id', $divisi_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_all_combobox_by_rak($rak_id)
  {
    $this->db->where('rak_id', $rak_id);
    $this->db->where('is_delete_baris', '0');

    $this->db->order_by('baris_name');

    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_all_combobox_update($instansi_id)
  {
    $this->db->where('instansi_id', $instansi_id);
    $this->db->order_by('baris_name');
    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Baris -';
        $result[$row['id_baris']] = $row['baris_name'];
      }
      return $result;
    }
  }

  function get_all_deleted()
  {
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');
    $this->db->join('lokasi', 'baris.lokasi_id = lokasi.id_lokasi', 'left');
    $this->db->join('rak', 'baris.rak_id = rak.id_rak', 'left');

    $this->db->where('is_delete_baris', '1');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_instansi()
  {
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');
    $this->db->join('lokasi', 'baris.lokasi_id = lokasi.id_lokasi', 'left');
    $this->db->join('rak', 'baris.rak_id = rak.id_rak', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('is_delete_baris', '1');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_cabang()
  {
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('baris.cabang_id', $this->session->cabang_id);
    $this->db->where('is_delete_baris', '1');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_divisi()
  {
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi', 'left');
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang', 'left');

    $this->db->where('baris.instansi_id', $this->session->instansi_id);
    $this->db->where('baris.cabang_id', $this->session->cabang_id);
    $this->db->where('baris.divisi_id', $this->session->divisi_id);
    $this->db->where('is_delete_baris', '1');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_by_id($id)
  {
    $this->db->where($this->id, $id);
    return $this->db->get($this->table)->row();
  }

  function check_by_name_and_instansi($name, $instansi_id)
  {
    $this->db->where('baris_name', $name);
    $this->db->where('instansi_id', $instansi_id);
    return $this->db->get($this->table)->row();
  }

  function check_by_name_and_instansi_and_cabang($name, $instansi_id, $cabang_id)
  {
    $this->db->where('baris_name', $name);
    $this->db->where('instansi_id', $instansi_id);
    $this->db->where('cabang_id', $cabang_id);

    return $this->db->get($this->table)->row();
  }

  function check_by_name_and_instansi_and_cabang_and_divisi($name, $instansi_id, $cabang_id, $divisi_id)
  {
    $this->db->where('baris_name', $name);
    $this->db->where('instansi_id', $instansi_id);
    $this->db->where('cabang_id', $cabang_id);
    $this->db->where('divisi_id', $divisi_id);
    $this->db->where('is_delete_baris', 0);

    return $this->db->get($this->table)->row();
  }

  function check_by_name_and_rak_and_lokasi_and_instansi($name, $instansi_id, $lokasi_id, $rak_id)
  {
    $this->db->where('baris_name', $name);
    $this->db->where('instansi_id', $instansi_id);
    $this->db->where('lokasi_id', $lokasi_id);
    $this->db->where('rak_id', $rak_id);
    return $this->db->get($this->table)->row();
  }

  function total_rows()
  {
    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_instansi()
  {
    $this->db->join('instansi', 'baris.instansi_id = instansi.id_instansi');

    $this->db->where('instansi_id', $this->session->instansi_id);

    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_cabang()
  {
    $this->db->join('cabang', 'baris.cabang_id = cabang.id_cabang');

    $this->db->where('cabang_id', $this->session->cabang_id);

    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_divisi()
  {
    $this->db->join('divisi', 'baris.divisi_id = divisi.id_divisi');

    $this->db->where('divisi_id', $this->session->divisi_id);

    return $this->db->get($this->table)->num_rows();
  }

  function insert($data)
  {
    $this->db->insert($this->table, $data);
  }

  function update($id, $data)
  {
    $this->db->where($this->id, $id);
    $this->db->update($this->table, $data);
  }

  function soft_delete($id, $data)
  {
    $this->db->where($this->id, $id);
    $this->db->update($this->table, $data);
  }

  function delete($id)
  {
    $this->db->where($this->id, $id);
    $this->db->delete($this->table);
  }
}

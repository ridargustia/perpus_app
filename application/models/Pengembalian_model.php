<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pengembalian_model extends CI_Model
{

  public $table = 'pengembalian';
  public $id    = 'id_pengembalian';
  public $order = 'DESC';

  function get_all()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.anggota_id, pengembalian.arsip_id, pengembalian.created_at, pengembalian.created_by,
      anggota.id_anggota, anggota.anggota_name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '0');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_by_instansi()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.anggota_id, pengembalian.arsip_id, pengembalian.created_at, pengembalian.created_by,
      anggota.id_anggota, anggota.anggota_name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '0');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_by_cabang()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at, pengembalian.created_by,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name,
      cabang.cabang_name,
      divisi.divisi_name, bagian.bagian_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('bagian', 'pengembalian.bagian_id = bagian.id_bagian', 'LEFT');

    $this->db->where('is_delete_pengembalian', '0');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_by_divisi()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at, pengembalian.created_by,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name,
      cabang.cabang_name,
      divisi.divisi_name, bagian.bagian_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('bagian', 'pengembalian.bagian_id = bagian.id_bagian', 'LEFT');

    $this->db->where('is_delete_pengembalian', '0');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);
    $this->db->where('pengembalian.divisi_id', $this->session->divisi_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_by_bagian()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at, pengembalian.created_by,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name,
      cabang.cabang_name,
      divisi.divisi_name, bagian.bagian_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('bagian', 'pengembalian.bagian_id = bagian.id_bagian', 'LEFT');

    $this->db->where('is_delete_pengembalian', '0');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);
    $this->db->where('pengembalian.divisi_id', $this->session->divisi_id);
    $this->db->where('pengembalian.bagian_id', $this->session->bagian_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.anggota_id, pengembalian.arsip_id, pengembalian.created_at,
      anggota.id_anggota, anggota.anggota_name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '1');

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_instansi()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.anggota_id, pengembalian.arsip_id, pengembalian.created_at,
      anggota.id_anggota, anggota.anggota_name,
      arsip.id_arsip, arsip.arsip_name,
      instansi.instansi_name
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '1');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);

    $this->db->order_by($this->id, $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_cabang()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.instansi_id, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      divisi.divisi_name,
      cabang.cabang_name,
      instansi.instansi_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '1');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_divisi()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      divisi.divisi_name,
      cabang.cabang_name,
      instansi.instansi_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '1');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);
    $this->db->where('pengembalian.divisi_id', $this->session->divisi_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_bagian()
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, pengembalian.divisi_id, pengembalian.user_id, pengembalian.arsip_id, pengembalian.created_at,
      users.id_users, users.name,
      arsip.id_arsip, arsip.arsip_name,
      divisi.divisi_name,
      cabang.cabang_name,
      instansi.instansi_name
    ');

    $this->db->join('users', 'pengembalian.user_id = users.id_users', 'LEFT');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('is_delete_pengembalian', '1');
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);
    $this->db->where('pengembalian.divisi_id', $this->session->divisi_id);
    $this->db->where('pengembalian.bagian_id', $this->session->bagian_id);

    $this->db->order_by('id_pengembalian', 'DESC');

    return $this->db->get($this->table)->result();
  }

  function get_all_deleted_by_user()
  {
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('users', 'pengembalian.user_id = users.id_users');

    $this->db->where('user_id', $this->session->id_users);
    $this->db->where('is_delete_pengembalian', '1');

    $this->db->order_by('pengembalian.deleted_at', $this->order);

    return $this->db->get($this->table)->result();
  }

  function get_all_periode($tgl_awal, $tgl_akhir)
  {
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('users', 'pengembalian.user_id = users.id_users');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('pengembalian.created_at >=', $tgl_awal);
    $this->db->where('pengembalian.created_at <=', $tgl_akhir);

    return $this->db->get($this->table)->result();
  }

  function get_all_periode_by_instansi($tgl_awal, $tgl_akhir)
  {
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('users', 'pengembalian.user_id = users.id_users');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('pengembalian.created_at >=', $tgl_awal);
    $this->db->where('pengembalian.created_at <=', $tgl_akhir);
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);

    return $this->db->get($this->table)->result();
  }

  function get_all_periode_by_cabang($tgl_awal, $tgl_akhir)
  {
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('users', 'pengembalian.user_id = users.id_users');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('pengembalian.created_at >=', $tgl_awal);
    $this->db->where('pengembalian.created_at <=', $tgl_akhir);
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.cabang_id', $this->session->cabang_id);

    return $this->db->get($this->table)->result();
  }

  function get_all_periode_by_divisi($tgl_awal, $tgl_akhir)
  {
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('users', 'pengembalian.user_id = users.id_users');
    $this->db->join('divisi', 'pengembalian.divisi_id = divisi.id_divisi', 'LEFT');
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');

    $this->db->where('pengembalian.created_at >=', $tgl_awal);
    $this->db->where('pengembalian.created_at <=', $tgl_akhir);
    $this->db->where('pengembalian.instansi_id', $this->session->instansi_id);
    $this->db->where('pengembalian.divisi_id', $this->session->divisi_id);

    return $this->db->get($this->table)->result();
  }

  function get_all_combobox($id)
  {
    $this->db->where('menu_id', $id);
    $this->db->order_by('pengembalian_name');
    $data = $this->db->get($this->table);

    if ($data->num_rows() > 0) {
      foreach ($data->result_array() as $row) {
        $result[''] = '- Silahkan Pilih Pengembalian';
        $result[$row['id_pengembalian']] = $row['pengembalian_name'];
      }
      return $result;
    }
  }

  function get_by_id($id)
  {
    $this->db->select('
      id_pengembalian, tgl_kembali, peminjaman_id, pengembalian.anggota_id, pengembalian.arsip_id,
      anggota.id_anggota, anggota.no_induk, anggota.anggota_name, anggota.gender, anggota.angkatan, anggota.address,
      arsip.id_arsip, arsip.no_arsip, arsip.arsip_name, arsip.penulis_buku, arsip.penerbit, arsip.kota_penerbit, arsip.tahun_terbit, lokasi.lokasi_name, rak.rak_name, baris.baris_name,
      instansi.instansi_name
    ');

    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip', 'LEFT');
    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota', 'LEFT');
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi', 'LEFT');
    $this->db->join('lokasi', 'arsip.lokasi_id = lokasi.id_lokasi', 'LEFT');
    $this->db->join('rak', 'arsip.rak_id = rak.id_rak', 'LEFT');
    $this->db->join('baris', 'arsip.baris_id = baris.id_baris', 'LEFT');

    $this->db->where($this->id, $id);

    return $this->db->get($this->table)->row();
  }

  function total_rows()
  {
    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_instansi()
  {
    $this->db->join('instansi', 'pengembalian.instansi_id = instansi.id_instansi');

    $this->db->where('instansi_id', $this->session->instansi_id);

    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_cabang()
  {
    $this->db->join('cabang', 'pengembalian.cabang_id = cabang.id_cabang');

    $this->db->where('cabang_id', $this->session->cabang_id);

    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_user()
  {
    $this->db->where('user_id', $this->session->id_users);
    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_divisi()
  {
    $this->db->where('divisi_id', $this->session->divisi_id);
    return $this->db->get($this->table)->num_rows();
  }

  function total_rows_by_anggota_and_tgl_kembali($id_anggota, $tgl_kembali)
  {
    $this->db->where('anggota_id', $id_anggota);
    $this->db->where('tgl_kembali', $tgl_kembali);
    $this->db->where('is_delete_pengembalian', '0');

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

  function get_pengembalian_by_anggota($id_anggota)
  {
    $this->db->select('
      pengembalian.id_pengembalian, pengembalian.peminjaman_id, pengembalian.tgl_kembali, pengembalian.arsip_id, pengembalian.anggota_id, pengembalian.instansi_id, pengembalian.created_at, pengembalian.created_by, anggota.id_anggota, anggota.no_induk, anggota.anggota_name, anggota.instansi_id, anggota.gender, anggota.angkatan, anggota.address, arsip.id_arsip, arsip.arsip_name, arsip.no_arsip, arsip.penulis_buku, arsip.penerbit, arsip.kota_penerbit, arsip.tahun_terbit, arsip.cover_buku, arsip.cover_buku_thumb, instansi.instansi_name
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi');

    $this->db->where('pengembalian.anggota_id', $id_anggota);
    $this->db->where('pengembalian.is_delete_pengembalian', '0');

    return $this->db->get($this->table)->result();
  }

  function get_pengembalian_by_anggota_and_tgl_kembali($id_anggota, $tgl_kembali)
  {
    $this->db->select('
      pengembalian.id_pengembalian, pengembalian.peminjaman_id, pengembalian.tgl_kembali, pengembalian.arsip_id, pengembalian.anggota_id, pengembalian.instansi_id, pengembalian.denda, pengembalian.created_at, pengembalian.created_by, anggota.id_anggota, anggota.no_induk, anggota.anggota_name, anggota.instansi_id, anggota.gender, anggota.angkatan, anggota.address, arsip.id_arsip, arsip.arsip_name, arsip.no_arsip, arsip.penulis_buku, arsip.penerbit, arsip.kota_penerbit, arsip.tahun_terbit, arsip.cover_buku, arsip.cover_buku_thumb, instansi.instansi_name, peminjaman.tgl_peminjaman
    ');

    $this->db->join('anggota', 'pengembalian.anggota_id = anggota.id_anggota');
    $this->db->join('arsip', 'pengembalian.arsip_id = arsip.id_arsip');
    $this->db->join('peminjaman', 'pengembalian.peminjaman_id = peminjaman.id_peminjaman');
    $this->db->join('instansi', 'anggota.instansi_id = instansi.id_instansi');

    $this->db->where('pengembalian.anggota_id', $id_anggota);
    $this->db->where('pengembalian.tgl_kembali', $tgl_kembali);
    $this->db->where('pengembalian.is_delete_pengembalian', '0');

    return $this->db->get($this->table)->result();
  }
}

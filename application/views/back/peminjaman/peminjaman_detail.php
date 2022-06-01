<?php $this->load->view('back/template/meta'); ?>
<div class="wrapper">

  <?php $this->load->view('back/template/navbar'); ?>
  <?php $this->load->view('back/template/sidebar'); ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1><?php echo $page_title ?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url('admin/dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><?php echo $module ?></li>
        <li class="active"><?php echo $page_title ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-8">
          <?php if ($this->session->flashdata('message')) {
            echo $this->session->flashdata('message');
          } ?>
          <?php
          foreach ($get_peminjaman as $data) {
            // $kembalikan = '<a href="'.base_url('admin/peminjaman/set_kembali/'.$data->id_peminjaman).'" class="btn btn-sm btn-info" title="Kembalikan Buku"><i class="fa fa-rotate-left"></i> Kembalikan</a>';
            $edit = '<a href="' . base_url('admin/peminjaman/update/' . $data->id_peminjaman) . '" class="btn btn-sm btn-warning" title="Ganti Buku"><i class="fa fa-pencil"></i> Ganti Buku</a>';
            $delete = '<a href="' . base_url('admin/peminjaman/delete/' . $data->id_peminjaman) . '" onClick="return confirm(\'Apakah anda yakin ingin menghapus data?\');" class="btn btn-sm btn-danger" title="Hapus Data"><i class="fa fa-trash"></i> Hapus</a>';
          ?>
            <div class="box box-primary">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-4">
                    <?php if ($data->cover_buku != NULL) { ?>
                      <a href="#" onclick="previewCover(<?php echo $data->id_arsip ?>)" title="Preview Cover">
                        <img src="<?php echo base_url('assets/images/cover_buku/' . $data->cover_buku) ?>" width="100%" height="275px" style="object-fit:contain">
                      </a>
                    <?php } else { ?>
                      <img src="<?php echo base_url('assets/images/noimage.jpg') ?>" width="100%">
                    <?php } ?>
                  </div>
                  <div class="col-md-8">
                    <table class="table">
                      <tbody>
                        <tr>
                          <td>No Label</td>
                          <td style="width:10px">:</td>
                          <td class="text-left"><?php echo $data->no_arsip ?></td>
                        </tr>
                        <tr>
                          <td>Judul Buku</td>
                          <td>:</td>
                          <td class="text-left"><?php echo $data->arsip_name ?></td>
                        </tr>
                        <tr>
                          <td style="width:120px">Tgl Peminjaman</td>
                          <td>:</td>
                          <td class="text-left"><?php echo datetime_indo3($data->tgl_peminjaman) ?></td>
                        </tr>
                        <tr>
                          <td>Tgl Pengembalian</td>
                          <td>:</td>
                          <td class="text-left"><?php echo datetime_indo3($data->tgl_kembali) ?></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <div style="text-align: right">
                  <?php echo $kembalikan . ' ';
                  echo $edit . ' ';
                  echo $delete; ?>
                </div>
              </div>
            </div>
          <?php } ?>
        </div>
        <div class="col-md-4">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Identitas Peminjam Buku</h3>
            </div>
            <div class="box-body">
              <table class="table">
                <tbody>
                  <tr>
                    <td style="width:130px">No Induk</td>
                    <td style="width:10px">:</td>
                    <td class="text-left"><b><?php echo $get_user->no_induk ?></b></td>
                  </tr>
                  <tr>
                    <td>Nama Anggota</td>
                    <td>:</td>
                    <td class="text-left"><b><?php echo $get_user->anggota_name ?></b></td>
                  </tr>
                  <tr>
                    <td>Gender</td>
                    <td>:</td>
                    <td class="text-left"><b>
                        <?php
                        if ($get_user->gender == 1) {
                          $gender = 'Laki-laki';
                        } elseif ($get_user->gender == 2) {
                          $gender = 'Perempuan';
                        }
                        echo $gender
                        ?>
                      </b></td>
                  </tr>
                  <tr>
                    <td>Angkatan</td>
                    <td>:</td>
                    <td class="text-left"><b><?php echo $get_user->angkatan ?></b></td>
                  </tr>
                  <tr>
                    <td>Address</td>
                    <td>:</td>
                    <td class="text-left"><b><?php echo $get_user->address ?></b></td>
                  </tr>
                  <?php if (is_grandadmin()) { ?>
                    <tr>
                      <td>Perguruan Tinggi</td>
                      <td>:</td>
                      <td class="text-left"><b><?php echo $get_user->instansi_name ?></b></td>
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- /.box -->
      <div class="modal fade" id="ModalPreview" role="dialog" style="min-width: 100%;margin-left:0px">
        <div class="modal-dialog" style="min-width: 100%;">
          <div id="dataPreview"></div>
        </div><!-- /.modal-dialog -->
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <?php $this->load->view('back/template/footer'); ?>

  <script>
    function previewCover(id) {
      $("#id").val(id);
      $('#ModalPreview').modal("show");
      loadPreview(id);
    }

    function loadPreview(id_arsip) {
      // var url = "buku/ajax_label/" + id + "/";
      $.ajax({
        url: "<?php echo base_url(); ?>book/ajax_preview_cover/" + id_arsip + "",
        type: "GET",
        async: true,
        data: {

        },
        success: function(data) {
          $('#dataPreview').html(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert('Error adding / update data');
        }
      });
    }
  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
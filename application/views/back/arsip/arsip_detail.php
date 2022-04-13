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
      <div class="box box-primary">
        <div class="box-body">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group"><label>No/Label Buku</label>
                <p><?php echo $detail_arsip->no_arsip ?></p>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Judul Buku</label>
                <p><?php echo $detail_arsip->arsip_name ?></p>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Perguruan Tinggi</label>
                <p><?php echo $detail_arsip->instansi_name ?></p>
              </div>
            </div>
          </div>
          <div class="form-group"><label>Deskripsi Buku</label>
            <p><?php echo $detail_arsip->deskripsi_arsip ?></p>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group"><label>Lokasi Buku</label>
                <p><?php echo $detail_arsip->lokasi_name ?></p>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Rak</label>
                <p><?php echo $detail_arsip->rak_name ?></p>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Baris</label>
                <p><?php echo $detail_arsip->baris_name ?></p>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Jumlah/Stok Buku</label>
                <p><?php echo $detail_arsip->qty ?></p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group"><label>Dikoleksi Perpustakaan Sejak</label>
                <p><?php echo datetime_indo($detail_arsip->waktu_dibuat) ?></p>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Dibuat Oleh</label>
                <p><?php echo $detail_arsip->pembuat_arsip ?></p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
            <?php
            // Jika grand/masteradmin, tampilkan semua file
            if (is_grandadmin() or is_masteradmin()) {
            ?>
              <div class="form-group"><label>File</label>
                <br>
                <?php if ($file_upload == NULL) {
                  echo "<button class='btn btn-sm btn-danger'><i class='fa fa-remove'></i> Belum ada data</button>";
                } ?>
                <ol>
                  <?php foreach ($file_upload as $files) { ?>
                    <li>
                      <b>FileName:</b> <?php echo $files->file_upload ?><br>
                      <a href="<?php echo base_url('assets/file_arsip/' . $instansiName . '/') . $files->file_upload ?>" class="btn btn-sm btn-primary" target="_blank"><i class="fa fa-download"></i> Download/Lihat</a>
                    </li><br>
                  <?php } ?>
                </ol>
              </div>

            <?php } ?>
            </div>
            <div class="col-sm-6">
              <div class="form-group"><label>Cover Buku</label><br>
                <?php if ($detail_arsip->cover_buku_thumb != NULL) { ?>
                  <a href="#" onclick="previewCover(<?php echo $detail_arsip->id_arsip ?>)" title="Preview Cover">
                    <img src="<?php echo base_url('assets/images/cover_buku/'.$detail_arsip->cover_buku_thumb) ?>" width="100px" height="120px">
                  </a>
                <?php } else { ?>
                  <img src="<?php echo base_url('assets/images/noimage.jpg') ?>" width="100px" height="120px">
                <?php } ?>
              </div>
            </div>
          </div>
          
        </div>
        <!-- /.box-body -->

      </div>

      <a href="<?php echo base_url('admin/buku/index') ?>" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Kembali ke halaman sebelumnya</a>

      <div class="modal fade" id="ModalPreview" role="dialog" style="min-width: 100%;margin-left:0px">
          <div class="modal-dialog" style="min-width: 100%;">
              <div id="dataPreview"></div>
          </div><!-- /.modal-dialog -->
      </div>

      <!-- /.box -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <?php $this->load->view('back/template/footer'); ?>

  <!-- Select2 -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>select2/dist/css/select2-flat-theme.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>select2/dist/js/select2.full.min.js"></script>
  <!-- multifile -->
  <script src="<?php echo base_url('assets/plugins/multifile/') ?>jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

  <script type="text/javascript">
    $('#masa_retensi').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
      zIndexOffset: 9999,
      todayHighlight: true,
    });

    $("#jenis_arsip_id").select2({
      placeholder: "- Please Choose Jenis Arsip -",
      theme: "flat"
    });

    function previewCover(id) {
      $("#id").val(id);
      $('#ModalPreview').modal("show");
      loadPreview(id);
    }

    function loadPreview(id_arsip) {
      // var url = "buku/ajax_label/" + id + "/";
      $.ajax({
          url: "<?php echo base_url(); ?>admin/buku/ajax_preview_cover/" + id_arsip + "",
          type: "GET",
          async: true,
          data: {
              
          },
          success: function (data) {
              $('#dataPreview').html(data);
          },
          error: function (jqXHR, textStatus, errorThrown) {
              alert('Error adding / update data');
          }
      });
    }
  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
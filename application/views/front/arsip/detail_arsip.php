<?php $this->load->view('front/template/meta'); ?>

<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-blue layout-top-nav">
  <div class="wrapper">

    <div class="content-wrapper bg">
      <div class="container">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>Detail Buku</h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <div class="box box-primary box-solid">
            <!-- /.box-header -->
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
                  <div class="form-group"><label>Nomor Rak</label>
                    <p><?php echo $detail_arsip->rak_name ?></p>
                  </div>
                </div>
                <div class="col-sm-3">
                  <div class="form-group"><label>Nomor Baris</label>
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
                    <p><?php echo $detail_arsip->dibuat_oleh ?></p>
                  </div>
                </div>
                <div class="col-sm-4">
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

            <?php
            // Jika grand/masteradmin, tampilkan semua file
            if ($detail_arsip->status_file == '1') {
            ?>
              <div class="box-footer">
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
              </div>

            <?php } ?>
          </div>

          <a href="<?php echo base_url('book/cari_book?search_form='.$search_form) ?>" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Kembali ke halaman sebelumnya</a>

          <div class="modal fade" id="ModalPreview" role="dialog" style="min-width: 100%;margin-left:0px">
              <div class="modal-dialog" style="min-width: 100%;">
                  <div id="dataPreview"></div>
              </div><!-- /.modal-dialog -->
          </div>
        </section>
        <!-- /.content -->
      </div>
      <!-- /.container -->
    </div>
    <!-- /.content-wrapper -->

    <?php $this->load->view('front/template/footer'); ?>

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
            success: function (data) {
                $('#dataPreview').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error adding / update data');
            }
        });
      }
    </script>

</body>

</html>
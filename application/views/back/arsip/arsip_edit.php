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
      <?php if ($this->session->flashdata('message')) {
        echo $this->session->flashdata('message');
      } ?>
      <?php echo validation_errors() ?>
      <div class="box box-primary">
        <?php echo form_open_multipart($action, array('class' => 'form-horizontal')) ?>
        <div class="box-body">
          <?php if (is_grandadmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Perguruan Tinggi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_instansi, $arsip->instansi_id, $instansi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Buku</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_lokasi, $arsip->lokasi_id, $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_rak, $arsip->rak_id, $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_baris, $arsip->baris_id, $baris_id) ?>
              </div>
            </div>
          <?php } elseif (is_masteradmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Buku</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_lokasi, $arsip->lokasi_id, $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_rak, $arsip->rak_id, $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_baris, $arsip->baris_id, $baris_id) ?>
              </div>
            </div>
          <?php } ?>

          <div class="form-group">
            <label class="col-lg-2 control-label">Nomor / Label Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($no_arsip, substr($arsip->no_arsip, 0, -6)) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Judul Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($arsip_name, $arsip->arsip_name) ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-2 control-label">Penulis Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($penulis_buku, $arsip->penulis_buku) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Jumlah Halaman</label>
            <div class="col-lg-10">
              <?php echo form_input($jumlah_halaman, $arsip->jumlah_halaman) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Bahasa</label>
            <div class="col-lg-10">
              <?php echo form_dropdown('', $get_all_combobox_bahasa, $arsip->bahasa_id, $bahasa_id) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Tema/Topik</label>
            <div class="col-lg-10">
            <?php echo form_input($tema_buku, $arsip->tema_buku) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Penerbit</label>
            <div class="col-lg-10">
            <?php echo form_input($penerbit, $arsip->penerbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Kota Penerbit</label>
            <div class="col-lg-10">
            <?php echo form_input($kota_penerbit, $arsip->kota_penerbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Tahun Terbit</label>
            <div class="col-lg-10">
            <?php echo form_input($tahun_terbit, $arsip->tahun_terbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Jumlah/Stok Buku</label>
            <div class="col-lg-10">
            <?php echo form_input($qty, $arsip->qty) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Current Cover</label>
            <div class="col-lg-10">
              <p>
                <?php if ($arsip->cover_buku != NULL) { ?>
                  <img src="<?php echo base_url('assets/images/cover_buku/' . $arsip->cover_buku) ?>" width="150px" alt="current photo">
                <?php } else { ?>
                  <img src="<?php echo base_url('assets/images/noimage.jpg') ?>" width="200px" alt="current photo">
                <?php } ?>
              </p>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Ganti Cover Baru</label>
            <div class="col-lg-10">
              <input type="file" name="cover" id="cover" onchange="coverPreview(this, 'preview')" />
              <p class="help-block">Maximum file size is 2MB</p>
              <img id="preview" width="150px" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">File Buku Saat Ini</label>
            <div class="col-lg-10">
              <?php if ($file_upload == NULL) {
                echo "<button class='btn btn-sm btn-danger'><i class='fa fa-remove'></i> Belum ada data</button>";
              } ?>
              <ol>
                <?php foreach ($file_upload as $files) { ?>
                  <li>
                    <b>FileName:</b> <?php echo $files->file_upload ?><br>                    
                    <a href="<?php echo base_url('assets/file_arsip/'.$instansiName.'/').$files->file_upload ?>" class="btn btn-sm btn-primary" target="_blank"><i class="fa fa-download"></i> Download/Lihat</a>
                    <a href="<?php echo base_url('admin/buku/delete_files_by_id/' . $files->id) ?>" class="btn btn-sm btn-danger"><i class="fa fa-remove"></i> Hapus</a>
                  </li><br>
                <?php } ?>
              </ol>
            </div>
          </div>          

          <div class="form-group">
            <label class="col-lg-2 control-label">Upload File Baru</label>
            <div class="col-lg-10">
              <input type="file" name="file_upload[]" class="multi" multiple>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Status Akses File</label>
            <div class="col-lg-10">
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="status_file" value="1" <?php if ($arsip->status_file == '1') {echo "checked";} ?> required />
                <div class="state p-success">
                  <i class="icon fa fa-check"></i>
                  <label>Umum</label>
                </div>
              </div>
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="status_file" value="0" <?php if ($arsip->status_file == '0') {echo "checked";} ?> />
                <div class="state p-success">
                  <i class="icon fa fa-check"></i>
                  <label>Privat</label>
                </div>
              </div>
            </div>
          </div>

          <hr>

          <h3><b>CATATAN:</b></h3>
          <ul>
            <li>Jenis File yang boleh diupload:
              <br><b>TEXT</b>: txt, pdf, ppt, pptx, xls, xlsx, doc, docx.
              <br><b>FOTO</b>: jpg, jpeg, png.
              <br><b>COMPRESSION</b>: zip, rar.
            </li>
            <li>Disarankan kalau filenya banyak, lebih baik buat dalam format <b>zip</b> atau <b>rar</b></li>
          </ul>

        </div>
        <?php echo form_input($id_arsip, $arsip->id_arsip) ?>
        <input type="hidden" name="arsip_id" value="<?php echo $arsip->id_arsip; ?>">
        <div class="box-footer">
          <button type="submit" name="button" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $btn_submit ?></button>
          <button type="reset" name="button" class="btn btn-danger"><i class="fa fa-refresh"></i> <?php echo $btn_reset ?></button>
        </div>
        <!-- /.box-body -->
        <?php echo form_close() ?>
      </div>

      <!-- /.box -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <?php $this->load->view('back/template/footer'); ?>

  <!-- dropzone -->
  <!-- multifile -->
  <script src="<?php echo base_url('assets/plugins/multifile/') ?>jquery.MultiFile.js" type="text/javascript" language="javascript"></script>  
  <!-- Pretty Checkbox -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>pretty-checkbox/dist/pretty-checkbox.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>select2/dist/css/select2-flat-theme.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>select2/dist/js/select2.full.min.js"></script>
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

  <script type="text/javascript">
    $('#tahun_terbit').datepicker({
      autoclose: true,
      format: 'yyyy',
      viewMode: 'years', 
      minViewMode: 'years'
    });

    $('#email').on('change', function() {
      var email = $(this).val();
      $.ajax({
        type: "POST",
        url: "<?php echo base_url('admin/token/pilih_folder') ?>",
        dataType: "JSON",
        data: {
          email: email
        },
        cache: false,
        success: function(data) {
          $.each(data, function() {
            $('[id="folder_name"]').val(data.folder_name);
          });
        }
      });
      return false;
    });

    function coverPreview(cover, idpreview) {
      var gb = cover.files;
      for (var i = 0; i < gb.length; i++) {
        var gbPreview = gb[i];
        var imageType = /image.*/;
        var preview = document.getElementById(idpreview);
        var reader = new FileReader();
        if (gbPreview.type.match(imageType)) {
          //jika tipe data sesuai
          preview.file = gbPreview;
          reader.onload = (function(element) {
            return function(e) {
              element.src = e.target.result;
            };
          })(preview);
          //membaca data URL gambar
          reader.readAsDataURL(gbPreview);
        } else {
          //jika tipe data tidak sesuai
          alert("Tipe file tidak sesuai. Gambar harus bertipe .png, .gif atau .jpg.");
        }
      }
    }

    function tampilLokasi() {
      instansi_id = document.getElementById("instansi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/lokasi/pilih_lokasi/" + instansi_id + "",
        success: function(response) {
          $("#lokasi_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilRak() {
      lokasi_id = document.getElementById("lokasi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/rak/pilih_rak/" + lokasi_id + "",
        success: function(response) {
          $("#rak_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilBaris() {
      rak_id = document.getElementById("rak_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/baris/pilih_baris/" + rak_id + "",
        success: function(response) {
          $("#baris_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
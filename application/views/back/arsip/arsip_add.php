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
        <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
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
        <?php echo form_open_multipart($action, array('class' => 'form-horizontal', 'id' => 'add_form')) ?>
        <div class="box-body">
          <?php if (is_grandadmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Perguruan Tinggi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_instansi, '', $instansi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Buku</label>
              <div class="col-lg-10">
              <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Lokasi Buku Dulu -'), '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Rak Dulu -'), '', $baris_id) ?>
              </div>
            </div>

          <?php } elseif (is_masteradmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Buku</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_lokasi, '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Lokasi Buku Dulu -'), '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Rak Dulu -'), '', $baris_id) ?>
              </div>
            </div>

          <?php } ?>

          <div class="form-group">
            <label class="col-lg-2 control-label">Nomor / Label Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($no_arsip) ?>
              <span id="no_arsip-availability-status"></span>
              <img src="<?php echo base_url('assets/images/loading.gif') ?>" id="loaderNoArsip" style="display:none" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Judul Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($arsip_name) ?>
              <span id="arsip_name-availability-status"></span>
              <img src="<?php echo base_url('assets/images/loading.gif') ?>" id="loaderArsipName" style="display:none" />
            </div>
          </div>

          <!-- <div class="form-group">
            <label class="col-lg-2 control-label">Deskripsi</label>
            <div class="col-lg-10">
              <?php //echo form_textarea($deskripsi_arsip) ?>
            </div>
          </div> -->

          <div class="form-group">
            <label class="col-lg-2 control-label">Penulis Buku</label>
            <div class="col-lg-10">
              <?php echo form_input($penulis_buku) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Jumlah Halaman</label>
            <div class="col-lg-10">
              <?php echo form_input($jumlah_halaman) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Bahasa</label>
            <div class="col-lg-10">
              <?php echo form_dropdown('', $get_all_combobox_bahasa, '', $bahasa_id) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Tema/Topik</label>
            <div class="col-lg-10">
            <?php echo form_input($tema_buku) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Penerbit</label>
            <div class="col-lg-10">
            <?php echo form_input($penerbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Kota Penerbit</label>
            <div class="col-lg-10">
            <?php echo form_input($kota_penerbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Tahun Terbit</label>
            <div class="col-lg-10">
            <?php echo form_input($tahun_terbit) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Jumlah/Stok Buku</label>
            <div class="col-lg-10">
            <?php echo form_input($qty) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Upload Cover Buku</label>
            <div class="col-lg-10">
              <input type="file" name="cover" id="cover" onchange="coverPreview(this, 'preview')" />
              <p class="help-block">Maximum file size is 2MB</p>
              <img id="preview" width="150px" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Upload File Buku</label>
            <div class="col-lg-10">
              <input type="file" name="file_upload[]" class="multi" multiple>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Status Akses File</label>
            <div class="col-lg-10">
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="status_file" value="1" required />
                <div class="state p-success">
                  <i class="icon fa fa-check"></i>
                  <label>Umum</label>
                </div>
              </div>
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="status_file" value="0" />
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
  <!-- multifile -->
  <script src="<?php echo base_url('assets/plugins/multifile/') ?>jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
  <!-- Jquery Validation -->
  <script src="<?php echo base_url('assets/plugins/') ?>jquery-validation/jquery.validate.min.js"></script>
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
      // format: 'yyyy-mm-dd',
      // zIndexOffset: 9999,
      // todayHighlight: true,
      format: 'yyyy',
      viewMode: 'years', 
      minViewMode: 'years'
    });

    $("#jenis_arsip_id").select2({
      placeholder: "- Silahkan Pilih Jenis Arsip -",
      theme: "flat"
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

    function tampilBox() {
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/box/pilih_box/" + divisi_id + "",
        success: function(response) {
          $("#box_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilMap() {
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/map/pilih_map/" + divisi_id + "",
        success: function(response) {
          $("#map_id").html(response);
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

    function tampilCabang() {
      instansi_id = document.getElementById("instansi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/cabang/pilih_cabang/" + instansi_id + "",
        success: function(response) {
          $("#cabang_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilDivisi() {
      cabang_id = document.getElementById("cabang_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/divisi/pilih_divisi/" + cabang_id + "",
        success: function(response) {
          $("#divisi_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilBagian() {
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/bagian/pilih_bagian/" + divisi_id + "",
        success: function(response) {
          $("#bagian_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilKepemilikanArsip() {
      bagian_id = document.getElementById("bagian_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/auth/pilih_user/" + bagian_id + "",
        success: function(response) {
          $("#user_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function checkNoArsip() {
      $("#loaderNoArsip").show();
      <?php if(is_grandadmin()){ ?>
        instansi_id = document.getElementById("instansi_id").value;
        lokasi_id = document.getElementById("lokasi_id").value;
        // divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_masteradmin()){ ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        lokasi_id = document.getElementById("lokasi_id").value;
        // cabang_id = document.getElementById("cabang_id").value;
        // divisi_id = document.getElementById("divisi_id").value;
      <?php } ?>
        
      no_arsip = $("#no_arsip").val();
      jQuery.ajax({
        url: "<?php echo base_url('admin/buku/check_no_arsip') ?>",
        data: {no_arsip: no_arsip, instansi_id: instansi_id, lokasi_id: lokasi_id},
        type: "POST",
        success: function(data) {
          $("#no_arsip-availability-status").html(data);
          $("#loaderNoArsip").hide();
        },
        error: function() {}
      });
    }

    function checkArsipName() {
      $("#loaderArsipName").show();
      <?php if(is_grandadmin()){ ?>
        instansi_id = document.getElementById("instansi_id").value;
        lokasi_id = document.getElementById("lokasi_id").value;
      <?php } elseif(is_masteradmin()){ ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        lokasi_id = document.getElementById("lokasi_id").value;
      <?php } ?>

      arsip_name = $("#arsip_name").val();

      jQuery.ajax({
        url: "<?php echo base_url('admin/buku/check_arsip_name') ?>",
        data: {arsip_name: arsip_name, instansi_id: instansi_id, lokasi_id: lokasi_id},
        type: "POST",
        success: function(data) {
          $("#arsip_name-availability-status").html(data);
          $("#loaderArsipName").hide();
        },
        error: function() {}
      });
    }

    $(document).ready(function() {
      $("#add_form").validate({
        errorElement: "span",
        rules: {
          name: "required",
          instansi_id: {
            required: true,
          },
          cabang_id: {
            required: true,
          },
          divisi_id: {
            required: true,
          },
          lokasi_id: {
            required: true,
          },
          user_id: {
            required: true,
          },
          rak_id: {
            required: true,
          },
          map_id: {
            required: true,
          },
          box_id: {
            required: true,
          },
          baris_id: {
            required: true,
          },
          no_arsip: {
            required: true,
          },
          arsip_name: {
            required: true,
          },
          deskripsi_arsip: {
            required: true,
          },
          masa_retensi: {
            required: true,
          },
          status_file: {
            required: true,
          },
          keterangan: {
            required: true,
          },
        },
        messages: {
          instansi_id: "<span style='color:red'>Wajib diisi</span>",
          cabang_id: "<span style='color:red'>Wajib diisi</span>",
          divisi_id: "<span style='color:red'>Wajib diisi</span>",
          lokasi_id: "<span style='color:red'>Wajib diisi</span>",
          user_id: "<span style='color:red'>Wajib diisi</span>",
          rak_id: "<span style='color:red'>Wajib diisi</span>",
          map_id: "<span style='color:red'>Wajib diisi</span>",
          box_id: "<span style='color:red'>Wajib diisi</span>",
          baris_id: "<span style='color:red'>Wajib diisi</span>",
          no_arsip: "<span style='color:red'>Wajib diisi</span>",
          arsip_name: "<span style='color:red'>Wajib diisi</span>",
          deskripsi_arsip: "<span style='color:red'>Wajib diisi</span>",
          masa_retensi: "<span style='color:red'>Wajib diisi</span>",
          status_file: "<span style='color:red'>Wajib diisi</span>",
          keterangan: "<span style='color:red'>Wajib diisi</span>",
        }
      });
    });
  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
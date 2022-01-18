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
              <label class="col-lg-2 control-label">Fakultas</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $cabang_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Program Studi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Fakultas Dulu -'), '', $divisi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Divisi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $bagian_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Kepemilikan Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Divisi Dulu -'), '', $user_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Box</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $box_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Map</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $map_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $baris_id) ?>
              </div>
            </div>

          <?php } elseif (is_masteradmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Fakultas</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_cabang, '', $cabang_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Program Studi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Fakultas Dulu -'), '', $divisi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Divisi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $bagian_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Kepemilikan Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Divisi Dulu -'), '', $user_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Box</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $box_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Map</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $map_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $baris_id) ?>
              </div>
            </div>

          <?php } elseif (is_superadmin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Program Studi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_divisi, '', $divisi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Divisi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $bagian_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Kepemilikan Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Divisi Dulu -'), '', $user_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Box</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $box_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Map</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $map_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Program Studi Dulu -'), '', $baris_id) ?>
              </div>
            </div>

          <?php } elseif (is_admin()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Divisi</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_bagian, '', $bagian_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_lokasi, '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Kepemilikan Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', array('' => '- Pilih Divisi Dulu -'), '', $user_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_rak, '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Box</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_box, '', $box_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Map</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_map, '', $map_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_baris, '', $baris_id) ?>
              </div>
            </div>
          <?php } elseif (is_pegawai()) { ?>
            <div class="form-group">
              <label class="col-lg-2 control-label">Lokasi Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_lokasi, '', $lokasi_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Kepemilikan Arsip</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_user, '', $user_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Rak</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_rak, '', $rak_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Box</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_box, '', $box_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Map</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_map, '', $map_id) ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Baris</label>
              <div class="col-lg-10">
                <?php echo form_dropdown('', $get_all_combobox_baris, '', $baris_id) ?>
              </div>
            </div>
          <?php } ?>

          <div class="form-group">
            <label class="col-lg-2 control-label">Nomor Arsip</label>
            <div class="col-lg-10">
              <?php echo form_input($no_arsip) ?>
              <span id="no_arsip-availability-status"></span>
              <img src="<?php echo base_url('assets/images/loading.gif') ?>" id="loaderNoArsip" style="display:none" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Nama Arsip</label>
            <div class="col-lg-10">
              <?php echo form_input($arsip_name) ?>
              <span id="arsip_name-availability-status"></span>
              <img src="<?php echo base_url('assets/images/loading.gif') ?>" id="loaderArsipName" style="display:none" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Deskripsi</label>
            <div class="col-lg-10">
              <?php echo form_textarea($deskripsi_arsip) ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Jenis Arsip</label>
            <div class="col-lg-10">
              <p>
                <?php foreach ($get_all_jenis_arsip as $jenisArsipId) { ?>
                  <div class="pretty p-icon p-smooth">
                    <input type="checkbox" name="jenis_arsip_id[]" value="<?php echo $jenisArsipId->id_jenis ?>">
                    <div class="state p-success">
                      <i class="icon fa fa-check"></i>
                      <label><?php echo $jenisArsipId->jenis_name ?></label>
                    </div>
                  </div>
                <?php } ?>
              </p>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Masa Retensi</label>
            <div class="col-lg-10">
              <?php echo form_input($masa_retensi) ?>
            </div>
          </div>          

          <div class="form-group">
            <label class="col-lg-2 control-label">Upload File</label>
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
                <div class="state p-danger">
                  <i class="icon fa fa-check"></i>
                  <label>Khusus</label>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-2 control-label">Keterangan</label>
            <div class="col-lg-10">
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="keterangan" value="0" required />
                <div class="state p-success">
                  <i class="icon fa fa-check"></i>
                  <label>Permanen</label>
                </div>
              </div>
              <div class="pretty p-icon p-smooth">
                <input type="radio" name="keterangan" value="1" />
                <div class="state p-danger">
                  <i class="icon fa fa-check"></i>
                  <label>Musnah</label>
                </div>
              </div>
            </div>
          </div>

          <hr>

          <h3><b>CATATAN:</b></h3>
          <ul>
            <li>Jenis File yang boleh diupload:
              <br><b>TEXT</b>: txt, pdf, ppt, pptx, xls, xlsx, doc, docx.
              <br><b>AUDIO</b>: mp3, flac, wav, m4a.
              <br><b>VIDEO</b>: mp4, flv.
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
    $('#masa_retensi').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
      zIndexOffset: 9999,
      todayHighlight: true,
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

    function tampilLokasi() {
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/lokasi/pilih_lokasi/" + divisi_id + "",
        success: function(response) {
          $("#lokasi_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilRak() {
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/rak/pilih_rak/" + divisi_id + "",
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
      divisi_id = document.getElementById("divisi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/baris/pilih_baris/" + divisi_id + "",
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
        cabang_id = document.getElementById("cabang_id").value;
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_masteradmin()){ ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = document.getElementById("cabang_id").value;
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_superadmin()) {?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = <?php $this->session->cabang_id; ?>
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_admin() or is_pegawai()) { ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = <?php $this->session->cabang_id; ?>
        divisi_id = <?php $this->session->divisi_id; ?>
      <?php } ?>
        

      no_arsip = $("#no_arsip").val();
      jQuery.ajax({
        url: "<?php echo base_url('admin/arsip/check_no_arsip') ?>",
        data: {no_arsip: no_arsip, divisi_id: divisi_id, cabang_id: cabang_id, instansi_id: instansi_id},
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
        cabang_id = document.getElementById("cabang_id").value;
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_masteradmin()){ ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = document.getElementById("cabang_id").value;
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_superadmin()) {?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = <?php $this->session->cabang_id; ?>
        divisi_id = document.getElementById("divisi_id").value;
      <?php } elseif(is_admin() or is_pegawai()) { ?>
        instansi_id = <?php $this->session->instansi_id; ?>
        cabang_id = <?php $this->session->cabang_id; ?>
        divisi_id = <?php $this->session->divisi_id; ?>
      <?php } ?>

      arsip_name = $("#arsip_name").val();

      jQuery.ajax({
        url: "<?php echo base_url('admin/arsip/check_arsip_name') ?>",
        data: {arsip_name: arsip_name, divisi_id: divisi_id, cabang_id: cabang_id, instansi_id: instansi_id},
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
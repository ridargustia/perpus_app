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
      <?php echo form_open($action) ?>
      <?php echo validation_errors() ?>
      <div class="box box-primary">
        <div class="box-body">
          <div class="form-group"><label>Tanggal Peminjaman</label>
            <?php echo form_input($tgl_peminjaman) ?>
          </div>
          <div class="form-group"><label>Tanggal Pengembalian</label>
            <?php echo form_input($tgl_kembali) ?>
          </div>

          <?php if (is_grandadmin()) { ?>
            <div class="row">
              <div class="col-lg-4">
                <div class="form-group"><label>Perguruan Tinggi (*)</label>
                  <?php echo form_dropdown('', $get_all_combobox_instansi, '', $instansi_id) ?>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="form-group"><label>Judul Buku yang Akan Dipinjam</label>
                  <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $arsip_id) ?>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="form-group"><label>No Induk Peminjam Buku</label>
                  <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $no_induk) ?>
                </div>
              </div>
            </div>

          <?php } elseif (is_masteradmin()) { ?>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Judul Buku yang Akan Dipinjam</label>
                  <?php echo form_dropdown('', $get_all_combobox_arsip_available, '', $arsip_id) ?>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group"><label>No Induk Peminjam Buku</label>
                <?php echo form_dropdown('', $get_all_combobox_anggota, '', $no_induk) ?>
                </div>
              </div>
            </div>

          <?php } ?>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <a href="<?php echo $scan_qrcode ?>" class="btn btn-primary"><i class="fa fa-qrcode"></i> <?php echo $btn_scan ?></a>
        </div>
      </div>

      <!-- /.box -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">DATA ANGGOTA</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group"><label>Nama Anggota</label>
                <?php echo form_input($anggota_name) ?>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Jenis Kelamin</label>
                <?php echo form_input($gender) ?>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Angkatan</label>
                <?php echo form_input($angkatan) ?>
              </div>
            </div>
          </div>
          <div class="form-group"><label>Address</label>
            <?php echo form_textarea($address) ?>
          </div>
        </div>
        <div class="box-footer">
          <button type="submit" name="button" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $btn_submit ?></button>
          <button type="reset" name="button" class="btn btn-danger"><i class="fa fa-refresh"></i> <?php echo $btn_reset ?></button>
        </div>
      </div>
      <?php echo form_close() ?>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <?php $this->load->view('back/template/footer'); ?>

  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <!-- select2 -->
  <link rel="stylesheet" href="<?php echo base_url() ?>assets/plugins/select2/dist/css/select2.min.css">
  <script type="text/javascript" src="<?php echo base_url() ?>assets/plugins/select2/dist/js/select2.full.min.js"></script>

  <script type="text/javascript">
    $('#tgl_peminjaman').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
      zIndexOffset: 9999,
      todayHighlight: true,
    });
    $('#tgl_kembali').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
      zIndexOffset: 9999,
      todayHighlight: true,
    });
    $(document).ready(function() {
      $("#arsip_id").select2({
        // placeholder: "Silahkan Pilih Arsip",
      });
    });
    $(document).ready(function() {
      $("#no_induk").select2({
        // placeholder: "Silahkan Pilih Arsip",
      });
    });
    $(document).ready(function() {
      $("#user_id").select2({
        // placeholder: "Silahkan Pilih Peminjam",
      });
    });

    // $('#user_id').on('change', function() {
    //   var user_id = $(this).val();
    //   //alert(peminjaman_id);
    //   $.ajax({
    //     url: "<?php echo base_url('admin/peminjaman/get_cabang_divisi_instansi_by_user/') ?>" + user_id,
    //     success: function(response) {
    //       var myObj = JSON.parse(response);

    //       $('#instansi_id').val(myObj.instansi_name);
    //       $('#cabang_id').val(myObj.cabang_name);
    //       $('#divisi_id').val(myObj.divisi_name);

    //     }
    //   });
    // });

    $('#no_induk').on('change', function() {
      var no_induk = $(this).val();
      // alert(no_induk);
      $.ajax({
        url: "<?php echo base_url('admin/anggota/get_anggota/') ?>" + no_induk,
        success: function(response) {
          var myObj = JSON.parse(response);

          $('#anggota_name').val(myObj.anggota_name);
          $('#gender').val(myObj.gender);
          $('#angkatan').val(myObj.angkatan);
          $('#address').val(myObj.address);
          // $('#instansi_id').val(myObj.instansi_name);

        }
      });
    });

    function tampilArsip() {
      instansi_id = document.getElementById("instansi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/buku/pilih_arsip_available/" + instansi_id + "",
        success: function(response) {
          $("#arsip_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilNoInduk() {
      instansi_id = document.getElementById("instansi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/anggota/pilih_anggota/" + instansi_id + "",
        success: function(response) {
          $("#no_induk").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    // function tampilUser() {
    //   divisi_id = document.getElementById("divisi_id").value;
    //   $.ajax({
    //     url: "<?php echo base_url(); ?>admin/auth/pilih_user/" + divisi_id + "",
    //     success: function(response) {
    //       $("#user_id").html(response);
    //     },
    //     dataType: "html"
    //   });
    //   return false;
    // }
  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
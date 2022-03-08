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
        <?php echo form_open($action) ?>
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>Tanggal Peminjaman (*)</label>
                <?php echo form_input($tgl_peminjaman, $peminjaman->tgl_peminjaman) ?>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>Tanggal Pengembalian (*)</label>
                <?php echo form_input($tgl_kembali, $peminjaman->tgl_kembali) ?>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>Buku yang Dipinjam Saat Ini</label>
                <input type="hidden" class="form-control" name="current_arsip" value="<?php echo $peminjaman->arsip_id ?>">
                <p><button class="btn btn-primary" name="button"><?php echo $peminjaman->arsip_name ?></button></p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>No/Label Buku yang Dipinjam Saat Ini</label>
                <p><button class="btn btn-primary" name="button"><?php echo $peminjaman->no_arsip ?></button></p>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>Peminjam Buku Saat Ini</label>
                <input type="hidden" class="form-control" name="current_peminjam" value="<?php echo $peminjaman->anggota_id ?>">
                <p><button class="btn btn-primary" name="button"><?php echo $peminjaman->anggota_name ?></button></p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>No Induk Peminjam Buku Saat Ini</label>
                <p><button class="btn btn-primary" name="button"><?php echo $peminjaman->no_induk ?></button></p>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-3">
              <div class="form-group"><label>Perguruan Tinggi Saat Ini</label>
                <p><button class="btn btn-primary" name="button"><?php echo $peminjaman->instansi_name ?></button></p>
              </div>
            </div>
          </div>

          <hr>

          <?php if (is_grandadmin()) { ?>
            <div class="row">
              <div class="col-lg-12">
                <div class="form-group"><label>Perguruan Tinggi (*)</label>
                  <?php echo form_dropdown('', $get_all_combobox_instansi, '', $instansi_id) ?>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Judul Buku yang Akan Dipinjam</label>
                  <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $new_arsip) ?>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group"><label>No Induk Peminjam Buku</label>
                <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $no_induk) ?>
                </div>
              </div>
            </div>

          <?php } elseif (is_masteradmin()) { ?>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Judul Buku yang Akan Dipinjam</label>
                <?php echo form_dropdown('', $get_all_combobox_arsip_available, '', $new_arsip) ?>
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
        <?php echo form_input($id_peminjaman, $peminjaman->id_peminjaman) ?>
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
      $("#new_arsip").select2({
        // placeholder: "Pilih Divisi Dulu",
      });
    });
    $(document).ready(function() {
      $("#user_id").select2({
        // placeholder: "Pilih Divisi Dulu",
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

    function tampilArsip() {
      instansi_id = document.getElementById("instansi_id").value;
      $.ajax({
        url: "<?php echo base_url(); ?>admin/buku/pilih_arsip_available/" + instansi_id + "",
        success: function(response) {
          $("#new_arsip").html(response);
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
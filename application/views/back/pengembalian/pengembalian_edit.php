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
      <?php if($this->session->flashdata('message')){echo $this->session->flashdata('message');} ?>
      <?php echo validation_errors() ?>
      <div class="box box-primary">
        <?php echo form_open($action) ?>
          <div class="box-body">
            <div class="form-group"><label>Tanggal Pengembalian (*)</label>
              <?php echo form_input($tgl_kembali, $pengembalian->tgl_kembali) ?>
            </div>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Buku yang Dipinjam Saat Ini</label>
                  <p><button class="btn bg-navy" name="button"><?php echo $pengembalian->arsip_name ?></button></p>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group"><label>No/Label Buku Saat Ini</label>
                  <p><button class="btn bg-navy" name="button"><?php echo $pengembalian->no_arsip ?></button></p>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Peminjam Buku Saat Ini</label>
                  <p><button class="btn bg-navy" name="button"><?php echo $pengembalian->anggota_name ?></button></p>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group"><label>No Induk Peminjam Saat Ini</label>
                  <p><button class="btn bg-navy" name="button"><?php echo $pengembalian->no_induk ?></button></p>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group"><label>Perguruan Tinggi Saat Ini</label>
                  <p><button class="btn bg-navy" name="button"><?php echo $pengembalian->instansi_name ?></button></p>
                </div>
              </div>
            </div>

            <div class="form-group"><label>Buku Baru yang Akan Dikembalikan</label>
              <?php echo form_dropdown('', $get_all_combobox_arsip_peminjaman, '', $peminjaman_id) ?>
            </div>

            <div class="row">
              <div class="col-md-3">
                <div class="form-group"><label>No/Label Buku Baru(*)</label>
                  <?php echo form_input($no_arsip) ?>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group"><label>Nama Peminjam Buku Baru(*)</label>
                  <?php echo form_input($anggota_id) ?>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group"><label>No Induk Peminjam Baru</label>
                  <?php echo form_input($no_induk) ?>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group"><label>Jenis Kelamin</label>
                  <?php echo form_input($gender) ?>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group"><label>Alamat</label>
                  <?php echo form_input($address) ?>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group"><label>Perguruan Tinggi</label>
                  <?php echo form_input($instansi_id) ?>
                </div>
              </div>
            </div>

          </div>
          <?php echo form_input($id_pengembalian, $pengembalian->id_pengembalian) ?>
          <?php echo form_input($arsip_id, $pengembalian->arsip_id) ?>
          <?php echo form_input($id_peminjaman, $pengembalian->peminjaman_id) ?>
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
    $('#tgl_kembali').datepicker({
      autoclose: true,
      format: 'yyyy/mm/dd',
      zIndexOffset: 9999,
      todayHighlight: true,
    })

    $(document).ready(function() {
      $("#peminjaman_id").select2({
        // placeholder: "Silahkan Pilih Arsip",
      });
    });

    $('#peminjaman_id').on('change',function(){
      var peminjaman_id=$(this).val();
      //alert(peminjaman_id);
      $.ajax({
        url  :  "<?php echo base_url('admin/peminjaman/get_peminjaman/')?>" + peminjaman_id,
        success: function(response){
          var myObj = JSON.parse(response);

          $('#anggota_id').val(myObj.anggota_name);
          $('#no_induk').val(myObj.no_induk);
          $('#gender').val(myObj.gender);
          $('#address').val(myObj.address);
          $('#instansi_id').val(myObj.instansi_name);
          $('#no_arsip').val(myObj.no_arsip);
        }
      });
    });
  </script>

</div>
<!-- ./wrapper -->

</body>
</html>

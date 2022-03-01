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
        <?php echo form_open($action) ?>
        <div class="box-body">
          <?php if (is_grandadmin()){ ?>
            <div class="form-group"><label>Perguruan Tinggi</label>
              <?php echo form_dropdown('', $get_all_combobox_instansi, $anggota->instansi_id, $instansi_id) ?>
            </div>
          <?php } ?>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group"><label>No Induk Mahasiswa (*)</label>
                        <?php echo form_input($no_induk, $anggota->no_induk) ?>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group"><label>Nama Anggota (*)</label>
                        <?php echo form_input($anggota_name, $anggota->anggota_name) ?>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group"><label>Jenis Kelamin (*)</label>
                        <?php echo form_dropdown('', $gender_value, $anggota->gender, $gender) ?>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group"><label>Angkatan (*)</label>
                        <?php echo form_input($angkatan, $anggota->angkatan) ?>
                    </div>
                </div>
            </div>
            
            <div class="form-group"><label>Alamat (*)</label>
            <?php echo form_textarea($address, $anggota->address) ?>
            </div>
        </div>
        <?php echo form_input($id_anggota, $anggota->id_anggota) ?>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="<?php echo base_url('assets/plugins/') ?>datatables-bs/css/dataTables.bootstrap.min.css">
  <script src="<?php echo base_url('assets/plugins/') ?>datatables/js/jquery.dataTables.min.js"></script>
  <script src="<?php echo base_url('assets/plugins/') ?>datatables-bs/js/dataTables.bootstrap.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#dataTable').DataTable();
    });

  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
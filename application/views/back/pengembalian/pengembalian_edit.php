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
      <?php echo form_open($action) ?>
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">BUKU YANG TELAH DIKEMBALIKAN</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-8">
              <div class="form-group"><label>Judul Buku</label>
                <?php echo form_input($current_arsip_name, $pengembalian->arsip_name) ?>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"><label>No/Label Buku</label>
                <?php echo form_input($current_no_arsip, $pengembalian->no_arsip) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="form-group"><label>Penulis Buku</label>
                <?php echo form_input($current_penulis_buku, $pengembalian->penulis_buku) ?>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"><label>Penerbit</label>
                <?php echo form_input($current_penerbit, $pengembalian->penerbit) ?>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"><label>Kota Penerbit</label>
                <?php echo form_input($current_kota_penerbit, $pengembalian->kota_penerbit) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3">
              <div class="form-group"><label>Lokasi Buku</label>
                <?php echo form_input($current_lokasi_name, $pengembalian->lokasi_name) ?>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group"><label>Rak</label>
                <?php echo form_input($current_rak_name, $pengembalian->rak_name) ?>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group"><label>Baris</label>
                <?php echo form_input($current_baris_name, $pengembalian->baris_name) ?>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group"><label>Tahun Terbit</label>
                <?php echo form_input($current_tahun_terbit, $pengembalian->tahun_terbit) ?>
              </div>
            </div>
          </div>

          <?php if (is_grandadmin()) { ?>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group"><label>Perguruan Tinggi Saat Ini</label>
              <?php echo form_input($current_instansi_name, $pengembalian->instansi_name) ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group"><label>Tanggal Pengembalian (*)</label>
                <?php echo form_input($tgl_kembali, $pengembalian->tgl_kembali) ?>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
      </div>

      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">PEMINJAM BUKU</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>Nama</label>
                <input type="hidden" class="form-control" name="current_peminjam" value="<?php echo $pengembalian->anggota_id ?>">
                <?php echo form_input($current_anggota_name, $pengembalian->anggota_name) ?>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>No Induk</label>
                <?php echo form_input($current_no_induk, $pengembalian->no_induk) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>Jenis Kelamin</label>
                <?php
                  if ($pengembalian->gender == 1) {
                    $gender = 'Laki-laki';
                  } elseif ($pengembalian->gender == 2) {
                    $gender = 'Perempuan';
                  }
                  echo form_input($current_gender, $gender) 
                ?>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>Angkatan</label>
                <?php echo form_input($current_angkatan, $pengembalian->angkatan) ?>
              </div>
            </div>
          </div>
          <div class="form-group"><label>Alamat</label>
            <?php echo form_input($current_address, $pengembalian->address) ?>
          </div>
        </div>
        
        <div class="box-footer">
          <a href="<?php echo base_url('admin/pengembalian') ?>" class="btn btn-info"><i class="fa fa-arrow-left"></i> <?php echo $btn_back ?></a>
          <a href="<?php echo base_url('admin/pengembalian/update_anggota/'.$pengembalian->id_pengembalian) ?>" class="btn btn-primary"><i class="fa fa-pencil"></i> <?php echo $btn_edit ?></a>
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

</div>
<!-- ./wrapper -->

</body>
</html>

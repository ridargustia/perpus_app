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

      <div class="box box-primary">
        <div class="box-header"><a href="<?php echo $add_action ?>" class="btn btn-primary"><i class="fa fa-plus"></i> <?php echo $btn_add ?></a> </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table id="dataTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Tgl Pengembalian</th>
                  <th style="text-align: center">No Induk Peminjam</th>
                  <th style="text-align: center">Nama Peminjam</th>
                  <?php
                  //? Jika GrandAdmin
                  if (is_grandadmin()) {
                  ?>
                    <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Invoice</th>
                  <th style="text-align: center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php $no = 1;
                foreach ($get_all as $data) {
                  //TODO Buat tombol action
                  $detail = '<a href="' . base_url('admin/pengembalian/detail/' . $data->id_anggota . '/' . $data->tgl_kembali) . '" class="btn btn-sm btn-primary" title="Lihat Detail Pengembalian"><i class="fa fa-eye"></i></a>';
                  $delete = '<a href="' . base_url('admin/pengembalian/delete_pengembalian_by_anggota_and_tgl_kembali/' . $data->id_anggota . '/' . $data->tgl_kembali) . '" onClick="return confirm(\'Apakah anda yakin ingin menghapus data?\');" class="btn btn-sm btn-danger" title="Hapus Data"><i class="fa fa-trash"></i></a>';
                  $invoice = '<a href="' . base_url('admin/pengembalian/print_invoice/' . $data->id_anggota . '/' . $data->tgl_kembali) . '" target="_blank" class="btn btn-sm btn-success" title="Cetak Invoice"><i class="fa fa-print"></i></a>';
                ?>
                  <tr>
                    <td style="text-align: center"><?php echo $no++ ?></td>
                    <td style="text-align: center"><?php echo datetime_indo4($data->tgl_kembali) ?></td>
                    <td style="text-align: center"><?php echo $data->no_induk ?></td>
                    <td style="text-align: center"><?php echo $data->anggota_name ?></td>
                    <?php
                    //? Jika GrandAdmin
                    if (is_grandadmin()) {
                    ?>
                      <td style="text-align: center"><?php echo $data->instansi_name ?></td>
                    <?php } ?>
                    <td style="text-align: center"><?php echo $invoice ?></td>
                    <td style="text-align: center"><?php echo $detail . ' ';
                                                    echo $delete; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Tgl Pengembalian</th>
                  <th style="text-align: center">No Induk Peminjam</th>
                  <th style="text-align: center">Nama Peminjam</th>
                  <?php
                  //? Jika GrandAdmin
                  if (is_grandadmin()) {
                  ?>
                    <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Invoice</th>
                  <th style="text-align: center">Aksi</th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        <!-- /.box-body -->
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
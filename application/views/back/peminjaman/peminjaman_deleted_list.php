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
      <?php if($this->session->flashdata('message')){echo $this->session->flashdata('message');} ?>

      <div class="box box-primary">
        <div class="box-body">
          <div class="table-responsive">
            <table id="dataTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Tgl Peminjaman</th>
                  <th style="text-align: center">Tgl Pengembalian</th>
                  <th style="text-align: center">Judul Buku</th>
                  <th style="text-align: center">Nama Peminjam</th>
                  <?php if (is_grandadmin()) { ?>
                  <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Created At</th>
                  <th style="text-align: center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php $no = 1; foreach($get_all_deleted as $data){
                  // action
                  $restore = '<a href="'.base_url('admin/peminjaman/restore/'.$data->id_peminjaman).'" class="btn btn-sm btn-primary" title="Restore Buku"><i class="fa fa-refresh"></i></a>';
                  $delete = '<a href="'.base_url('admin/peminjaman/delete_permanent/'.$data->id_peminjaman).'" onClick="return confirm(\'Apakah anda yakin ingin hapus data secara permanen?\');" class="btn btn-sm btn-danger" title="Hapus Permanen"><i class="fa fa-remove"></i></a>';
                ?>
                  <tr>
                    <td style="text-align: center"><?php echo $no++ ?></td>
                    <td style="text-align: center"><?php echo date_only($data->tgl_peminjaman) ?></td>
                    <td style="text-align: center"><?php echo date_only($data->tgl_kembali) ?></td>
                    <td style="text-align: left"><?php echo $data->arsip_name ?></td>
                    <td style="text-align: left"><?php echo $data->anggota_name ?></td>
                    <?php if (is_grandadmin()) { ?>
                    <td style="text-align: left"><?php echo $data->instansi_name ?></td>
                    <?php } ?>
                    <td style="text-align: center"><?php echo datetime_indo($data->created_at) ?></td>
                    <td style="text-align: center"><?php echo $restore ?> <?php echo $delete ?></td>
                  </tr>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Tgl Peminjaman</th>
                  <th style="text-align: center">Tgl Pengembalian</th>
                  <th style="text-align: center">Judul Buku</th>
                  <th style="text-align: center">Nama Peminjam</th>
                  <?php if (is_grandadmin()) { ?>
                  <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Created At</th>
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
  $(document).ready( function () {
    $('#dataTable').DataTable();
  } );
  </script>

</div>
<!-- ./wrapper -->

</body>
</html>
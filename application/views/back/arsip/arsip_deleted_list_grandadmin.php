<?php $this->load->view('back/template/meta'); ?>
<div class="wrapper">

  <?php $this->load->view('back/template/navbar'); ?>
  <?php $this->load->view('back/template/sidebar'); ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1><?php echo $page_title ?></h1>
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
        <div class="box-header"> </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table id="dataTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align: center">No. Urut</th>
                  <th style="text-align: center">No / Label Buku</th>
                  <th style="text-align: center">Judul Buku</th>
                  <th style="text-align: center">Perguruan Tinggi</th>
                  <th style="text-align: center">Lokasi</th>
                  <th style="text-align: center">Rak</th>
                  <th style="text-align: center">Baris</th>
                  <th style="text-align: center">Status Peminjaman</th>
                  <th style="text-align: center">Created By</th>
                  <th style="text-align: center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no = 1;
                foreach ($get_all_deleted as $data) {

                  // status peminjaman
                  if ($data->is_available == '0') {
                    $is_available = "<button class='btn btn-xs btn-danger'><i class='fa fa-remove'></i> DIPINJAM</button> ";
                  } elseif ($data->is_available == '1') {
                    $is_available = "<button class='btn btn-xs btn-success'><i class='fa fa-check'></i> TERSEDIA</button>";
                  }

                  $restore  = '<a href="' . base_url('admin/buku/restore/' . $data->id_arsip) . '" class="btn btn-sm btn-primary" title="Restore Buku"><i class="fa fa-refresh"></i></a>';
                  $delete   = '<a href="' . base_url('admin/buku/ajax_delete/' . $data->id_arsip) . '" onClick="return confirm(\'Apakah anda yakin ingin menghapus data secara permanen?\');" class="btn btn-sm btn-danger" title="Hapus Permanen"><i class="fa fa-remove"></i></a>';
                ?>
                  <tr>
                    <td style="text-align: center"><?php echo $no++ ?></td>
                    <td style="text-align: center"><?php echo $data->no_arsip ?></td>
                    <td style="text-align: left"><?php echo $data->arsip_name ?></td>
                    <td style="text-align: center"><?php echo $data->instansi_name ?></td>
                    <td style="text-align: center"><?php echo $data->lokasi_name ?></td>
                    <td style="text-align: center"><?php echo $data->rak_name ?></td>
                    <td style="text-align: center"><?php echo $data->baris_name ?></td>
                    <td style="text-align: center"><?php echo $is_available ?></td>
                    <td style="text-align: center"><?php echo $data->created_by_arsip ?></td>
                    <td style="text-align: center"><?php echo $restore . ' '; echo $delete . ' '; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
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
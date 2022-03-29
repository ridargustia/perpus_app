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
        <div class="box-header"><a href="<?php echo $add_action ?>" class="btn btn-primary"><i class="fa fa-plus"></i> <?php echo $btn_add ?></a> </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table id="dataTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align: center">No. Urut</th>
                  <th style="text-align: center">No / Label Buku</th>
                  <th style="text-align: center">Judul Buku</th>
                  <th style="text-align: center">Lokasi</th>
                  <th style="text-align: center">Rak</th>
                  <th style="text-align: center">Baris</th>
                  <th style="text-align: center">Status Peminjaman</th>
                  <th style="text-align: center">Stok</th>
                  <th style="text-align: center">Created By</th>
                  <th style="text-align: center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no = 1;
                foreach ($get_all as $data) {
                  
                  // status peminjaman
                  if ($data->qty <= 0) {
                    $is_available = "<button class='btn btn-xs btn-danger'><i class='fa fa-remove'></i> DIPINJAM</button> ";
                  } elseif ($data->qty > 0) {
                    $is_available = "<button class='btn btn-xs btn-success'><i class='fa fa-check'></i> TERSEDIA</button>";
                  }
                  
                  $edit   = '<a href="' . base_url('admin/buku/update/' . $data->id_arsip) . '" class="btn btn-sm btn-warning" title="Ubah Buku"><i class="fa fa-pencil"></i></a>';
                  $delete = '<a href="' . base_url('admin/buku/delete/' . $data->id_arsip) . '" onClick="return confirm(\'Apakah anda yakin ingin menghapus data?\');" class="btn btn-sm btn-danger" title="Hapus Buku"><i class="fa fa-trash"></i></a>';                    
                  $detail = '<a href="' . base_url('admin/buku/detail/' . $data->id_arsip) . '" class="btn btn-sm bg-purple" title="Tampilkan Buku"><i class="fa fa-search-plus"></i></a>';
                  $print = '<a href="#" onclick="labelBuku(' . "'" . $data->id_arsip . "'" . ')" class="btn btn-sm btn-info" title="Cetak Label Buku"><i class="fa fa-print"></i></a>';              
                ?>
                  <tr>
                    <td style="text-align: center"><?php echo $no++ ?></td>
                    <td style="text-align: center"><?php echo $data->no_arsip ?></td>
                    <td style="text-align: left"><?php echo $data->arsip_name ?></td>
                    <td style="text-align: center"><?php echo $data->lokasi_name ?></td>
                    <td style="text-align: center"><?php echo $data->rak_name ?></td>
                    <td style="text-align: center"><?php echo $data->baris_name ?></td>
                    <td style="text-align: center"><?php echo $is_available ?></td>
                    <td style="text-align: center"><?php echo $data->qty ?></td>
                    <td style="text-align: center"><?php echo $data->created_by_arsip ?></td>
                    <td style="text-align: center"><?php echo $detail . ' '; echo $edit . ' '; echo $delete . ' '; echo $print; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
      <div class="modal fade" id="ModalLabel" role="dialog" style="min-width: 100%;margin-left:0px">
          <div class="modal-dialog" style="min-width: 90%;">
              <div id="dataLabel"></div>
          </div><!-- /.modal-dialog -->
      </div>
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

    function labelBuku(id) {
        $("#id").val(id);
        $('#ModalLabel').modal("show");
        loadLabel(id);
    }

    function loadLabel(id_arsip) {
        // var url = "buku/ajax_label/" + id + "/";
        $.ajax({
            url: "<?php echo base_url(); ?>admin/buku/ajax_label/" + id_arsip + "",
            type: "GET",
            async: true,
            data: {
                
            },
            success: function (data) {
                $('#dataLabel').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error adding / update data');
            }
        });
    }
  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
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

      <div class="box box-primary">
        <div class="box-header"><a href="<?php echo $add_action ?>" class="btn btn-primary"><i class="fa fa-plus"></i> <?php echo $btn_add ?></a> </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table id="dataTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Nomor Induk</th>
                  <th style="text-align: center">Nama Anggota</th>
                  <th style="text-align: center">Jenis Kelamin</th>
                  <th style="text-align: center">Angkatan</th>
                  <th style="text-align: center">Alamat</th>
                  <?php if (is_grandadmin()) { ?>
                    <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Created By</th>
                  <th style="text-align: center">Action</th>
                </tr>
              </thead>
              <tbody>
                <?php $no = 1; foreach($get_all as $data){
                  // action
                  $edit = '<a href="'.base_url('admin/anggota/update/'.$data->id_anggota).'" class="btn btn-warning" title="Ubah Anggota"><i class="fa fa-pencil"></i></a>';
                  $delete = '<a href="'.base_url('admin/anggota/delete/'.$data->id_anggota).'" onClick="return confirm(\'Apakah anda yakin ingin menghapus data?\');" class="btn btn-danger" title="Hapus Anggota"><i class="fa fa-trash"></i></a>';
                  $print = '<a href="#" onclick="printQrcode(' . "'" . $data->id_anggota . "'" . ')" class="btn btn-info" title="Cetak QR Code Anggota"><i class="fa fa-qrcode"></i></a>';

                  //Gender
                  if ($data->gender == 1) {
                    $gender = "Laki - laki";
                  } elseif ($data->gender == 2) {
                    $gender = "Perempuan";
                  }
                ?>
                  <tr>
                    <td style="text-align: center"><?php echo $no++ ?></td>
                    <td style="text-align: left"><?php echo $data->no_induk ?></td>
                    <td style="text-align: left"><?php echo $data->anggota_name ?></td>
                    <td style="text-align: center"><?php echo $gender ?></td>
                    <td style="text-align: center"><?php echo $data->angkatan ?></td>
                    <td style="text-align: center"><?php echo $data->address ?></td>
                    <?php if (is_grandadmin()) { ?>
                        <td style="text-align: center"><?php echo $data->instansi_name ?></td>
                    <?php } ?>
                    <td style="text-align: center"><?php echo $data->created_by_anggota ?></td>
                    <td style="text-align: center"><?php echo $edit ?> <?php echo $delete ?> <?php echo $print ?></td>
                  </tr>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <th style="text-align: center">No</th>
                  <th style="text-align: center">Nomor Induk</th>
                  <th style="text-align: center">Nama Anggota</th>
                  <th style="text-align: center">Jenis Kelamin</th>
                  <th style="text-align: center">Angkatan</th>
                  <th style="text-align: center">Alamat</th>
                  <?php if (is_grandadmin()) { ?>
                    <th style="text-align: center">Perguruan Tinggi</th>
                  <?php } ?>
                  <th style="text-align: center">Created By</th>
                  <th style="text-align: center">Action</th>
                </tr>
              </tfoot>
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
    $(document).ready( function () {
      $('#dataTable').DataTable();
    } );

    function printQrcode(id) {
        $("#id").val(id);
        $('#ModalLabel').modal("show");
        loadLabel(id);
    }

    function loadLabel(id_anggota) {
        // var url = "buku/ajax_label/" + id + "/";
        $.ajax({
            url: "<?php echo base_url(); ?>admin/anggota/ajax_label/" + id_anggota + "",
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

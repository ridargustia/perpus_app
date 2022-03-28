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
        <div class="box-header with-border">
          <h3 class="box-title">SCAN QR CODE</h3>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-lg-12">
              <div id="sourceSelectPanel" style="display:none">
                  <label for="sourceSelect">Change video source:</label>
                  <select id="sourceSelect" style="max-width:400px"></select>
              </div>
              <div>
                  <video id="video" width="400" height="300" style="border: 1px solid gray"></video>
              </div>
            </div>
            
          </div>
        </div>
        <!-- /.box-body -->
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

  <script type="text/javascript" src="<?php echo base_url()?>assets/plugins/zxing/zxing.min.js"></script>
  <script type="text/javascript">
  window.addEventListener('load', function () {
      let selectedDeviceId;
      let audio = new Audio("assets/audio/beep.mp3");
      const codeReader = new ZXing.BrowserQRCodeReader()
      console.log('ZXing code reader initialized')
      codeReader.getVideoInputDevices()
      .then((videoInputDevices) => {
          const sourceSelect = document.getElementById('sourceSelect')
          selectedDeviceId = videoInputDevices[0].deviceId
          if (videoInputDevices.length >= 1) {
              videoInputDevices.forEach((element) => {
                  const sourceOption = document.createElement('option')
                  sourceOption.text = element.label
                  sourceOption.value = element.deviceId
                  sourceSelect.appendChild(sourceOption)
              })
              sourceSelect.onchange = () => {
                  selectedDeviceId = sourceSelect.value;
              };
              const sourceSelectPanel = document.getElementById('sourceSelectPanel')
              sourceSelectPanel.style.display = 'block'
          }
          codeReader.decodeFromInputVideoDevice(selectedDeviceId, 'video').then((result) => {
              console.log(result)
              document.getElementById('result').textContent = result.text
              if(result != null){
                  audio.play();
              }
              $('#button').submit();
          }).catch((err) => {
              console.error(err)
              document.getElementById('result').textContent = err
          })
          console.log(`Started continous decode from camera with id ${selectedDeviceId}`)
      })
      .catch((err) => {
          console.error(err)
      })
  })
  </script>

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
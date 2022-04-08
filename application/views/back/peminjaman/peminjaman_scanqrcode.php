<?php $this->load->view('back/template/meta'); ?>
<style>
  .btn-md {
      padding: 1rem 2.4rem;
      font-size: .94rem;
      display: none;
  }
</style>
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
      
      <?php
      $attributes = array('id' => 'button'); 
      echo form_open($action, $attributes); 
      ?>
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
              <textarea hidden="" name="id_arsip" id="result" readonly></textarea>
              <span>
                <input type="submit" id="button" class="btn btn-success btn-md" value="Cek Kehadiran">
              </span>
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
      let audio = new Audio("../../assets/audio/beep.mp3");
      // console.log(audio);
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

</div>
<!-- ./wrapper -->

</body>

</html>
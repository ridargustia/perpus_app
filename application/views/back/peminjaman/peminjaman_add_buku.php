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
      <!-- /.box -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">SCAN QR CODE BUKU DISINI</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-lg-12">
              <div id="sourceSelectPanel" style="display:none">
                  <label for="sourceSelect">Change video source: </label>
                  <select id="sourceSelect" style="max-width:400px"></select>
              </div>
              <div>
                  <video id="video" width="350" height="250" style="border: 0px solid gray"></video>
              </div>
              <textarea hidden="" name="id_qrcode" id="result" readonly></textarea>
              <span>
                <input type="submit" id="button" class="btn btn-success btn-md" value="Get Buku/Anggota">
              </span>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
      </div>

      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">DATA BUKU</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <?php if (is_grandadmin()) { ?>
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group"><label>Perguruan Tinggi (*)</label>
                  <?php echo form_dropdown('', $get_all_combobox_instansi, '', $instansi_id) ?>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group"><label>Judul Buku yang Akan Dipinjam</label>
                  <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $arsip_id) ?>
                </div>
              </div>
            </div>

          <?php } elseif (is_masteradmin()) { ?>
            <div class="row">
              <div class="col-lg-12">
                <div class="form-group"><label>Atau Pilih Buku Dari Daftar Berikut</label>
                  <?php echo form_dropdown('', $get_all_combobox_arsip_available, '', $arsip_id) ?>
                </div>
              </div>
            </div>
          <?php } ?>
        </div>
        <div class="box-footer">
          <div class="row">
            <div class="col-sm-8">
              <div class="form-group"><label>Judul Buku</label>
                <?php echo form_input($arsip_name) ?>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>No/Label Buku</label>
                <?php echo form_input($no_arsip) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group"><label>Penulis Buku</label>
                <?php echo form_input($penulis_buku) ?>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Penerbit</label>
                <?php echo form_input($penerbit) ?>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group"><label>Kota Penerbit</label>
                <?php echo form_input($kota_penerbit) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group"><label>Lokasi Buku</label>
                <?php echo form_input($lokasi_name) ?>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Rak</label>
                <?php echo form_input($rak_name) ?>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Baris</label>
                <?php echo form_input($baris_name) ?>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group"><label>Tahun Terbit</label>
                <?php echo form_input($tahun_terbit) ?>
              </div>
            </div>
          </div>
        </div>
      </div>

      <?php echo form_input($id_arsip) ?>
      <!-- /.box -->
      <div class="box box-primary">
        <div class="box-footer">
          <a href="#" onClick="document.location.reload(true)" class="btn btn-info"><i class="fa fa-refresh"></i> Ulangi Scan</a>
          <button type="submit" name="button" class="btn btn-success"><i class="fa fa-share"></i> Selanjutnya</button>
        </div>
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
        let audio = new Audio("<?php echo base_url() ?>assets/audio/beep.mp3");
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
                // console.log(result)
                document.getElementById('result').textContent = result.text
                if(result != null){
                    audio.play();
                }
                // $('#button').submit();
                let string_kode = result.text;
                let id_qrcode = string_kode.split("/");

                if (id_qrcode[1] == 'book') {
                  $.ajax({
                    url: "<?php echo base_url('admin/peminjaman/get_buku/') ?>" + id_qrcode[0],
                    success: function(response) {
                      var myObj = JSON.parse(response);

                      <?php 
                        $this->db->order_by('instansi_name');
                        $data = $this->db->get('instansi');
                    
                        if($data->num_rows() > 0)
                        {
                          foreach($data->result_array() as $row)
                          {
                            $result[''] = '- Silahkan Pilih Perguruan Tinggi -';
                            $result[$row['id_instansi']] = $row['instansi_name'];
                          }
                          $result;
                        }
                      ?>

                      $('#instansi_id').html(<?php echo $result ?>);

                      <?php if (is_grandadmin()) { ?>
                        $.ajax({
                          url: "<?php echo base_url(); ?>admin/buku/form_empty",
                          success: function(response2) {
                            $("#arsip_id").html(response2);
                          },
                          dataType: "html"
                        });
                      <?php } elseif (is_masteradmin()) { ?>
                        tampilArsip();
                      <?php } ?>

                      $('#id_arsip').val(myObj.id_arsip);
                      $('#arsip_name').val(myObj.arsip_name);
                      $('#no_arsip').val(myObj.no_arsip);
                      $('#penulis_buku').val(myObj.penulis_buku);
                      $('#penerbit').val(myObj.penerbit);
                      $('#kota_penerbit').val(myObj.kota_penerbit);
                      $('#lokasi_name').val(myObj.lokasi_name);
                      $('#rak_name').val(myObj.rak_name);
                      $('#baris_name').val(myObj.baris_name);
                      $('#tahun_terbit').val(myObj.tahun_terbit);
                    }
                  });
                } else if (id_qrcode[1] == 'anggota') {
                  
                }
            }).catch((err) => {
                console.error(err)
                document.getElementById('result').textContent = err
            });
            console.log(`Started continous decode from camera with id ${selectedDeviceId}`)
        })
        .catch((err) => {
            console.error(err)
        })
    });

    $(document).ready(function() {
      $("#instansi_id").select2({
        // placeholder: "Silahkan Pilih Instansi",
      });
    });
    $(document).ready(function() {
      $("#arsip_id").select2({
        // placeholder: "Silahkan Pilih Arsip",
      });
    });

    $('#arsip_id').on('change', function() {
      var arsip_id = $(this).val();
      // alert(no_induk);
      $.ajax({
        url: "<?php echo base_url('admin/peminjaman/get_buku/') ?>" + arsip_id,
        success: function(response) {
          var myObj = JSON.parse(response);

          $('#id_arsip').val(myObj.id_arsip);
          $('#arsip_name').val(myObj.arsip_name);
          $('#no_arsip').val(myObj.no_arsip);
          $('#penulis_buku').val(myObj.penulis_buku);
          $('#penerbit').val(myObj.penerbit);
          $('#kota_penerbit').val(myObj.kota_penerbit);
          $('#lokasi_name').val(myObj.lokasi_name);
          $('#rak_name').val(myObj.rak_name);
          $('#baris_name').val(myObj.baris_name);
          $('#tahun_terbit').val(myObj.tahun_terbit);
        }
      });
    });

    function tampilArsip() {
      <?php if (is_grandadmin()) { ?>
        instansi_id = document.getElementById("instansi_id").value;
      <?php } elseif (is_masteradmin()) { ?>
        instansi_id = <?php echo $this->session->instansi_id ?>;
      <?php } ?>

      $.ajax({
        url: "<?php echo base_url(); ?>admin/buku/pilih_arsip_available/" + instansi_id + "",
        success: function(response) {
          $("#arsip_id").html(response);
        },
        dataType: "html"
      });
      return false;
    }

  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
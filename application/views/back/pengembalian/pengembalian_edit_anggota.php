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
      <?php echo validation_errors() ?>
      <?php 
        echo form_open($action);
      ?>
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">SCAN QR CODE ANGGOTA DISINI</h3>
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
          </div><br>
          <?php if (is_grandadmin()) { ?>
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group"><label>Perguruan Tinggi (*)</label>
                  <?php echo form_dropdown('', $get_all_combobox_instansi, '', $instansi_id) ?>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group"><label>No Induk Anggota Peminjam Buku</label>
                  <?php echo form_dropdown('', array('' => '- Pilih Perguruan Tinggi Dulu -'), '', $no_induk) ?>
                </div>
              </div>
            </div>
          <?php } elseif (is_masteradmin()) { ?>
            <div class="row">
              <div class="col-lg-12">
                <div class="form-group"><label>Atau Pilih No Induk Anggota dari Daftar Berikut</label>
                  <?php echo form_dropdown('', $get_all_combobox_anggota, '', $no_induk) ?>
                </div>
              </div>
            </div>
          <?php } ?>
        </div>
        <!-- /.box-body -->
      </div>

      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">DATA PEMINJAMAN</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"><label>No Induk Peminjam</label>
                <?php echo form_input($anggota_id) ?>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"><label>Nama Peminjam</label>
                <?php echo form_input($anggota_name) ?>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="ajax-content" id="showR"></div>
            </div>
          </div>
        </div>
        <div class="box-footer">
          <a href="#" onClick="document.location.reload(true)" class="btn btn-info"><i class="fa fa-refresh"></i> Ulangi Scan</a>
          <a href="<?php echo base_url() ?>admin/pengembalian" class="btn btn-success"><i class="fa fa-check"></i> Selesai</a>
        </div>
      </div>
      <?php echo form_close() ?>
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

  <script type="text/javascript" src="<?php echo base_url()?>assets/plugins/zxing/zxing.min.js"></script>

  <script type="text/javascript">
    window.addEventListener('load', function () {
        <?php if ($this->session->flashdata('anggota_id') || $pengembalian) { 
          if ($this->session->flashdata('anggota_id')) { 
            $id_anggota = $this->session->flashdata('anggota_id'); ?>
            // console.log('Pakai Session');
          <?php } elseif($pengembalian) { 
            $id_anggota = $pengembalian->anggota_id;
            // console.log('Tidak Pakai Session');
          } ?>

          $.ajax({
            url: "<?php echo base_url('admin/pengembalian/get_anggota/'.$id_anggota) ?>",
            success: function(response) {
              var myObj = JSON.parse(response);

              $('#anggota_id').val(myObj.no_induk);
              $('#anggota_name').val(myObj.anggota_name);

              tampilBukuDipinjam(myObj.id_anggota);
            }
          });
        <?php } ?>
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
                  //NOTIFIKASI FAILED
                } else if (id_qrcode[1] == 'anggota') {
                  $.ajax({
                    url: "<?php echo base_url('admin/pengembalian/get_anggota/') ?>" + id_qrcode[0],
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
                          url: "<?php echo base_url(); ?>admin/anggota/form_empty",
                          success: function(response2) {
                            $("#no_induk").html(response2);
                          },
                          dataType: "html"
                        });
                      <?php } elseif (is_masteradmin()) { ?>
                        tampilNoInduk();
                      <?php } ?>
                      
                      $('#anggota_id').val(myObj.no_induk);
                      $('#anggota_name').val(myObj.anggota_name);

                      tampilBukuDipinjam(myObj.id_anggota);
                    }
                  });
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

    $('#no_induk').on('change', function() {
      var no_induk = $(this).val();
      // alert(no_induk);
      $.ajax({
        url: "<?php echo base_url('admin/pengembalian/get_anggota/') ?>" + no_induk,
        success: function(response) {
          var myObj = JSON.parse(response);
          
          $('#anggota_id').val(myObj.no_induk);
          $('#anggota_name').val(myObj.anggota_name);

          tampilBukuDipinjam(myObj.id_anggota);
        }
      });
    });

    function tampilNoInduk() {
      <?php if (is_grandadmin()) { ?>
        instansi_id = document.getElementById("instansi_id").value;
      <?php } elseif (is_masteradmin()) { ?>
        instansi_id = <?php echo $this->session->instansi_id ?>;
      <?php } ?>
      
      $.ajax({
        url: "<?php echo base_url(); ?>admin/anggota/pilih_anggota/" + instansi_id + "",
        success: function(response) {
          $("#no_induk").html(response);
        },
        dataType: "html"
      });
      return false;
    }

    function tampilBukuDipinjam(id) {
      var id_pengembalian = <?php echo $pengembalian->id_pengembalian ?>;
      $.ajax({
          type: 'POST',
          url: "<?php echo base_url(); ?>admin/pengembalian/update_tampil_buku_dipinjam/" + id + "",
          data: `id_pengembalian=${id_pengembalian}`,
          beforeSend: function(msg) {
              $('#showR').html('<center><h1><i class="fa fa-spin fa-spinner" /></h1></center>');
          },
          success: function(msg) {
              $('#showR').html(msg);
              // $('#id_karyawan').focus();
          }
      });
    }

  </script>

</div>
<!-- ./wrapper -->

</body>

</html>
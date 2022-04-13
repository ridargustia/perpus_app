<?php $this->load->view('front/template/meta'); ?>
<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-blue layout-top-nav">
  <div class="wrapper">

    <div class="content-wrapper bg">
      <div class="container">
        
        <!-- Main content -->
        <section class="content">
          <?php $this->load->view('front/template/form_pencarian'); ?>

          <div class="box box-primary box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Hasil Pencarian</h3>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body scrollable-content">
              <?php
              $total_data = count($hasil_pencarian);

              // jika datanya TIDAK ADA
              if ($hasil_pencarian == NULL) {
                //Form cari diisi
                if ($this->input->get('search_form') != NULL) {
                  echo "Tidak ada data yang ditemukan dari pencarian buku dengan keywords: '<b>" . $this->input->get('search_form') . "</b>'";
                }
                //Form cari null 
                elseif ($this->input->get('search_form') == NULL) {
                  echo "Tidak ada data yang ditemukan dari pencarian semua buku";
                }
                 
              }
              // jika datanya ADA
              else {
                 //Form cari diisi
                 if ($this->input->get('search_form') != NULL) {
                  echo "
                    Ada <b>" . $total_data . " data</b> dengan <b>" . $total_eksemplar . " eksemplar buku</b> ditemukan dari pencarian buku dengan keywords: '<b>" . $this->input->get('search_form') . "</b>'";
                }
                //Form cari null 
                elseif ($this->input->get('search_form') == NULL) {
                  echo "
                    Ada <b>" . $total_data . " data</b> dengan<b> " . $total_eksemplar . " eksemplar buku</b> ditemukan dari pencarian semua buku";
                }
              }
              ?>

              <hr>

              <ul class="products-list product-list-in-box">
                <?php
                foreach ($hasil_pencarian as $hasil) {
                  $search_form = $this->input->get('search_form');

                  $arsip_name = !empty($search_form) ? highlightWords($hasil->arsip_name, $search_form) : $hasil->arsip_name;
                  $deskripsi_arsip = !empty($search_form) ? highlightWords($hasil->deskripsi_arsip, $search_form) : $hasil->deskripsi_arsip;

                  // status peminjaman
                  if ($hasil->qty <= 0) {
                    $is_available = "<button type='button' name='button' class='btn btn-xs btn-danger'>DIPINJAM</button> ";
                  } elseif ($hasil->qty > 0) {
                    $is_available = "<button type='button' name='button' class='btn btn-xs btn-success'>TERSEDIA " . $hasil->qty . " BUKU</button>";
                  }
                ?>
                  <li class="item">
                    <div class="product-img">
                      <?php if ($hasil->cover_buku_thumb != NULL) { ?>
                      <a href="#" onclick="previewCover(<?php echo $hasil->id_arsip ?>)" title="Preview Cover">
                        <img src="<?php echo base_url('assets/images/cover_buku/'.$hasil->cover_buku_thumb) ?>" style="height: 90px; width:70px;">
                      </a>
                      <?php } else { ?>
                      <img src="<?php echo base_url('assets/images/noimage.jpg') ?>" style="height: 90px; width:70px;">
                      <?php } ?>
                    </div>
                    <div class="product-info">
                      <a class="product-title" style="margin-left:15px">
                        <font style="font-size: 23px"><?php echo $arsip_name ?></font>
                      </a>
                      <p style="margin-left:25px">
                        <?php if ($hasil->deskripsi_arsip != NULL) {
                          echo '<font style="font-size: 15px">' . $deskripsi_arsip . '</font>';
                        } else {
                          echo "Belum ada deskripsi";
                        } ?>
                      </p>
                    </div>
                  </li>
                  <br>
                  <div class="row">
                    <div class="col-sm-8 text-left">
                      Lokasi | <b><?php echo $hasil->lokasi_name . '</b> > <b>Rak ' . $hasil->rak_name . '</b> > <b>Baris ' . $hasil->baris_name . '</b> > <b>Label ' . $hasil->no_arsip . '</b>' ?>
                      <?php echo $is_available ?>
                    </div>
                    <div class="col-sm-4 text-right">
                      <a href="<?php echo base_url('book/detail/' . $hasil->id_arsip . '/' . $search_form) ?>" class="btn btn-sm btn-success"><i class="fa fa-search"></i> PREVIEW</a>
                    </div>
                  </div>
                  <hr>
                <?php } ?>
              </ul>
            </div>
          </div>
          <!-- /.box -->
          <div class="modal fade" id="ModalPreview" role="dialog" style="min-width: 100%;margin-left:0px">
              <div class="modal-dialog" style="min-width: 100%;">
                  <div id="dataPreview"></div>
              </div><!-- /.modal-dialog -->
          </div>
        </section>
        <!-- /.content -->
      </div>
      <!-- /.container -->
    </div>
    <!-- /.content-wrapper -->

    <?php $this->load->view('front/template/footer'); ?>

    <script>
      function previewCover(id) {
        $("#id").val(id);
        $('#ModalPreview').modal("show");
        loadPreview(id);
      }

      function loadPreview(id_arsip) {
        // var url = "buku/ajax_label/" + id + "/";
        $.ajax({
            url: "<?php echo base_url(); ?>book/ajax_preview_cover/" + id_arsip + "",
            type: "GET",
            async: true,
            data: {
                
            },
            success: function (data) {
                $('#dataPreview').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error adding / update data');
            }
        });
      }
    </script>

</body>

</html>
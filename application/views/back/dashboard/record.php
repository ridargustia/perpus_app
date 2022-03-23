<!-- Small boxes (Stat box) -->
<div class="row">
  <div class="col-lg-4 col-sm-4 col-xs-12">
    <div class="small-box bg-aqua">
      <div class="inner">
        <h3><?php echo $get_total_peminjaman ?></h3>
        <p>Peminjaman</p>
      </div>
      <div class="icon"><i class="fa fa-edit"></i></div>
      <a href="<?php echo base_url('admin/peminjaman/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-4 col-sm-4 col-xs-12">
    <div class="small-box bg-blue">
      <div class="inner">
        <h3><?php echo $get_total_pengembalian ?></h3>
        <p>Pengembalian</p>
      </div>
      <div class="icon"><i class="fa fa-edit"></i></div>
      <a href="<?php echo base_url('admin/pengembalian/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-4 col-sm-4 col-xs-12">
    <div class="small-box bg-maroon">
      <div class="inner">
        <h3><?php echo $get_total_arsip ?></h3>
        <p>Buku</p>
      </div>
      <div class="icon"><i class="fa fa-book"></i></div>
      <a href="<?php echo base_url('admin/buku/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
</div>

<?php if(!is_pegawai()){ ?>
<div class="row">
  <div class="col-lg-4 col-xs-6">
    <div class="small-box bg-green">
      <div class="inner">
        <h3><?php echo $get_total_lokasi ?></h3>
        <p>Lokasi</p>
      </div>
      <div class="icon"><i class="fa fa-map-marker"></i></div>
      <a href="<?php echo base_url('admin/lokasi/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-4 col-xs-6">
    <div class="small-box bg-green">
      <div class="inner">
        <h3><?php echo $get_total_rak ?></h3>
        <p>Rak</p>
      </div>
      <div class="icon"><i class="fa fa-building"></i></div>
      <a href="<?php echo base_url('admin/rak/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-4 col-xs-6">
    <div class="small-box bg-green">
      <div class="inner">
        <h3><?php echo $get_total_baris ?></h3>
        <p>Baris</p>
      </div>
      <div class="icon"><i class="fa fa-server"></i></div>
      <a href="<?php echo base_url('admin/baris/index') ?>" class="small-box-footer">Selengkapnya <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
</div>
<?php } ?>

<!-- /.row -->

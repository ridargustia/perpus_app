<div class="row">

  <div class="col-lg-12">
    <?php echo form_open('book/cari_book', array("method" => "get")) ?>
  </div>

  <div class="col-lg-12">
    <div class="box box-success box-solid">
      <div class="box-header with-border">
        <h3 class="box-title">Cari Buku</h3>
        <!-- /.box-tools -->
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="input-group">
          <input type="text" name="search_form" placeholder="Isikan Keywords ..." class="form-control">
          <span class="input-group-btn">
            <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-search"></i> Cari Buku</button>
          </span>
        </div>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
    <?php echo form_close() ?>
  </div>
</div>
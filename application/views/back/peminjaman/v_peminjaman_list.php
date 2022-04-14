<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Judul Buku</th>
                <th scope="col">Tgl Pinjam</th>
                <th scope="col">Maks Dikembalikan</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $no = 1;
            foreach($buku_dipinjam as $data) { 
            ?>
            <tr>
                <th scope="row"><?php echo $no++ ?></th>
                <td><?php echo $data->arsip_name ?></td>
                <td><?php echo $data->tgl_peminjaman ?></td>
                <td><?php echo $data->tgl_kembali ?></td>
                <td><a href="#" class="btn btn-sm btn-info"><i class="fa fa-refresh"></i></a></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
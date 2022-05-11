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
            <?php if (!$buku_dipinjam) { ?>
                <tr>
                    <td colspan='5' style='text-align: center;'>Tidak ada buku yang dipinjam</td>
                </tr>
            <?php } ?>
            <?php 
            $no = 1;
            foreach($buku_dipinjam as $data) {
                $kembalikan = '<a href="'.base_url('admin/pengembalian/update_verifikasi_buku/'.$pengembalian->id_pengembalian.'/'. $data->id_peminjaman).'" class="btn btn-sm btn-info" title="Kembalikan Buku"><i class="fa fa-refresh"></i></a>'; 
            ?>
            <tr>
                <th scope="row"><?php echo $no++ ?></th>
                <td><?php echo $data->arsip_name ?></td>
                <td><?php echo $data->tgl_peminjaman ?></td>
                <td><?php echo $data->tgl_kembali ?></td>
                <td><?php echo $kembalikan ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
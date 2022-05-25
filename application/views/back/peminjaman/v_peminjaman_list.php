<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col" style="width:450px">Judul Buku</th>
                <th scope="col" style="width:90px">Tgl Pinjam</th>
                <th scope="col" style="width:140px">Maks Dikembalikan</th>
                <th scope="col" style="width:150px">Status Pengembalian</th>
                <th scope="col">Denda</th>
                <th scope="col" style="width:60px">Aksi</th>
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
                $kembalikan = '<a href="'.base_url('admin/pengembalian/verifikasi_buku/'.$data->id_peminjaman).'" class="btn btn-sm btn-info" title="Kembalikan Buku"><i class="fa fa-refresh"></i></a>'; 

                $tgl_kembali = new DateTime($data->tgl_kembali);
                $today = new DateTime(date('Y-m-d'));
                
                if ($tgl_kembali >= $today) {
                    $status = '<span class="btn btn-sm btn-success">Tepat Waktu</span>';
                    $denda = 'Rp. 0,-';
                } elseif($tgl_kembali < $today) {
                    $selisih_hari = $today->diff($tgl_kembali);

                    $status = '<span class="btn btn-sm btn-danger">Terlambat '.$selisih_hari->d.' hari</span>';

                    $subtotal_denda = 2500*$selisih_hari->d;

                    $denda = 'Rp. '.$subtotal_denda.',-';
                }
            ?>
            <tr>
                <th scope="row"><?php echo $no++ ?></th>
                <td><?php echo $data->arsip_name ?></td>
                <td><?php echo $data->tgl_peminjaman ?></td>
                <td><?php echo $data->tgl_kembali ?></td>
                <td><?php echo $status ?></td>
                <td><?php echo $denda ?></td>
                <td><?php echo $kembalikan ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
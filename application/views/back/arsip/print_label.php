<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Label Buku | EduArsip</title>
    <style type="text/css">
        .box {
            font-family: sans-serif;
            color: #232323;
            border-collapse: collapse;
            border: 1px solid #999;
            width: 151.2px;
            height: 113.4px;
            font-size: 10px;
        }
        thead {
            border: 1px solid #999;
        }
        tbody {
            text-align: center;
        }
        th {
            height: 15px;
        }
        /* td {
            border: 1px solid #999;
        } */
    </style>
    <link rel="shortcut icon" href="<?php echo base_url('assets/images/company/'.$company_data->company_photo_thumb) ?>" />
</head>
<body>
    <table class="box">
        <thead>
            <tr>
                <th colspan="3">PERPUSTAKAAN</th>
            </tr>
            <tr>
                <th colspan="3"><?php echo $buku->instansi_name ?></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="4" style="width:30px"></td>
                <td style="width:55px"><?php echo $label_buku[0] ?></td>
                <td rowspan="4"><img src="<?php echo base_url('admin/buku/render_qrcode/'.$buku->id_arsip) ?>" alt=""></td>
            </tr>
            <tr>
                <td><?php echo $label_buku[1] ?></td>
            </tr>
            <tr>
                <td><?php echo $label_buku[2] ?></td>
            </tr>
            <tr>
                <td><?php echo $label_buku[3] ?></td>
            </tr>
            
        </tbody>
    </table>
    <script type="text/javascript">
        window.print();
    </script>
    
</body>
</html>
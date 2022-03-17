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
            width: 300px;
            height: 230px;
        }
        thead {
            border: 1px solid #999;
        }
        tbody {
            text-align: center;
        }
        th {
            height: 30px;
        }
        
    </style>
    <link rel="shortcut icon" href="<?php echo base_url('assets/images/company/'.$company_data->company_photo_thumb) ?>" />
</head>
<body>
    <table class="box">
        <thead>
            <tr>
                <th>PERPUSTAKAAN</th>
            </tr>
            <tr>
                <th><?php echo $buku->instansi_name ?></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $label_buku[0] ?></td>
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
<style>
    .modal {
        overflow: auto !important;
    }

    /* @media print {
        .tr {
            -webkit-print-color-adjust: exact !important;
        }
    } */

    /* table,
    th,
    td,
    tr {
        text-align: center;
    } */

    .label-style {
        
    }

    thead {
        
        
    }
    tbody {
        
    }
    th {
        
    }
</style>
<?php
// $segment = $this->uri->segment(3);
// $kar = $this->kar->get_by_id($segment);
// $gedung = $this->gedung->get_by_id($segment);
// $gedung = $this->gedung->get_by_id($segment = $this->uri->segment(3)); 
?>

<div class="box" style='max-width:50%;margin-left:27%;'>
    <div class="box-header with-border">
        <h3 class="box-title">Preview Label Buku</h3>
        <button onclick="printDiv('print-area')" class='pull-right'><i class='fa fa-print'></i> Print</button>
    </div>
    <div class="box-body">
        <div class="modal-content" style="min-width: 100px;">
            
            <div class="modal-header" style='text-align:center'>
                <center>
                <span id="print-area">
                    <table style="color: #232323;border-collapse: collapse;width: 226.8px;height: 113.4px;font-size: 10px;border: 1px solid #999;font-family: sans-serif;">
                        <thead style="border: 1px solid #999;">
                            <tr>
                                <th colspan="3" style="height: 15px;text-align: center;">PERPUSTAKAAN</th>
                            </tr>
                            <tr>
                                <th colspan="3" style="height: 15px;text-align: center;"><?php echo $buku->instansi_name ?></th>
                            </tr>
                        </thead>
                        <tbody style="text-align: center;">
                            <tr>
                                <td rowspan="4" style="width:70px"></td>
                                <td style="width:75px"><?php echo $label_buku[0] ?></td>
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
                </span>
                </center>
            </div>
            
            <div class="modal-body" id="dataLaporan" style='margin-top:10px'></div>
        </div><!-- /.modal-content -->
        <div class="modal-footer">
            <button type="button" class="btn btn-primary btn3d" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
<!-- <script src="<?php //echo base_url() ?>assets/app/core/ModalLaporan.js" charset="utf-8"></script> -->
<!-- <script src="<?php //echo base_url() ?>assets/app/core/print.js" charset="utf-8"></script> -->
<script type="text/javascript">
    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        // console.log(printContents);
        setTimeout(function () {
            window.print();
            document.body.innerHTML = originalContents;
            location.reload(true);
        }, 1000);
        // document.body.innerHTML = originalContents;
        // location.reload(true);
        // setTimeout(function () {
        // }, 1000);
    }

</script>

<!-- <!DOCTYPE html>
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
            width: 226.8px;
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
    <link rel="shortcut icon" href="<?php //echo base_url('assets/images/company/'.$company_data->company_photo_thumb) ?>" />
</head>
<body>
    <table class="box">
        <thead>
            <tr>
                <th colspan="3">PERPUSTAKAAN</th>
            </tr>
            <tr>
                <th colspan="3"><?php //echo $buku->instansi_name ?></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="4" style="width:70px"></td>
                <td style="width:75px"><?php //echo //$label_buku[0] ?></td>
                <td rowspan="4"><img src="<?php //echo //base_url('admin/buku/render_qrcode/'.$buku->id_arsip) ?>" alt=""></td>
            </tr>
            <tr>
                <td><?php //echo //$label_buku[1] ?></td>
            </tr>
            <tr>
                <td><?php //echo //$label_buku[2] ?></td>
            </tr>
            <tr>
                <td><?php //echo //$label_buku[3] ?></td>
            </tr>
            
        </tbody>
    </table>
    <script type="text/javascript">
        window.print();
    </script>
    
</body>
</html> -->

<style>
    .modal {
        overflow: auto !important;
    }
</style>

<div class="box" style='max-width:50%;margin-left:27%;'>
    <div class="box-header with-border">
        <h3 class="box-title">Preview QR Code Anggota</h3>
        <button onclick="printDiv('print-area')" class='pull-right'><i class='fa fa-print'></i> Print</button>
    </div>
    <div class="box-body">
        <div class="modal-content" style="min-width: 100px;">
            <div class="modal-header" style='text-align:center'>
                <center>
                <span id="print-area">
                    <img src="<?php echo base_url('admin/anggota/render_qrcode/'.$anggota->id_anggota) ?>" alt="">
                </span>
                </center>
            </div>
        </div><!-- /.modal-content -->
        <div class="modal-footer">
            <button type="button" class="btn btn-primary btn3d" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
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
    }

</script>
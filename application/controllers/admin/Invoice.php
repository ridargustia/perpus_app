<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Invoice extends CI_Controller {


	public function index()
	{
		require FCPATH . '/vendor/autoload.php';
		require FCPATH . '/vendor/setasign/fpdf/fpdf.php';

		$pdf = new FPDF('P','mm','A4');
        $pdf->AddPage();
       
        $pdf->SetFont('Arial','B',14);
        $pdf->Cell(130 ,5,'TOKO ABC',0,0);
        $pdf->Cell(59 ,5,'INVOICE',0,1);

        $pdf->SetFont('Arial','',12);
        $pdf->Cell(130 ,5,'JL. Selalu Bahagia',0,0);
		$pdf->Cell(25 ,5,'Date',0,0);
		$pdf->Cell(34 ,5,'01 Januari 2020',0,1);//end of line

		$pdf->Cell(130 ,5,'Jakarta, Indonesia, 32122',0,0);
		$pdf->Cell(25 ,5,'Invoice #',0,0);
		$pdf->Cell(34 ,5,'1234567',0,1);//end of line

		$pdf->Cell(130 ,5,'Phone 021121212',0,0);
		$pdf->Cell(59 ,5,'',0,1);

		//make a dummy empty cell as a vertical spacer
		$pdf->Cell(189 ,10,'',0,1);//end of line

		//billing address
		$pdf->Cell(100 ,5,'Tagihan ke',0,1);//end of line

		//add dummy cell at beginning of each line for indentation
		$pdf->Cell(10 ,5,'',0,0);
		$pdf->Cell(90 ,5,'Tejo',0,1);

		$pdf->Cell(10 ,5,'',0,0);
		$pdf->Cell(90 ,5,'JL. Tidak Lupa Bahagia',0,1);

		$pdf->Cell(10 ,5,'',0,0);
		$pdf->Cell(90 ,5,'Desa A, Kecamatan B, Kab. C' ,0,1);

		$pdf->Cell(10 ,5,'',0,0);
		$pdf->Cell(90 ,5,'08888888888',0,1);

		$pdf->Cell(10 ,5,'',0,0);
		$pdf->Cell(90 ,5,'email@example.com',0,1);

		$pdf->Cell(189 ,10,'',0,1);//end of line

		//invoice contents
		$pdf->SetFont('Arial','B',12);
		$pdf->Cell(100 ,5,'Produk',1,0);
		$pdf->Cell(30 ,5,'Harga',1,0);
		$pdf->Cell(25 ,5,'Qty',1,0);
		$pdf->Cell(34 ,5,'Jumlah',1,1);//end of line

		$pdf->SetFont('Arial','',12);

		$pdf->Cell(100 ,5,'Produk A',1,0);
		$pdf->Cell(30 ,5,'Rp 100.000',1,0);
		$pdf->Cell(25 ,5,2,1,0);
		$pdf->Cell(34 ,5,'Rp 200.000',1,1,'R');

		$pdf->Cell(100 ,5,'Produk B',1,0);
		$pdf->Cell(30 ,5,'Rp 100.000',1,0);
		$pdf->Cell(25 ,5,3,1,0);
		$pdf->Cell(34 ,5,'Rp 300.000',1,1,'R');


		$pdf->Cell(100 ,5,'',0,0);
		$pdf->Cell(55 ,5,'Subtotal',0,0);
		$pdf->Cell(34 ,5,'Rp 500.000',1,1,'R');//end of line

		$pdf->Cell(100 ,5,'',0,0);
		$pdf->Cell(55 ,5,'Biaya Pengiriman',0,0);
		$pdf->Cell(34 ,5,'Rp 10.000',1,1,'R');//end of line

		$pdf->Cell(100 ,5,'',0,0);
		$pdf->Cell(55 ,5,'Total',0,0);
		$pdf->Cell(34 ,5,'Rp 510.000',1,1,'R');//end of line

		$pdf->Cell(100 ,5,'',0,0);
		$pdf->Cell(55 ,5,'PPN',0,0);
		$pdf->Cell(34 ,5,'Rp 5.100',1,1,'R');//end of line

		$pdf->Cell(100 ,5,'',0,0);
		$pdf->Cell(55 ,5,'Grandtotal',0,0);
		$pdf->Cell(34 ,5,'Rp 515.100',1,1,'R');//end of line


        $pdf->Output();
		
	}

}
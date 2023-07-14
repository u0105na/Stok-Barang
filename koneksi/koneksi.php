<?php
$base_http = 'http://localhost/e-Barang/';
$root = 'http://localhost/e-Barang/';
error_reporting(0);
	
$konek = mysqli_connect("sql206.infinityfree.com", "if0_34603984", "jemEtAmpKguHlZ2", "if0_34603984_dbbarang");
	
if(mysqli_connect_errno()){
	printf ("Gagal terkoneksi : ".mysqli_connect_error());
	exit();
}
	
?>
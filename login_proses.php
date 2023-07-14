<?php

session_start();
include "koneksi/koneksi.php";

	$user_email = $_POST["username"];
	$user_password = md5($_POST["password"]);

	$query = mysqli_query ($konek, "SELECT * FROM users WHERE username='$user_email' AND `password`='$user_password'");
	// Validasi Login member/admin
	$val = mysqli_num_rows($query);

	if ($val > 0){
		
		$data = mysqli_fetch_assoc($query);
		$_SESSION['username'] = $user_email;
		$_SESSION['user_id'] 	= $data['id'];
		$_SESSION['user_level'] = $data['role'];

		header("location: admin/?pesan=success");
		
	} else {
		header("location: login?pesan=gagal");
	}

?>
<?php

include 'conn.php';

$cctv_id = $_POST['cctv_id'];

$queryResult = $connect->query("SELECT * FROM cctv_links WHERE cctv_id='".$cctv_id."' ");

$result = array();

// Cek apakah ada pengguna dengan username dan password yang cocok
if ($queryResult->num_rows > 0) {
    // Ambil data pengguna
    $userData = $queryResult->fetch_assoc();
    // Buat respons sukses dengan data pengguna
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "cctvLinks" => $userData
    );
} else {
    // Buat respons gagal jika akun tidak ditemukan
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
        "cctvLinks" => null,
    );
}

// Mengembalikan respons dalam bentuk JSON
echo json_encode($response);

?>
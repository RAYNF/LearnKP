<?php

include 'conn.php';

$name = $_POST['name'];


$queryResult = $connect->query("SELECT * FROM kecamatan WHERE name='".$name."' ");

$result = array();

// Cek apakah ada pengguna dengan username dan password yang cocok
if ($queryResult->num_rows > 0) {
    // Ambil data pengguna
    $userData = $queryResult->fetch_assoc();
    // Buat respons sukses dengan data pengguna
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "kecamatan" => $userData
    );
} else {
    // Buat respons gagal jika akun tidak ditemukan
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
    );
}

// Mengembalikan respons dalam bentuk JSON
echo json_encode($response);

?>
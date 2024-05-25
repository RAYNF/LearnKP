<?php

include 'conn.php';

$kecamatan_id = $_POST['kecamatan_id'];

$queryResult = $connect->query("SELECT * FROM kelurahans WHERE kecamatan_id='".$kecamatan_id."' ");

$result = array();

// Cek apakah ada pengguna dengan username dan password yang cocok
if ($queryResult->num_rows > 0) {
     // Ambil semua data dan masukkan ke dalam array
     while ($row = $queryResult->fetch_assoc()) {
        $result[] = $row;
    }


    // Buat respons sukses dengan data pengguna
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "kelurahan" => $result
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
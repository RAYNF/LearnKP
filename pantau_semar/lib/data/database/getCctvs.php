<?php

include 'conn.php';

$kelurahan_id = $_POST['kelurahan_id'];
$cctv_categories_id = $_POST['cctv_categories_id'];

$queryResult = $connect->query("SELECT * FROM cctvs WHERE kelurahan_id ='".$kelurahan_id."' AND cctv_categories_id ='".$cctv_categories_id."' ");

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
        "CctvsName" => $result
    );
} else {
    // Buat respons gagal jika akun tidak ditemukan
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
        "CctvsName" => $result
    );
}

// Mengembalikan respons dalam bentuk JSON
echo json_encode($response);

?>
<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult = $connect->query("SELECT * FROM users WHERE username='".$username."' and password='".$password."'");

$result = array();

// //jadinya json aray 
// while ($fetchData = $queryResult->fetch_assoc()) {
//     $result[]= $fetchData;
// }

// echo json_encode($result);

// Cek apakah ada pengguna dengan username dan password yang cocok
if ($queryResult->num_rows > 0) {
    // Ambil data pengguna
    $userData = $queryResult->fetch_assoc();
    // Buat respons sukses dengan data pengguna
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "data" => $userData
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
<?php

include 'conn.php';

$id = '';
$users_id = $_POST['users_id'];
$judul = $_POST['judul'];
$tanggal = date('Y-m-d H:i:s');;
$description = $_POST['description'];
$urlImage = $_POST['urlImage'];

$queryResult = $connect->query("INSERT INTO berita VALUES ('$id','$users_id','$judul','$tanggal','$description','$urlImage')");

if ($queryResult == true) {
    $response = array("succes" => true,"message" => "berita berhasil ditambahkan");
}else{
    $response = array("succes"=> false,"message" => "gagal menambahkan berita: " .$connect->error);
}

echo json_encode($response);

?>
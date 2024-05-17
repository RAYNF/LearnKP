<?php

include 'conn.php';

$id = $_POST['id'];
$users_id = $_POST['users_id'];
$judul = $_POST['judul'];
$tanggal = date('Y-m-d H:i:s');;
$description = $_POST['description'];
$urlImage = $_POST['urlImage'];

$queryResult = $connect->query("UPDATE berita SET judul ='$judul', description = '$description', urlImage = '$urlImage' , tanggal = '$tanggal' WHERE  id= '$id'");

if ($queryResult == true) {
    $response = array("succes" => true,"message" => "berita berhasil diUpdate");
}else{
    $response = array("succes"=> false,"message" => "gagal mengupdate berita: " .$connect->error);
}

echo json_encode($response);

?>
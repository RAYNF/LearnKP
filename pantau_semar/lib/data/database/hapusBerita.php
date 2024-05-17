<?php

include 'conn.php';

$id = $_POST['id'];

$queryResult = $connect->query("DELETE FROM berita WHERE  id= '$id'");

if ($queryResult == true) {
    $response = array("succes" => true,"message" => "berhasi dihapus");
}else{
    $response = array("succes"=> false,"message" => "gagal menghapus berita: " .$connect->error);
}

echo json_encode($response);

?>
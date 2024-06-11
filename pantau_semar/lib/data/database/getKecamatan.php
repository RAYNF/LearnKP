<?php

include 'conn.php';

$name = $_POST['name'];


$queryResult = $connect->query("SELECT * FROM kecamatan WHERE name='".$name."' ");

$result = array();
if ($queryResult->num_rows > 0) {
    $userData = $queryResult->fetch_assoc();
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "kecamatan" => $userData
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
    );
}

echo json_encode($response);

?>
<?php

include 'conn.php';

$cctv_id = $_POST['cctv_id'];

$queryResult = $connect->query("SELECT * FROM cctv_links WHERE cctv_id='".$cctv_id."' ");

$result = array();

if ($queryResult->num_rows > 0) {
    $userData = $queryResult->fetch_assoc();
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "cctvLinks" => $userData
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
        "cctvLinks" => null,
    );
}

echo json_encode($response);

?>
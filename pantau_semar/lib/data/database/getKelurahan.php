<?php

include 'conn.php';

$kecamatan_id = $_POST['kecamatan_id'];

$queryResult = $connect->query("SELECT * FROM kelurahans WHERE kecamatan_id='".$kecamatan_id."' ");

$result = array();
if ($queryResult->num_rows > 0) {
     while ($row = $queryResult->fetch_assoc()) {
        $result[] = $row;
    }

    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "kelurahan" => $result
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
    );
}

echo json_encode($response);

?>
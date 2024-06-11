<?php

include 'conn.php';

$kelurahan_id = $_POST['kelurahan_id'];
$cctv_categories_id = $_POST['cctv_categories_id'];

$queryResult = $connect->query("SELECT * FROM cctvs WHERE kelurahan_id ='".$kelurahan_id."' AND cctv_categories_id ='".$cctv_categories_id."' ");
$result = array();
if ($queryResult->num_rows > 0) {
     while ($row = $queryResult->fetch_assoc()) {
        $result[] = $row;
    }
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "CctvsName" => $result
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
        "CctvsName" => $result
    );
}

echo json_encode($response);

?>
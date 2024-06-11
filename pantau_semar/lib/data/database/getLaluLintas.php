<?php

include 'conn.php';

$cctv_categories_id = $_POST['cctv_categories_id'];

$queryResult = $connect->query("SELECT * FROM cctvs WHERE cctv_categories_id='".$cctv_categories_id."' ");

$result = array();
if ($queryResult->num_rows > 0) {
     while ($row = $queryResult->fetch_assoc()) {
        $result[] = $row;
    }
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "Lalu Lintas" => $result
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
    );
}
echo json_encode($response);

?>
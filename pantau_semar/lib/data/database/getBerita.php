<?php 
include 'conn.php';

$queryResult = $connect->query("SELECT * FROM berita");

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

$response = array("success" => true, "message" => "berita berhasil.", "berita" => $result);
echo json_encode($response);

?>
<?php

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult = $connect->query("SELECT * FROM users WHERE username='".$username."' and password='".$password."'");

$result = array();
if ($queryResult->num_rows > 0) {
    $userData = $queryResult->fetch_assoc();
    $response = array(
        "success" => true,
        "message" => "Akun ditemukan.",
        "data" => $userData
    );
} else {
    $response = array(
        "success" => false,
        "message" => "Akun tidak ditemukan.",
    );
}
echo json_encode($response);

?>
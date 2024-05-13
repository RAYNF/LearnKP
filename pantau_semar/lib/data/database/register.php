<?php
    include 'conn.php';

    $id = '';
    $email = $_POST['email'];
    $password = $_POST['password'];
    $username = $_POST['username'];
    $phone_number = $_POST['phone_number'];
    $level = 'member';

    $queryResult = $connect->query("INSERT INTO users VALUES ('$id','$email','$password','$username','$phone_number','$level')");

    if ($queryResult == true) {
        $response = array("succes" => true,"message" => "akun berhsail ditambahkan");
    }else{
        $response = array("succes"=> false,"message" => "gagal menambahkan akun: " .$connect->error);
    }

    echo json_encode($response);
?>
<?php

    include('connect.php');
    
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $email = $_POST["email"];
    $password = $_POST["password"];


    if($fname=="" && $lname=="" &&$email=="" && $password=="")
    {
        echo '0';
    }
    else
    {
        $sql ="insert into signup(fname,lname,email,password) values ('$fname','$lname','$email','$password')";
        mysqli_query($con,$sql);
        
    }

?>
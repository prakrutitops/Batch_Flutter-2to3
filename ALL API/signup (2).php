<?php

    include('connect.php');
    
    $uname = $_POST["username"];
    $pass = $_POST["password"];
    $mobile = $_POST["mobileno"];
    $identifier = $_POST["identifier"];


    if($uname=="" && $pass=="" &&$mobile=="" && $identifier=="")
    {
        echo '0';
    }
    else
    {
        $sql ="insert into project_signup (username,password,mobileno,identifier) values ('$uname','$pass','$mobile','$identifier')";
        mysqli_query($con,$sql);
        
    }

?>
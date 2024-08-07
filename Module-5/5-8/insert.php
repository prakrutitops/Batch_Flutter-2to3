<?php

    include('connect.php');
    
    $pname = $_POST["pname"];
    $pprice = $_POST["pprice"];
    $pdes = $_POST["pdes"];
   


    if($pname=="" && $pprice=="" &&$pdes=="")
    {
        echo '0';
    }
    else
    {
        $sql ="insert into product(pname,pprice,pdes) values ('$pname','$pprice','$pdes')";
        mysqli_query($con,$sql);
        
    }

?>
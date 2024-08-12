<?php
    include('connect.php');
 
    $id = $_POST['id'];
    $pname = $_POST['pname'];
    $pprice = $_POST['pprice'];
    $pdes = $_POST['pdes'];
    

    $result = "UPDATE product SET pname = '$pname',pprice = '$pprice',pdes = '$pdes' WHERE id= '$id'";

    if(mysqli_query($con,$result))
    {
        echo 'Record Updated Successfully';
    }
    else
    {
        echo 'Something went wrong';
    }
    
?>
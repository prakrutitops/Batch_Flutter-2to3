<?php
    include('connect.php');
 
    $id = $_POST['id'];

    

    $result = "DELETE from product WHERE id= '$id'";

    if(mysqli_query($con,$result))
    {
        echo 'Record Deleted Successfully';
    }
    else
    {
        echo 'Something went wrong';
    }
    
?>
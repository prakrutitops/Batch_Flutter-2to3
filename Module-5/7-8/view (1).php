<?php
    
    include('connect.php');
    
    $sql="select * from product";
    
    $r = mysqli_query($con,$sql);
    $response = array();
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["pname"]=$row["pname"];
        $value["pprice"]=$row["pprice"];
        $value["pdes"]=$row["pdes"];
        
        array_push($response,$value);
       
    }
     echo json_encode($response);
     mysqli_close($con);


?>
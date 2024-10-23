<?php
    include('connect.php');

    $cid=$_REQUEST["data"];

    $select="SELECT * from project_Category_images where c_id='$cid'";

    $result=mysqli_query($con,$select);

    $response= array();

    while ($row = mysqli_fetch_array($result))
    {
        $value = array();
        $value["id"] = $row["id"];
        $value["c_id"] = $row["c_id"];
        $value["c_images"] = $row["c_images"];

        array_push($response, $value);
    }
    echo json_encode($response);
?>

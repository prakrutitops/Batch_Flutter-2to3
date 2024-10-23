<?php
    include('connect.php');

    $ID = $_POST['data'];

    $delete1 = "DELETE FROM project_Category_images WHERE c_id = '$ID'";
    mysqli_query($con,$delete1);
?>

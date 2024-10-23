<?php
    include('connect.php');

    $ID = $_POST['data'];

    $delete = "DELETE FROM project_category WHERE id = '$ID'";
    mysqli_query($con,$delete);
?>

<?php

    include 'connect.php';

    $upload_path = 'images/';

    $upload_url = 'https://'.$_SERVER['SERVER_NAME'] . "/Project_API/" . $upload_path;

    $name = $_REQUEST['name'];
    $id = $_REQUEST['id'];

    $fileinfo = pathinfo($_FILES["profile_pic"]["name"]);

    $extension = $fileinfo["extension"];

    $random = 'image_' . rand(1000,9999);

    $file_url = $upload_url . $random . '.' . $extension;

    $file_path = $upload_path . $random . '.'. $extension;

    $category_img = "https://prakrutitech.buzz/Project_API/";

    move_uploaded_file($_FILES["profile_pic"]["tmp_name"],$file_path);

    $insert = "INSERT INTO project_Category_images (c_id,c_images) VALUES ('$id','$category_img$file_path')";
    $result=mysqli_query($con,$insert);
?>

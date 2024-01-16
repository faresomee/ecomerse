<?php
session_start();
include "db.php";
$id = $_SESSION['user_id'];
$result=mysqli_query($con,"select user_id,first_name,last_name, email, mobile,address1,address2, from user_info where user_id='$user_id'")or die ("query 1 incorrect.......");

list($$id,$fname,$lname,$email,$address1,$address2)=mysqli_fetch_array($result);


if (isset($_POST['edit'])) {
    
    $fname = $_POST['first_name'];
    $lname = $_POST['last_name'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $address1 = $_POST['address1'];
    $address2 = $_POST['address2'];
    mysqli_query($con,"UPDATE user_info SET first_name='$fname',last_name='$lname',email='$email',mobile='$mobile',address1='$address1',address2='$address2' WHERE user_id='$id'")or die("Query 2 is inncorrect..........");
        if ($sql2) {
            /*Successful*/
            header('location:user_update.php');
        } else {
            /*sorry your profile is not update*/
            header('location:index.php');
        }
    } else {
        /*sorry your id is not match*/
        header('location:index.php');
    }
    include "footer.php";
?>
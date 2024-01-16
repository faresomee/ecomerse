<?php
session_start();

unset($_SESSION["uid"]);

unset($_SESSION["name"]);

$BackToMyPage = $_SERVER['HTTP_REFERER'];
if(isset($BackToMyPage)) {
    header('Location: ../index.php');
} else {
    header('Location: ../index.php'); // default page
}
   

?>
<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="stylesheet" href="style.css">
</head>
<body>
<?php

$conn = mysqli_connect('localhost','root','','user_db');
$db=mysqli_select_db($conn,'user_db');

$query=mysqli_query($conn,"SELECT * FROM `user_form`");
?>
<table>
    <tr>
        <td>name</td>
        <td>email</td>
        <td>password</td>
        <td>type</td>
        <td>image</td>
</tr>
<?php
while($fetch=mysqli_fetch_assoc($query))
{
    echo"<tr>
    <td>".$fetch['name']."</td>
    <td>".$fetch['email']."</td>
    <td>".$fetch['password']."</td>
    <td>".$fetch['type']."</td>
    <td>".$fetch['image']."</td>
    </tr>";

}
?>
</body>
</html>




?>
</body>
</html>

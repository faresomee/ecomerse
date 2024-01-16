<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

<div class="content">
    <form action ="delete_user.php" method ="post">
    <span><label class ="btn">Delete user<label><span><br>
    <span><label class ="btn">Name</label><span><input  class ="btnn" type ="text" name="name"/><br>
        <input type="submit" class="btn" name="Delete">
</div>
</div>
    <?php
    if(isset($_POST[Delete])){
$name=$_POST["name"];

$conn=new mysqli("localhost","root","","user_db");
$stmt=$conn->prepare("delete from user_form where name=?");
$stmt->bind_param("s",$name);
$stmt->execute();
echo "DONE";
    }
?>

</body>
</html>
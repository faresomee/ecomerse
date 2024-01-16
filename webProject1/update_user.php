<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

<div class="content">
    <form action ="update_user.php" method ="post">
    <label class ="btn">Update user<label><br>
    <label class ="btn">Name</label><input  class ="btnn" type ="text" name="name"/><br>
    <label class ="btn">Email</label><input  class ="btnn" type ="text" name="email"/><br>
    <label class ="btn">Password</label><input  class ="btnn" type ="text" name="password"/><br>
    <label class ="btn">User type</label>
        <select  class ="btn" name="user_type">
         <option value="user" >user</option>
         <option value="admin" >admin</option>
        </select><br>
        <input  class ="btn" type="submit" name="update">
</div>
</div>
    </form><hr>
    <?php
    if(isset($_POST["update"])){
$name=$_POST["name"];
$email=$_POST["email"];
$password=$_POST["password"];
$user_type=$_POST["user_type"];

$conn=new mysqli("localhost","root","","user_db");
$stmt=$conn->prepare("update user_form set email=$email, password=$password ,user_type=$user_type  where name=$name");
$stmt->execute();
echo "DONE";
    }
?>
</body>
</html>

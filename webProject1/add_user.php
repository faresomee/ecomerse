<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

<div class="content">
    <form action ="add_user.php" method ="post">
        <span><label class ="btn">Add user<label><span><br>
        <span><label class ="btn">Name</label></span><input class ="btnn" type ="text" name="name"/><br>
        <span><label class ="btn" >Email</label><span><input class ="btnn" type ="text" name="email"/><br>
        <span><label class ="btn">Password</label><span><input class ="btnn" type ="text" name="password"/><br>
        <span><label class ="btn" >User type</label><span>
        <select name="user_type">
         <option value="user" >user</option>
         <option value="admin" >admin</option>
        </select><br>
        <input class ="btn" type="submit" name="Add">

</div>
</div>
    </form><hr>
    <?php
    if(isset($_POST[Add])){
$name=$_POST["name"];
$email=$_POST["email"];
$password=$_POST["password"];
$user_type=$_POST["user_type"];

$conn=new mysqli("localhost","root","","user_db");
$stmt=$conn->prepare("insert into user_form(name,email,password,user_type)values(?,?,?,?);");
$stmt->bind_param("ssss",$name,$email,$password,$user_type);
$stmt->execute();
echo "DONE";
    }
?>

</body>
</html>
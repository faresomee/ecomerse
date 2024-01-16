<?php
include "db.php";
session_start();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Profile</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/accountbtn.css" />






    <style>
        body {
            background: rgb(99, 39, 120)
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #682773
        }

        .profile-button:focus {
            background: #682773;
            box-shadow: none
        }

        .profile-button:active {
            background: #682773;
            box-shadow: none
        }

        .back:hover {
            color: #682773;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }
    </style>
</head>

<body>

    <?php
    include "db.php";
    if (isset($_SESSION["uid"])) {
        $sql = "SELECT * FROM user_info WHERE user_id='$_SESSION[uid]'";
        $query = mysqli_query($con, $sql);
        $row = mysqli_fetch_array($query);
        echo '
        <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">' . $row["first_name"] . '</span><span class="text-black-50">' . $row["email"] . '</span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
        <form action="user_update.php" method="post">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">First Name</label><input type="text" name="first_name" class="form-control" placeholder="' . $row["first_name"] . '" value=""></div>
                    <div class="col-md-6"><label class="labels">Last Name</label><input type="text" name="last_name"class="form-control" value="" placeholder="' . $row["last_name"] . '"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="mobile" class="form-control" placeholder="' . $row["mobile"] . '" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 1</label><input type="text" name="address1" class="form-control" placeholder="' . $row["address1"] . '" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 2</label><input type="text" name="address2" class="form-control" placeholder="' . $row["address2"] . '" value=""></div>
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" name="email" class="form-control" placeholder="' . $row["mobile"] . '" value=""></div>
                    <div class="col-md-12"><label class="labels">Password</label><input type="text" name="password"class="form-control" placeholder="enter password" value=""></div>
                    </div>
                
                <div class="mt-5 text-center"><input type="submit"  name ="edit" class="btn btn-primary profile-button" ></div>
            </div>
            </div>
</form>
        </div>
        
    </div>
</div>
</div>
</div>';
    } ?>
</body>

</html>
<?php
session_start();
include("../db.php");


if (isset($_POST['btn_save'])) {
    $cat_id = $_POST['cat_id'];


    mysqli_query($con, "DELETE FROM categories where cat_id= $cat_id") or die("THE CATEGORIE NOT FOUND");

    header("location: index.php?success=1");


    mysqli_close($con);
}
include "sidenav.php";
include "topheader.php";
?>
<!-- End Navbar -->
<div class="content">
    <div class="container-fluid">
        <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
            <div class="row">


                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h5 class="title">Delete Categorie</h5>
                        </div>
                        <div class="card-body">

                            <div class="row">

                                <div class="col-md-12">

                                </div>
                                <div class="col-md-4">
                                    <div class="">
                                        <label for="">Categorie Number</label>
                                        <input type="number" id="cat_id" name="cat_id" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">

                                </div>

                                <div class="col-md-12">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">

                        <div class="card-body">

                            <div class="row">

                                <div class="col-md-12">

                                </div>
                                <div class="col-md-12">

                                </div>


                                <div class="col-md-12">

                                </div>
                            </div>

                        </div>
                        <div class="card-footer">
                            <button type="submit" id="btn_save" name="btn_save" required
                                class="btn btn-fill btn-primary">Delete Categorie</button>
                        </div>
                    </div>
                </div>

            </div>
        </form>

    </div>
</div>
<?php
include "footer.php";
?>
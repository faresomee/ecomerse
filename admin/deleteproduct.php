<?php
session_start();
include("../db.php");


if(isset($_POST['btn_save']))
{
$product_id=$_POST['product_id'];

//picture coding
$picture_name=$_FILES['picture']['name'];
$picture_type=$_FILES['picture']['type'];
$picture_tmp_name=$_FILES['picture']['tmp_name'];
$picture_size=$_FILES['picture']['size'];


		
mysqli_query($con,"DELETE FROM products where product_id=$product_id") or die ("query incorrect");

 header("location: productlist.php?success=1");


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
                <h5 class="title">Delete Product</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    
                    <div class="col-md-12">
                      
                    </div>
                    <div class="col-md-4">
                      <div class="">
                        <label for="">Product Code</label>
                        <input type="number" id="product_id" name="product_id" required="[1-100000]" class="form-control">
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
              <div class="card-header card-header-primary">
                <h5 class="title">Categories</h5>
              </div>
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
                  <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Delete Product</button>
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
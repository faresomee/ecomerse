<?php
session_start();
include("../db.php");


if(isset($_POST['btn_save']))
{
$Brand_Title=$_POST['Brand_Title'];



		
mysqli_query($con,"insert into brands (brand_title) values ('$Brand_Title')") or die ("query incorrect");

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
                <h5 class="title">Add New Brand</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    
                    <div class="col-md-12">
                      
                    </div>
                    <div class="col-md-4">
                      <div class="">
                        <label for="">Brand Title </label>
                        <input type="text" id="Brand_Title" name="Brand_Title" required class="form-control" >
                      </div>
                    </div>
                     <div class="col-md-12">
                      
                    </div>
                  
                    <div class="col-md-12">
                      
                    </div>
                  </div>
                 
                  
                 <div class="">
                  <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Save</button>
              </div>
              </div>
              
            </div>
          </div>
          
             
            
        
      <?php
include "footer.php";
?>
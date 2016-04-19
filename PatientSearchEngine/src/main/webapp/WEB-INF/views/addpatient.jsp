<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<<!DOCTYPE html>
<html lang="en">
<head>
  <title>PARSd - Patient Search Engine</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script>
/*	$(document).ready(function(){
		$("#visitForm").hide();
		$("#doctorForm").hide();
		$("#bedForm").hide();
		$("#patient").click(function(){
			$("#patientForm").show();
			$("#visitForm").hide();
			$("#doctorForm").hide();
			$("#bedForm").hide();
		});
		$("#visit").click(function(){
			$("#patientForm").hide();
			$("#visitForm").show();
			$("#doctorForm").hide();
			$("#bedForm").hide();
		});
		$("#bed").click(function(){
			$("#patientForm").hide();
			$("#visitForm").hide();
			$("#doctorForm").hide();
			$("#bedForm").show();
		});
		$("#doctor").click(function(){
			$("#patientForm").hide();
			$("#visitForm").hide();
			$("#doctorForm").show();
			$("#bedForm").hide();
		});
	});*/
	</script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">MyPatientSearch</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Patient</a></li>
    </ul>
  </div>
</nav>
<div class="container">
<div class="row">
    <div class="col-md-4">
    <p></p>
    </div>
    <div class="clearfix visible-lg"></div>
 </div>
<h2>MY Patient Search</h2>
  <form class="form-group" role="form">	
		<div class="panel-group" id="accordion">
        
		   <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Patient Information</a></h4>
		      </div>
		    <div id="collapseOne" class="panel-collapse collapse">
		      <div class="panel-body">
             		
                    <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">First Name</label>
      					<input type="text" class="form-control" id="firstName" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">Middle Name</label>
      					<input type="text" class="form-control" id="middleName" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">Last Name</label>
      					<input type="text" class="form-control" id="lastName" placeholder="Enter alphabets">
				    </div>
                    </div>
                    
                    <div class="row col-md-12">
      			    <div class=" col-md-4"><label for="usr">Date of Birth</label>
      					<input type="date" class="form-control" id="dOB" placeholder="Select Date">
				    </div>
                    <div class=" col-md-4"><label for="usr">Blood Group</label>
      					<input type="text" class="form-control" id="bloodGroup" placeholder="Format: AB+">
				    </div>
                    <div class=" col-md-4"><label for="usr">Primary Care Physician</label>
      					<input type="text" class="form-control" id="pcp" placeholder="Enter alphabets">
				    </div>
                    </div>
                    
                    <div class="row col-md-12">
                    <div class=" col-md-4"><label for="usr">Marital Status</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
      			    <div class=" col-md-4"><label for="usr">Cell Phone Number</label>
      					<input type="number" class="form-control" id="" placeholder="Format: 9988776655">
				    </div>
                    <div class=" col-md-4"><label for="usr">Home Phone Number</label>
      					<input type="number" class="form-control" id="" placeholder="Format: 9988776655">
				    </div>

                    </div>
                    
                    <div class="row col-md-12">

					<div class=" col-md-4"><label style="margin:10px">Sex</label>
                        <input type="radio" name="RadioGroup1" value="sex" id="RadioGroup1_0">
                        Male
                      
                        <input type="radio" name="RadioGroup1" value="sex" id="RadioGroup1_1">
                        Female
				    </div>                   
                    
                    <div class=" col-md-8"><label style="margin:10px">Disability Status</label>&nbsp;
                        <input type="radio" name="RadioGroup1" value="disyes" id="RadioGroup2_1">
                        Patient has disability

                        <input type="radio" name="RadioGroup1" value="disno" id="RadioGroup2_2">
                        Patient has no disability
				    </div>
       		    </div>
                    
                    <div class="row col-md-12">
      			    <div class=" col-md-4"><label for="usr">Emergency Contact Name</label>
      					<input type="date" class="form-control" id="" placeholder="Select Date">
				    </div>
                    <div class=" col-md-4"><label for="usr">Relationship with Patient</label>
   					  <input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class=" col-md-4"><label for="usr">Phone Number</label>
   					  <input type="number" class="form-control" id="" placeholder="Format: 9988776655">
				    </div>
                    </div>
                    
                    <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                    </div>
                    
               </div>              
            
	         </div>
		   </div>
            
		   <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Address Details</a></h4>
		      </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
		      <div class="panel-body">
	
                  <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Street</label>
      					<input type="text" class="form-control" id="street" placeholder="Enter alphanumeric">
				    </div>
                    <div class="col-lg-4"><label for="usr">City</label>
      					<input type="text" class="form-control" id="city" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">State</label>
      					<input type="text" class="form-control" id="state" placeholder="Format: MA">
				    </div>
                  </div>
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Zip Code</label>
      					<input type="number" class="form-control" id="zip" placeholder="Format: 02115">
				    </div>
                    <div class="col-lg-6"><label for="usr">Country</label>
      					<input type="text" class="form-control" id="country" placeholder="Format: US">
				    </div>
                  </div>          

                  <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                  </div>                                           
              
              </div>
		      
              </div>
		   </div>
            
		   <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Social Habits</a></h4>
		      </div>
		    <div id="collapseThree" class="panel-collapse collapse">
		      <div class="panel-body">
                   
                   <div class="row col-md-12">
      			    <div class="col-lg-4"><label>Smoking</label>&nbsp;
                        <input type="radio" name="RadioGroup1" value="smoyes" id="RadioGroup3_1">
                        Yes
                        <input type="radio" name="RadioGroup1" value="smono" id="RadioGroup3_2">
                        No
				    </div>
                    <div class="col-lg-4"><label>Alcohol</label>&nbsp;
                        <input type="radio" name="RadioGroup1" value="alcyes" id="RadioGroup4_1">
                        Yes
                        <input type="radio" name="RadioGroup1" value="alcno" id="RadioGroup4_2">
                        No
				    </div>
                    <div class="col-lg-4"><label>Recreational Drugs</label>&nbsp;
                        <input type="radio" name="RadioGroup1" value="reces" id="RadioGroup5_1">
                        Yes
                        <input type="radio" name="RadioGroup1" value="recno" id="RadioGroup5_2">
                        No
				    </div>                    
                  </div>  
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Smoking Years</label>
						<input type="number" class="form-control" id="smoking" placeholder="Enter no. of years">
				    </div>
                    <div class="col-lg-6"><label for="usr">Alcohol Years</label>
      					<input type="number" class="form-control" id="alcohol" placeholder="Enter no. of years">
				    </div>
                  </div>
                  
                  <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                  </div>             
                                          
              </div>
              
             </div>
		    </div>
            
           <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Family History</a></h4>
		      </div>
		    <div id="collapseFour" class="panel-collapse collapse">
		      <div class="panel-body">
              
              	<div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Member Name</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">Relationship with Patient</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">Age</label>
      					<input type="number" class="form-control" id="age" placeholder="Enter digits">
				    </div>
                </div>
                
                <div class="row col-md-12">
      			    <div class="col-lg-8"><label for="usr">Medical Condtions</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label style="margin:25px">Alive?</label>&nbsp;
                        <input type="radio" name="RadioGroup1" value="alive" id="RadioGroup6_1">
                        Yes
                        <input type="radio" name="RadioGroup1" value="dead" id="RadioGroup6_2">
                        No
				    </div>
                </div>                                                     
                
                <div class="row col-md-12">
                	<div class="col-lg-8"><label for="usr">Death Cause</label>
      					<input type="text" class="form-control" id="deathcause" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-4"><label for="usr">Death Age</label>
      					<input type="number" class="form-control" id="deathage" placeholder="Enter digits">
				    </div>
                </div>
                
                <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                </div>
                                                        
              </div>
              
              </div>
		    </div>
           
           <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Health Care Proxy</a></h4>
		      </div>
		    <div id="collapseFive" class="panel-collapse collapse">
		      <div class="panel-body">
                            	  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Primary Agent Name</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-6"><label for="usr">Relationship with Patient</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                  </div> 
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Primary Agent Privileges</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphanumeric">
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective from</label>
      					<input type="date" class="form-control" id="" placeholder="Select Date">
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective till</label>
      					<input type="date" class="form-control" id="" placeholder="Select Date">
				    </div>
                  </div>
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Primary Agent Name</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                    <div class="col-lg-6"><label for="usr">Relationship with Patient</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphabets">
				    </div>
                  </div> 
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Primary Agent Privileges</label>
      					<input type="text" class="form-control" id="" placeholder="Enter alphanumeric">
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective from</label>
      					<input type="date" class="form-control" id="" placeholder="Select Date">
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective till</label>
      					<input type="date" class="form-control" id="" placeholder="Select Date">
				    </div>
                  </div>
                  
                  <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                  </div>                                                                                          
              
              </div>              
              
		      </div>
		   </div>
           
		   </div>
           
  		</form>
	</div>
    
</body>
</html>

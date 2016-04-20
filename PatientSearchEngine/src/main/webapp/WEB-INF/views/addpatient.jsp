<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <form:form action="patientadded" class="form-group" role="form" commandName="patient" method="post">	
		<div class="panel-group" id="accordion">
        
		   <div class="panel panel-primary">
		    <div class="panel-heading">
		      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Patient Information</a></h4>
		      </div>
		    <div id="collapseOne" class="panel-collapse collapse">
		      <div class="panel-body">
             		
                    <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">First Name</label>
      					<form:input path="patientFname" type="text" class="form-control" id="patientFname" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Middle Name</label>
      					<form:input path="patientMname"  type="text" class="form-control" id="patientMname" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Last Name</label>
      					<form:input path="patientLname"   type="text" class="form-control" id="patientLname" placeholder="Enter alphabets"/>
				    </div>
                    </div>
                    
                    <div class="row col-md-12">
      			    <div class=" col-md-4"><label for="usr">Date of Birth</label>
      					<form:input path="patientDob" type="text" class="form-control" id="patientDob" placeholder="Select Date"/>
				    </div>
                    <div class=" col-md-4"><label for="usr">Blood Group</label>
      					<form:input path="bloodGroup" type="text" class="form-control" id="bloodGroup" placeholder="Format: AB+"/>
				    </div>
                    <div class=" col-md-4"><label for="usr">Primary Care Physician</label>
      					<form:input path="patientPcpName" type="text" class="form-control" id="patientPcpName" placeholder="Enter alphabets"/>
				    </div>
                    </div>
                    
                    <div class="row col-md-12">
                    <div class=" col-md-4"><label for="usr">Marital Status</label>
      					<form:input path="maritalStatus" type="text" class="form-control"  placeholder="Enter alphabets"/>
				    </div>
      			    <div class=" col-md-4"><label for="usr">Cell Phone Number</label>
      					<form:input path="cellPhone" type="number" class="form-control" placeholder="Format: 9988776655"/>
				    </div>
                    <div class=" col-md-4"><label for="usr">Home Phone Number</label>
      					<form:input path="homePhone" type="number" class="form-control"  placeholder="Format: 9988776655"/>
				    </div>

                    </div>
                    
                    <div class="row col-md-12">

					<div class=" col-md-4"><label style="margin:10px">Sex</label>
                        <form:radiobutton path="gender"  name="RadioGroup1" value="M" id="RadioGroup1_0"/>
                        Male
                      
                        <form:radiobutton path="gender"  name="RadioGroup1" value="F" id="RadioGroup1_1"/>
                        Female
				    </div>                   
                    
                    <div class=" col-md-8"><label style="margin:10px">Disability Status</label>&nbsp;
                        <form:radiobutton path="disabilityStatus"  name="RadioGroup1" value="Y" id="RadioGroup2_1"/>
                        Patient has disability

                        <form:radiobutton path="disabilityStatus"  name="RadioGroup1" value="N" id="RadioGroup2_2"/>
                        Patient has no disability
				    </div>
       		    </div>
                    
                    <div class="row col-md-12">
      			    <div class=" col-md-4"><label for="usr">Emergency Contact Name</label>
      					<form:input path="emergencyContactName"  type="text" class="form-control" id="" placeholder="Enter Name"/>
				    </div>
                    <div class=" col-md-4"><label for="usr">Relationship with Patient</label>
   					  <form:input path="emergencyContactRelationship"  type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class=" col-md-4"><label for="usr">Phone Number</label>
   					  <form:input path="emergencyContactNumber"  type="number" class="form-control" id="" placeholder="Format: 9988776655"/>
				    </div>
                    </div>
                    
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
      					<form:input path="addresses[0].street" type="text" class="form-control" id="street" placeholder="Enter alphanumeric"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">City</label>
      					<form:input path="addresses[0].city" type="text" class="form-control" id="city" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">State</label>
      					<form:input path="addresses[0].state" type="text" class="form-control" id="state" placeholder="Format: MA"/>
				    </div>
                  </div>
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Zip Code</label>
      					<form:input path="addresses[0].zipcode"  type="number" class="form-control" id="zip" placeholder="Format: 02115"/>
				    </div>
                    <div class="col-lg-6"><label for="usr">Country</label>
      					<form:input path="addresses[0].country"  type="text" class="form-control" id="country" placeholder="Format: US"/>
				    </div>
                  </div>          

              
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
                        <form:radiobutton path="socialHabits.smokingHabit"   name="RadioGroup1" value="Y" id="RadioGroup3_1"/>
                        Yes
                        <form:radiobutton path="socialHabits.smokingHabit"   name="RadioGroup1" value="N" id="RadioGroup3_2"/>
                        No
				    </div>
                    <div class="col-lg-4"><label>Alcohol</label>&nbsp;
                        <form:radiobutton path="socialHabits.alcoholHabit"   name="RadioGroup1" value="Y" id="RadioGroup4_1"/>
                        Yes
                        <form:radiobutton path="socialHabits.alcoholHabit"  name="RadioGroup1" value="N" id="RadioGroup4_2"/>
                        No
				    </div>
                    <div class="col-lg-4"><label>Recreational Drugs</label>&nbsp;
                        <form:radiobutton path="socialHabits.recreationalDrugs"  name="RadioGroup1" value="Y" id="RadioGroup5_1"/>
                        Yes
                        <form:radiobutton path="socialHabits.recreationalDrugs"  name="RadioGroup1" value="N" id="RadioGroup5_2"/>
                        No
				    </div>                    
                  </div>  
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Smoking Years</label>
						<form:input  path="socialHabits.smokingYears" type="number" class="form-control" id="smoking" placeholder="Enter no. of years"/>
				    </div>
                    <div class="col-lg-6"><label for="usr">Alcohol Years</label>
      					<form:input  path="socialHabits.alcoholYears" type="number" class="form-control" id="alcohol" placeholder="Enter no. of years"/>
				    </div>
                  </div>
                  
                              
                                          
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
      					<form:input  path="familyHistory.memberName" type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Relationship with Patient</label>
      					<form:input  path="familyHistory.memberPatientRelationship" type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Age</label>
      					<form:input  path="familyHistory.age" type="number" class="form-control" id="age" placeholder="Enter digits"/>
				    </div>
                </div>
                
                <div class="row col-md-12">
      			    <div class="col-lg-8"><label for="usr">Medical Condtions</label>
      					<form:input path="familyHistory.medicalConditions" type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label style="margin:25px">Alive?</label>&nbsp;
                        <form:radiobutton path="familyHistory.alive"  name="RadioGroup1" value="Y" id="RadioGroup6_1"/>
                        Yes
                        <form:radiobutton path="familyHistory.alive"  name="RadioGroup1" value="N" id="RadioGroup6_2"/>
                        No
				    </div>
                </div>                                                     
                
                <div class="row col-md-12">
                	<div class="col-lg-8"><label for="usr">Death Cause</label>
      					<form:input path="familyHistory.deathCause"  type="text" class="form-control" id="deathcause" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Death Age</label>
      					<form:input path="familyHistory.deathAge"  type="number" class="form-control" id="deathage" placeholder="Enter digits"/>
				    </div>
                </div>
                
               
                                                        
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
      					<form:input path="healthCareProxy.primaryAgentName" type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-6"><label for="usr">Phone Number</label>
      					<form:input path="healthCareProxy.primaryPhoneNumber" type="number" class="form-control" id="" placeholder="Enter Number"/>
				    </div>
                  </div> 
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Primary Agent Privileges</label>
      					<form:input path="healthCareProxy.primaryPrivileges" type="text" class="form-control" id="" placeholder="Enter alphanumeric"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective from</label>
      					<form:input path="healthCareProxy.primaryStartDate" type="text" class="form-control" id="" placeholder="Select Date"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective till</label>
      					<form:input path="healthCareProxy.primaryEndDate" type="text" class="form-control" id="" placeholder="Select Date"/>
				    </div>
                  </div>
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-6"><label for="usr">Secondary Agent Name</label>
      					<form:input path="healthCareProxy.secondaryAgentName" type="text" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                    <div class="col-lg-6"><label for="usr">Phone Number</label>
      					<form:input path="healthCareProxy.secondaryPhoneNumber" type="number" class="form-control" id="" placeholder="Enter alphabets"/>
				    </div>
                  </div> 
                  
                  <div class="row col-md-12">
      			    <div class="col-lg-4"><label for="usr">Secondary Agent Privileges</label>
      					<form:input path="healthCareProxy.secondaryPrivileges" type="text" class="form-control" id="" placeholder="Enter alphanumeric"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective from</label>
      					<form:input path="healthCareProxy.secondaryStartDate" type="text" class="form-control" id="" placeholder="Select Date"/>
				    </div>
                    <div class="col-lg-4"><label for="usr">Effective till</label>
      					<form:input path="healthCareProxy.secondaryEndDate" type="text" class="form-control" id="" placeholder="Select Date"/>
				    </div>
                  </div>
                  
                  <div class="row col-md-12" style="margin:10px">      			    
                      <input type="submit" class="btn btn-success center-block"/>                						                  </div>                                                                                          
              
              </div>              
              
		      </div>
		   </div>
           
		   </div>
           
  		</form:form>
	</div>
    
</body>
</html>

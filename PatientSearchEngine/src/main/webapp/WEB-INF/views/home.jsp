<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>PARSd - Patient Search Engine</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#visitForm").hide();
		$("#doctorForm").hide();
		$("#bedForm").hide();
		$("#patient").click(function() {
			$("#patientForm").show();
			$("#visitForm").hide();
			$("#doctorForm").hide();
			$("#bedForm").hide();
		});
		$("#visit").click(function() {
			$("#patientForm").hide();
			$("#visitForm").show();
			$("#doctorForm").hide();
			$("#bedForm").hide();
		});
		$("#bed").click(function() {
			$("#patientForm").hide();
			$("#visitForm").hide();
			$("#doctorForm").hide();
			$("#bedForm").show();
		});
		$("#doctor").click(function() {
			$("#patientForm").hide();
			$("#visitForm").hide();
			$("#doctorForm").show();
			$("#bedForm").hide();
		});
	});
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
				<li><a href="addpatient">Patient</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">

      	<div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>

		<div class="form-group" role="form">

            <p></p>
            <div class="col-md-3">
            </div>
			<div class="panel-group col-md-6">
				<div class="panel panel-info">
                	<center><span style="font-family:'Open Sans', Arial; font-weight:bold; font-size:60px">
                    <font color="#4285F4">P</font><font color="#EB584C">a</font><font color="#FCBD05">r</font><font color="#4285F4">s</font><font color="#EB584C">d</font></span></center>
					
                    <center><em><strong>A Patient Search Engine</strong></em></center>
                    <div class="panel-heading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
						<label class="radio-inline"><input type="radio" checked
							name="optradio" id="patient">Patient</label> <label
							class="radio-inline"><input type="radio" name="optradio"
							id="visit">Visit</label> <label class="radio-inline"><input
							type="radio" name="optradio" id="doctor">Doctor</label> <label
							class="radio-inline"><input type="radio" name="optradio"
							id="bed">Bed Details</label>
					</div>
					<div class="panel-body">

						<!-- Patient Search Box -->
						
						<div id="patientForm" class="row">
						<form action="search?param=patient">

							<div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="patientName">Name:</label> <input name="patientName"
									type="text" class="form-control" placeholder="Enter Patient Name">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            

                            
                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="location">Location:</label> <input name="location"
									type="text" class="form-control" placeholder="Enter Location">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                                                        
							<input type="hidden" name="identifier" value="patientsearch" />
							
                            <div class="row">
                            <div class="col-md-5">
                            </div>
							<div class="form-group">
								<input type="submit" class="btn btn-success"></button>
							</div>

                            </div>
                            							
                        </form>
						</div>
						
						<!-- End: Patient Search Box -->
                        
						<!-- Visit Search Box -->
						<div id="visitForm" class="row">
						<form action="visit?param=visit">

							<div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="dateOfVisit">Date:</label> <input name="dateOfVisit"
									type="text" class="form-control" placeholder="Format: 2010-12-31">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>

                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="type">Patient Type:</label> <select class="form-control"
									name="typeofPatient">
  									<option>Any</option>
									<option>In-Patient</option>
									<option>Out-Patient</option>
								</select>
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            
							<input type="hidden" name="identifier" value="visitsearch" />
							
                            <div class="row">
                            <div class="col-md-5">
                            </div>
							<div class="form-group">
								<input type="submit" class="btn btn-success"></button>
							</div>

                            </div>
							</form>
						</div>
						<!-- End: Visit Search Box -->
                        
						<!-- Doctor Search Box -->
						<div id="doctorForm" class="row">
						<form action="doctor?param=doctor">

							<div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="doctorName">Name:</label> <input type="text"
									class="form-control" name="doctorName"
									placeholder="Enter Doctor Name">
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            
                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="type">Speciality:</label> <select
									class="form-control" name="typeofDoctor">
									<option>Any</option>
									<option>Physician</option>
									<option>Orthopedic</option>
  									<option>Dermatologist</option>
								</select>
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>

							<div class="row">
                            <div class="col-md-5">
                            </div>
							<div class="form-group">
								<input type="submit" class="btn btn-success"></button>
							</div>
                            </div>
                            
						  </form>	
						</div>
						<!-- End: Doctor Search Box -->
						<!-- Bed Search Box -->
						<div id="bedForm" class="row">
						<form action="bedassigned?param=bedassigned">
							
                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">
								<label for="email">Bed number:</label> <input type="number"
									class="form-control" placeholder="Enter the Bed number" name="bednumber"/>
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            
                            <div class="row">
                            <div class="col-md-2">
                            </div>
							<div class="form-group col-md-8">							
								<label for="type">Type of Room:</label> <select
									class="form-control" name="typeofRoom">
									<option>Any</option>
                                    <option>ICU</option>
									<option>OPD</option>
								</select>
							</div>
                            <div class="col-md-2">
                            </div>
                            </div>
                            
							<div class="row">
                            <div class="col-md-5">
                            </div>
							<div class="form-group">
								<input type="submit" class="btn btn-success"></button>
							</div>
                            </div>
						</form>
						</div>
						<!-- End: Bed Search Box -->
					</div>

				</div>

			</div>           
		</div>
	</div>

</body>
</html>

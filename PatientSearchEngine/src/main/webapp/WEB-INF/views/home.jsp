<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>PARSd - Patient Search Engine</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<div class="row">
			<div class="col-md-4">
				<p>The .navbar-fixed-bottom class makes the navigation bar stay
					at the bottom.</p>
			</div>
			<div class="col-md-4">
				<p>The .navbar-fixed-bottom class makes the navigation bar stay
					at the bottom.</p>
			</div>
			<div class="col-md-4">
				<p>The .navbar-fixed-bottom class makes the navigation bar stay
					at the bottom.</p>
			</div>
			<div class="clearfix visible-lg"></div>
		</div>
		<h2>MY Patient Search</h2>
		<p>Enter your Query here</p>
		<div class="form-inline" role="form" >
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
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
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="patientName">Name:</label> <input name="patientName"
									type="text" class="form-control" placeholder="Enter Name">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="location">Location:</label> <input name="location"
									type="text" class="form-control" placeholder="Enter Location">
							</div>
							<input type="hidden" name="identifier" value="patientsearch" />
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>
							</form>
						</div>
						
						<!-- End: Patient Search Box -->
						<!-- Visit Search Box -->
						<div id="visitForm" class="row">
						<form action="search?param=visit">
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="dateOfVisit">Date:</label> <input name="dateOfVisit"
									type="text" class="form-control" placeholder="">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="type">Type:</label> <select class="form-control"
									name="typeofPatient">
									<option>In-Patient</option>
									<option>Out-Patient</option>
								</select>
							</div>
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="identifier" value="visitsearch" />
							<div class="form-group">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>
							</form>
						</div>
						<!-- End: Visit Search Box -->
						<!-- Doctor Search Box -->
						<div id="doctorForm" class="row">
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="doctorName">Doctor:</label> <input type="text"
									class="form-control" name="doctorName"
									placeholder="Enter name of the doctor">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="type">Speciality:</label> <select
									class="form-control" name="typeofDoctor">
									<option>Gyanecologist</option>
									<option>Orthopedic</option>
								</select>
							</div>
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>
						</div>
						<!-- End: Doctor Search Box -->
						<!-- Bed Search Box -->
						<div id="bedForm" class="row">
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="email">Bed no.:</label> <input type="number"
									class="form-control" placeholder="Enter the Bed number">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label for="type">Type of Room:</label> <select
									class="form-control" name="typeofRoom">
									<option>ICU</option>
									<option>OPD</option>
								</select>
							</div>
							<div class="">&nbsp;</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>

						</div>
						<!-- End: Bed Search Box -->
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>

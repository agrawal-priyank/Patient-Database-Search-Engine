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

     function deleteDoctor(doctorId, doctorUpin){

    	 jQuery.ajax({
			  type: "POST",
			  dataType: "html",
			  url: "deletedoctor",
			  data: "doctorId="+doctorId+"&doctorUpin="+doctorUpin,
			  success: function(msg){
					if(msg === "success"){
						var row = document.getElementById(doctorId);
                        row.parentNode.removeChild(row);
					}else{
						 alert("Deleting doctor failed");
						}
			  },
			  error: function(XMLHttpRequest, textStatus, errorThrown) {
			     alert("error deleting doctor");
			  }
			});
    	 
         }
	
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/SocialProject">MyPatientSearch</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/SocialProject">Home</a></li>
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
		<h2>MY Doctor Search</h2>
		<form class="form-inline" role="form">
			<div class="panel-group">
				<div class="panel panel-info">
					<div class="panel-heading">Search Result</div>
					<!-- Patient Search Result -->
					<div class="panel-body">
						<c:set var="doctorList" value="${requestScope.doctorList}" />
						<c:choose>
							<c:when test="${not empty doctorList}">
							
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Doctor Id</th>
									<th>Doctor UPI</th>
									<th>Doctor Name</th>
									<th>Doctor Specialization</th>
								</tr>


							</thead>
							<tbody>
								<c:forEach var="doctor" items="${doctorList}">
									<tr id='${doctor.doctorId}'>
										<td>${doctor.doctorId}</td>
										<td>${doctor.doctorUpin}</td>
										<td>${doctor.doctorFname} ${doctor.doctorLname}</td>
										<td>${doctor.doctorSpecialization}</td>
										<td><button type="button" class="btn btn-danger btn-xs" onClick="deleteDoctor('${doctor.doctorId}','${doctor.doctorUpin}')">Delete</button></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div class="alert alert-warning">
									<strong>Sorry:</strong> No Doctor found in the database.
								</div>
					</c:otherwise>	
					</c:choose>

					</div>
					<!-- End Search Result -->

				</div>

			</div>
		</form>
	</div>

</body>
</html>

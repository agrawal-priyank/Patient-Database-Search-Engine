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
<style type="text/css">
.readonlyStyle {
	background: none;
	border: none;
	outline: none;
	
}
</style>
<script>

	$(document).ready(function() {
		$("#visitForm").hide();
		$("#doctorForm").hide();
		$("#bedForm").hide();
		$(".btn-info").click(function() {
			//$(this).parent().parent();
			 var dsbutton = $(this);
			 var $row = dsbutton.closest("tr");
			 var patientId = $row.children('td.patientid').text();
             var $tds = $row.find("input:text");    
			if($(this).text() == "Update"){
				dsbutton.text("Save");
				 $.each($tds, function () {             
	                 $(this).removeAttr("readonly");
	                 $(this).removeClass("readonlyStyle");
	             });
			}else{
					 var query = 'updatePatient?patientId='+patientId + '&';
					 
					 $.each($tds, function () {  
						 $(this).attr("readonly");
		                 $(this).addClass("readonlyStyle");
		                 var name = $(this).attr("name");
		                 var val = $(this).val();
		                 if (name !== null || val !== undefined) {
		                     query = query + name + "=" + val + "&";
		                 }
					 });
					 jQuery.ajax({
	                        url: query,
	                        success: function (result) {
	                        	dsbutton.text("Update");
	                        	 
	                        },
	                        error: function(XMLHttpRequest, textStatus, errorThrown) {
	           			     alert("Update Patient failed");
	           			  },
	                        async: true
	                    });
				}
            
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
		<form class="form-inline" role="form">
			<div class="panel-group">
				<div class="panel panel-info">
					<div class="panel-heading">Search Result</div>
					<!-- Patient Search Result -->
					<div class="panel-body">
						<c:set var="patientList" value="${requestScope.patientList}" />
						<c:choose>
							<c:when test="${not empty patientList}">
								<table class="table table-hover">
									<thead>

										<tr>
											<th>Patient UPI</th>
											<th>Firstname</th>
											<th>Lastname</th>
											<th>DOB</th>
											<th>Marital Status</th>
											<th>Emergency Contact Name</th>
										</tr>


									</thead>
									<tbody>
										<c:forEach var="patient" items="${patientList}">
											<tr>
												<td class="patientid">${patient.patientUpi}</td>
												<td>${patient.patientFname}</td>
												<td>${patient.patientLname}</td>
												<td>${patient.patientDob}</td>
												<td><input name="maritalStatus" type="text" class="readonlyStyle" readonly
													value="${patient.maritalStatus}" /></td>
												<td><input name="ecn" type="text" class="readonlyStyle" readonly
													value="${patient.emergencyContactName}" /></td>
												<td><button type="button" class="btn btn-info btn-xs"
														onClick="">Update</button></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<div class="alert alert-warning">
									<strong>Sorry:</strong> No patient found in the database.
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

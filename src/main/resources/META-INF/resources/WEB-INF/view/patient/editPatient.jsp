<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<!DOCTYPE html>
<html>
<%
    Patient patient = (Patient)request.getAttribute("patient");
%>

<head>
    <meta charset="utf-8">
    <title>AddPatient</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body>
    <%@ include file="../navbar/navbar.jspf" %>

    <form action="${pageContext.request.contextPath}/patient/submitPatient" method="post">
        <div class="container w-100" style="padding: 10px">
            <div class="form-group">
                <input type="hidden" name="patientId" value=<%= patient.getPatientId()%>>
            </div>
            <div class="form-group">
                <label for="attestationID">Attestation ID: </label>
                <input required type="text" pattern="NA|[0-9]{11,11}" required title="Please enter a 11 number attestation ID or enter 'NA'" maxlength="11"
                       class="form-control" id="attestationID" name="attestationID" value=<%= patient.getAttestationID()%>><br>
            </div>
            <div class="form-group">
                <label for="firstName">First name: </label>
                <input required type="text" class="form-control" id="firstName" name="firstName" value=<%= patient.getFirstName()%>><br>
            </div>
            <div class="form-group">
                <label for="lastName">Last name: </label>
                <input required type="text" class="form-control" id="lastName" name="lastName" value=<%= patient.getLastName()%>><br>
            </div>
            <div class="form-group">
                <label for="country">Country: </label>
                <input required type="text" class="form-control" id="country" name="country" value=<%= patient.getCountry()%>><br>
            </div>
            <div class="form-group">
                <label for="location">Location: </label>
                <input required type="text" class="form-control" id="location" name="location" value=<%= patient.getLocation()%>><br>
            </div>
            <button type="submit" value="Submit"> Create </button>
            <p id="status"></p>
            <p id="patientInfo"></p>
        </div>
        <input type="hidden" name="action" value="edit"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</body>


</html>
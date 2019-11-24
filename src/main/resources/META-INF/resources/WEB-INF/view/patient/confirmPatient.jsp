<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<!DOCTYPE html>
<html>

<%
    Patient patient = (Patient)request.getAttribute("patient");
    String action = (String)request.getAttribute("action");
%>

<head>
    <meta charset="utf-8">
    <title>Add Patient</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<script>
    function getPatientIdByAddOrEdit() {
        if (<%= action.equals("edit")%>) {
            return <%= patient.getPatientId()%>
        } else if (<%= action.equals("add")%>) {
            return null;
        }
        return null;
    }
    document.getElementById('patientId').value = getPatientIdByAddOrEdit();
</script>

<body>
    <%@ include file="../navbar.jspf" %>
    <div class="row">
        <div class="col-sm-3">Attestation:</div>
        <div class="col-sm-8"><%= patient.getAttestationID()%></div>
    </div>
    <div class="row">
        <div class="col-sm-3">First Name:</div>
        <div class="col-sm-8"><%= patient.getFirstName()%></div>
    </div>
    <div class="row">
        <div class="col-sm-3">Last Name:</div>
        <div class="col-sm-8"><%= patient.getLastName()%></div>
    </div>
    <div class="row">
        <div class="col-sm-3">Country:</div>
        <div class="col-sm-9"><%= patient.getCountry()%></div>
    </div>
    <div class="row">
        <div class="col-sm-3">Location:</div>
        <div class="col-sm-9"><%= patient.getLocation()%></div>
    </div>
    <div class="row">
        <form id="submit" action="${pageContext.request.contextPath}/patient/submitPatient" method="post">
            <input type="hidden" id="action" name="action" value=<%= action%>>
            <input type="hidden" id="patientId" name="patientId" value="">
            <input type="hidden" id="attestationID" name="attestationID" value=<%= patient.getAttestationID()%>>
            <input type="hidden" id="firstName" name="firstName" value=<%= patient.getFirstName()%>>
            <input type="hidden" id="lastName" name="lastName" value=<%= patient.getLastName()%>>
            <input type="hidden" id="country" name="country" value=<%= patient.getCountry()%>>
            <input type="hidden" id="location" name="location" value=<%= patient.getLocation()%>>
            <button type="submit" onclick="return true" class="btn btn-primary">
                Save
            </button>

            <input type = "hidden" name = "${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

</body>


</html>
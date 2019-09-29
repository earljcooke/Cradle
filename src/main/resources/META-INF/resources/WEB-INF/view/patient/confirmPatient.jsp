<%@ page import="com.mercury.TeamMercuryCradlePlatform.Model.Patient" %>
<!DOCTYPE html>
<html>
<%
    Patient patient = (Patient)request.getAttribute("patient");
%>

<head>
    <meta charset="utf-8">
    <title>AddPatient</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
    </script>
</head>

<body>
<%@ include file="../navbar.jspf" %>
</body>

<body>
    <p>  <%= patient.getFirstName()%></p>
    <p>  <%= patient.getLastName()%></p>
    <p>  <%= patient.getCountry()%></p>
    <p>  <%= patient.getLocation()%></p>
</body>


</html>
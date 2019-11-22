<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Patients</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-patients.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<script>
    function deleteRow(patientId) {
        var isConfirmed = confirm("Are you sure you want to delete " + patientId + "?");
        return isConfirmed;
    }
</script>
<%
    List<Patient> patientList = (List<Patient>)request.getAttribute("patientList");
%>
<body>

    <div class="main-container">
        <%@ include file="../navbar/navbar.jspf" %>


        <div class="content-container">
            <div class="content-header">
              View Patients
            </div>
            <div class="content-body">
              <div class="table-container">
                <table class="table view-patients-table">
                <thead>
                <tr>
                    <th scope="col">ATTESTATION ID</th>
                    <th scope="col">FIRST NAME</th>
                    <th scope="col">LAST NAME</th>
                    <th scope="col">COUNTRY</th>
                    <th scope="col">LOCATION</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="<%=patientList%>" var = "patient">
                    <tr>
                        <td class="table-row-id">${patient.attestationID}</th>
                        <td>${patient.firstName}</td>
                        <td>${patient.lastName}</td>
                        <td>${patient.country}</td>
                        <td>${patient.location}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/patient/editPatient" method="post">
                                <input type="hidden" name="patientId" value=${patient.patientId}>
                                <input type="hidden" name="attestationID" value=${patient.attestationID}>
                                <input type="hidden" name="firstName" value=${patient.firstName}>
                                <input type="hidden" name="lastName" value=${patient.lastName}>
                                <input type="hidden" name="country" value=${patient.country}>
                                <input type="hidden" name="location" value=${patient.location}>
                                <button type="submit" value="submit" class="glyphicon glyphicon-pencil table-icon btn-no-style"  title="Edit"></button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/patient/delete" method="post">
                                <input type="hidden" name="patientId" value=${patient.patientId}>
                                <input type="hidden" name="attestationID" value=${patient.attestationID}>
                                <input type="hidden" name="firstName" value=${patient.firstName}>
                                <input type="hidden" name="lastName" value=${patient.lastName}>
                                <input type="hidden" name="country" value=${patient.country}>
                                <input type="hidden" name="location" value=${patient.location}>
                                <button type="submit" value="submit" class="glyphicon glyphicon-trash table-icon btn-no-style"
                                        onclick="return confirm('Are you sure you want to delete ' + ${patient.attestationID}
                                        + '?') "
                                 title="Delete"></button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/reading/all/${patient.patientId}" method="get">
                                <button type="submit" value="submit" class="glyphicon glyphicon-signal table-icon btn-no-style" title="Readings"></button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </td>
    
                    </tr>
                </c:forEach>
                </tbody>
            </table>
          </div>
          </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>
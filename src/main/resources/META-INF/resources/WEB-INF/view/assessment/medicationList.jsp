<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Medication" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prescription List</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="/css/patient.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-referrals.css"/>
    <link rel="stylesheet" href="https://printjs-4de6.kxcdn.com/print.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src= "https://printjs-4de6.kxcdn.com/print.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <script src="/js/printMed.js"></script>

</head>

<%
    List<Medication> medicationList = (List<Medication>)request.getAttribute("medicationList");
    String patientName = (String) request.getAttribute("patientName");
%>

<body>
<div class="main-container">

    <%@ include file="../navbar/navbar.jspf" %>

    <div class="content-container">
        <div class="content-header">
            Prescription List for <%=patientName%>
        </div>
        <div class="content-body">
            <div class="table-container">
                <table id="medicationTable" class="table view-users-table">
                    <thead>
                    <tr>
                        <th style="width: 5%" scope="col">ID</th>
                        <th style="width: 15%" scope="col">NAME</th>
                        <th style="width: 15%" scope="col">DOSE</th>
                        <th style="width: 10%" scope="col">START DATE</th>
                        <th style="width: 15%" scope="col">PERIOD OF CONSUMPTION</th>
                        <th style="width: 10%" scope="col">FINISH DATE</th>
                        <th style="width: 30%" scope="col">SIDE EFFECTS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="<%=medicationList%>" var = "medication">
                    <tr>
                        <td  class="table-row-id">${medication.medicationId}</td>
                        <td > <strong> ${medication.medicationName} </strong> </td>
                        <td>${medication.dose} ${medication.doseUnits}</td>
                        <td>${medication.startDate}</td>
                        <td>${medication.periodOfConsumption} days</td>
                        <td>${medication.finishDate}</td>
                        <td>${medication.sideEffects}</td>
                        </c:forEach>
                    </tbody>
                </table>
                <button style="float: right"  id="print" type="button" class="icon ion-3x ion-md-print table-icon btn-no-style"
                        title="Print Prescription List" onclick="printTable()"></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

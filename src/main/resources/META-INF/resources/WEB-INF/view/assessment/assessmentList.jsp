<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Assessment" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assessment List</title>

    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="/css/patient.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-referrals.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="/js/assessmentList.js"></script>

</head>

<%
    List<Assessment> assessmentList = (List<Assessment>)request.getAttribute("assessmentList");
%>

<body>
<div class="main-container">

    <%@ include file="../navbar/navbar.jspf" %>

    <div class="content-container">
        <div class="content-header">
            View Assessments
        </div>
        <div class="content-body">
            <div class="table-container">
                <input class="form-control w-25" type="text" id="searchAssessmentInput" onkeyup="searchPatient()" placeholder="Search Patient" aria-label="Search">
                <table id="assessmentTable" class="table view-users-table">
                    <thead>
                    <tr>
                        <th style="width: 5%" scope="col">ID</th>
                        <th style="width: 10%" scope="col">PATIENT</th>
                        <th style="width: 50%" scope="col">DIAGNOSIS</th>
                        <th style="width: 30%" scope="col">NOTES</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="<%=assessmentList%>" var = "assessment">
                    <tr>
                        <td  class="table-row-id">${assessment.assessmentId}</td>
                        <td > <strong> ${assessment.referral.firstName} ${assessment.referral.lastName} </strong> </td>
                        <td >${assessment.diagnosis}</td>
                        <td >${assessment.notes}</td>
                        <td >
                            <form action="${pageContext.request.contextPath}/assessment/medicationList/${assessment.assessmentId}" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="fas fa-file-prescription table-icon btn-no-style" title="View Prescription List"></button>
                            </form>
                        </td>
                        <td >
                            <form action="${pageContext.request.contextPath}/assessment/deleteAssessment/${assessment.assessmentId}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button style="color: darkred" type="submit" class="glyphicon glyphicon-trash table-icon btn-no-style"
                                        title="Delete Assessment" onclick="return confirm('Do you want to delete this assessment?');"></button>
                            </form>
                        </td>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>

</html>

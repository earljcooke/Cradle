<%@ page import="java.util.List" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<%
    List<Reading> readingList = (List<Reading>) request.getAttribute("readingList");
%>

<head>
    <meta charset="utf-8">
    <title>Readings</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>

<%@ include file="../navbar.jspf" %>

    <div class="container-fluid">
        <br>
        <input class="form-control w-25" type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search" aria-label="Search">
        <table class="table" id="readingsTable">
            <thead>
            <tr>
                <th scope="col">Reading ID</th>
                <th scope="col">First name</th>
                <th scope="col">Last name</th>
                <th scope="col">Age</th>
                <th scope="col">Symptoms</th>
                <th scope="col">Gestational Age</th>
                <th scope="col">Blood Pressure</th>
                <th scope="col">Heart Rate</th>
                <th scope="col">Traffic light(change)</th>
                <th scope="col">Advice</th>
                <th scope="col">Time Taken</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="<%=readingList%>" var = "reading">
                <tr>
                    <th>${reading.readingId}</th>
                    <td>${reading.firstName}</td>
                    <td>${reading.lastName}</td>
                    <td>${reading.ageYears}</td>
                    <td>
                        <c:forEach items="${reading.symptoms}" var = "symptom">
                            ${symptom}
                            <br>
                        </c:forEach>
                    </td>
                    <td>${reading.gestationWeekDaysString}</td>
                    <td>${reading.bpSystolic}/${reading.bpDiastolic}</td>
                    <td>${reading.heartRateBPM}</td>
                    <td>
                        <img src="/images/${ReadingAnalysis.analyze(reading).trafficLightImg}.png" alt="Traffic Light">
                        <c:if test="${not empty ReadingAnalysis.analyze(reading).arrowDirection}">
                            <img src="/images/${ReadingAnalysis.analyze(reading).arrowDirection}.png" alt="Arrow Direction">
                        </c:if>
                    </td>
                    <td>
                        ${ReadingAnalysis.analyze(reading).briefText}
                        <br>
                        ${ReadingAnalysis.analyze(reading).analysisText}
                    </td>
                    <td>${reading.timeYYYYMMDD}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/reading/edit/${reading.readingId}" method="get">
                            <button type="submit" class="btn btn-secondary">Edit</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>

<script>

    $(document).ready(function(){
        $("#searchInput").on("keyup", function() {
            const value = $(this).val().toLowerCase();
            $("#readingsTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>

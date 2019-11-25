<%@ page import="java.util.List" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Patients</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/patient.css"/>
    <link rel="stylesheet" type="text/css" href="/css/readings-table.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<script>
    function deleteRow(patientId) {
        var isConfirmed = confirm("Are you sure you want to delete " + patientId + "?");
        return isConfirmed;
    }
</script>
<%
    List<Reading> readingList = (List<Reading>) request.getAttribute("readingList");
    int i = 0;
%>
<body>

<style>
    .padding-0 {
        padding-right: 0;
        padding-left: 0;
    }
</style>

<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>

    <div class="content-container">
        <div class="content-header">
            Readings
        </div>
        <div class="content-body">
            <div class="table-container">
                <table id="readingsTable" class="table">
                    <thead>
                    <tr>
                            <th scope="col"></th>

                        <th scope="col">NAME</th>
                        <th scope="col">AGE</th>
                        <th scope="col">STATUS</th>
                        <th scope="col">TIME TAKEN</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="<%=readingList%>" var="reading">
                        <tr data-toggle="collapse" data-target=".<%=i%>" onclick="changeIcon(<%=i%>)" style="border-top: 1px solid #dee2e6;">
                            <td class="td-element">
                                <span id="glyphicon-<%=i%>" class="glyphicon glyphicon-plus" style="font-size:25px; margin-left: 10px; color: rgb(14, 168, 130)"></span>
                            </td>
                            <td class="td-element">${reading.firstName} ${reading.lastName}</td>
                            <td class="td-element">${reading.ageYears}</td>
                            <td>
                                <img src="/images/${ReadingAnalysis.analyze(reading).trafficLightImg}.png"
                                     alt="Traffic Light">
                                <c:if test="${not empty ReadingAnalysis.analyze(reading).arrowDirection}">
                                    <img src="/images/${ReadingAnalysis.analyze(reading).arrowDirection}.png"
                                         alt="Arrow Direction">
                                </c:if>
                            </td>
                            <td class="td-element">${reading.timeYYYYMMDD}</td>
                            <td class="td-element">
                                <c:if test="${reading.dateRecheckVitalsNeeded != null }">
                                    <span class="glyphicon glyphicon-warning-sign"></span>
                                    <p> Recheck vitals now</p>
                                </c:if>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="6" class="hiddenRow">
                                <div class="collapse <%=i++%>">
                                    <div class="expand-container">
                                            <div class="details-container">
                                                <div class="form-group row">
                                                <div class="col-sm-6">
                                  
                              
                                                <div class="form-group row">
                                                        <span class="col-sm-4 referral-label text-md-left">NAME</span>
                                                        <span class ="col-sm-7">${reading.firstName} ${reading.lastName}</span>
                                                </div>
                              
                                                <div class="form-group row">
                                                        <span class="col-sm-4 referral-label text-md-left">AGE</span>
                                                        <span class ="col-sm-7">${reading.ageYears}y</span>
                                                </div>
                              
                                                <div class="form-group row">
                                                        <span class="col-sm-4 referral-label text-md-left">GESTATIONAL AGE</span>
                                                        <span class ="col-sm-7">@${reading.gestationWeekDaysString}</span>
                                                </div>
                                                </div>
                              
                                                <div class="col-sm-6">
                                                        <div class="form-group row">
                                                                <span class="col-sm-4 referral-label text-md-left">DIASTOLIC</span>
                                                                <span class ="col-sm-7 ">${reading.bpSystolic}/${reading.bpDiastolic}</span>
                                                        </div>
                                    
                                                        <div class="form-group row">
                                                                <span class="col-sm-4 referral-label text-md-left">HEART RATE</span>
                                                                <span class ="col-sm-7">${reading.heartRateBPM}</span>
                                                        </div>
                                                        <div class="form-group row">
                                                                <span class="col-sm-4 referral-label text-md-left">ADVICE</span>
                                                                <span class ="col-sm-7 ">${ReadingAnalysis.analyze(reading).briefText}</span>
                                                        </div>
                                                </div>



                                                
                                                </div>
                                                <div class="form-group row">
                                                        <div class="col-sm-2 offset-sm-2  text-center">
                                                            <c:if test="${reading.dateRecheckVitalsNeeded != null }">
                                                                <form action="${pageContext.request.contextPath}/reading/retest/${reading.readingId}"
                                                                      method="get">
                                                                    <button type="submit" class="btn-generic">Recheck
                                                                        vitals
                                                                    </button>
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                           value="${_csrf.token}"/>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${reading.dateRecheckVitalsNeeded == null }">
                                                                <form action="${pageContext.request.contextPath}/reading/retest/${reading.readingId}"
                                                                      method="get">
                                                                    <button type="submit" class="btn-generic-disabled" disabled>Recheck
                                                                        vitals
                                                                    </button>
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                           value="${_csrf.token}"/>
                                                                </form>
                                                            </c:if>
                                                        </div>
                                                        <div class="col-sm-2 text-center">
        
                                                            <form action="${pageContext.request.contextPath}/reading/edit/${reading.readingId}"
                                                                  method="get">
                                                                <button type="submit" class="btn-generic">Edit</button>
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                       value="${_csrf.token}"/>
                                                            </form>
                                                        </div>
                                                        <div class="col-sm-2  text-center">
                                                            <form action="${pageContext.request.contextPath}/statistics/blood-pressure-graph/${reading.patientId}"
                                                                  method="get">
                                                                <button type="submit" class="btn-generic">Statistics
                                                                </button>
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                       value="${_csrf.token}"/>
                                                            </form>
                                                        </div>
                                                    </div>
                                            </div>
                                    
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
<script>


    $('.collapse').each(function () {
        if ($(this).hasClass('in')) {
            $(this).collapse('toggle');
        }
    });

    function changeIcon(i) {

        const spans = document.getElementById('glyphicon-' + i);

        if (spans.classList.contains("glyphicon-plus")) {
            spans.className = "glyphicon glyphicon-minus";
        } else {
            spans.className = "glyphicon glyphicon-plus";
        }

    }


</script>

</html>

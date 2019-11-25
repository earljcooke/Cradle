<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.Strings" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<%
    Reading reading = (Reading) request.getAttribute("reading");
%>

<head>
    <meta charset="utf-8">
    <title>Analysis</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/patient.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="/css/create-reading.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>


<style>
    .padding-0 {
        padding-right: 0;
        padding-left: 0;
    }
</style>

<body>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>

    <div class="content-container">
        <div class="content-header">
            Analysis
        </div>
        <div class="content-body" style="margin-top: 0; margin-left: 0; padding: 0; width: 50%">
            <div class="create-reading-container">
                <div class="row">
                    <h2><%= reading.firstName + " " + reading.lastName + ", " + reading.ageYears + "y" + " @ " + reading.getGestationWeekDaysString()%>
                    </h2>
                </div>
                <div class="row">
                    <p><%= reading.getSymptomsString()%>
                    </p>
                </div>
                <div class="row">
                    <h2><%= reading.getTimeTakenAmPm() + ": " + ReadingAnalysis.analyze(reading).getAnalysisText()%>
                    </h2>
                </div>
                <div class="row">
                    <div class="col">
                        <p><%= "BP: " + reading.bpSystolic + "/" + reading.bpDiastolic%>
                        </p>
                        <p><%= "HR: " + reading.heartRateBPM %>
                        </p>
                    </div>
                    <div class="col">
                        <img src="/images/<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>.png"
                             alt="<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>">
                        <c:if test="<%= ReadingAnalysis.analyze(reading).getArrowDirection() != null %>">
                            <img src="/images/<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>.png"
                                 alt="<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>">
                        </c:if>
                    </div>
                </div>
                <div class="row">
                    <h2> Advice</h2>
                </div>
                <div class="row">
                    <p> <%=ReadingAnalysis.analyze(reading).getBriefText()%>
                </div>
                <div class="row">
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="recheckVitals15">
                        <label class="custom-control-label" for="recheckVitals15"> Recheck vitals in 15 minutes (after
                            save)</label>
                    </div>
                </div>
                <div class="row">
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="recheckVitalsNow">
                        <label class="custom-control-label" for="recheckVitalsNow">Recheck vitals now(after
                            save)</label>
                    </div>
                </div>

                <div class="container mt-4">
                    <div class="m-2">
                        <form name="ReadingForm"
                              action="${pageContext.request.contextPath}/reading/retest/analysis/save"
                              method="post">
                            <input type="hidden" name="firstName" value="<%=reading.firstName%>"/>
                            <input type="hidden" name="lastName" value="<%=reading.lastName%>"/>
                            <input type="hidden" name="ageYears" value="<%=reading.ageYears%>"/>
                            <input type="hidden" name="symptoms" value="<%=reading.symptomsString%>"/>
                            <input type="hidden" name="gestationalAgeUnit" value="<%=reading.gestationalAgeUnit%>"/>
                            <input type="hidden" name="gestationalAgeValue" value="<%=reading.gestationalAgeValue%>"/>
                            <input type="hidden" name="bpSystolic" value="<%=reading.bpSystolic%>"/>
                            <input type="hidden" name="bpDiastolic" value="<%=reading.bpDiastolic%>"/>
                            <input type="hidden" name="heartRateBPM" value="<%=reading.heartRateBPM%>"/>
                            <input type="hidden" name="dateTimeTaken" value="<%=reading.dateTimeTaken.toString()%>"/>
                            <input type="hidden" name="saveByReferral" id="saveByReferral" value="">
                            <button class="btn-generic" type="submit" id="primaryButton"> Save</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>


    function editButton() {
        window.history.back();
    }

    function triggerButton() {
        document.getElementById('saveByReferral').value = 'true';
        document.getElementById('primaryButton').click();
    }

</script>

</html>
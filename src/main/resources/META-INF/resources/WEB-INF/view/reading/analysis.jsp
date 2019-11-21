<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <%
       Reading reading = (Reading)request.getAttribute("reading");
    %>

<head>
    <meta charset="utf-8">
    <title>Edit Reading</title>
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

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
           Analysis
        </div>
        <div class="content-body">
            <div class="edit-patient-container">

            <h2> <%= reading.firstName + " " + reading.lastName + ", " + reading.ageYears + "y" + " @ " + reading.getGestationWeekDaysString()%></h2>
            <p> <%= reading.getSymptomsString()%></p>
            <h2> <%= reading.getTimeTakenAmPm() + ": " + ReadingAnalysis.analyze(reading).getAnalysisText()%></h2>

            <div class="content-container">
                <div class="row">
                    <div class="col">
                        <p> <%= "BP: " + reading.bpSystolic + "/" + reading.bpDiastolic%></p>
                        <p> <%= "HR: " + reading.heartRateBPM %></p>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <img src="/images/<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>.png" alt="<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>">
                            </div>
                            <div class="col">
                                <c:if test="<%= ReadingAnalysis.analyze(reading).getArrowDirection() != null %>">
                                    <img src="/images/<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>.png" alt="<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>">
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <br>
                <br>
                <br>
                <br>
            <h2> Advice</h2>
            <p> <%=ReadingAnalysis.analyze(reading).getBriefText()%></p>

            <div class="custom-control custom-switch">
                <input checked type="checkbox" class="custom-control-input" id="recheckVitalsNow">
                <label class="custom-control-label" for="recheckVitalsNow">Recheck vitals now(after save)</label>
            </div>

            <div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="recheckVitals15">
                <label class="custom-control-label" for="recheckVitals15"> Recheck vitals in 15 minutes (after save)</label>
            </div>



            <h2> Not referred</h2>
            <p> <%= ReadingAnalysis.analyze(reading).isReferralToHealthCentreRecommended()? "Referral recommended" : "Referral not recommended"%>
                <%
                    session.setAttribute("firstName",reading.firstName);
                    session.setAttribute("lastName", reading.lastName);
                    session.setAttribute("ageYears", reading.ageYears);
                    session.setAttribute("symptoms", reading.symptomsString);
                    session.setAttribute("bpSystolic", reading.bpSystolic);
                    session.setAttribute("bpDiastolic", reading.bpDiastolic);
                    session.setAttribute("heartRateBPM", reading.heartRateBPM);
                    session.setAttribute("dateTimeTaken", reading.dateTimeTaken.toString());
                    session.setAttribute("gestationalAgeUnit", reading.gestationalAgeUnit);
                    session.setAttribute("gestationalAgeValue", reading.gestationalAgeValue);

                    session.setAttribute("analysis", ReadingAnalysis.analyze(reading).name());
                %>

                <button type="button" id="secondaryButton" onclick="triggerButton()">
                    Send referral
                </button>
            </p>


            <div class="custom-control custom-switch">
                <input checked type="checkbox" class="custom-control-input" id="followUp">
                <label class="custom-control-label" for="followUp"> Follow-up needed (another day)</label>
            </div>
            <p> Follow-up <%= reading.isFlaggedForFollowup()? "recommended" : "not recommended"%></p>

            <button type="button" onclick="editButton()"> Edit </button>
            <form name="ReadingForm" action="${pageContext.request.contextPath}/reading/analysis/save" method="post">
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
                <button type="submit" id="primaryButton" > Save </button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
        </div>
    </div>
</body>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%
    Long referralReadingId = (Long)session.getAttribute("readingId");
    String firstName = (String)session.getAttribute("firstName");
    String lastName = (String)session.getAttribute("lastName");
    Integer ageYears = (Integer)session.getAttribute("ageYears");
    Integer bpSystolic = (Integer)session.getAttribute("bpSystolic");
    Integer bpDiastolic = (Integer)session.getAttribute("bpDiastolic");
    Integer heartRateBPM = (Integer)session.getAttribute("heartRateBPM");
    String analysis = (String)session.getAttribute("analysis");
%>

    <head>

    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>

        <%@ include file="../navbar.jspf" %>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <form action="${pageContext.request.contextPath}/referral/confirmReferral" method="post">
            <div class="container w-100" style="padding: 10px">
                <div class="form-group">
                    <label for="referredHealthCentre">Health Centre referred to: </label>
                    <input type="text" class="form-control" id="referredHealthCentre" name="referredHealthCentre"><br>
                </div>

                <%--Patient Info--%>
                <div class="form-group">
                    <label for="referralReadingId">Reading ID: </label>
                    <input type="text" class="form-control" id="referralReadingId" name="referralReadingId" value="<%=referralReadingId%>"><br>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name: </label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="<%=firstName%>"><br>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name: </label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%=lastName%>"><br>
                </div>
                <div class="form-group">
                    <label for="ageYears">Age: </label>
                    <input type="number" class="form-control" id="ageYears" name="ageYears" value="<%=ageYears%>"><br>
                </div>

                <div class="form-group">
                    <label for="sex"></label>
                    <select class="form-control" id="sex" name="sex">
                        <option value="FEMALE">FEMALE</option>
                        <option value="MALE">MALE</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="zoneNumber">Zone Number: </label>
                    <input type="number" class="form-control" id="zoneNumber" name="zoneNumber"><br>
                </div>
                <div class="form-group">
                    <label for="blockNumber">Block Number: </label>
                    <input type="number" class="form-control" id="blockNumber" name="blockNumber"><br>
                </div>
                <div class="form-group">
                    <label for="tankNumber">Tank Number: </label>
                    <input type="number" class="form-control" id="tankNumber" name="tankNumber"><br>
                </div>
                <div class="form-group">
                    <label for="villageNumber">Village Number: </label>
                    <input type="number" class="form-control" id="villageNumber" name="villageNumber"><br>
                </div>
                <div class="form-group">
                    <label for="householdNumber">Household Number: </label>
                    <input type="number" class="form-control" id="householdNumber" name="householdNumber"><br>
                </div>
                <div class="form-group">
                    <label for="bpSystolic">Blood Pressure Systolic: </label>
                    <input type="number" class="form-control" id="bpSystolic" name="bpSystolic" value="<%=bpSystolic%>"><br>
                </div>
                <div class="form-group">
                    <label for="bpDiastolic">Blood Pressure Diastolic: </label>
                    <input type="number" class="form-control" id="bpDiastolic" name="bpDiastolic" value="<%=bpDiastolic%>"><br>
                </div>
                <div class="form-group">
                    <label for="heartRateBPM">Heart Rate: </label>
                    <input type="number" class="form-control" id="heartRateBPM" name="heartRateBPM" value="<%=heartRateBPM%>"><br>
                </div>
                <div class="form-group">
                    <label for="analysis">Reading Analysis: </label>
                    <input type="text" class="form-control" id="analysis" name="analysis" value="<%=analysis%>"><br>
                </div>
                <%--vht--%>
                <div class="form-group">
                    <label for="vhtName">Name of VHT: </label>
                    <input type="text" class="form-control" id="vhtName" name="vhtName"><br>
                </div>
                <%--referral reason--%>
                <div class="form-group">
                    <label for="reasonOfReferral">I have referred to you this patient for this following reasons: </label>
                    <input type="text" class="form-control" id="reasonOfReferral" name="reasonOfReferral"><br>
                </div>
                <%--action taken--%>
                <div class="form-group">
                    <label for="actionAlreadyTaken">Action already taken: </label>
                    <input type="text" class="form-control" id="actionAlreadyTaken" name="actionAlreadyTaken"><br>
                </div>
                <%--other message--%>
                <div class="form-group">
                    <label for="otherInfoMessage">Other Information and Messages: </label>
                    <input type="text" class="form-control" id="otherInfoMessage" name="otherInfoMessage"><br>
                </div>

                <button type="submit" value="Submit"> Submit </button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

    </body>


</html>
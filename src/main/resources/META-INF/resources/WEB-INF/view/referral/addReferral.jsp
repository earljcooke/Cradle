<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%
    String firstName = (String) session.getAttribute("firstName");
    String lastName = (String) session.getAttribute("lastName");
    Integer ageYears = (Integer) session.getAttribute("ageYears");
    Integer bpSystolic = (Integer) session.getAttribute("bpSystolic");
    Integer bpDiastolic = (Integer) session.getAttribute("bpDiastolic");
    Integer heartRateBPM = (Integer) session.getAttribute("heartRateBPM");
    String analysis = (String) session.getAttribute("analysis");
%>

<head>

    <meta charset="utf-8">
    <title>AddReferral</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

</head>
<body>

<%@ include file="../navbar/navbar.jspf" %>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<form action="${pageContext.request.contextPath}/referral/confirmReferral" method="post">
    <div class="container w-100" style="padding: 10px">
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="referredHealthCentre">Health Centre referred to: </label>
                    <input required type="text" class="form-control" id="referredHealthCentre"
                           name="referredHealthCentre"><br>
                </div>

                <%--vht--%>
                <div class="col">
                    <label for="vhtName">Name of VHT: </label>
                    <input required type="text" class="form-control" id="vhtName" name="vhtName"><br>
                </div>
            </div>
        </div>

        <%--Patient Info--%>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="firstName">First Name: </label>
                    <input required type="text" class="form-control" id="firstName" name="firstName" disabled
                           value="<%=firstName%>"><br>
                </div>
                <div class="col">
                    <label for="lastName">Last Name: </label>
                    <input required type="text" class="form-control" id="lastName" name="lastName" disabled
                           value="<%=lastName%>"><br>
                </div>
                <div class="col">
                    <label for="ageYears">Age: </label>
                    <input required type="number" class="form-control" id="ageYears" name="ageYears" disabled
                           value="<%=ageYears%>"><br>
                </div>
                <div class="col">
                    <label for="sex">Sex: </label>
                    <select class="form-control" id="sex" name="sex">
                        <option value="FEMALE">FEMALE</option>
                        <option value="MALE">MALE</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="zoneNumber">Zone Number: </label>
                    <input type="number" class="form-control" id="zoneNumber" name="zoneNumber" required="required"
                           pattern="[0-9]{1,5}">
                </div>
                <div class="col">
                    <label for="villageNumber">Village Number: </label>
                    <input type="number" class="form-control" id="villageNumber" name="villageNumber"
                           required="required" pattern="[0-9]{1,5}">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="bpSystolic">Blood Pressure Systolic: </label>
                    <input type="number" class="form-control" id="bpSystolic" name="bpSystolic" disabled
                           value="<%=bpSystolic%>">
                </div>
                <div class="col">
                    <label for="bpDiastolic">Blood Pressure Diastolic: </label>
                    <input type="number" class="form-control" id="bpDiastolic" name="bpDiastolic" disabled
                           value="<%=bpDiastolic%>">
                </div>
                <div class="col">
                    <label for="heartRateBPM">Heart Rate: </label>
                    <input type="number" class="form-control" id="heartRateBPM" name="heartRateBPM" disabled
                           value="<%=heartRateBPM%>">
                </div>
                <div class="col">
                    <label for="analysis">Reading Analysis: </label>
                    <input type="text" class="form-control" id="analysis" name="analysis" disabled
                           value="<%=analysis%>">
                </div>
            </div>
        </div>

        <%--referral reason--%>
        <div class="form-group">
            <label for="reasonOfReferral">I have referred to you this patient for this following reasons: </label>
            <input required type="text" class="form-control" id="reasonOfReferral" name="reasonOfReferral"><br>
        </div>
        <%--action taken--%>
        <div class="form-group">
            <label for="actionAlreadyTaken">Action already taken: </label>
            <input required type="text" class="form-control" id="actionAlreadyTaken" name="actionAlreadyTaken"><br>
        </div>
        <%--other message--%>
        <div class="form-group">
            <label for="otherInfoMessage">Other Information and Messages: </label>
            <input required type="text" class="form-control" id="otherInfoMessage" name="otherInfoMessage"><br>
        </div>

        <button type="submit" value="Submit"> Submit</button>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

</body>
</html>
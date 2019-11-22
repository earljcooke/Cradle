<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.Strings" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Create Reading</title>
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
<%@ include file="../navbar/navbar.jspf" %>
<div class="content-container">
    <div class="content-header">
        Create a new reading
    </div>
    <div class="content-body">
        <div class="edit-patient-container">
            <form action="${pageContext.request.contextPath}/reading/analysis" method="post" id="form">
                <div class="form-group">
                    <div class="row">
                        <div class="col">
                            <label for="readingId">ID number</label>
                            <input required type="text" class="form-control" id="readingId" name="readingId">
                        </div>
                        <div class="col">
                            <label for="firstName">First Name</label>
                            <input required type="text" class="form-control" id="firstName" name="firstName">
                        </div>
                        <div class="col">
                            <label for="lastName">Last Name</label>
                            <input required type="text" class="form-control" id="lastName" name="lastName">
                        </div>
                        <div class="col">
                            <label for="ageYears">Age</label>
                            <input required type="number" min="0" class="form-control" id="ageYears" name="ageYears">
                        </div>
                    </div>
                    <div class="row" style="width: 25%;  margin-top: 5px" >
                        <div class="col">
                            <label for="gestationalAgeValue">Gestational Age</label>
                            <input required type="number" min="0" class="form-control" id="gestationalAgeValue" name="gestationalAgeValue">
                        </div>
                    </div>


                    <div class="form-group" style="width: 25%">
                        <label for="gestationalAgeUnit"></label>
                        <select class="form-control" id="gestationalAgeUnit" name="gestationalAgeUnit" onchange="gestationalAgeUnitChange()">
                            <option value="Weeks">Weeks</option>
                            <option value="Months">Months</option>
                            <option value="Not Pregnant">Not Pregnant</option>
                        </select>
                    </div>
                </div>
                <div class="form-group" style="width: 25%">
                    <label for="health"></label>
                    <select class="form-control" id="health" name="health" onchange="healthChange()">
                        <option value="sick">Patient is sick</option>
                        <option value="healthy">Patient is healthy</option>
                    </select>
                </div>
                <div class="form-group" id="symptomsSelectorDiv">
                    <ul class="list-unstyled">
                        <li>
                            <label>
                                <input type="checkbox" name="symptoms" value="<%=Strings.SYMPTOM_HEADACHE%>"> <%=Strings.SYMPTOM_HEADACHE%>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="symptoms" value="<%=Strings.SYMPTOM_BLURRED_VISION%>"> <%=Strings.SYMPTOM_BLURRED_VISION%>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="symptoms" value="<%=Strings.SYMPTOM_ABDOMINAL_PAIN%>"> <%=Strings.SYMPTOM_ABDOMINAL_PAIN%>

                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="symptoms" value=<%=Strings.SYMPTOM_BLEEDING%>> <%=Strings.SYMPTOM_BLEEDING%>
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="checkbox" name="symptoms" value="<%=Strings.SYMPTOM_FEVERISH%>"> <%=Strings.SYMPTOM_FEVERISH%>
                            </label>
                        </li>
                        <li><label>
                            <input type="checkbox" name="symptoms" value="<%=Strings.SYMPTOM_UNWELL%>"> <%=Strings.SYMPTOM_UNWELL%>
                        </label>
                        </li>
                    </ul>
                </div>
                <div class="form-group">
                    <label for="otherSymptoms">Other symptoms</label>
                    <textarea class="form-control" id="otherSymptoms" name="otherSymptoms" rows="2" maxlength="200"></textarea>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col">
                            <label for="bpSystolic">Systolic</label>
                            <input required type="number" min="10" max="300" class="form-control" id="bpSystolic" name="bpSystolic"/>
                        </div>
                        <div class="col">
                            <label for="bpDiastolic">Diastolic</label>
                            <input required type="number" min="10" max="300" class="form-control" id="bpDiastolic" name="bpDiastolic">
                        </div>
                        <div class="col">
                            <label for="heartRateBPM">Heart rate</label>
                            <input required type="number" min="40" max="200" class="form-control" id="heartRateBPM" name="heartRateBPM">
                        </div>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="form-group" type="submit" value="Submit" id="submitButton">
            </form>
            <label for="backButtonState"></label>
            <input id="backButtonState" type="text" value="0" style="display:none;" />
        </div>
    </div>
</div>
</body>


<script>
        document.addEventListener('DOMContentLoaded', function () {
            var backButton = document.getElementById("backButtonState");
            if (backButton.value === "0") {
                backButton.value = "1";
            } else {
                // Back button pressed
                gestationalAgeUnitChange();
                healthChange();
            }
        }, false);

        function healthChange() {
            const e = document.getElementById("health");
            const strUser = e.options[e.selectedIndex].value;

            if(strUser === "healthy"){
                $("#symptomsSelectorDiv input").attr('disabled', true);
            }
            else {
                $("#symptomsSelectorDiv input").removeAttr('disabled');
            }

            document.getElementById("otherSymptoms").disabled = strUser === "healthy";
        }

        function gestationalAgeUnitChange() {
            const e = document.getElementById("gestationalAgeUnit");
            const strUser = e.options[e.selectedIndex].value;
            document.getElementById("gestationalAgeValue").disabled = strUser === "<c:out value='<%=Strings.GESTATION_UNIT_NOT_PREGNANT%>'/>";
        }

    </script>

</html>
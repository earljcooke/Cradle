<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.Strings" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.GestationalAgeUnit" %>
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

<%@ include file="../navbar/navbar.jspf" %>
<div class="content-container">
    <div class="content-header">
        Create a new reading
    </div>
    <div class="content-body">
        <div class="edit-patient-container">
        <form action="${pageContext.request.contextPath}/reading/update/<%=reading.readingId%>" method="post" id="form">
            <div class="form-group">
                <div class="row">
                    <input type="hidden" name="id" value="<%=reading.readingId%>"/>
                    <div class="col">
                        <label for="firstName">First Name</label>
                        <input disabled required type="text" class="form-control" value="<%=reading.firstName%>">
                        <input hidden required type="text" class="form-control" id="firstName" name="firstName" value="<%=reading.firstName%>">
                    </div>
                    <div class="col">
                        <label for="lastName">Last Name</label>
                        <input disabled required type="text" class="form-control"  value="<%=reading.lastName%>">
                        <input hidden required type="text" class="form-control" id="lastName" name="lastName" value="<%=reading.lastName%>">
                    </div>
                    <div class="col">
                        <label for="ageYears">Age</label>
                        <input disabled required type="number" min="0" class="form-control" value="<%=reading.ageYears%>">
                        <input hidden required type="number" min="0" class="form-control" id="ageYears" name="ageYears" value="<%=reading.ageYears%>">
                    </div>
                </div>
                <div class="row" style="width: 25%; margin-top: 5px">
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
                        <input required type="number" min="10" max="300" class="form-control" id="bpSystolic" name="bpSystolic" value="<%=reading.bpSystolic%>"/>
                    </div>
                    <div class="col">
                        <label for="bpDiastolic">Diastolic</label>
                        <input required type="number" min="10" max="300" class="form-control" id="bpDiastolic" name="bpDiastolic" value="<%=reading.bpDiastolic%>"/>
                    </div>
                    <div class="col">
                        <label for="heartRateBPM">Heart rate</label>
                        <input required type="number" min="40" max="200" class="form-control" id="heartRateBPM" name="heartRateBPM" value="<%=reading.heartRateBPM%>">
                    </div>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="form-group" type="submit" value="Submit" id="submitButton">
        </form>
        </div>
    </div>
</div>
</body>


<script>

    window.onload = function () {
        selectGestationalUnit();
        selectSymptoms();
    };

    function selectGestationalUnit(){

        let selectedGestationUnit = $("#gestationalAgeUnit");
        let gestationalValue = $("#gestationalAgeValue");
        let val = "<c:out value='<%=reading.gestationalAgeUnit%>'/>"

        if(val ===  "<c:out value='<%=GestationalAgeUnit.GESTATIONAL_AGE_UNITS_WEEKS%>'/>"){
            selectedGestationUnit.prop('selectedIndex', 0);
        }
        else if(val ===  "<c:out value='<%=GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS%>'/>"){
            selectedGestationUnit.prop('selectedIndex', 1);
        }
        else{
            gestationalValue.prop('disabled', true);
            selectedGestationUnit.prop('selectedIndex', 2);
        }
        gestationalValue.val(<%=reading.gestationalAgeValue%>);
    }

    function selectSymptoms(){

        let symptomsArr = "<c:out value='<%=reading.getSymptomsString()%>'/>".split(",");

        if(symptomsArr[0] === "<c:out value='<%=Strings.SYMPTOM_NO_SYMPTOMS%>'/>"){
            document.getElementById("health").selectedIndex = "1";
            healthChange();
        }
        else{
            let symptomsIndex = 0;
            $("#symptomsSelectorDiv input[type=checkbox]").each(function() {
                if (symptomsArr.indexOf($(this).val()) > -1) {
                    $(this).prop('checked', true);
                    symptomsIndex++;
                }
            });

            if(symptomsIndex < symptomsArr.length){
                const slicedArr = symptomsArr.slice(symptomsIndex, symptomsArr.length);
                for(symptomsIndex = 0; symptomsIndex < slicedArr.length; symptomsIndex++){
                    if(symptomsIndex > 0){
                        slicedArr[symptomsIndex] = " " + slicedArr[symptomsIndex];
                    }
                }

                $("#otherSymptoms").val(slicedArr);
            }
        }
    }

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
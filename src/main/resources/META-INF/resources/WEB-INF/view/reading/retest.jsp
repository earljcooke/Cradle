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
    <meta charset="utf-8" />
    <title>Edit Reading</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/edit-readings.css" />
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
    />
</head>

<body>

<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            Edit Reading
        </div>
        <div class="create-reading-container">
            <main class="my-form">
                <div class="container">
                    <form action="${pageContext.request.contextPath}/reading/retest/analysis"
                          method="post"
                          id="form">
                        <input hidden required type="text" class="form-control" id="readingId" name="readingId" value="<%=reading.readingId%>">
                        <div class="form-group row">
                            <div class="col-sm-6 row">
                                <label for="firstName" class="col-sm-4 col-form-label create-reading-label">FIRST NAME</label>
                                <div class="col-sm-7">
                                    <div class="reading-field-uneditable"><%=reading.firstName%></div>
                                    <input hidden required type="text" class="form-control" id="firstName" name="firstName" value="<%=reading.firstName%>">
                                </div>
                            </div>
                            <div class="col-sm-6 row">
                                <label for="lastName" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">LAST NAME</label>
                                <div class="col-sm-7">
                                    <div class="reading-field-uneditable"><%=reading.lastName%></div>
                                    <input hidden required type="text" class="form-control" id="lastName" name="lastName" value="<%=reading.lastName%>">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6 row">
                                <label for="ageYears" class="col-sm-4 col-form-label create-reading-label">AGE</label>
                                <div class="col-sm-7">
                                    <input type="number" id="ageYears" class="reading-field" name="ageYears" placeholder="Age" value="<%=reading.ageYears%>" required min="0" max="120">
                                    <input hidden required type="number" min="0" class="form-control" name="ageYears" value="<%=reading.ageYears%>">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6 row">
                                <label for="gestationalAgeValue" id="gestationalAgeValueLabel" class="col-sm-4 col-form-label create-reading-label">GESTATIONAL AGE</label>
                                <div class="col-sm-7">
                                    <input type="number" id="gestationalAgeValue" class="reading-field" name="gestationalAgeValue" placeholder="Gestational Age" value="<%=
                                                        reading.gestationalAgeValue%>" min="0" required>
                                </div>
                            </div>
                            <div class="col-sm-6 row">
                                <label for="gestationalAgeUnit" id="gestationalAgeUnitLabel" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">GESTATIONAL UNIT</label>
                                <div class="col-sm-7">
                                    <input id="hiddenGestationalUnit" value="<%=reading.gestationalAgeUnit%>" hidden>
                                    <select
                                            class="form-control"
                                            id="gestationalAgeUnit"
                                            name="gestationalAgeUnit"
                                            onchange="gestationalAgeUnitChange()"
                                    >
                                        <option value="Weeks">Weeks</option>
                                        <option value="Months">Months</option>
                                        <option value="Not Pregnant">Not Pregnant</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 row" style="margin-top: 20px;">
                                <label for="health" class="col-sm-4 col-form-label create-reading-label">HEALTH</label>
                                <div class="col-sm-7">
                                    <select
                                            class="form-control"
                                            id="health"
                                            name="health"
                                            onchange="healthChange()"
                                    >
                                        <option value="sick">Patient is sick</option>
                                        <option value="healthy">Patient is healthy</option>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-group row" id="symptomsSelectorDiv">
                            <div class="col-sm-6 row">
                                <label class="col-sm-4 col-form-label create-reading-label" style="margin-top: 10px">SYMPTOMS</label>
                                <input hidden id="symptomsString" value="<%=reading.symptomsString%>">
                                <div class="col-md-5 col-form-label">
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck1" value="<%=Strings.SYMPTOM_HEADACHE%>" class="reading-checkbox">
                                            <label for="inlineCheck1"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck1"><%=Strings.SYMPTOM_HEADACHE%></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck2" value="<%=Strings.SYMPTOM_BLURRED_VISION%>" class="reading-checkbox">
                                            <label for="inlineCheck2"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck2"><%=Strings.SYMPTOM_BLURRED_VISION%></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck3" value="<%=Strings.SYMPTOM_ABDOMINAL_PAIN%>" class="reading-checkbox">
                                            <label for="inlineCheck3"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck3"><%=Strings.SYMPTOM_ABDOMINAL_PAIN%></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck4" value="<%=Strings.SYMPTOM_BLEEDING%>" class="reading-checkbox">
                                            <label for="inlineCheck4"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck4"><%=Strings.SYMPTOM_BLEEDING%></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck5" value="<%=Strings.SYMPTOM_FEVERISH%>" class="reading-checkbox">
                                            <label for="inlineCheck5"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck5"><%=Strings.SYMPTOM_FEVERISH%></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <div class="round">
                                            <input class="form-check-input" type="checkbox" name="symptoms" id="inlineCheck6" value="<%=Strings.SYMPTOM_UNWELL%>" class="reading-checkbox">
                                            <label for="inlineCheck6"></label>
                                        </div>
                                        <label class="form-check-label" for="inlineCheck6"><%=Strings.SYMPTOM_UNWELL%></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-12 row">
                                <label for="otherSymptoms" class="col-sm-2 col-form-label create-reading-label">OTHER SYMPTOMS</label>
                                <div class="col-sm-6">
                                    <textarea rows="2" type="text" id="otherSymptoms" class="reading-textarea" name="otherSymptoms" placeholder="Other Symptoms"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" style="margin-top: 50px;">
                            <div class="col-sm-4 row">
                                <label for="bpSystolic" class="col-sm-5 col-form-label create-reading-label">SYSTOLIC</label>
                                <div class="col-sm-6">
                                    <input type="number" id="bpSystolic" class="reading-field" name="bpSystolic" placeholder="Systolic"  required min="50" max="210">
                                </div>
                            </div>
                            <div class="col-sm-4 row">
                                <label for="bpDiastolic" class="col-sm-5 offset-sm-1 col-form-label create-reading-label">DIASTOLIC</label>
                                <div class="col-sm-6">
                                    <input type="number" id="bpDiastolic" class="reading-field" name="bpDiastolic" placeholder="Diastolic"  required min="30" max="120">
                                </div>
                            </div>
                            <div class="col-sm-4 row">
                                <label for="heartRateBPM" class="col-sm-5 offset-sm-1 col-form-label create-reading-label">HEART RATE</label>
                                <div class="col-sm-6">
                                    <input type="number" id="heartRateBPM" class="reading-field" name="heartRateBPM" placeholder="Heart Rate"  required min="0" max="240">
                                </div>
                            </div>
                        </div>

                        <input
                                type="hidden"
                                name="${_csrf.parameterName}"
                                value="${_csrf.token}"
                        />

                        <input type="hidden" name="previousBpSystolic" value="<%=reading.bpSystolic%>"/>
                        <input type="hidden" name="previousBpDiastolic" value="<%=reading.bpSystolic%>"/>
                        <input type="hidden" name="previousHeartRateBPM" value="<%=reading.bpSystolic%>"/>
                        <div class="col-md-3 offset-md-9">
                            <div class="offset-md-2">
                                <button type="submit" class="btn-submit">
                                    Submit
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
</div>
</div>
</div>
</body>

<script
        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"
></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"
></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"
></script>

<script>
    document.addEventListener(
        "DOMContentLoaded",
        function() {
            loadGestationalAgeUnit();
            loadSymptoms();
            var backButton = document.getElementById("backButtonState");
            if (backButton.value === "0") {
                backButton.value = "1";
            } else {
                // Back button pressed
                gestationalAgeUnitChange();
                healthChange();
            }
        },
        false
    );

    function loadGestationalAgeUnit() {
        const prevValue = document.getElementById("hiddenGestationalUnit").value;
        let res;

        if (prevValue === "GESTATIONAL_AGE_UNITS_MONTHS") {
            res = "Months";
        }
        else if (prevValue === "GESTATIONAL_AGE_UNITS_WEEKS") {
            res = "Weeks"
        }
        else {
            res = "Not Pregnant";
        }

        document.getElementById("gestationalAgeUnit").value = res;
        gestationalAgeUnitChange();
    }

    function loadSymptoms() {
        const s = document.getElementById("symptomsString").value;
        console.log(s);

        if (s === "No Symptoms (patient healthy)") {
            document.getElementById("health").value = "healthy";
            healthChange();
            return;
        }

        const symptoms = s.split(",");
        let numChecked = 0;
        for (let i = 0; i < symptoms.length; i++) {
            console.log(symptoms[i]);
            let symptom = symptoms[i];
            for (let j = 1; j < 7; j++) {
                console.log("inlineCheck" + j.toString());
                let checkbox = document.getElementById("inlineCheck" + j.toString());
                console.log("Checking " + "inlineCheck" + j.toString() + checkbox.value + " == " + symptom);
                if (checkbox.value === symptom) {
                    checkbox.checked = true;
                    numChecked++;
                }
            }
        }

        if (numChecked !== symptoms.length) {
            const otherSymptoms = document.getElementById("otherSymptoms");
            otherSymptoms.value = symptoms[symptoms.length - 1]
        }
        healthChange();
    }

    function healthChange() {
        const e = document.getElementById("health");
        const strUser = e.options[e.selectedIndex].value;

        if (strUser === "healthy") {
            $("#symptomsSelectorDiv input").attr("disabled", true);
            $(".form-check-input").prop("checked", false);
            $("#symptomsSelectorDiv").addClass("disable-input");
            $("#otherSymptomsDiv").addClass("disable-input");
        }
        else {
            $("#symptomsSelectorDiv input").removeAttr("disabled");
            $("#symptomsSelectorDiv").removeClass("disable-input");
            $("#otherSymptomsDiv").removeClass("disable-input");
        }

        document.getElementById("otherSymptoms").disabled = strUser === "healthy";
    }

    function gestationalAgeUnitChange() {
        const e = document.getElementById("gestationalAgeUnit");
        const strUser = e.options[e.selectedIndex].value;
        const notPregnant = "<c:out value='<%=Strings.GESTATION_UNIT_NOT_PREGNANT%>'/>";

        const gestValue = document.getElementById("gestationalAgeValue");

        if (strUser === notPregnant) {
            gestValue.disabled = true;
            gestValue.value = "";
            $("#gestationalAgeValueLabel").addClass("disable-input");
            $("#gestationalAgeValue").addClass("disable-input");
            $("#gestationalAgeValue").prop("required", false);
        }
        else {
            gestValue.disabled = false;
            $("#gestationalAgeValueLabel").removeClass("disable-input");
            $("#gestationalAgeValue").removeClass("disable-input");
            $("#gestationalAgeValue").prop("required", true);
        }

    }
</script>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Assessment" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Medication" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    Assessment assessment = (Assessment) request.getAttribute("assessment");
    List<Medication> medications = (List<Medication>) request.getAttribute("medications");
    Long referralId = (Long) request.getAttribute("referralId");
    int medCounter = 0;
%>
<head>
    <title>Confirm Assessment</title>

    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="/css/patient.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style>
        h2{
            color: rgb(36, 128, 112)
        }
        p {
            font-size: 15px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <%@ include file="../navbar/navbar.jspf" %>
        <div class="content-container">
            <div class="content-header">
                Confirm Assessment
            </div>
            <div class="content-body" style="padding: 25px">
                <div class="container w-100 mt-4">
                    <h2>Diagnosis</h2>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <p> <%= assessment.getDiagnosis()%></p>
                            </div>
                        </div>
                    </div>

                    <br>

                    <h2>List of medications</h2>
                    <c:forEach items="<%=medications%>" var = "medication">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    <p> <strong> Name: </strong> ${medication.medicationName}</p>
                                    <p> <strong> Dose: </strong> ${medication.dose}</p>
                                    <p> <strong> Dose Units: </strong> ${medication.doseUnits}</p>
                                    <p> <strong> Period Of Consumption: </strong> ${medication.periodOfConsumption} </p>
                                    <p> <strong> Side Effects:  </strong> ${medication.sideEffects}  </p>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <%if (medications.size() == 0) {%>
                         <p style="color: darkred; font-weight: bold;">     No medication was prescribed! </p>
                    <%} %>

                    <br>

                    <h2>Notes</h2>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <p> <%= assessment.getNotes()%></p>
                            </div>
                        </div>
                    </div>

                    <br>

                    <form action="${pageContext.request.contextPath}/assessment/assessmentSaved" method="post">
                        <input type="hidden" name="diagnosis" value="<%=assessment.getDiagnosis()%>"/>
                        <input type="hidden" name="notes" value="<%=assessment.getNotes()%>"/>
                        <input type="hidden" id="referralId" name="referralId" value="<%=referralId%>"/>



                        <button type="button" class="btn-med" onclick="editButton()"> Edit </button>
                        <button type="submit" class="btn-generic" style="font-size: 15px" onclick="addHidMed()"> Save </button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    function editButton() {
        window.history.back();
    }
    
    function addHidMed() {
        var inputRef = document.getElementById('referralId');
        var counter = 0;
        <c:forEach items="<%=medications%>" var = "medication">
            var arr_index = "medications[" + counter.toString() + "]";

            var nameInput = document.createElement('input');
            var nameIndex = arr_index + ".medicationName";
            nameInput.id = nameIndex;
            nameInput.type = 'text';
            nameInput.name = nameIndex;
            nameInput.hidden = true;
            nameInput.value= "${medication.medicationName}";

            var doseInput = document.createElement('input');
            var doseIndex = arr_index + ".dose";
            doseInput.id = doseIndex;
            doseInput.type = 'number';
            doseInput.name = doseIndex;
            doseInput.hidden = true;
            doseInput.value= "${medication.dose}";

            var unitsInput = document.createElement('input');
            var unitsIndex = arr_index + ".doseUnits";
            unitsInput.id = unitsIndex;
            unitsInput.type = 'text';
            unitsInput.name = unitsIndex;
            unitsInput.hidden = true;
            unitsInput.value= "${medication.doseUnits}";

            var periodInput = document.createElement('input');
            var periodIndex = arr_index + ".periodOfConsumption";
            periodInput.id = periodIndex;
            periodInput.type = 'number';
            periodInput.name = periodIndex;
            periodInput.hidden = true;
            periodInput.value= "${medication.periodOfConsumption}";

            var sideInput = document.createElement('input');
            var sideIndex = arr_index + ".sideEffects";
            sideInput.id = sideIndex;
            sideInput.type = 'text';
            sideInput.name = sideIndex;
            sideInput.hidden = true;
            sideInput.value= "${medication.sideEffects}";

            inputRef.appendChild(nameInput);
            inputRef.appendChild(doseInput);
            inputRef.appendChild(unitsInput);
            inputRef.appendChild(periodInput);
            inputRef.appendChild(sideInput);

            counter++;
        </c:forEach>
    }
    
</script>

</html>

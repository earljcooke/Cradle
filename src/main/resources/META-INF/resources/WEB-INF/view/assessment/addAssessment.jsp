<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    Referral referral = (Referral) request.getAttribute("referral");
%>

<head>
    <meta charset="utf-8">

    <title>Add Assessment</title>

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
        label{
            font-weight: bold;
        }
        textarea{
            resize: none;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <%@ include file="../navbar/navbar.jspf" %>
        <div class="content-container">
            <div class="content-header">
                Add Assessment
            </div>
            <div class="content-body" style="padding: 25px">
                <div class="container w-100">
                    <form action="${pageContext.request.contextPath}/assessment/confirmAssessment" method="post">
                        <div class="form-group">
                            <label for="diagnosis" >Put Diagnosis for <%=referral.getFirstName()%> <%=referral.getLastName()%> </label>
                            <textarea required="required" class="form-control" name="diagnosis" id="diagnosis" rows="9" maxlength="3000" placeholder="Put Diagnosis Here"></textarea>
                        </div>
                        <br>

                        <div id="medication_set"></div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <button id = "addMedication" class="btn-med" type="button" onclick= addMed() > Add Medication </button>
                                </div>
                                <div class="col">
                                    <button id = "removeMedication" style="visibility: hidden" class="btn-med btn-red" type="button" onclick= removeMed() > Remove Medication </button>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="notes" > Notes </label>
                            <textarea class="form-control" name="notes" id="notes" rows="5" maxlength="1000" placeholder="You can put your additional notes here"></textarea>
                        </div>

                        <button class="btn-generic" type="submit" value="Submit"> Submit </button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="referralId" value="<%=referral.getReferralId()%>"/>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

<script src="${pageContext.request.contextPath}/js/addAssessment.js"></script>

</html>

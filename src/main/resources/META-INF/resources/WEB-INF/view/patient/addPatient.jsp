<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<!DOCTYPE html>
<html>
<%
    Patient patient = (Patient) request.getAttribute("patient");
%>

<head>
    <meta charset="utf-8">
    <title>Add Patient</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="/css/add-patients.css"/>
    <link rel='stylesheet' href="/css/edit-patients.css"/>
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
<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            Add new Patient
        </div>
        <div class="add-patient-container">
            <form action="${pageContext.request.contextPath}/patient/confirmPatient" method="post">
                <div class="form-group row">
                    <label for="attestationID" class="col-md-4 col-form-label text-md-right edit-users-label">ATTESTATION
                        ID
                    </label>
                    <div class="col-md-6">
                        <input required type="text" pattern="NA|[0-9]{11,11}"
                               title="Please enter a 11 number attestation ID or enter 'NA'" maxlength="11"
                               class="edit-field" id="attestationID" name="attestationID"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="firstName" class="col-md-4 col-form-label text-md-right edit-users-label">FIRST NAME
                    </label>
                    <div class="col-md-6">
                        <input required type="text" id="firstName" class="edit-field" name="firstName"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            for="lastName"
                            class="col-md-4 col-form-label text-md-right edit-users-label">LAST NAME
                    </label>
                    <div class="col-md-6">
                        <input
                                required type="text"
                                id="lastName"
                                class="edit-field"
                                name="lastName"
                        />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="country" class="col-md-4 col-form-label text-md-right edit-users-label">COUNTRY
                    </label>
                    <div class="col-md-6">
                        <input required type="text" id="country" class="edit-field" name="country"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            for="location"
                            class="col-md-4 col-form-label text-md-right edit-users-label">LOCATION
                    </label>
                    <div class="col-md-6">
                        <input
                                required type="text"
                                id="location"
                                class="edit-field"
                                name="location"
                        />
                    </div>
                </div>

                <button class="btn-save" type="submit" value="Submit">Create</button>
                <p id="status"></p>
                <p id="patientInfo"></p>
        </div>
        <input type="hidden" name="action" value="add"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>
</body>


</html>
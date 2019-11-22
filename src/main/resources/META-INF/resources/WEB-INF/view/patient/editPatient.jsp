<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<!DOCTYPE html>
<html>
  <% Patient patient = (Patient)request.getAttribute("patient"); %>

  <head>
    <meta charset="utf-8" />
    <title>Edit Patient</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/edit-patients.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>

  <body>
    <div class="main-container">
      <%@ include file="../navbar/navbar.jspf" %>

      <div class="content-container">
        <div class="content-header">
          Edit Patient
        </div>

        <div class="edit-users-container">
          <form
            action="${pageContext.request.contextPath}/patient/submitPatient"
            method="post"
          >
            <label>
              <input type="hidden" name="patientId" value=<%=
              patient.getPatientId()%>>
            </label>

            <div class="form-group row">
                    <label for="attestationID" class="col-md-4 col-form-label text-md-right edit-users-label">ATTESTATION ID</label>
                    <div class ="col-md-6">
                    <input required type="text" pattern="NA|[0-9]{11,11}" required title="Please enter a 11 number attestation ID or enter 'NA'" maxlength="11"
                           class="edit-field" id="attestationID" name="attestationID" value=<%= patient.getAttestationID()%>>
                        </div>
                </div>
            <div class="form-group row">
              <label
                for="firstName"
                class="col-md-4 col-form-label text-md-right edit-users-label"
                >FIRST NAME</label
              >
              <div class="col-md-6">
                <input
                  required
                  type="text"
                  id="firstName"
                  class="edit-field"
                  name="firstName"
                  value="<%= patient.getFirstName()%>"
                />
              </div>
            </div>

            <div class="form-group row">
              <label
                for="lastName"
                class="col-md-4 col-form-label text-md-right edit-users-label"
                >LAST NAME</label
              >
              <div class="col-md-6">
                <input
                  required
                  type="text"
                  id="lastName"
                  class="edit-field"
                  name="lastName"
                  value="<%= patient.getLastName()%>"
                />
              </div>
            </div>

            <div class="form-group row">
              <label
                for="country"
                class="col-md-4 col-form-label text-md-right edit-users-label"
                >COUNTRY</label
              >
              <div class="col-md-6">
                <input
                  required
                  type="text"
                  id="country"
                  class="edit-field"
                  name="country"
                  value="<%= patient.getCountry()%>"
                />
              </div>
            </div>
            <div class="form-group row">
              <label
                for="location"
                class="col-md-4 col-form-label text-md-right edit-users-label"
                >LOCATION</label
              >
              <div class="col-md-6">
                <input
                  type="text"
                  id="location"
                  class="edit-field"
                  name="location"
                  value="<%= patient.getLocation()%>"
                />
              </div>
            </div>
            <div class="col-md-6 offset-md-6">
                    <div class="offset-md-2">
                            <button type="submit" class="btn-save">
                                    Save
                                  </button>
                    </div>
                </div>
                <p id="status"></p>
            <p id="patientInfo"></p>
                <input type="hidden" name="action" value="edit"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
          </div>
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>

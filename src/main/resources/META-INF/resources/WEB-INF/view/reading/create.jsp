<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
import="com.mercury.TeamMercuryCradlePlatform.Strings" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Create Reading</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/create-reading.css" />
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
                        Create A New Reading
                    </div>
                    <div class="create-reading-container">
                        <main class="my-form">
                            <div class="container">
                                <form action="${pageContext.request.contextPath}/reading/analysis"
                                method="post"
                                id="form">

                                    <div class="form-group row">
                                            <div class="col-sm-6 row">
                                        <label for="readingId" class="col-md-4 col-form-label create-reading-label">READING ID</label>
                                        <div class="col-md-7">
                                            <input type="text" id="readingId" class="reading-field" name="readingId" placeholder="Reading ID">
                                        </div>
                                    </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6 row">
                                            <label for="firstName" class="col-sm-4 col-form-label create-reading-label">FIRST NAME</label>
                                            <div class="col-sm-7">
                                                <input type="text" id="firstName" class="reading-field" name="firstName" placeholder="First Name">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 row">
                                                <label for="lastName" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">LAST NAME</label>
                                                <div class="col-sm-7">
                                                    <input type="text" id="lastName" class="reading-field" name="lastName" placeholder="Last Name">
                                                </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                            <div class="col-sm-6 row">
                                                <label for="ageYears" class="col-sm-4 col-form-label create-reading-label">AGE</label>
                                                <div class="col-sm-7">
                                                    <input type="text" id="ageYears" class="reading-field" name="ageYears" placeholder="Age">
                                                </div>
                                            </div>
                                        </div>
                                    
                                    <div class="form-group row">
                                            <div class="col-sm-6 row">
                                                    <label for="gestationalAgeValue" class="col-sm-4 col-form-label create-reading-label">GESTATIONAL AGE</label>
                                                    <div class="col-sm-7">
                                                        <input type="text" id="gestationalAgeValue" class="reading-field" name="gestationalAgeValue" placeholder="Gestational Age">
                                                    </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                                    <label for="gestationalAgeUnit" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">GESTATIONAL UNIT</label>
                                                    <div class="col-sm-7">
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
                                                    <input type="text" id="bpSystolic" class="reading-field" name="bpSystolic" placeholder="Systolic">
                                                </div>
                                            </div>
                                            <div class="col-sm-4 row">
                                                    <label for="bpDiastolic" class="col-sm-5 offset-sm-1 col-form-label create-reading-label">DIASTOLIC</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" id="bpDiastolic" class="reading-field" name="bpDiastolic" placeholder="Diastolic">
                                                    </div>
                                            </div>
                                            <div class="col-sm-4 row">
                                                    <label for="heartRateBPM" class="col-sm-5 offset-sm-1 col-form-label create-reading-label">HEART RATE</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" id="heartRateBPM" class="reading-field" name="heartRateBPM" placeholder="Heart Rate">
                                                    </div>
                                            </div>
                                        </div>

                                    <input
                                    type="hidden"
                                    name="${_csrf.parameterName}"
                                    value="${_csrf.token}"
                                    />
                                    <div class="col-md-3 offset-md-9">
                                        <div class="offset-md-2">
                                            <button type="submit" class="btn-submit">
                                                Submit
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>
                </main>
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

    function healthChange() {
      const e = document.getElementById("health");
      const strUser = e.options[e.selectedIndex].value;

      if (strUser === "healthy") {
        $("#symptomsSelectorDiv input").attr("disabled", true);
      } else {
        $("#symptomsSelectorDiv input").removeAttr("disabled");
      }

      document.getElementById("otherSymptoms").disabled = strUser === "healthy";
    }

    function gestationalAgeUnitChange() {
      const e = document.getElementById("gestationalAgeUnit");
      const strUser = e.options[e.selectedIndex].value;
      document.getElementById("gestationalAgeValue").disabled =
        strUser === "<c:out value='<%=Strings.GESTATION_UNIT_NOT_PREGNANT%>'/>";
    }
  </script>
</html>

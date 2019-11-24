<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %> 
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <% String firstName = (String) session.getAttribute("firstName"); String
  lastName = (String) session.getAttribute("lastName"); Integer ageYears =
  (Integer) session.getAttribute("ageYears"); Integer bpSystolic = (Integer)
  session.getAttribute("bpSystolic"); Integer bpDiastolic = (Integer)
  session.getAttribute("bpDiastolic"); Integer heartRateBPM = (Integer)
  session.getAttribute("heartRateBPM"); String analysis = (String)
  session.getAttribute("analysis");
  Reading reading = (Reading) request.getAttribute("reading"); %>

  <head>
    <meta charset="utf-8" />
    <title>Add Referral</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/create-referral.css" />
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
                        Add A Referral
                    </div>
                    <div class="create-reading-container">
                        <main class="my-form">
                            <div class="container">
                                <form action="${pageContext.request.contextPath}/referral/confirmReferral"
                                method="post"
                                id="form">

                                <div class="form-group row">
                                  <div class="col-sm-6 row">
                                      <label for="firstName" class="col-sm-4 col-form-label create-reading-label">FIRST NAME</label>
                                      <div class="col-sm-7">
                                          <input hidden type="text" id="firstName" class="reading-field" name="firstName" placeholder="First Name" value="<%=firstName%>">
                                          <div class="reading-field-readonly"><%=firstName%></div>
                                      </div>
                                  </div>
                                  <div class="col-sm-6 row">
                                          <label for="lastName" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">LAST NAME</label>
                                          <div class="col-sm-7">
                                              <input hidden type="text" id="lastName" class="reading-field" name="lastName" placeholder="Last Name" value="<%=lastName%>">
                                              <div class="reading-field-readonly"><%=lastName%></div>
                                          </div>
                                  </div>
                              </div>

                              <div class="form-group row">
                                <div class="col-sm-6 row">
                                    <label for="ageYears" class="col-sm-4 col-form-label create-reading-label">AGE</label>
                                    <div class="col-sm-7">
                                        <input hidden type="text" id="ageYears" class="reading-field" name="ageYears" placeholder="Age" value="<%=ageYears%>">
                                        <div class="reading-field-readonly"><%=ageYears%></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 row">
                                        <label for="sex" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">SEX</label>
                                        <div class="col-sm-7">
                                          <select class="form-control" id="sex" name="sex">
                                            <option value="FEMALE">FEMALE</option>
                                            <option value="MALE">MALE</option>
                                          </select>
                                        </div>
                                    </div>
                            </div>

                              <div class="form-group row" style="margin-top: 50px">
                                <div class="col-sm-6 row">
                                    <label for="bpSystolic" class="col-sm-4 col-form-label create-reading-label">SYSTOLIC</label>
                                    <div class="col-sm-7">
                                        <input hidden type="text" id="bpSystolic" class="reading-field" name="bpSystolic" placeholder="Systolic" value="<%=bpSystolic%>">
                                        <div class="reading-field-readonly"><%=bpSystolic%></div>
                                    </div>
                                </div>
                                <div class="col-sm-6" style="position:absolute; right: 0;">
                                  <div class="form-group row">
                                          <div class="col-sm-3 text-right" style="padding-top: 30px;">
                                                  <img src="/images/<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>.png" alt="<%=ReadingAnalysis.analyze(reading).getTrafficLightImg()%>">
                                              </div>
                                              <div class="col-sm-3" style="padding-top: 30px">
                                                  <c:if test="<%= ReadingAnalysis.analyze(reading).getArrowDirection() != null %>">
                                                      <img src="/images/<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>.png" alt="<%=ReadingAnalysis.analyze(reading).getArrowDirection()%>">
                                                  </c:if>
                                              </div>
                                  </div>
                                  </div>
                            </div>

                            <div class="form-group row">
                              <div class="col-sm-6 row">
                                  <label for="bpDiastolic" class="col-sm-4 col-form-label create-reading-label">DIASTOLIC</label>
                                  <div class="col-sm-7">
                                      <input hidden type="text" id="bpDiastolic" class="reading-field" name="bpDiastolic" placeholder="Diastolic" value="<%=bpDiastolic%>">
                                      <div class="reading-field-readonly"><%=bpDiastolic%></div>
                                  </div>
                              </div>
                          </div>

                          <div class="form-group row">
                            <div class="col-sm-6 row">
                                <label for="heartRateBPM" class="col-sm-4 col-form-label create-reading-label">HEART RATE</label>
                                <div class="col-sm-7">
                                    <input hidden type="text" id="heartRateBPM" class="reading-field" name="heartRateBPM" placeholder="Heart Rate" value="<%=heartRateBPM%>">
                                    <div class="reading-field-readonly"><%=heartRateBPM%></div>
                                </div>
                            </div>
                          </div>

                                    <div class="form-group row" style="margin-top: 50px">
                                        <div class="col-sm-6 row">
                                            <label for="referredHealthCentre" class="col-sm-4 col-form-label create-reading-label">HEALTH CENTRE</label>
                                            <div class="col-sm-7">
                                                <input type="text" id="referredHealthCentre" class="reading-field" name="referredHealthCentre" placeholder="Health Centre">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 row">
                                                <label for="vhtName" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">VHT</label>
                                                <div class="col-sm-7">
                                                    <input type="text" id="vhtName" class="reading-field" name="vhtName" placeholder="Name Of VHT">
                                                </div>
                                        </div>
                                    </div>

                              
                                    
                                        <div class="form-group row">
                                                <div class="col-sm-6 row">
                                                    <label for="zoneNumber" class="col-sm-4 col-form-label create-reading-label">ZONE #</label>
                                                    <div class="col-sm-7">
                                                        <input type="number" id="zoneNumber" class="reading-field" name="zoneNumber" placeholder="Zone Number">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 row">
                                                        <label for="lastName" class="col-sm-4 offset-sm-1 col-form-label create-reading-label">VILLAGE #</label>
                                                        <div class="col-sm-7">
                                                            <input type="number" id="villageNumber" class="reading-field" name="villageNumber" placeholder="Village Number">
                                                        </div>
                                                </div>
                                            </div>


                                    <div class="form-group row" style="margin-top: 50px">
                                            <div class="col-sm-12 row">
                                                <label for="reasonOfReferral" class="col-sm-2 col-form-label create-reading-label">REASON OF REFERRAL</label>
                                                <div class="col-sm-6">
                                                    <textarea rows="2" type="text" id="reasonOfReferral" class="reading-textarea" name="reasonOfReferral" placeholder="Reason Of Referral"></textarea>
                                                </div>
                                            </div>
                                        </div>


                                      <div class="form-group row">
                                          <div class="col-sm-12 row">
                                              <label for="actionAlreadyTaken" class="col-sm-2 col-form-label create-reading-label">ACTION TAKEN</label>
                                              <div class="col-sm-6">
                                                  <textarea rows="2" type="text" id="actionAlreadyTaken" class="reading-textarea" name="actionAlreadyTaken" placeholder="Action Taken"></textarea>
                                              </div>
                                          </div>
                                      </div>

                                      <div class="form-group row">
                                        <div class="col-sm-12 row">
                                            <label for="otherInformationMessage" class="col-sm-2 col-form-label create-reading-label">OTHER</label>
                                            <div class="col-sm-6">
                                                <textarea rows="2" type="text" id="otherInformationMessage" class="reading-textarea" name="otherInformationMessage" placeholder="Other Notes"></textarea>
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
                        </main>
                    </div>
                </div>
                </main>
            </div>
        </div>
    </div>
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
  </body>
</html>

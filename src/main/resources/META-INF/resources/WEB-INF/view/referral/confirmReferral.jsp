<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <% Referral referral = (Referral)request.getAttribute("referral"); %>

  <head>
    <meta charset="utf-8" />
    <title>Confirm Referral</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/confirm-referral.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>

  <body>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />



    <div class="main-container">

      <%@ include file="../navbar/navbar.jspf" %>
  
      <div class="content-container">
          <div class="content-header">
            Confirm Referral Details
          </div>
          <div class="content-body">
              <div class="details-container-header">Personal Details</div>
              <div class="details-container">
                  <div class="form-group row">
                  <div class="col-sm-6">
                  <div class="details-header">
                      Personal Info
                  </div>
    

                  <div class="form-group row">
                          <span class="col-sm-4 referral-label text-md-left">NAME</span>
                          <span class ="col-sm-7"><%= referral.getFirstName() + " " + referral.getLastName()%></span>
                  </div>

                  <div class="form-group row">
                          <span class="col-sm-4 referral-label text-md-left">AGE</span>
                          <span class ="col-sm-7"><%= referral.getAgeYears()%></span>
                  </div>

                  <div class="form-group row">
                          <span class="col-sm-4 referral-label text-md-left">SEX</span>
                          <span class ="col-sm-7"><%= referral.getSex()%></span>
                  </div>
                  </div>

                  <div class="col-sm-6">
                          <div class="details-header">
                              Address Info
                          </div>
                          <div class="form-group row">
                                  <span class="col-sm-4 referral-label text-md-left">ZONE #</span>
                                  <span class ="col-sm-7 "><%= referral.getZoneNumber()%></span>
                          </div>
      
                          <div class="form-group row">
                                  <span class="col-sm-4 referral-label text-md-left">VILLAGE #</span>
                                  <span class ="col-sm-7"><%= referral.getVillageNumber()%></span>
                          </div>
                  </div>

                  

                  </div>
              </div>

              <div class="details-container-header">Status</div>
              <div class="details-container">
                      <div class="form-group row">


                      <div class="col-sm-6">
                      <div class="details-header">
                          Reading Info
                      </div>
  
                      <div class="form-group row">
                              <span class="col-sm-4 referral-label text-md-left">BLOOD PRESSURE</span>
                              <span class ="col-sm-7"><%= referral.getBpSystolic() + "/" + referral.getBpDiastolic()%></span>
                      </div>
  
                      <div class="form-group row">
                              <span class="col-sm-4 referral-label text-md-left">HEART RATE</span>
                              <span class ="col-sm-7"><%= referral.getHeartRateBPM()%></span>
                      </div>
                      </div>

                      <div class="col-sm-6">
                          <div class="details-header">
                              Referred Health Centre
                          </div>
                          <div class="form-group row">
                                  <span class="col-sm-4 referral-label text-md-left">VHT NAME</span>
                                  <span class ="col-sm-7"><%= referral.getVhtName()%></span>
                          </div>
      
                          <div class="form-group row">
                                  <span class="col-sm-4 referral-label text-md-left">HEALTH CENTRE</span>
                                  <span class ="col-sm-7"><%= referral.getReferredHealthCentre()%></span>
                          </div>
      
                          <div class="form-group row">
                                  <span class="col-sm-4 referral-label text-md-left">DATE</span>
                                  <span class ="col-sm-7"><%= referral.getDateTimeSent()%></span>
                          </div>
                  </div>
  

                          </div>
                  </div>


                  <div class="details-container-header">Description</div>
                <div class="details-container">
                        <div class="form-group row">
    
                        <div class="col-sm-12">
                                <div class="details-header">
                                    Notes
                                </div>
                                <div class="form-group row">
                                        <span class="col-sm-2 referral-label text-md-left">REASON OF REFERRAL</span>
                                        <span class ="col-sm-10"><%=referral.getReasonOfReferral()%></span>
                                </div>
            
                                <div class="form-group row">
                                        <span class="col-sm-2 referral-label text-md-left">ACTION TAKEN</span>
                                        <span class ="col-sm-10"><%=referral.getActionAlreadyTaken()%></span>
                                </div>
    
                                <div class="form-group row">
                                        <span class="col-sm-2 referral-label text-md-left">OTHER</span>
                                        <span class ="col-sm-10"><%=referral.getOtherInformationMessage()%></span>
                                </div>
                        </div>
                        </div>
                        </div>

              

              
                  </div>

                  <form
        action="${pageContext.request.contextPath}/referral/referralSaved"
        method="post"
      >
        <input
          type="hidden"
          name="firstName"
          value="<%=referral.getFirstName()%>"
        />
        <input
          type="hidden"
          name="lastName"
          value="<%=referral.getLastName()%>"
        />
        <input
          type="hidden"
          name="ageYears"
          value="<%=referral.getAgeYears()%>"
        />
        <input type="hidden" name="sex" value="<%=referral.getSex()%>" />
        <input
          type="hidden"
          name="zoneNumber"
          value="<%=referral.getZoneNumber()%>"
        />
        <input
          type="hidden"
          name="villageNumber"
          value="<%=referral.getVillageNumber()%>"
        />
        <input
          type="hidden"
          name="vhtName"
          value="<%=referral.getVhtName()%>"
        />
        <input
          type="hidden"
          name="referredHealthCentre"
          value="<%=referral.getReferredHealthCentre()%>"
        />
        <input
          type="hidden"
          name="bpSystolic"
          value="<%=referral.getBpSystolic()%>"
        />
        <input
          type="hidden"
          name="bpDiastolic"
          value="<%=referral.getBpDiastolic()%>"
        />
        <input
          type="hidden"
          name="heartRateBPM"
          value="<%=referral.getHeartRateBPM()%>"
        />
        <input
          type="hidden"
          name="reasonOfReferral"
          value="<%=referral.getReasonOfReferral()%>"
        />
        <input
          type="hidden"
          name="actionAlreadyTaken"
          value="<%=referral.getActionAlreadyTaken()%>"
        />
        <input
          type="hidden"
          name="otherInformationMessage"
          value="<%=referral.getOtherInformationMessage()%>"
        />

        <div class="col-md-3 offset-md-9">
            <div class="offset-md-2">
                <button type="submit" class="btn-submit">
                    Submit
                </button>
            </div>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
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

</html>

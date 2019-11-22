
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Referral Details</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-referral-info.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<%
    Referral referral = (Referral)request.getAttribute("referral");
    Reading reading = (Reading)request.getAttribute("reading");
%>

<body>
<div class="main-container">

        <%@ include file="../navbar/navbar.jspf" %>
    
        <div class="content-container">
            <div class="content-header">
              Referral Details
            </div>
            <div class="content-body">
                <div class="details-container-header">Personal Details</div>
                <div class="details-container">
                    <div class="form-group row">
                    <div class="col-sm-4">
                    <div class="details-header">
                        Personal Info
                    </div>
                    <div class="form-group row">
                            <span class="col-sm-4 referral-label text-md-left">REFERRAL ID</span>
                            <span class ="col-sm-7"><%= referral.getReferralId()%></span>
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

                    <div class="col-sm-4">
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

                    <div class="col-sm-4">
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

                <div class="details-container-header">Reading Details</div>
                <div class="details-container">
                        <div class="form-group row">
                        <div class="col-sm-4">
                        <div class="details-header">
                            Reading Info
                        </div>
                        <div class="form-group row">
                                <span class="col-sm-4 referral-label text-md-left">READING ID</span>
                                <span class ="col-sm-7"><%= reading.getReadingId()%></span>
                        </div>
    
                        <div class="form-group row">
                                <span class="col-sm-4 referral-label text-md-left">GESTATION AGE</span>
                                <span class ="col-sm-7"><%= reading.getGestationWeekDaysString()%></span>
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
    
                        <div class="col-sm-4">
                                <div class="details-header">
                                    Status
                                </div>
                                <div class="form-group row">
                                        <div class="col-sm-3" style="padding-top: 30px; margin-right: 10px;">
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
                    </div>


                    <div class="details-container-header">Status</div>
                <div class="details-container">
                        <div class="form-group row">

                        <div class="col-sm-4">
                                <div class="details-header">
                                    Analysis
                                </div>
                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">SYMPTOMS</span>
                                        <span class ="col-sm-7 "><%= reading.getSymptomsString()%></span>
                                </div>
            
                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">ANALYSIS</span>
                                        <span class ="col-sm-7"><%= ReadingAnalysis.analyze(reading).getAnalysisText()%></span>
                                </div>

                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">ADVICE</span>
                                        <span class ="col-sm-7"><%= ReadingAnalysis.analyze(reading).getBriefText()%></span>
                                </div>
                        </div>
    
                        <div class="col-sm-8">
                                <div class="details-header">
                                    Additional Notes
                                </div>
                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">REASON OF REFERRAL</span>
                                        <span class ="col-sm-7"><%= referral.getReasonOfReferral()%></span>
                                </div>
            
                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">ACTION TAKEN</span>
                                        <span class ="col-sm-7"><%= referral.getActionAlreadyTaken()%></span>
                                </div>
    
                                <div class="form-group row">
                                        <span class="col-sm-4 referral-label text-md-left">OTHER</span>
                                        <span class ="col-sm-7"><%= referral.getOtherInformationMessage()%></span>
                                </div>
                        </div>
                        </div>
                        </div>
                    </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

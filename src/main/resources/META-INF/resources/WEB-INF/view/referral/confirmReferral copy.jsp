<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <% Referral referral = (Referral)request.getAttribute("referral"); %>

  <head>
    <meta charset="utf-8" />
    <title>Confirm Referral</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
  </head>

  <body>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    <%@ include file="../navbar/navbar.jspf" %>
    <div class="container w-100 mt-4">
      <h2>Personal Information</h2>
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <p>
              <%= "Name: " + referral.getFirstName() + " " +
              referral.getLastName()%>
            </p>
            <p><%= "Age: " + referral.getAgeYears()%></p>
            <p><%= "Sex: " + referral.getSex()%></p>
          </div>
        </div>
      </div>
      <h2>Referred Health Centre</h2>
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <p><%= "Date: " + referral.getDateTimeSent()%></p>
            <p><%= "VHT Name: " + referral.getVhtName()%></p>
            <p>
              <%= "Referred Health Centre: " +
              referral.getReferredHealthCentre()%>
            </p>
          </div>
        </div>
      </div>

      <h2>Address Information</h2>
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <p><%= "Zone Number: " + referral.getZoneNumber()%></p>
            <p><%= "Village Number: " + referral.getVillageNumber()%></p>
          </div>
        </div>
      </div>
      <h2>Blood Pressure and Heart Rate</h2>
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <p>
              <%= "BP: " + referral.getBpSystolic() + "/" +
              referral.getBpDiastolic()%>
            </p>
            <p><%= "HR: " + referral.getHeartRateBPM() %></p>
          </div>
        </div>
      </div>

      <h2>Reason of Referral</h2>
      <p><%=referral.getReasonOfReferral()%></p>
      <h2>Action Already Taken</h2>
      <p><%=referral.getActionAlreadyTaken()%></p>
      <h2>Other Messages</h2>
      <p><%=referral.getOtherInformationMessage()%></p>

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

        <button type="submit"> Save </button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
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

<%--<script>--%>


<%--    function editButton() {--%>
<%--        window.history.back();--%>
<%--    }--%>

<%--</script>--%>

</html>

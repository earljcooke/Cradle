<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<!DOCTYPE html>
<html>

<%
  List<Reading> readingList = (List<Reading>) request.getAttribute("readingList");
  List<Patient> patientList = (List<Patient>) request.getAttribute("patientList");
  List<Integer> data = (List<Integer>) request.getAttribute("data");
%>

  <head>
    <meta charset="ISO-8859-1" />
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/toastr.css" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="/js/toastr.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/notifications.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

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
  </head>

  <body onload="populatePatientList()">
    <div class="main-container">
      <%@ include file="../navbar/navbar.jspf" %>
      <div class="content-container">
        <div class="content-header">
          Dashboard
        </div>
        <div class="content-body">
<%--          <label for="selectPatient"> </label>--%>
<%--          <select id="selectPatient" onchange="createGraphs()">--%>
<%--          </select>--%>
          <div class="summary-container">
            <canvas id="bloodPressureChart"></canvas>
          </div>
          <div class="summary-container">
            <canvas id="statusChart"></canvas>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>


<script>

  function getData(type) {

    var data = [];

    <% for (int i=0; i<readingList.size(); i++) { %>

    if(type === 0 ){
      data[<%= i %>] = "<%= readingList.get(i).getTimeYYYYMMDD()%>";
    }
    else if(type === 1){
      data[<%= i %>] = "<%= readingList.get(i).getBpSystolic()%>";
    }
    else if(type === 2){
      data[<%= i %>] = "<%= readingList.get(i).getBpDiastolic()%>";
    }
    else {
      data[<%= i %>] = "<%= readingList.get(i).getHeartRateBPM()%>";
    }

    <% } %>

    return data;
  }

  var canvas = document.getElementById('bloodPressureChart');
  var chart = new Chart(canvas,
          {
            "type":"line",
            "data":
                    {
                      "labels": getData(0),
                      "datasets": [
                        {
                          "label":"Systolic",
                          "data": getData(1),
                          "fill":false,
                          "backgroundColor": "rgb(0, 0, 255)",
                          "borderColor" : "rgb(0, 0, 255)"
                        },
                        {
                          "label":"Diastolic",
                          "data": getData(2),
                          "fill":false,
                          "backgroundColor": "rgb(255, 129, 0)",
                          "borderColor" : "rgb(255, 129, 0)"
                        },
                        {
                          "label":"Heart Rate",
                          "data": getData(3),
                          "fill":false,
                          "backgroundColor": "rgb(142, 56, 140)",
                          "borderColor" : "rgb(142, 56, 140)"
                        }
                      ]},
            "options":
                    {
                      "scales":
                              {
                                "xAxes": [{
                                  scaleLabel: {
                                    display: true,
                                    labelString: 'Time Reading Taken'
                                  },
                                }],

                                "yAxes": [{
                                  "ticks":{
                                    "beginAtZero":true
                                  }
                                }]
                              }
                    }
          });

  new Chart(document.getElementById("statusChart"),
          {
            "type":"doughnut",
            "data":
                    {
                      "labels":["Red","Yellow", "Green"],
                      "datasets":[{
                        "label":"Status lights",
                        "data":
                                [
                                  "<c:out value='<%=data.get(0)%>'/>",
                                  "<c:out value='<%=data.get(1)%>'/>",
                                  "<c:out value='<%=data.get(2)%>'/>"
                                ],
                        "backgroundColor":
                                [
                                  "rgb(255, 99, 132)",
                                  "rgb(255, 255, 0)",
                                  "rgb(124, 252, 0)"
                                ]}]
                    }}
  );


  <%--var pId = [];--%>
  <%--var pList = [];--%>
  <%--var numbGreen = 0;--%>
  <%--var numbYellow = 0;--%>
  <%--var numbRed = 0;--%>

  <%--function generatePatientData() {--%>

  <%--  <% for (Patient p : patientList) { %>--%>

  <%--    pId.push("<%= p.getPatientId()%>");--%>
  <%--    pList.push("<%= p.getFirstName() + " " + p.getLastName() + ", " + p.getAgeYears()%>");--%>

  <%--  <% } %>--%>

  <%--}--%>

  <%--function populatePatientList() {--%>

  <%--  generatePatientData();--%>

  <%--  var select = document.getElementById("selectPatient");--%>
  <%--  var options = pList;--%>
  <%--  for(var i = 0; i < options.length; i++) {--%>
  <%--    var opt = options[i];--%>
  <%--    var el = document.createElement("option");--%>
  <%--    el.textContent = opt;--%>
  <%--    el.value = opt;--%>
  <%--    select.appendChild(el);--%>
  <%--  }--%>

  <%--  createGraphs();--%>

  <%--}--%>

  <%--function getBloodPressureData(type) {--%>

  <%--  var data = [];--%>
  <%--  var e = document.getElementById("selectPatient");--%>

  <%--  <% for (int i=0; i<readingList.size(); i++) { %>--%>

  <%--    if("<c:out value='<%=readingList.get(i).getPatient() != null%>'/>"){--%>
  <%--      if(pId[e.selectedIndex] === "<c:out value='<%=readingList.get(i).getPatient().getPatientId()%>'/>") {--%>
  <%--        // Get date--%>
  <%--        if (type === 0) {--%>
  <%--          data[<%= i %>] = "<%= readingList.get(i).getTimeYYYYMMDD()%>";--%>
  <%--        }--%>
  <%--        // Get systolic--%>
  <%--        else if (type === 1) {--%>
  <%--          data[<%= i %>] = "<%= readingList.get(i).getBpSystolic()%>";--%>
  <%--        }--%>

  <%--        // Get diastolic--%>
  <%--        else if (type === 2) {--%>
  <%--          data[<%= i %>] = "<%= readingList.get(i).getBpDiastolic()%>";--%>
  <%--        }--%>
  <%--        // Get heartRate--%>
  <%--        else {--%>
  <%--          data[<%= i %>] = "<%= readingList.get(i).getHeartRateBPM()%>";--%>
  <%--        }--%>
  <%--      }--%>
  <%--    }--%>
  <%--  <% } %>--%>

  <%--  return data;--%>
  <%--}--%>


  <%--function createGraphs() {--%>
  <%--  createBloodPressureChart();--%>
  <%--  // createStatusChart();--%>
  <%--}--%>

  <%--function createBloodPressureChart() {--%>
  <%--  new Chart(document.getElementById("bloodPressureChart"),--%>
  <%--          {--%>
  <%--            "type":"line",--%>
  <%--            "data":--%>
  <%--                    {--%>
  <%--                      "labels": getBloodPressureData(0),--%>
  <%--                      "datasets": [--%>
  <%--                        {--%>
  <%--                          "label":"Systolic",--%>
  <%--                          "data": getBloodPressureData(1),--%>
  <%--                          "fill":false,--%>
  <%--                          "backgroundColor": "rgb(0, 0, 255)",--%>
  <%--                          "borderColor" : "rgb(0, 0, 255)"--%>
  <%--                        },--%>
  <%--                        {--%>
  <%--                          "label":"Diastolic",--%>
  <%--                          "data": getBloodPressureData(2),--%>
  <%--                          "fill":false,--%>
  <%--                          "backgroundColor": "rgb(255, 129, 0)",--%>
  <%--                          "borderColor" : "rgb(255, 129, 0)"--%>
  <%--                        },--%>
  <%--                        {--%>
  <%--                          "label":"Heart Rate",--%>
  <%--                          "data": getBloodPressureData(3),--%>
  <%--                          "fill":false,--%>
  <%--                          "backgroundColor": "rgb(142, 56, 140)",--%>
  <%--                          "borderColor" : "rgb(142, 56, 140)"--%>
  <%--                        }--%>
  <%--                      ]},--%>
  <%--            "options":--%>
  <%--                    {--%>
  <%--                      "scales":--%>
  <%--                              {--%>
  <%--                                "yAxes": [{--%>
  <%--                                  "ticks":{--%>
  <%--                                    "beginAtZero":true--%>
  <%--                                  }--%>
  <%--                                }]--%>
  <%--                              }--%>
  <%--                    }--%>
  <%--          });--%>
  <%--}--%>

  <%--function createStatusChart() {--%>


  <%--  <%--%>

  <%--    int numbGreen = 0;--%>
  <%--    int numbYellow = 0;--%>
  <%--    int numbRed = 0;--%>

  <%--  %>--%>

  <%--  var e = document.getElementById("selectPatient");--%>

  <%--  <% for (Reading reading : readingList) { %>--%>

  <%--  if(pId[e.selectedIndex] === "<c:out value='<%=reading.getPatient().getPatientId()%>'/>"){--%>
  <%--    <%--%>
  <%--      ReadingAnalysis readingAnalysis = ReadingAnalysis.analyze(reading);--%>
  <%--      if(readingAnalysis.isGreen()){--%>
  <%--        numbGreen++;--%>
  <%--      }--%>
  <%--      else if(readingAnalysis.isYellow()){--%>
  <%--        numbYellow++;--%>
  <%--      }--%>
  <%--      else {--%>
  <%--        numbRed++;--%>
  <%--      }--%>
  <%--    %>--%>
  <%--  }--%>

  <%--  <% } %>--%>

  <%--  new Chart(document.getElementById("statusChart"),--%>
  <%--          {--%>
  <%--            "type":"doughnut",--%>
  <%--            "data":--%>
  <%--                    {--%>
  <%--                      "labels":["Red","Yellow", "Green"],--%>
  <%--                      "datasets":[{--%>
  <%--                        "label":"Status lights",--%>
  <%--                        "data":--%>
  <%--                                [--%>
  <%--                                  "<c:out value='<%=numbRed%>'/>",--%>
  <%--                                  "<c:out value='<%=numbYellow%>'/>",--%>
  <%--                                  "<c:out value='<%=numbGreen%>'/>"--%>
  <%--                                ],--%>
  <%--                        "backgroundColor":--%>
  <%--                                [--%>
  <%--                                  "rgb(255, 99, 132)",--%>
  <%--                                  "rgb(255, 255, 0)",--%>
  <%--                                  "rgb(124, 252, 0)"--%>
  <%--                                ]}]--%>
  <%--                    }}--%>
  <%--  );--%>
  <%--}--%>


</script>



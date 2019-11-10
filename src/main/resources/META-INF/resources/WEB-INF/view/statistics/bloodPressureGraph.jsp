<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<%
    List<String> dateArr = (List<String>) request.getAttribute("dateArr");
    List<Integer> systolicArr = (List<Integer>) request.getAttribute("systolicArr");
    List<Integer>diastolicArr = (List<Integer>) request.getAttribute("diastolicArr");
    List<Integer> heartRateArr = (List<Integer>) request.getAttribute("heartRateArr");
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

<body>">
<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            Statistics
        </div>
        <div class="content-body">
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

    var dates = [], systolic = [], diastolic = [], heartRate = [];

    <% for (int i=0; i<dateArr.size(); i++) { %>
        dates[<%= i %>] = "<%= dateArr.get(i) %>";
        systolic[<%= i %>] = "<%= systolicArr.get(i) %>";
        diastolic[<%= i %>] = "<%= diastolicArr.get(i) %>";
        heartRate[<%= i %>] = "<%=  heartRateArr.get(i) %>";
    <% } %>


    new Chart(document.getElementById("bloodPressureChart"),
        {
            "type":"line",
            "data":
                {
                    "labels": dates,
                    "datasets": [
                        {
                            "label":"Systolic",
                            "data": systolic,
                            "fill":false,
                            "backgroundColor": "rgb(0, 0, 255)",
                            "borderColor" : "rgb(0, 0, 255)"
                        },
                        {
                            "label":"Diastolic",
                            "data": diastolic,
                            "fill":false,
                            "backgroundColor": "rgb(255, 129, 0)",
                            "borderColor" : "rgb(255, 129, 0)"
                        },
                        {
                            "label":"Heart Rate",
                            "data": heartRate,
                            "fill":false,
                            "backgroundColor": "rgb(142, 56, 140)",
                            "borderColor" : "rgb(142, 56, 140)"
                        }
                    ]},
            "options":
                {
                    "scales":
                        {
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
                    "labels":["Green","Yellow", "Red"],
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
                                "rgb(124, 252, 0)",
                                "rgb(255, 255, 0)",
                                "rgb(255, 99, 132)"
                            ]}]
                }}
    );

</script>


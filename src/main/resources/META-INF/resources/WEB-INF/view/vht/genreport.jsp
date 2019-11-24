<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<%
    ArrayList<Integer> readingList = (ArrayList<Integer>) request.getAttribute("readingList");
    ArrayList<Integer> referralList = (ArrayList<Integer>) request.getAttribute("referralList");
    ArrayList<Integer> complReferralList = (ArrayList<Integer>) request.getAttribute("complReferralList");
    ArrayList<Integer> pregnantList = (ArrayList<Integer>) request.getAttribute("pregnantList");
    ArrayList<Integer> pregnantHelpedList = (ArrayList<Integer>) request.getAttribute("pregnantHelpedList");

    ArrayList<Integer> greenList = (ArrayList<Integer>) request.getAttribute("green");
    ArrayList<Integer> yellowUpList = (ArrayList<Integer>) request.getAttribute("yellowUp");
    ArrayList<Integer> yellowDownList = (ArrayList<Integer>) request.getAttribute("yellowDown");
    ArrayList<Integer> redUpList = (ArrayList<Integer>) request.getAttribute("redUp");
    ArrayList<Integer> redDownList = (ArrayList<Integer>) request.getAttribute("redDown");
%>

<head>
    <meta charset="utf-8">

    <title>General Report</title>
    <!-- Native scripts -->
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>

    <link rel="stylesheet" type="text/css" href="/css/report-general.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css"
          crossorigin="anonymous">

    <!-- Imported scripts -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>


<body>
<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            General Reports
        </div>
        <div class="content-body">
            <%--<button class="collapsible">CRADLE readings recorded</button>--%>
            <div class="report-container">

                <div class="report-header">
                    Cradle Readings Per Month
                </div>
                <canvas id="readingGraph" height="100"></canvas>
            </div>
            <%--<button class="collapsible">Referrals</button>--%>
            <div class="report-container">
                <div class="report-header">
                    Referrals Per Month
                </div>

                <canvas id="referralGraph" height="100"></canvas>

            </div>
            <%--<button class="collapsible">Traffic light colours recorded</button>--%>
            <div class="report-container">
                <div class="report-header">
                    Early Warning Indicators Per Month
                </div>
                <canvas id="trafficLightsGraph" height="100"></canvas>

            </div>
            <%--<button class="collapsible">Pregnant women</button>--%>
            <div class="report-container">
                <div class="report-header">
                    Pregnant Women Per Month
                </div>
                <canvas id="prWRefGraph" height="100"></canvas>

            </div>
        </div>
    </div>
</div>
</body>

<script>
    function getStandardLabels() {
        return ['January', 'February', 'March', 'April',
            'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    }

    function getData(type) {

        var data = [];

        if (type === 0) {
            <% for (int i=0; i<readingList.size(); i++) { %>
            data[<%= i %>] = "<%= readingList.get(i)%>";
            <% } %>
        } else if (type === 1) {
            <% for (int i=0; i<referralList.size(); i++) { %>
            data[<%= i %>] = "<%= referralList.get(i)%>";
            <% } %>
        } else if (type === 2) {
            <% for (int i=0; i<complReferralList.size(); i++) { %>
            data[<%= i %>] = "<%= complReferralList.get(i)%>";
            <% } %>
        } else if (type === 3) {
            <% for (int i=0; i<pregnantList.size(); i++) { %>
            data[<%= i %>] = "<%= pregnantList.get(i)%>";
            <% } %>
        } else if (type === 4) {
            <% for (int i=0; i<pregnantHelpedList.size(); i++) { %>
            data[<%= i %>] = "<%= pregnantHelpedList.get(i)%>";
            <% } %>
        } else if (type === 5) {
            <% for (int i=0; i<greenList.size(); i++) { %>
            data[<%= i %>] = "<%= greenList.get(i)%>";
            <% } %>
        } else if (type === 6) {
            <% for (int i=0; i<yellowUpList.size(); i++) { %>
            data[<%= i %>] = "<%= yellowUpList.get(i)%>";
            <% } %>
        } else if (type === 7) {
            <% for (int i=0; i<yellowDownList.size(); i++) { %>
            data[<%= i %>] = "<%= yellowDownList.get(i)%>";
            <% } %>
        } else if (type === 8) {
            <% for (int i=0; i<redUpList.size(); i++) { %>
            data[<%= i %>] = "<%= redUpList.get(i)%>";
            <% } %>
        } else if (type === 9) {
            <% for (int i=0; i<redDownList.size(); i++) { %>
            data[<%= i %>] = "<%= redDownList.get(i)%>";
            <% } %>
        }
        return data;
    }
</script>
<script>
    var ctx = document.getElementById('readingGraph').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: getStandardLabels(),
            datasets: [{
                label: 'CRADLE readings recorded per Month',
                data: getData(0),
                pointBackgroundColor: 'rgb(228,245,255)',
                borderColor: 'rgba(26,47,118, 1)',
                pointBorderColor: 'rgba(26,47,118, 1)',
                backgroundColor: 'rgba(26,47,118, 1)',
                fill: false,
                borderWidth: 3
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        min: 0,
                        stepSize: 1
                    }
                }]
            },
        }
    });
</script>
<script>
    var ctx = document.getElementById('referralGraph').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: getStandardLabels(),
            datasets: [{
                label: 'Referrals made per Month',
                data: getData(1),
                pointBackgroundColor: 'rgb(255,201,189)',
                borderColor: 'rgb(224,113,113)',
                pointBorderColor: 'rgb(224,113,113)',
                backgroundColor: 'rgb(224,113,113)',
                fill: false,
                borderWidth: 3
            },
                {
                    label: 'Referrals that received diagnosis and treatment, per Month',
                    data: getData(2),
                    pointBackgroundColor: 'rgb(211,255,205)',
                    borderColor: 'rgb(36,118,41)',
                    pointBorderColor: 'rgb(36,118,41)',
                    backgroundColor: 'rgb(36,118,41)',
                    fill: false,
                    borderWidth: 3
                }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        min: 0,
                        stepSize: 1
                    }
                }]
            },
        }
    });
</script>
<script>
    var ctx = document.getElementById('trafficLightsGraph').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: getStandardLabels(),
            datasets: [{
                label: 'Green, per Month',
                data: getData(5),
                pointBackgroundColor: 'rgb(211,255,205)',
                borderColor: 'rgb(36,118,41)',
                pointBorderColor: 'rgb(36,118,41)',
                backgroundColor: 'rgb(36,118,41)',
                fill: false,
                borderWidth: 3
            },
                {
                    label: 'Yellow down, per Month',
                    data: getData(7),
                    pointBackgroundColor: 'rgb(255,244,162)',
                    borderColor: 'rgb(226,226,35)',
                    pointBorderColor: 'rgb(226,226,35)',
                    backgroundColor: 'rgb(226,226,35)',
                    fill: false,
                    borderWidth: 3
                },
                {
                    label: 'Yellow up, per Month',
                    data: getData(6),
                    pointBackgroundColor: 'rgb(255,211,144)',
                    borderColor: 'rgb(226,155,33)',
                    pointBorderColor: 'rgb(226,155,33)',
                    backgroundColor: 'rgb(226,155,33)',
                    fill: false,
                    borderWidth: 3
                },
                {
                    label: 'Red down, per Month',
                    data: getData(9),
                    pointBackgroundColor: 'rgb(255,226,247)',
                    borderColor: 'rgb(174,61,172)',
                    pointBorderColor: 'rgb(174,61,172)',
                    backgroundColor: 'rgb(174,61,172)',
                    fill: false,
                    borderWidth: 3
                },
                {
                    label: 'Red up, per Month',
                    data: getData(8),
                    pointBackgroundColor: 'rgb(255,135,134)',
                    borderColor: 'rgb(182,33,50)',
                    pointBorderColor: 'rgb(182,33,50)',
                    backgroundColor: 'rgb(182,33,50)',
                    fill: false,
                    borderWidth: 3
                }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        min: 0,
                        stepSize: 1
                    }
                }]
            },
        }
    });
</script>
<script>
    var ctx = document.getElementById('prWRefGraph').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: getStandardLabels(),
            datasets: [{
                label: 'Pregnant women referred per Month',
                data: getData(3),
                pointBackgroundColor: 'rgb(255,203,160)',
                borderColor: 'rgb(246,171,40)',
                pointBorderColor: 'rgb(246,171,40)',
                backgroundColor: 'rgb(246,171,40)',
                fill: false,
                borderWidth: 3
            },
                {
                    label: 'Pregnant women assessed per Month',
                    data: getData(4),
                    pointBackgroundColor: 'rgb(228,245,255)',
                    borderColor: 'rgba(26,47,118, 1)',
                    pointBorderColor: 'rgba(26,47,118, 1)',
                    backgroundColor: 'rgba(26,47,118, 1)',
                    fill: false,
                    borderWidth: 3
                }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        min: 0,
                        stepSize: 1
                    }
                }]
            },
        }
    });
</script>
<script src="/js/report.js"></script>

</html>
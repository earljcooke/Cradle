<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <title>Referral List</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="/css/patient.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-referrals.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<%
    List<Referral> referralList = (List<Referral>)request.getAttribute("referralList");
    int buttonCounter = 0;
%>

<body>
    <div class="main-container">

            <%@ include file="../navbar/navbar.jspf" %>

                <div class="content-container">
                <div class="content-header">
                    Referrals
                </div>
                <div class="content-body">
                    <div class="table-container">
                    <table class="table view-users-table">
                    <thead>
                    <tr>
                        <th scope="col">REFERRAL ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">AGE</th>
                        <th scope="col">SEX</th>
                        <th scope="col">REFERRED HEALTH CENTRE</th>
                        <th scope="col">VHT NAME</th>
                        <th scope="col"></th>
                        <th scope="col">STATUS</th>
                    </tr>
                    </thead>
                <tbody>
                <c:forEach items="<%=referralList%>" var = "referral">
                    <tr>
                        <td class="table-row-id">${referral.referralId}</td>
                        <td>${referral.firstName} ${referral.lastName} </td>
                        <td>${referral.ageYears}</td>
                        <td>${referral.sex}</td>
                        <td>${referral.referredHealthCentre}</td>
                        <td>${referral.vhtName}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/referral/info/${referral.referralId}" class="glyphicon glyphicon-search table-icon" title="More Details"></a>
                        </td>
                        <%if (!referralList.get(buttonCounter++).getIsAssessed()) {%>
                        <td>
                            <form action="${pageContext.request.contextPath}/assessment/addAssessment/${referral.referralId}" method="get">
                                <button type="submit" class="btn-generic small" name="close" onclick="return confirm('Do you want to finalize this referral?');">Finalize</button>
                            </form>
                        </td>
                    </tr>
                    <%} else {%>
                        <td><button type="button" class="btn-generic small" style="background-color: darkred"> Closed </button></td>
                    <%}  %>
                </c:forEach>
                </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>

</html>
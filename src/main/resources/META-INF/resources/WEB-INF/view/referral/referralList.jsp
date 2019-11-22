<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <title>Referral List</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-referrals.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<%
    List<Referral> referralList = (List<Referral>)request.getAttribute("referralList");
%>

<body>
    <div class="main-container">

            <%@ include file="../navbar/navbar.jspf" %>
        
                <div class="content-container">
                <div class="content-header">
                    View Referrals
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
                            <td>
                                <form action="${pageContext.request.contextPath}/referral/close/${referral.referralId}" method="post">
                                    <button type="submit" class="btn-no-style glyphicon glyphicon-trash table-icon" name="delete" title="Delete" onclick="return confirm('Do you want to delete this referral?');"></button>
                                </form>
                            </td>
        
        
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </div>
                </div>
            </div>
        </div>

</body>

</html>
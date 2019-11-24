<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Referral" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Reading" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.Patient" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis" %>
<html>

<head>

    <meta charset="utf-8">
    <title>Edit Referral</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<%
    Referral referral = (Referral)request.getAttribute("referral");
%>

<body>

<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            Edit Referral
        </div>

    </div>
</div>

</body>
</html>

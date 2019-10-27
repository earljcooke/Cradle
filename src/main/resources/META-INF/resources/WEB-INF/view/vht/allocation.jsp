<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<%
    ArrayList<User> listOfVHT = (ArrayList<User>) request.getAttribute("listOfVHT");
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Patient Allocation</title>
    <!-- Native scripts -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vht.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navfunc.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome.css">


    <!-- Imported scripts -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>

<%@ include file="../navbar_admin.jspf" %>

<br>
<br>
<br>
<br>


<form id="allocationForm" action="${pageContext.request.contextPath}/submitAllocation" method="post">
  <div class="head-style">
    <h1 > Allocate patients from</h1>
  </div>

    <br>

    <div style="text-align:center;" >
            <select id = "firstVHT" name="firstVHT" class="btn btn-primary dropdown-toggle btn-select btn-lg">
                <c:forEach items="<%=listOfVHT%>" var = "vht">
                    <option>${vht.userId} - ${vht.firstName} ${vht.lastName}</option>
                </c:forEach>
            </select>

            <div class="divider"> &nbsp; TO &nbsp; </div>

            <select id = "secondVHT" name="secondVHT"  class="btn btn-primary dropdown-toggle btn-select btn-lg">
                <c:forEach items="<%=listOfVHT%>" var = "vht">
                    <option>${vht.userId} - ${vht.firstName} ${vht.lastName}</option>
                </c:forEach>
            </select>
    </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<br>
<br>
<div style="text-align:center;">

    <button id="mig_confirm" type="submit" form="allocationForm" class="btn btn-success btn-lg" onclick="return confirmAllocation()" value="Submit">
        CONFIRM
    </button>

</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

<script src="${pageContext.request.contextPath}/js/allocation.js"></script>

</html>
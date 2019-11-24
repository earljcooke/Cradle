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
    <title>Patient Allocation</title>
    <!-- Native scripts -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vht.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/edit-users.css"/>
    <!-- Imported scripts -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>


</head>

<body>


<div class="main-container">

    <%@ include file="../navbar/navbar.jspf" %>

    <div class="content-container">
        <div class="content-header">
            Allocate Patients
        </div>

        <div class="container-allocation">

            <div class="container">
                <form id="allocationForm" action="${pageContext.request.contextPath}/submitAllocation"
                      method="post">
                    <div class="form-group row">
                        <label for="firstVHT"
                               class="col-md-4 col-form-label text-md-right register-users-label">ALLOCATE FROM</label>
                        <div class="col-md-4 col-form-label text-md-right">
                            <select id="firstVHT" name="firstVHT">
                                <c:forEach items="<%=listOfVHT%>" var="vht">
                                    <option>${vht.email} - ${vht.firstName} ${vht.lastName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="secondVHT"
                               class="col-md-4 col-form-label text-md-right register-users-label">ALLOCATE TO</label>
                        <div class="col-md-4  col-form-label text-md-right ">
                            <select id="secondVHT" name="secondVHT">
                                <c:forEach items="<%=listOfVHT%>" var="vht">
                                    <option>${vht.email} - ${vht.firstName} ${vht.lastName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

            </div>

            <br>
            <br>
            <div style="text-align:center;">

                <button id="mig_confirm" type="submit" form="allocationForm" class="btn-confirm"
                        onclick="return confirmAllocation()" value="Submit">
                    CONFIRM
                </button>

            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

<script src="${pageContext.request.contextPath}/js/allocation.js"></script>

</html>
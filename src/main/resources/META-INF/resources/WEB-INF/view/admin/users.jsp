<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<%
    List<User> userList = (List<User>) request.getAttribute("users");
%>

<head>
    <meta charset="utf-8">
    <title>Users</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/view-users.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>

<div class="main-container">

    <%@ include file="../navbar/navbar.jspf" %>

      <div class="content-container">
        <div class="content-header">
          View Users
        </div>
        <div class="content-body">
          <div class="table-container">
            <table class="table view-users-table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">FIRST NAME</th>
                <th scope="col">LAST NAME</th>
                <th scope="col">E-MAIL</th>
                <th scope="col">PHONE #</th>
                <th scope="col">ROLES</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="<%=userList%>" var = "user">
                <tr>
                    <td class="table-row-id">${user.userId}</th>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNumber}</td>
                    <td>
                        <c:forEach items="${user.roles}" var = "role">
                            ${role}
                            <br>
                        </c:forEach>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/users/${user.userId}" class="glyphicon glyphicon-pencil table-icon" title="Edit"></a>
                    </td>
                    <td>
                      <a href="/admin/users/contact?userId=${user.userId}&name=${user.firstName} + ${user.lastName}" class="glyphicon glyphicon-envelope table-icon" title="Contact person"></a>
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
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
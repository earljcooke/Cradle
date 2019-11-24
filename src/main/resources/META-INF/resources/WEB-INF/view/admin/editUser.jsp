<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<%
    User postUser = (User) request.getAttribute("postUser");
%>

<head>
    <meta charset="utf-8">
    <title>Users</title>

    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/edit-users.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>

<div class="main-container">
    <%@ include file="../navbar/navbar.jspf" %>

      <div class="content-container">
        <div class="content-header">
          Edit Users
        </div>

            <div class="edit-users-container">

                    <form id="editForm" action="${pageContext.request.contextPath}/admin/users/edit" method = "post">
                        <label>
                            <input hidden required type="text" name="userId" value="<%=postUser.getUserId()%>">
                        </label>
                        <div class="form-group row">
                            <label for="firstName" class="col-md-4 col-form-label text-md-right edit-users-label">FIRST NAME</label>
                            <div class="col-md-6">
                                <input required type="text" id="firstName" class="edit-field" name="firstName" value="<%=postUser.getFirstName()%>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lastName" class="col-md-4 col-form-label text-md-right edit-users-label">LAST NAME</label>
                            <div class="col-md-6">
                                <input required type="text" id="lastName" class="edit-field" name="lastName" value="<%=postUser.getLastName()%>">
                            </div>
                        </div>

                        <div hidden class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                            <div class="col-md-6">
                                <input required type="password" id="password" class="form-control" name="password" value="<%=postUser.getPassword()%>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right edit-users-label">EMAIL</label>
                            <div class="col-md-6">
                                <input required type="email" id="email" class="edit-field" name="email" value="<%=postUser.getEmail()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phoneNumber" class="col-md-4 col-form-label text-md-right edit-users-label">PHONE #</label>
                            <div class="col-md-6">
                                <input type="text" id="phoneNumber" class="edit-field" name="phoneNumber" value="<%=postUser.getPhoneNumber()%>">
                            </div>
                          </div>
                        <div class="form-group row">
                            <label class="col-md-4 col-form-label text-md-right edit-users-label" style="margin-top: 10px">ROLES</label>
                            <div class="col-md-6 col-form-label">
                                <div class="form-check form-check-inline">
                                    <div class="round">
                                    <c:if test="<%= postUser.isVHT() %>">
                                        <input checked class="form-check-input" type="checkbox" name="roles" id="inlineCheck1" value="VHT" class="edit-checkbox">
                                    </c:if>
                                    <c:if test="<%= !postUser.isVHT() %>">
                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck1" value="VHT" class="edit-checkbox">
                                    </c:if>
                                    <label for="inlineCheck1"></label>
                                    </div>
                                    <label class="form-check-label" for="inlineCheck1">VHT</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <div class="round">
                                    <c:if test="<%= postUser.isHealthWorker() %>">
                                        <input checked class="form-check-input" type="checkbox" name="roles" id="inlineCheck2" value="HEALTHWORKER" class="edit-checkbox">
                                    </c:if>
                                    <c:if test="<%= !postUser.isHealthWorker() %>">
                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck2" value="HEALTHWORKER" class="edit-checkbox">
                                    </c:if>
                                    <label for="inlineCheck2"></label>
                                    </div>
                                    <label class="form-check-label" for="inlineCheck2">Health Worker</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <div class="round">
                                    <c:if test="<%= postUser.isAdmin() %>">
                                        <input checked class="form-check-input" type="checkbox" name="roles" id="inlineCheck3" value="ADMIN" class="edit-checkbox">
                                    </c:if>
                                    <c:if test="<%= !postUser.isAdmin() %>">
                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck3" value="ADMIN" class="edit-checkbox">
                                    </c:if>
                                    <label for="inlineCheck3"></label>
                                    </div>
                                    <label class="form-check-label" for="inlineCheck3">Admin</label>
                                </div>
                            </div>
                        </div>
                        <input type = "hidden" name = "${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <div class="row col-md-6 offset-md-4">
                        <div class="col sm-2">
                            <form id="deleteForm" action="${pageContext.request.contextPath}/admin/users/delete/<%=postUser.getUserId()%>" method = "post">
                                <button type="submit" form="deleteForm" onclick="return deleteAlertBox()" class="btn-delete">
                                    Delete
                                </button>
                                <input type = "hidden" name = "${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>
                        <div class="col sm-2">
                            <button type="submit" form="editForm" onclick="return rolesCheckbox()" class="btn-save">
                                Save
                            </button>
                        </div>
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

<script>

    function rolesCheckbox() {
        var checkBoxes = document.getElementsByName("roles");
        var isChecked = false;
        for (var i = 0; i < checkBoxes.length; i++) {
            if (checkBoxes[i].checked) {
                isChecked = true;
            }
        }
        if (isChecked) {
            return true
        } else {
            alert('Please select at least one role');
            return false;
        }
    }

    function deleteAlertBox() {
        return confirm("Are you sure you want to delete this user?");
    }

</script>

</body>
</html>
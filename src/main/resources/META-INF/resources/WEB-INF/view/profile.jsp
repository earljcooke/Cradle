<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' href="/css/profile.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
<div class="main-container">
        <%@ include file="./navbar/navbar.jspf" %>
    <div class="content-container">
        <div class="content-header">
            Your Profile
        </div>
        <div class="content-body">
            <div class="table-container">
                <div class="row">
                    <div class="col-sm-3">
                        <span class="glyphicon glyphicon-user profile-icon"></span>
                    </div>
                    <div class="col-sm-3 profile-label">
                        <span>ID</span></br>
                        <span>First Name</span></br>
                        <span>Last Name</span></br>
                        <span>Roles</span>
                    </div>
                    <div class="col-sm-6">
                        <span>${UserId}</span></br>
                        <span>${FirstName}</span></br>
                        <span>${LastName}</span></br>
                        <span>${Role}</span>
                    </div>
                </div>
                <div>
                    <form action="/profile/${pageContext.request.userPrincipal.name}/edit" method="post">
                        <input type="hidden" name="userName" value=${UserId}>
                        <button type="submit" value="submit" class="btn-edit">
                            Edit
                        </button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
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

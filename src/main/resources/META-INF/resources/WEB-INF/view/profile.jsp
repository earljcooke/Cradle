<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="/css/profile.css"/>
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>

<body>
<div class="main-container">
    <div class="navbar-container">
        <div class="navbar-title">
            Cradle.
        </div>

        <ul>
            <li class="navbar-list"><a class="nav-link" href="/admin/index"><span
                    class="glyphicon glyphicon-signal nav-link-icon"></span>Dashboard</a></li>
            <li class="navbar-list"><a class="nav-link" href="/admin/users"><span
                    class="glyphicon glyphicon-search nav-link-icon"></span>View Users</a></li>
            <li class="navbar-list">
                <a class="nav-link" href="/admin/registration"><span
                        class="glyphicon glyphicon-user nav-link-icon"></span>Register
                    Users</a>
            </li>
        </ul>

        <ul>
            <li class="navbar-list"><a class="nav-link" href="/patient/patientlist"><span
                    class="glyphicon glyphicon-user nav-link-icon"></span>Patients</a></li>
            <li class="navbar-list"><a class="nav-link" href="/reading/create"><span
                    class="glyphicon glyphicon-file nav-link-icon"></span>Readings</a></li>
            <li class="navbar-list"><a class="nav-link" href="/admin/education"><span
                    class="glyphicon glyphicon-folder-open nav-link-icon"></span>Education</a></li>
            <%if (request.getRemoteUser() != null) {%>
            <li class="navbar-list">
                <a
                        class="nav-link"
                        href="/profile/${pageContext.request.userPrincipal.name}"
                ><span class="glyphicon glyphicon-cog nav-link-icon"></span>Profile</a>
            </li>
            <%} %>
            <li class="navbar-list"><a class="nav-link" href="/logout">< Sign Out ></a></li>
        </ul>
    </div>
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
</body>
</html>

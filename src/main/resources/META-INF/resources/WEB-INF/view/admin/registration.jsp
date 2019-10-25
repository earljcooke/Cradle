<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/register-user.css" />
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
  </head>

  <body>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

    <div class="main-container">
      <!--NAVBAR-->
      <div class="navbar-container">
        <div class="navbar-title">
          Cradle.
        </div>

        <ul>
          <li class="navbar-list"><a class="nav-link" href="/admin/index"><span class="glyphicon glyphicon-signal nav-link-icon"></span>Dashboard</a></li>
          <li class="navbar-list"><a class="nav-link" href="/admin/users"><span class="glyphicon glyphicon-search nav-link-icon"></span>View Users</a></li>
          <li class="navbar-list">
            <a class="nav-link" href="/admin/registration"><span class="glyphicon glyphicon-user nav-link-icon"></span>Register Users</a>
          </li class="navbar-list">
        </ul>

        <ul>
          <li class="navbar-list"><a class="nav-link" href="/patient/patientlist"><span class="glyphicon glyphicon-user nav-link-icon"></span>Patients</a></li>
          <li class="navbar-list"><a class="nav-link" href="/reading/create"><span class="glyphicon glyphicon-file nav-link-icon"></span>Readings</a></li>
          <li class="navbar-list"><a class="nav-link" href="/admin/education"><span class="glyphicon glyphicon-folder-open nav-link-icon"></span>Education</a></li>
          <%if (request.getRemoteUser()!= null) {%>
          <li class="navbar-list">
            <a
              class="nav-link"
              href="/profile/${pageContext.request.userPrincipal.name}"
              ><span class="glyphicon glyphicon-cog nav-link-icon"></span>Profile</a
            >
          </li>
          <%} %>
          <li class="navbar-list"><a class="nav-link" href="/logout">< Sign Out ></a></li>
        </ul>
      </div> <!--END of NAVBAR-->
      <div class="content-container">
        <div class="content-header">
          Register A New User
        </div>
            <div class="register-users-container">
                <main class="my-form">
                <div class="container">
                                    <form action="${pageContext.request.contextPath}/admin/submitRegistration" method = "post">
                                        <div class="form-group row">
                                            <label for="firstName" class="col-md-4 col-form-label text-md-right register-users-label">FIRST NAME</label>
                                            <div class="col-md-6">
                                                <input type="text" id="firstName" class="register-field" name="firstName" placeholder="First Name">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="lastName" class="col-md-4 col-form-label text-md-right register-users-label">LAST NAME</label>
                                            <div class="col-md-6">
                                                <input type="text" id="lastName" class="register-field" name="lastName" placeholder="Last Name">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="password" class="col-md-4 col-form-label text-md-right register-users-label">PASSWORD</label>
                                            <div class="col-md-6">
                                                <input type="text" id="password" class="register-field" name="password" placeholder="Password">
                                            </div>
                                            <input type = "hidden" name = "${_csrf.parameterName}" value="${_csrf.token}"/>
                                        </div>

                                        <div class="form-group row">
                                            <label for="email" class="col-md-4 col-form-label text-md-right register-users-label">EMAIL</label>
                                            <div class="col-md-6">
                                                <input type="text" id="email" class="register-field" name="email" placeholder="Email">
                                            </div>
                                        </div>
                                            <div class="form-group row">
                                                <label class="col-md-4 col-form-label text-md-right register-users-label">ROLES</label>
                                                <div class="col-md-6 col-form-label">
                                                    <div class="form-check form-check-inline">
                                                        <div class="round">
                                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck1" value="VTH" class="register-checkbox">
                                                        <label for="inlineCheck1"></label>
                                                        </div>
                                                        <label class="form-check-label" for="inlineCheck1">VHT</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <div class="round">
                                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck2" value="HEALTHWORKER" class="register-checkbox">
                                                        <label for="inlineCheck2"></label>
                                                        </div>
                                                        <label class="form-check-label" for="inlineCheck2">Health Worker</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <div class="round">
                                                        <input class="form-check-input" type="checkbox" name="roles" id="inlineCheck3" value="ADMIN" class="register-checkbox">
                                                        <label for="inlineCheck3"></label>
                                                        </div>
                                                        <label class="form-check-label" for="inlineCheck3">Admin</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 offset-md-6">
                                                <div class="offset-md-2">
                                                    <button type="submit" class="btn-register">
                                                        Register
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
      </div>
    </div>
  </body>
</html>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css" />
    <link rel='stylesheet' href="/css/bootstrap.min.css"/>
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
    <div class="container">
      <div class="navbar-container">
        <div class="navbar-title">
          Cradle.
        </div>

        <ul>
          <li class="navbar-list"><a class="nav-link" href="/admin/index"><span class="glyphicon glyphicon-home nav-link-icon"></span>Dashboard</a></li>
          <li class="navbar-list"><a class="nav-link" href="/admin/users"><span class="glyphicon glyphicon-search nav-link-icon"></span>View users</a></li>
          <li class="navbar-list">
            <a class="nav-link" href="/admin/registration"><span class="glyphicon glyphicon-user nav-link-icon"></span>Register users</a>
          </li class="navbar-list">
        </ul>

        <ul>
          <li class="navbar-list"><a class="nav-link" href="/patient/patientlist"><span class="glyphicon glyphicon-user nav-link-icon"></span>Patients</a></li>
          <li class="navbar-list"><a class="nav-link" href="/reading/create"><span class="glyphicon glyphicon-file nav-link-icon"></span>Readings</a></li>
          <%if (request.getRemoteUser()!= null) {%>
          <li class="navbar-list">
            <a
              class="nav-link"
              href="/profile/${pageContext.request.userPrincipal.name}"
              ><span class="glyphicon glyphicon-cog nav-link-icon"></span>Profile</a
            >
          </li>
          <%} %>
        </ul>
      </div>
      <div class="content-container">
        <div class="content-header">
          Dashboard
        </div>
        <div class="summary-container">
          PLACEHOLDER
        </div>
        <div class="summary-container">
          PLACEHOLDER
        </div>
      </div>
    </div>
  </body>
</html>

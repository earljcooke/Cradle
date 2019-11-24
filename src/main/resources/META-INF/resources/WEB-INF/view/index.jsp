<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <script src="/js/index.js"></script>
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
    <!--NAVBAR-->

    <!--END of NAVBAR-->

    <div class="container">
      <div class="welcome-container">
        <div class="welcome-inner-container">
          <span class="dot1"></span>
          <span class="dot2"></span>
          <span class="dot3"></span>
          <span class="dot4"></span>
          <span class="dot5"></span>
          <span class="dot6"></span>
          <div id="welcome-header" class="fade vertical-translate">
            Cradle.
          </div>
          <div id="welcome-desc" class="fade vertical-translate">
            WELCOME TO</br>
            MERCURY'S PROJECT
          </div>
        </div>
      </div>
      <div class="login-container">
        <div class="login-inner-container">
          <form
            method="POST"
            action="${pageContext.request.contextPath}/login"
            class="form-signin"
          >
            <div class="login-header">
              Sign in
            </div>
            <div class="form-group">
              <div class="login-field-container">
                <input
                  class="login-field form-control"
                  id="username"
                  name="username"
                  type="email"
                  placeholder="Email"
                  required
                  autofocus
                />
              </div>

              <div class="login-field-container">
                <input
                  class="login-field form-control"
                  id="password"
                  name="password"
                  type="password"
                  placeholder="Password"
                  required
                />
              </div>

              <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"
              />

              <div class="form-actions" style="margin-top: 12px">
                <button class="btn btn-success login-btn" type="submit">
                  Log In
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>

<%@ page import="com.mercury.TeamMercuryCradlePlatform.model.User" %> <%@ page
import="com.mercury.TeamMercuryCradlePlatform.repository.UserRepository" %> <%@
taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <% String email = (String)request.getAttribute("email"); String phoneNumber =
  (String)request.getAttribute("phoneNumber"); %>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Cradle</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/contact.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="/css/toastr.css" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="/js/toastr.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/notifications.js"></script>
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
    <div class="main-container">
      <%@ include file="../navbar/navbar.jspf" %>
      <div class="content-container">
        <div class="content-header">
          Contact User
        </div>
        <div class="content-body">
          <div class="contact-container">
            <form
              action="${pageContext.request.contextPath}/admin/submitMessage"
              method="POST"
            >
              <input id="email" name="email" type="hidden" value="<%=email%>" />
              <input
                id="phoneNumber"
                name="phoneNumber"
                type="hidden"
                value="<%=phoneNumber%>"
              />

              <div class="form-group row">
                <label
                  for="contactMethod"
                  class="col-md-3 col-form-label text-md-right contact-label"
                  >METHOD</label
                >
                <div class="col-md-8">
                  <select
                    class="form-control"
                    id="contactMethod"
                    name="contactMethod"
                  >
                    <option value="email">Email</option>
                    <option value="phoneNumber">Phone Number</option>
                  </select>
                </div>
              </div>

              <div class="form-group row">
                <label
                  class="col-md-3 col-form-label text-md-right contact-label"
                  >TO</label
                >
                <div class="col-md-8 contact-receiver-container">
                  <span class="contact-receiver">${name}</span>
                </div>
              </div>
              <div class="form-group row">
                <label
                  for="subject"
                  class="col-md-3 col-form-label text-md-right contact-label"
                  >SUBJECT</label
                >
                <div class="col-md-8">
                  <input
                    type="text"
                    id="subject"
                    class="contact-field"
                    name="subject"
                    placeholder="Subject"
                  />
                </div>
              </div>
              <div class="form-group row contact-message-container">
                <label
                  for="message"
                  class="col-md-3 col-form-label text-md-right contact-label"
                  >MESSAGE</label
                >
                <div class="col-md-8">
                  <textarea
                    rows="5"
                    id="message"
                    class="contact-message"
                    name="message"
                    placeholder="Message"
                  ></textarea>
                </div>
              </div>
              <div class="col-md-6 offset-md-6">
                <div class="offset-md-5">
                  <button
                    type="submit"
                    class="btn-send"
                    onclick="contactMessage()"
                  >
                    Send
                  </button>
                </div>
              </div>
              <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"
              />
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

<%@ page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="com.mercury.TeamMercuryCradlePlatform.Strings" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>${error}</title>

    <style>
        table td{
            vertical-align:top;
            border:solid 1px #888;
            padding:10px;
        }
    </style>

     <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:400" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet">

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

        <!-- Custom stlylesheet -->
        <link rel="stylesheet" type="text/css" href="/css/error.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
         	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
         <![endif]-->
</head>


<body>

	<div id="notfound">
		<div class="notfound-bg"></div>
		<div class="notfound">
			<div class="notfound-404">
				<h1 id="code">${status}</h1>
			</div>
			<p id = "trace" style="color: transparent; font-size: 1px">${trace}</p>
			<h2 id="msg"> ${error} </h2>
			<a href="${pageContext.request.contextPath}/#">Back To Homepage</a>
			<br>
			<a id="mailSender" href="javascript:SendMail();"> Send details to Site Admin</a>
		</div>
	</div>
</body>

<script>
function SendMail() {
    var sub= "Error " + document.getElementById("code").innerHTML;
    var bod = "Please see error trace: \n" + document.getElementById("trace").innerHTML;
	var adminEmail = "<%= Strings.ADMIN_EMAIL %>";
	var link = "mailto:" + adminEmail
             + "?subject=" + encodeURI(sub)
             + "&body=" + encodeURI(bod)
    ;

    window.open(link);
}

</script>

<!-- This html file was made using templates made by Colorlib (https://colorlib.com) -->
</html>
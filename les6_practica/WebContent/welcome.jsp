<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="/navBar.css">
</head>
<body>
<div id="navBar">
	<ul>
	  	<li><a href="/index.jsp">Home</a></li>
	    <li><a href="/register.jsp">Registreren</a></li>
	    <c:if test="${request.getSession().getAttribute('loggedUser') != null}">
		 	<li><a href="/Blogger/myAccount.jsp">Mijn Account</a></li>
		 	<li><a href="/Blogger/myPosts.jsp">Mijn Posts</a></li>
	  	</c:if>
	</ul>
</div>
<h1>Registratie Succesvol!</h1>
<h3>Account gegevens:</h3>
<p>
Naam:
<%  out.println(request.getAttribute("naam")); %>
<br/>
Gebruikers naam:
<%= request.getAttribute("gbname") %>
<br/>
Email:
<%  out.println(request.getAttribute("email")); %>
<br/>
Wachtwoord:
<%  out.println(request.getAttribute("password")); %>
<p></p>
<a href="index.jsp">HOME</a>
</body>
</html>
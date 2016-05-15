<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registreren</title>
<link rel="stylesheet" type="text/css" href="/navBar.css">
</head>
<body>
<div id="navBar">
	<ul>
	  	<li><a href="/index.jsp">Home</a></li>
	    <li><a href="/register.jsp" class="active">Registreren</a></li>
	    <% if (request.getSession().getAttribute("loggedUser") != null) { %>
		 	<li><a href="/Blogger/myAccount.jsp">Mijn Account</a></li>
		 	<li><a href="/Blogger/myPosts.jsp">Mijn Posts</a></li>
		 	<form id="form" action="/LogoutServlet.do" method="post">
		 		<li><a href="javascript:{}"onclick="document.getElementById('form').submit();">Uitloggen</a></li>
		 	</form>
	  	<%}%>
	</ul>
</div>
<form action="RegisterServlet.do" method="post">
	<p>Password:</p>
	<input type="password" name="password"/>
	
	
	<p>Confirm Password:</p>
	<input type="password" name="pass" />
	
	<p>Naam:</p>
	<input type="text" name="naam"/>
	<p>Gebruikers naam:</p>
	<input type="text" name="gbNaam"/>
	<p></p>
	<p>Email adres:</p>
	<input type="text" name="email"/>
	
	<p></p>
	<% Object message = request.getAttribute("message");
		if(message != null){
			out.println(message);
		}
	%>
	<p></p>
	<input type="submit" value="Submit"/>
</form>
</body>
</html>
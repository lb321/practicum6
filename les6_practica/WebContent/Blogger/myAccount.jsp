<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import="model.User" %>
<title>Mijn Account</title>
<link rel="stylesheet" type="text/css" href="/navBar.css">
</head>
<body>
<div id="navBar">
	<ul>
	  	<li><a href="/index.jsp">Home</a></li>
	    <li><a href="/register.jsp">Registreren</a></li>
	    <% if (request.getSession().getAttribute("loggedUser") != null) { %>
		 	<li><a href="/Blogger/myAccount.jsp" class="active">Mijn Account</a></li>
		 	<li><a href="/Blogger/myPosts.jsp">Mijn Posts</a></li>
		 	<form id="form" action="/LogoutServlet.do" method="post">
		 		<li><a href="javascript:{}"onclick="document.getElementById('form').submit();">Uitloggen</a></li>
		 	</form>
	  	<%}%>
	</ul>
</div>
	<p></p>
	<%= "Welkom " + ((User) request.getSession().getAttribute("loggedUser")).getName()	%>
	<form action="/Blogger/BlogPostServlet.do" method="post">
		<p>Onderwerp</p>
		<input type="text" name="to"/>
		<p>Bericht</p>
		<textarea rows="5" cols="50" name="bericht"></textarea>
		<br/>
		<input type="submit" value="Submit"/>
	</form>
	<% Object message = request.getAttribute("message");
		if(message != null){
			out.println(message);
		}
	%>
	<br/>
	<form action="/LogoutServlet.do" method="post">
		<input type="submit" value="Uitloggen"/>
	</form>

</body>
</html>
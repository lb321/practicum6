<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/navBar.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mijn posts</title>
</head>
<body>
<div id="navBar">
	<ul>
	  	<li><a href="/index.jsp">Home</a></li>
	    <li><a href="/register.jsp">Registreren</a></li>
	    <% if (request.getSession().getAttribute("loggedUser") != null) { %>
		 	<li><a href="/Blogger/myAccount.jsp">Mijn Account</a></li>
		 	<li><a href="/Blogger/myPosts.jsp" class="active">Mijn Posts</a></li>
		 	<form id="form" action="/LogoutServlet.do" method="post">
		 		<li><a href="javascript:{}"onclick="document.getElementById('form').submit();">Uitloggen</a></li>
		 	</form>
	  	<%}%>
	</ul>
</div>
	<c:forEach var="post" items="${posts}">
		<table style="border: groove; border-collapse: collapse;">
			<tr>
				<td>
					<a>Tijd</a>
				</td>
				<td>
					<c:out value="${post.tijd}"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px;">
					<a>Onderwerp</a>
				</td>
				<td>
					<c:out value="${post.subject}"/>
				</td>
			</tr>
			<tr>
				<td>
					<a>Tekst</a>
				</td>
				<td>
					<c:out value="${post.text}"/>
				</td>
			</tr>
		</table>
		<br/>
	</c:forEach>
	<a href="myAccount.jsp">mijn Account</a>
</body>
</html>
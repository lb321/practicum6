<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<% request.setAttribute("service", ServiceProvider.getBlogService()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/navBar.css">
<title>Home page</title>
</head>
<body>
<div id="navBar">
	<ul>
	  	<li><a href="/index.jsp" class="active">Home</a></li>
	    <li><a href="/register.jsp">Registreren</a></li>
	    <% if (request.getSession().getAttribute("loggedUser") != null) { %>
		 	<li><a href="/Blogger/myAccount.jsp">Mijn Account</a></li>
		 	<li><a href="/Blogger/myPosts.jsp">Mijn Posts</a></li>
		 	<form id="form" action="/LogoutServlet.do" method="post">
		 		<li><a href="javascript:{}"onclick="document.getElementById('form').submit();">Uitloggen</a></li>
		 	</form>
	  	<%}%>
	</ul>
</div>
<h3>Inloggen</h3>
<div style="border-style: groove; width:250px; display:inline-block;">
<form action="LoginServlet.do" method="post">
<%! String gbName = ""; %>
<% try{
	for (Cookie c : request.getCookies()) {
		if (c.getName().equals("usrName")) {
			gbName = c.getValue() + "\n";
			break;
			}
		}
} catch(Exception e){
	
}
 %>
	<p>Inlog naam</p>
	<input type="text" name="name" value='<%=gbName%>' required/>
	<p>Wachtwoord</p>
	<input type="password" name="pass" required/>
	<p></p>
	<input type="submit" value="Submit"/>
	<p></p>
	<% Object message = request.getAttribute("message");
		if(message != null){
			out.println(message);
		}
	%>
	<p></p>
	<a href="register.jsp">Registreren</a>
	<br/>
	<a href="wachtwoordvergeten">Wachtwoord vergeten</a>
	
	
</form>

</div>
<br/>
<h3>Alle posts</h3>
<div style="display: inline-block; max-width:600px;">
	<c:forEach var="post" items="${service.getAllPosts()}">
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
</div>
	
</body>
</html>
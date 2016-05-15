package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException {
		req.getSession().removeAttribute("loggedUser");
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		rd.forward(req, resp);	
	}
	
}

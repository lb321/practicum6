package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlogService;
import model.ServiceProvider;
import model.User;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1190137669743686642L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException {
		BlogService service = ServiceProvider.getBlogService();
		String name = req.getParameter("naam");
		String password1 = req.getParameter("password");
		String password2 = req.getParameter("pass");
		String email = req.getParameter("email");
		String gebruikersNaam = req.getParameter("gbNaam");
		RequestDispatcher rd = null;
		if(name.length() < 1 || gebruikersNaam.length() < 1 || password1.length() < 1 || password2.length() < 1 || email.length() <1){
			//resp.sendRedirect("register.jsp");
			rd = req.getRequestDispatcher("register.jsp");
			req.setAttribute("message", "Vul alle velden in!");
			rd.forward(req, resp);
		} else if(!password1.equals(password2)){
			rd = req.getRequestDispatcher("register.jsp");
			req.setAttribute("message", "Wachtwoorden zijn niet gelijk!");
			rd.forward(req, resp);
		} else if(!email.contains("@") || !email.contains(".")){
			rd = req.getRequestDispatcher("register.jsp");
			req.setAttribute("message", "Email adres klopt niet.");
			rd.forward(req, resp);
		} else {
			rd = req.getRequestDispatcher("welcome.jsp");
			req.setAttribute("naam", name);
			req.setAttribute("gbname", gebruikersNaam);
			req.setAttribute("password", password1);
			req.setAttribute("email", email);
			User usr = new User(gebruikersNaam, password1, email, name);
			service.registerUser(gebruikersNaam, password1, email, name);
			rd.forward(req, resp);
		}
	}
}
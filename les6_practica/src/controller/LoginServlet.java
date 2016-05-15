package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlogService;
import model.ServiceProvider;
import model.User;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException {
		BlogService service = ServiceProvider.getBlogService();
		String name = req.getParameter("name");
		String password = req.getParameter("pass");
		RequestDispatcher rd = null;
		User usr = service.loginUser(name, password);
		if(usr != null){
			rd = req.getRequestDispatcher("Blogger/myAccount.jsp");
			req.setAttribute("naam", usr.getName());
			req.getSession().setAttribute("loggedUser", usr);
			Cookie c = new Cookie("usrName", usr.getUsername());
			resp.addCookie(c);
			rd.forward(req, resp);
		} else{
			rd = req.getRequestDispatcher("index.jsp");
			req.setAttribute("message", "Incorrecte gebruikersnaam of wachtwoord");
			rd.forward(req, resp);
		}		
	}
	
}

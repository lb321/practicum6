package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlogService;
import model.ServiceProvider;
import model.User;

/**
 * Servlet implementation class BlogPostServlet
 */
@WebServlet("/BlogPostServlet")
public class BlogPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BlogService service = ServiceProvider.getBlogService();
		String to = request.getParameter("to");
		String text = request.getParameter("bericht");
		RequestDispatcher rd = null;
		User usr = (User) request.getSession().getAttribute("loggedUser");
		try{
			service.addBlogPostForUser(to, text, usr);
			rd = request.getRequestDispatcher("/Blogger/myPosts.jsp");
			request.setAttribute("posts", usr.getMyBlogPosts());
			rd.forward(request, response);
		}catch(IllegalArgumentException e){
			rd = request.getRequestDispatcher("/Blogger/myAccount.jsp");
			request.setAttribute("naam", usr.getName());
			request.setAttribute("message", e.getMessage());
			request.getSession().setAttribute("loggedUser", usr);
			rd.forward(request, response);
		}		
	}

}

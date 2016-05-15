package utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.BlogService;
import model.ServiceProvider;

public class servletcontextListener implements ServletContextListener{
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		BlogService service = ServiceProvider.getBlogService();
		service.registerUser("test", "pass", "test@mail.com", "test gebruiker");		
	}
}

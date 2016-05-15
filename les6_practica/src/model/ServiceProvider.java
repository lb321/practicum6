package model;

public class ServiceProvider {
	private static BlogService bs = new BlogService();
	
	public static BlogService getBlogService(){
		return bs;
	}
}

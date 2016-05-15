package model;

import java.util.ArrayList;

public class BlogService {
	private ArrayList<User> allUsers = new ArrayList<User>();
	
	public void addBlogPostForUser(String sub, String txt, User u){
		if(sub != null && txt != null && sub.length() > 0 && txt.length() > 0){
			u.addBlogPost(new BlogPost(sub, txt));
		} else{
			throw new IllegalArgumentException("Invoer mag geen null zijn!");
		}
	}
	
	public boolean registerUser(String uNm, String pw, String em, String rN){
		for(User u: allUsers){
			if(u.getUsername().equals(uNm)){
				return false;
			}
		}
		allUsers.add(new User(uNm, pw, em, rN));
		return true;
	}
	
	public User loginUser(String uNm, String pw){
		for(User u: allUsers){
			if(u.getUsername().equals(uNm) && u.checkPassword(pw)){
				return u;
			}
		}
		return null;
	}
	
	public ArrayList<BlogPost> getAllPosts(){
		ArrayList<BlogPost> allPosts = new ArrayList<BlogPost>();
		for(User u: allUsers){
			for(BlogPost bp: u.getMyBlogPosts()){
				allPosts.add(bp);
			}
		}
		return allPosts;
	}
}

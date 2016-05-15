package model;

import java.util.ArrayList;
import java.util.Collections;

public class User {
	private String username;
	private String password;
	private String email;
	private String name;
	private ArrayList<BlogPost> myPosts = new ArrayList<BlogPost>();
	
	public User(String uNm, String pw, String em, String nm)
	{
		username = uNm;
		password = pw;
		email = em;
		name = nm;
	}
	
	public String getUsername(){
		return username;
	}
	
	public boolean checkPassword(String pw){
		if(pw.equals(password)){
			return true;
		}
		return false;
	}
	
	public String getName(){
		return name;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void addBlogPost(BlogPost bp){
		myPosts.add(bp);
	}
	
	public ArrayList<BlogPost> getMyBlogPosts(){
		return new ArrayList<BlogPost>(Collections.unmodifiableList(myPosts));
	}
}

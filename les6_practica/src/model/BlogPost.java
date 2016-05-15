package model;

import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalTime;

public class BlogPost {
	private long creationTime;
	private String subject;
	private String text;
	
	public BlogPost(String sub, String txt){
		creationTime = System.currentTimeMillis();
		subject = sub;
		text = txt;
	}
	
	public long getCreationTime(){
		return creationTime;
	}
	
	public String getTijd(){
		Format format = new SimpleDateFormat("dd-mm-yyy HH:mm");
		return format.format(new Date(creationTime));
	}
	
	public String getText(){
		return text;
	}
	
	public String getSubject(){
		return subject;
	}
}

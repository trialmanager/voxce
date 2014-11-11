package com.Voxce.model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="question_logs")
public class Question_Logs  {

	private int log_id; 	
	private int question_id;
	private String question_name;	
	private int modified_by;
	private String user_name;
	private String change_info; 
	private Date 	date;
	private Time 	time;
	 	 	 	 	 	 	 	
	@Id
	@GeneratedValue
	@Column(name="log_id")
	public int getLog_id() {
		return log_id;
	}
	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}
	
	@Column(name="question_id")
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	
	@Column(name="question_name")
	public String getQuestion_name() {
		return question_name;
	}
	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}
	
	@Column(name="modified_by")
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	
	
	@Column(name="user_name")
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	@Column(name="change_info")
	public String getChange_info() {
		return change_info;
	}
	public void setChange_info(String change_info) {
		this.change_info = change_info;
	}
	
	
	@Column(name="modified_date")
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	@Column(name="modified_time")
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	
		
}
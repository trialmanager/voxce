package com.Voxce.model;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sites_users")
public class SitesUsers {
	private int site_user_id; 	
	private int site_id;
	private int user_id;
	private int assigned_by;
	Date assigned_date;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="site_user_id")
	public int getSite_user_id() {
		return site_user_id;
	}
	public void setSite_user_id(int site_user_id) {
		this.site_user_id = site_user_id;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="assigned_by")
	public int getAssigned_by() {
		return assigned_by;
	}
	public void setAssigned_by(int assigned_by) {
		this.assigned_by = assigned_by;
	}
	
	@Column(name="assigned_date")
	public Date getAssigned_date() {
		return assigned_date;
	}
	public void setAssigned_date(Date assigned_date) {
		this.assigned_date = assigned_date;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}  	
}

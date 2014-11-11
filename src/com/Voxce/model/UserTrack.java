package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_track")
public class UserTrack {
	
	private int user_track_id;
	private int user_id;
	private String ip;
	private String page;
	private Date visit_dt;
	
	
	@Id
	@GeneratedValue
	@Column(name="user_track_id")
	public int getUser_track_id() {
		return user_track_id;
	}
	public void setUser_track_id(int user_track_id) {
		this.user_track_id = user_track_id;
	}
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="ip")
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Column(name="page")
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
	@Column(name="visit_dt")
	public Date getVisit_dt() {
		return visit_dt;
	}
	public void setVisit_dt(Date visit_dt) {
		this.visit_dt = visit_dt;
	}
}

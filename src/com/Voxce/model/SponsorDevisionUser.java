package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="sponsor_devision_user")
public class SponsorDevisionUser {
	
	private int sponsor_devision_user_id;
	private int sponsor_id;
	private int devision_id;
	private int user_id;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private int subscriber_id;
	
	
	@Id
	@GeneratedValue
	@Column(name="sponsor_devision_user_id")
	public int getSponsor_devision_user_id() {
		return sponsor_devision_user_id;
	}
	public void setSponsor_devision_user_id(int sponsor_devision_user_id) {
		this.sponsor_devision_user_id = sponsor_devision_user_id;
	}
	
	@Column(name="sponsor_id")
	public int getSponsor_id() {
		return sponsor_id;
	}
	public void setSponsor_id(int sponsor_id) {
		this.sponsor_id = sponsor_id;
	}
	
	@Column(name="devision_id")
	public int getDevision_id() {
		return devision_id;
	}
	public void setDevision_id(int devision_id) {
		this.devision_id = devision_id;
	}
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="date_created")
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	
	@Column(name="modified_by")
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	
	@Column(name="date_modified")
	public Date getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Date date_modified) {
		this.date_modified = date_modified;
	}
	@Column(name="subscriber_id")
	public int getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(int subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
}

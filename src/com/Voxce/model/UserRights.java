package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_rights")
public class UserRights {
	
	private int user_right_id;
	private int user_id;
	private int resource_id;
	private int right_type_id;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	
	
	@Id
	@GeneratedValue
	@Column(name="user_right_id")
	public int getUser_right_id() {
		return user_right_id;
	}
	public void setUser_right_id(int user_right_id) {
		this.user_right_id = user_right_id;
	}
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="resource_id")
	public int getResource_id() {
		return resource_id;
	}
	public void setResource_id(int resource_id) {
		this.resource_id = resource_id;
	}
	
	@Column(name="right_type_id")
	public int getRight_type_id() {
		return right_type_id;
	}
	public void setRight_type_id(int right_type_id) {
		this.right_type_id = right_type_id;
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
}

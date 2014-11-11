package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="user_cv")
public class UserCV {
	
	private int user_cv_id;
	private int user_id;
	private int study_id;
	private Date received_dt;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private String type;
	private String filename;
	private String file_description;
	private byte[] data;
	
	@Id
	@GeneratedValue
	@Column(name="user_cv_id")
	public int getUser_cv_id() {
		return user_cv_id;
	}
	public void setUser_cv_id(int user_cv_id) {
		this.user_cv_id = user_cv_id;
	}
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="received_dt")
	public Date getReceived_dt() {
		return received_dt;
	}
	public void setReceived_dt(Date received_dt) {
		this.received_dt = received_dt;
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
	
		@Column(name="filename")
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Column(name="file_description")
	public String getFile_description() {
		return file_description;
	}
	public void setFile_description(String file_description) {
		this.file_description = file_description;
	}
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	
	@Column(name="data")
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
}

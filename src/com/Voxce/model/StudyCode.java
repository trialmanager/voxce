package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="study_code")
public class StudyCode {
	
	private int study_code_id;
	private int  study_id;
	private String study_code;
	private int  created_by;
	private Date  date_created;
	private int  modified_by;
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="study_code_id")
	public int getStudy_code_id() {
		return study_code_id;
	}
	public void setStudy_code_id(int study_code_id) {
		this.study_code_id = study_code_id;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="study_code")
	public String getStudy_code() {
		return study_code;
	}
	public void setStudy_code(String study_code) {
		this.study_code = study_code;
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

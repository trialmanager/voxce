package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="study_user_countries")
public class StudyUserCountries {
		
	private int study_user_country_id;
	private int study_user_id;
	private int country_id;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="study_user_country_id")
	public int getStudy_user_country_id() {
		return study_user_country_id;
	}
	public void setStudy_user_country_id(int study_user_country_id) {
		this.study_user_country_id = study_user_country_id;
	}
	
	@Column(name="study_user_id")
	public int getStudy_user_id() {
		return study_user_id;
	}
	public void setStudy_user_id(int study_user_id) {
		this.study_user_id = study_user_id;
	}
	
	@Column(name="country_id")
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
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

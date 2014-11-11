package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="study_site_labroratories")
public class StudySiteLabroratories {

	private int study_site_lab_id;
	private int study_site_id;
	private int lab_id;
	private String is_default;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="study_site_lab_id")
	public int getStudy_site_lab_id() {
		return study_site_lab_id;
	}
	public void setStudy_site_lab_id(int study_site_lab_id) {
		this.study_site_lab_id = study_site_lab_id;
	}
	
	@Column(name="study_site_id")
	public int getStudy_site_id() {
		return study_site_id;
	}
	public void setStudy_site_id(int study_site_id) {
		this.study_site_id = study_site_id;
	}
	
	@Column(name="lab_id")
	public int getLab_id() {
		return lab_id;
	}
	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}
	
	@Column(name="is_default")
	public String getIs_default() {
		return is_default;
	}
	public void setIs_default(String is_default) {
		this.is_default = is_default;
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
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	} 	
}

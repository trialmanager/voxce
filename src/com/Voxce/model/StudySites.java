package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="study_sites")
public class StudySites {
	
	private int study_site_id;
	private int study_site_number;
	private int study_id;
	private int site_id;
	private int principal_investigator_id;
	private Date date_activated;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="study_site_id")
	public int getStudy_site_id() {
		return study_site_id;
	}
	public void setStudy_site_id(int study_site_id) {
		this.study_site_id = study_site_id;
	}
	
	@Column(name="study_site_number")
	public int getStudy_site_number() {
		return study_site_number;
	}
	public void setStudy_site_number(int study_site_number) {
		this.study_site_number = study_site_number;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="principal_investigator_id")
	public int getPrincipal_investigator_id() {
		return principal_investigator_id;
	}
	public void setPrincipal_investigator_id(int principal_investigator_id) {
		this.principal_investigator_id = principal_investigator_id;
	}
	
	@Column(name="date_activated")
	public Date getDate_activated() {
		return date_activated;
	}
	public void setDate_activated(Date date_activated) {
		this.date_activated = date_activated;
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

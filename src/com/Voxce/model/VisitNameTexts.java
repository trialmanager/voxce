package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="visit_name_texts")
public class VisitNameTexts {
	
	private int visit_name_text_id; 
	private int language_id; 	
	private String code; 
	private String visit_name;
	private String visit_text;
	private int created_by; 
	private Date date_created;
	private int modified_by;
	private Date date_modified;	
	private Integer subscriber_id;
	
	
	@Id
	@GeneratedValue
	@Column(name="visit_name_text_id")
	public int getVisit_name_text_id() {
		return visit_name_text_id;
	}
	public void setVisit_name_text_id(int visit_name_text_id) {
		this.visit_name_text_id = visit_name_text_id;
	}
	
	@Column(name="language_id")
	public int getLanguage_id() {
		return language_id;
	}
	public void setLanguage_id(int language_id) {
		this.language_id = language_id;
	}
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	@Column(name="visit_name")
	public String getVisit_name() {
		return visit_name;
	}
	public void setVisit_name(String visit_name) {
		this.visit_name = visit_name;
	}
	
	@Column(name="visit_text")
	public String getVisit_text() {
		return visit_text;
	}
	public void setVisit_text(String visit_text) {
		this.visit_text = visit_text;
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

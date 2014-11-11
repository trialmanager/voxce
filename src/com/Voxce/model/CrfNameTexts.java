package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_name_texts")
public class CrfNameTexts {

	private int crf_name_text_id;	 	 	 	 	 	 	
	private int language_id;		 	 	 	 	 	 	
	private String crf_code;		 	 	 	 	 	 	
	private String crf_name;		 	 	 	 	 	 	
	private String crf_text;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="crf_name_text_id")
	public int getCrf_name_text_id() {
		return crf_name_text_id;
	}
	public void setCrf_name_text_id(int crf_name_text_id) {
		this.crf_name_text_id = crf_name_text_id;
	}
	
	@Column(name="language_id")
	public int getLanguage_id() {
		return language_id;
	}
	public void setLanguage_id(int language_id) {
		this.language_id = language_id;
	}
	
	@Column(name="crf_code")
	public String getCrf_code() {
		return crf_code;
	}
	public void setCrf_code(String crf_code) {
		this.crf_code = crf_code;
	}
	
	@Column(name="crf_name")
	public String getCrf_name() {
		return crf_name;
	}
	public void setCrf_name(String crf_name) {
		this.crf_name = crf_name;
	}
	
	@Column(name="crf_text")
	public String getCrf_text() {
		return crf_text;
	}
	public void setCrf_text(String crf_text) {
		this.crf_text = crf_text;
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

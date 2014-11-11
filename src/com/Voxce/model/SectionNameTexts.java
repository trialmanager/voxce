package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="section_name_texts")
public class SectionNameTexts {
	
	private int section_name_text_id;	 	 	 	 	 	 	
	private int language_id;		 	 	 	 	 	 	
	private String snt_code;			 	 	 	 	 	 	
	private String snt_name;			 	 	 	 	 	 	
	private String snt_text;			 	 	 	 	 	 	
	private long created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private long modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="section_name_text_id")
	public int getSection_name_text_id() {
		return section_name_text_id;
	}
	public void setSection_name_text_id(int section_name_text_id) {
		this.section_name_text_id = section_name_text_id;
	}
	
	@Column(name="language_id")
	public int getLanguage_id() {
		return language_id;
	}
	public void setLanguage_id(int language_id) {
		this.language_id = language_id;
	}
	
	@Column(name="snt_code")
	public String getSnt_code() {
		return snt_code;
	}
	public void setSnt_code(String snt_code) {
		this.snt_code = snt_code;
	}
	
	@Column(name="snt_name")
	public String getSnt_name() {
		return snt_name;
	}
	public void setSnt_name(String snt_name) {
		this.snt_name = snt_name;
	}
	
	@Column(name="snt_text")
	public String getSnt_text() {
		return snt_text;
	}
	public void setSnt_text(String snt_text) {
		this.snt_text = snt_text;
	}
	
	@Column(name="created_by")
	public long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(long created_by) {
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
	public long getModified_by() {
		return modified_by;
	}
	public void setModified_by(long modified_by) {
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

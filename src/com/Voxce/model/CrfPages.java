package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_pages")
public class CrfPages {
	
	private int crf_page_id;	 	 	 	 	 	 	
	private int crf_id;		 	 	 	 	 	 	
	private String page_code;			 	 	 	 	 	 	
	private int display_order;		 	 	 	 	 	 	
	private int page_name_text_id;		 	 	 	 	 	 	
	private String template;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="crf_page_id")
	public int getCrf_page_id() {
		return crf_page_id;
	}
	public void setCrf_page_id(int crf_page_id) {
		this.crf_page_id = crf_page_id;
	}
	
	@Column(name="crf_id")
	public int getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(int crf_id) {
		this.crf_id = crf_id;
	}
	
	@Column(name="page_code")
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
	}
	
	@Column(name="page_name_text_id")
	public int getPage_name_text_id() {
		return page_name_text_id;
	}
	public void setPage_name_text_id(int page_name_text_id) {
		this.page_name_text_id = page_name_text_id;
	}
	
	@Column(name="template")
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
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

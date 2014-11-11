package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="case_report_forms")
public class CaseReportForms {
	
	private Integer crf_id;
	private String crf_code;
	private int crf_name_text_id;
	private String validator;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private String crf_edit_html;
	private String crf_html;
	private String crf_name;
	private Date date_modified;
	private Integer subscriber_id;
	
	
	@Id
	@GeneratedValue
	@Column(name="crf_id")
	public Integer getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(Integer crf_id) {
		this.crf_id = crf_id;
	}
	
	@Column(name="crf_code")
	public String getCrf_code() {
		return crf_code;
	}
	public void setCrf_code(String crf_code) {
		this.crf_code = crf_code;
	}
	
	@Column(name="crf_name_text_id")	
	public int getCrf_name_text_id() {
		return crf_name_text_id;
	}
	public void setCrf_name_text_id(int crf_name_text_id) {
		this.crf_name_text_id = crf_name_text_id;
	}
	
	@Column(name="validator")
	public String getValidator() {
		return validator;
	}
	public void setValidator(String validator) {
		this.validator = validator;
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
	
	@Column(name = "crf_edit_html")
	public String getCrf_edit_html() {
		return crf_edit_html;
	}
	public void setCrf_edit_html(String crf_edit_html) {
		this.crf_edit_html = crf_edit_html;
	}
	
	@Column(name =   "crf_html")
	public String getCrf_html() {
		return crf_html;
	}
	public void setCrf_html(String crf_html) {
		this.crf_html = crf_html;
	}
	
	@Column(name = "crf_name")
	public String getCrf_name() {
		return crf_name;
	}
	public void setCrf_name(String crf_name) {
		this.crf_name = crf_name;
	}
	@Column(name = "subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
}

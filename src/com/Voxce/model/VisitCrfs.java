package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="visit_crfs")
public class VisitCrfs {
	
	private int visit_crf_id;
	private int visit_id;
	private int display_order;
	private int case_report_form_id;
	private String is_mandatory;
	private String is_repeating;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date modified_date;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="visit_crf_id")
	public int getVisit_crf_id() {
		return visit_crf_id;
	}
	public void setVisit_crf_id(int visit_crf_id) {
		this.visit_crf_id = visit_crf_id;
	}
	
	@Column(name="visit_id")
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
	}
	
	@Column(name="case_report_form_id")
	public int getCase_report_form_id() {
		return case_report_form_id;
	}
	public void setCase_report_form_id(int case_report_form_id) {
		this.case_report_form_id = case_report_form_id;
	}
	
	@Column(name="is_mandatory")
	public String getIs_mandatory() {
		return is_mandatory;
	}
	public void setIs_mandatory(String is_mandatory) {
		this.is_mandatory = is_mandatory;
	}
	
	@Column(name="is_repeating")
	public String getIs_repeating() {
		return is_repeating;
	}
	public void setIs_repeating(String is_repeating) {
		this.is_repeating = is_repeating;
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
	
	@Column(name="modified_date")
	public Date getModified_date() {
		return modified_date;
	}
	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
}

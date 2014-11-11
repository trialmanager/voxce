package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="patient_visits")
public class PatientVisits {
	
	private int patient_visit_id;	 	 	 	 	 	 	
	private int subscriber_id;		 	 	 	 	 	 	
	private int patient_id;		 	 	 	 	 	 	
	private int visit_id;		 	 	 	 	 	 	
	private Date visit_date;		 	 	 	 	 	 	
	private String  visit_status;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date expected_date;
	private int optimum_days;
	private Date start_date_for_visit;
	private Date last_date_for_visit;
	private String rel_visit_status;
	private String Status;
	
	@Id
	@GeneratedValue
	@Column(name="patient_visit_id")
	public int getPatient_visit_id() {
		return patient_visit_id;
	}
	public void setPatient_visit_id(int patient_visit_id) {
		this.patient_visit_id = patient_visit_id;
	}
	
	@Column(name="subscriber_id")
	public int getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(int subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	@Column(name="visit_id")
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	
	@Column(name="visit_date")
	public Date getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}
	
	@Column(name="visit_status")
	public String getVisit_status() {
		return visit_status;
	}
	public void setVisit_status(String visit_status) {
		this.visit_status = visit_status;
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
	
	
	
	@Column(name="rel_visit_status")
	public String getRel_visit_status() {
		return rel_visit_status;
	}
	public void setRel_visit_status(String rel_visit_status) {
		this.rel_visit_status = rel_visit_status;
	}
	@Column(name="optimum_days")
	public int getOptimum_days() {
		return optimum_days;
	}
	public void setOptimum_days(int optimum_days) {
		this.optimum_days = optimum_days;
	}
	@Column(name="start_date_for_visit")
	public Date getStart_date_for_visit() {
		return start_date_for_visit;
	}
	public void setStart_date_for_visit(Date start_date_for_visit) {
		this.start_date_for_visit = start_date_for_visit;
	}
	@Column(name="last_date_for_visit")
	public Date getLast_date_for_visit() {
		return last_date_for_visit;
	}
	public void setLast_date_for_visit(Date last_date_for_visit) {
		this.last_date_for_visit = last_date_for_visit;
	}
	@Column(name="Status")
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	@Column(name="expected_date")
	public Date getexpected_date() {
		return expected_date;
	}
	public void setexpected_date(Date expected_date) {
		this.expected_date = expected_date;
	}
}

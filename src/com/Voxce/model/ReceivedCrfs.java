package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="received_crfs")
public class ReceivedCrfs {
	
	private int received_crf_id;	 	 	 	 	 	 	
	private String name;		 	 	 	 	 	 	
	private int patient_visit_id;		 	 	 	 	 	 	
	private int visit_crf_id;		 	 	 	 	 	 	
	private int received_crf_status_id;		 	 	 	 	 	 	
	private Date date_verified;		 	 	 	 	 	 	
	private int verified_by;		 	 	 	 	 	 	
	private int reviewed_by;		 	 	 	 	 	 	
	private Date date_reviewed;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="received_crf_id")
	public int getReceived_crf_id() {
		return received_crf_id;
	}
	public void setReceived_crf_id(int received_crf_id) {
		this.received_crf_id = received_crf_id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="patient_visit_id")
	public int getPatient_visit_id() {
		return patient_visit_id;
	}
	public void setPatient_visit_id(int patient_visit_id) {
		this.patient_visit_id = patient_visit_id;
	}
	
	@Column(name="visit_crf_id")
	public int getVisit_crf_id() {
		return visit_crf_id;
	}
	public void setVisit_crf_id(int visit_crf_id) {
		this.visit_crf_id = visit_crf_id;
	}
	
	@Column(name="received_crf_status_id")
	public int getReceived_crf_status_id() {
		return received_crf_status_id;
	}
	public void setReceived_crf_status_id(int received_crf_status_id) {
		this.received_crf_status_id = received_crf_status_id;
	}
	
	@Column(name="date_verified")
	public Date getDate_verified() {
		return date_verified;
	}
	public void setDate_verified(Date date_verified) {
		this.date_verified = date_verified;
	}
	
	@Column(name="verified_by")
	public int getVerified_by() {
		return verified_by;
	}
	public void setVerified_by(int verified_by) {
		this.verified_by = verified_by;
	}
	
	@Column(name="reviewed_by")
	public int getReviewed_by() {
		return reviewed_by;
	}
	public void setReviewed_by(int reviewed_by) {
		this.reviewed_by = reviewed_by;
	}
	
	@Column(name="date_reviewed")
	public Date getDate_reviewed() {
		return date_reviewed;
	}
	public void setDate_reviewed(Date date_reviewed) {
		this.date_reviewed = date_reviewed;
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

package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="received_crfs_v")
public class ReceivedCrfsV {
	
	// there is no primary key in this table as per database
	
	private int study_id;		 
	private String study;			 
	private int study_name_text_id;		 
	private int site_id;		 
	private String site;			 
	private int patient_id;		 
	private int patient;		 
	private int patient_visit_id;		 
	private int visit_id;		 
	private String visit;			 
	private int visit_name_text_id;		 
	private int crf_id;		 
	private String crf;		 
	private int crf_name_text_id;		 
	private int received_crf_id;		 
	private String form;		 
	private Date date_created;		 
	private int received_crf_status_id;		 
	private String status;		 
	private long unresolved_discrepancies;		 
	private long unassigned_discrepancies;		 
	private Date date_verified;		 
	private int verified_by;		 
	private int verified_by_name;		 
	private Date date_reviewed;		 
	private int reviewed_by;		 
	private int reviewed_by_name;
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="study")
	public String getStudy() {
		return study;
	}
	public void setStudy(String study) {
		this.study = study;
	}
	
	@Column(name="study_name_text_id")
	public int getStudy_name_text_id() {
		return study_name_text_id;
	}
	public void setStudy_name_text_id(int study_name_text_id) {
		this.study_name_text_id = study_name_text_id;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="site")
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	@Column(name="patient")
	public int getPatient() {
		return patient;
	}
	public void setPatient(int patient) {
		this.patient = patient;
	}
	
	@Column(name="patient_visit_id")
	public int getPatient_visit_id() {
		return patient_visit_id;
	}
	public void setPatient_visit_id(int patient_visit_id) {
		this.patient_visit_id = patient_visit_id;
	}
	
	@Column(name="visit_id")
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	
	@Column(name="visit")
	public String getVisit() {
		return visit;
	}
	public void setVisit(String visit) {
		this.visit = visit;
	}
	
	@Column(name="visit_name_text_id")
	public int getVisit_name_text_id() {
		return visit_name_text_id;
	}
	public void setVisit_name_text_id(int visit_name_text_id) {
		this.visit_name_text_id = visit_name_text_id;
	}
	
	@Column(name="crf_id")
	public int getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(int crf_id) {
		this.crf_id = crf_id;
	}
	
	@Column(name="crf")
	public String getCrf() {
		return crf;
	}
	public void setCrf(String crf) {
		this.crf = crf;
	}
	
	@Column(name="crf_name_text_id")
	public int getCrf_name_text_id() {
		return crf_name_text_id;
	}
	public void setCrf_name_text_id(int crf_name_text_id) {
		this.crf_name_text_id = crf_name_text_id;
	}
	
	@Column(name="received_crf_id")
	public int getReceived_crf_id() {
		return received_crf_id;
	}
	public void setReceived_crf_id(int received_crf_id) {
		this.received_crf_id = received_crf_id;
	}
	
	@Column(name="form")
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	
	@Column(name="date_created")
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	
	@Column(name="received_crf_status_id")
	public int getReceived_crf_status_id() {
		return received_crf_status_id;
	}
	public void setReceived_crf_status_id(int received_crf_status_id) {
		this.received_crf_status_id = received_crf_status_id;
	}
	
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="unresolved_discrepancies")
	public long getUnresolved_discrepancies() {
		return unresolved_discrepancies;
	}
	public void setUnresolved_discrepancies(long unresolved_discrepancies) {
		this.unresolved_discrepancies = unresolved_discrepancies;
	}
	
	@Column(name="unassigned_discrepancies")
	public long getUnassigned_discrepancies() {
		return unassigned_discrepancies;
	}
	public void setUnassigned_discrepancies(long unassigned_discrepancies) {
		this.unassigned_discrepancies = unassigned_discrepancies;
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
	
	@Column(name="verified_by_name")
	public int getVerified_by_name() {
		return verified_by_name;
	}
	public void setVerified_by_name(int verified_by_name) {
		this.verified_by_name = verified_by_name;
	}
	
	@Column(name="date_reviewed")
	public Date getDate_reviewed() {
		return date_reviewed;
	}
	public void setDate_reviewed(Date date_reviewed) {
		this.date_reviewed = date_reviewed;
	}
	
	@Column(name="reviewed_by")
	public int getReviewed_by() {
		return reviewed_by;
	}
	public void setReviewed_by(int reviewed_by) {
		this.reviewed_by = reviewed_by;
	}
	
	@Column(name="reviewed_by_name")
	public int getReviewed_by_name() {
		return reviewed_by_name;
	}
	public void setReviewed_by_name(int reviewed_by_name) {
		this.reviewed_by_name = reviewed_by_name;
	}	

	
}

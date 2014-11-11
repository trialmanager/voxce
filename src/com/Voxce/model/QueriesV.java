package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="queries_v")
public class QueriesV {
	
	// this table does not have primary key as per database
	
	private int study_id;		 
	private String study;			 
	private int site_id;		 
	private String site;			 
	private int patient_id;		 
	private int patient;		 
	private int visit_id;		 
	private String visit;			 
	private int crf_id;		 
	private String crf;		 
	private int received_crf_id;		 
	private String form;		 
	private int query_id;		 
	private int query_number;		 
	private Date date_created;		 
	private int query_status_id;
	private String status;		 
	private long unresolved_discrepancies; //	bigint(21)
	
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
	
	@Column(name="query_id")
	public int getQuery_id() {
		return query_id;
	}
	public void setQuery_id(int query_id) {
		this.query_id = query_id;
	}
	
	@Column(name="query_number")
	public int getQuery_number() {
		return query_number;
	}
	public void setQuery_number(int query_number) {
		this.query_number = query_number;
	}
	
	@Column(name="date_created")
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	
	@Column(name="query_status_id")
	public int getQuery_status_id() {
		return query_status_id;
	}
	public void setQuery_status_id(int query_status_id) {
		this.query_status_id = query_status_id;
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
	
	

}

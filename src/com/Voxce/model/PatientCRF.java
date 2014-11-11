package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="patent_crf")
public class PatientCRF {
	
	private Integer patient_crf_id;	 	 	 	 	 	
	private int patient_id;		 	 	 	 	 	 	
	private Integer crf_id;
	private String crf_name;
	private String crf_html;		 	 	 	 	 	 	
	private String crf_status; 
	private int visit_id;
	private int filld_by;
	private Date filled_date;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="patient_crf")
	public Integer getPatient_crf_id() {
		return patient_crf_id;
	}
	public void setPatient_crf_id(Integer patient_crf_id) {
		this.patient_crf_id = patient_crf_id;
	}
	
	
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	
	public void setCrf_id(Integer crf_id) {
		this.crf_id = crf_id;
	}
	@Column(name="crf_id")
	public Integer getCrf_id() {
		return crf_id;
	}
	
	
	public void setCrf_status(String crf_status) {
		this.crf_status = crf_status;
	}
	@Column(name="crf_status")
	public String getCrf_status() {
		return crf_status;
	}
	public void setCrf_html(String crf_html) {
		this.crf_html = crf_html;
	}
	@Column(name="crf_html")
	public String getCrf_html() {
		return crf_html;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	@Column(name="visit_id")
	public int getVisit_id() {
		return visit_id;
	}
	@Column(name="filld_by")
	public int getFilld_by() {
		return filld_by;
	}
	public void setFilld_by(int filld_by) {
		this.filld_by = filld_by;
	}
	@Column(name="filled_date")
	public Date getFilled_date() {
		return filled_date;
	}
	public void setFilled_date(Date filled_date) {
		this.filled_date = filled_date;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	@Column(name="crf_name")
	public String getCrf_name() {
		return crf_name;
	}
	public void setCrf_name(String crf_name) {
		this.crf_name = crf_name;
	}
	
	

}

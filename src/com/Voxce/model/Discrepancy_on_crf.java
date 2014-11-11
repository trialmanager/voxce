package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="discrepancy_on_crf")
public class Discrepancy_on_crf {

	private int discrepancy_id;	 	 	 	 	 	 	
	private int patient_crf_id;		 	 	 	 	 	 	
	private int study_id;		 	 	 	 	 	 	
	private int site_id;
	private int createdBy;
	private int modifiedBy;
	private String question_text;
	private String status;
	private String section;
	private String orignal_value;
	private String current_value;
	private String action;
	private String type;
	private String reasion;
	private String discrepancy_text;		 	 	 	 	 	 	
	private Date createdDate;
	private Date modifiedDate;
	private String responce_text;		 	 	 	 	 	 	

	@Id
	@GeneratedValue
	@Column(name="discrepancy_id")
	public int getDiscrepancy_id() {
		return discrepancy_id;
	}
	public void setDiscrepancy_id(int discrepancy_id) {
		this.discrepancy_id = discrepancy_id;
	}

	@Column(name="discrepancy_text")
	public String getDiscrepancy_text() {
		return discrepancy_text;
	}
	public void setDiscrepancy_text(String discrepancy_text) {
		this.discrepancy_text = discrepancy_text;
	}
	@Column(name="patient_crf_id")
	public int getPatient_crf_id() {
		return patient_crf_id;
	}
	public void setPatient_crf_id(int patient_crf_id) {
		this.patient_crf_id = patient_crf_id;
	}
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	@Column(name="responce_text")
	public String getResponce_text() {
		return responce_text;
	}
	public void setResponce_text(String responce_text) {
		this.responce_text = responce_text;
	}
	@Column(name="question_text")
	public String getQuestion_text() {
		return question_text;
	}
	public void setQuestion_text(String question_text) {
		this.question_text = question_text;
	}
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	@Column(name="section")
	public String getSection() {
		return section;
	}
	@Column(name="orignal_value")
	public String getOrignal_value() {
		return orignal_value;
	}
	@Column(name="current_value")
	public String getCurrent_value() {
		return current_value;
	}
	@Column(name="action")
	public String getAction() {
		return action;
	}
	@Column(name="type")
	public String getType() {
		return type;
	}
	@Column(name="reasion")
	public String getReasion() {
		return reasion;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public void setOrignal_value(String orignal_value) {
		this.orignal_value = orignal_value;
	}
	public void setCurrent_value(String current_value) {
		this.current_value = current_value;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setReasion(String reasion) {
		this.reasion = reasion;
	}
	@Column(name="created_by")
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	@Column(name="modified_by")
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	@Column(name="created_date")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Column(name="modified_date")
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}

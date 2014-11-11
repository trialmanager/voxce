package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="patients")
public class Patients {
	
	private int patient_id;
	private int study_id;		 	 	 	 	 	 	
	private int site_id;
	private String patient_number;			 	 	 	 	 	 	
			 	 	 	 	 	 	
	private String initials;		 	 	 	 	 	 	
	private char gender;			 	 	 	 	 	 	
	private Date date_of_birth;		 	 	 	 	 	 	
	private Date date_of_informed_consent;		 	 	 	 	 	 	
	private Date date_of_randomization;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="patient_number")
	public String getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(String patient_number) {
		this.patient_number = patient_number;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="initials")
	public String getInitials() {
		return initials;
	}
	public void setInitials(String initials) {
		this.initials = initials;
	}
	
	@Column(name="gender")
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	@Column(name="date_of_birth")
	public Date getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	
	@Column(name="date_of_informed_consent")
	public Date getDate_of_informed_consent() {
		return date_of_informed_consent;
	}
	public void setDate_of_informed_consent(Date date_of_informed_consent) {
		this.date_of_informed_consent = date_of_informed_consent;
	}
	
	@Column(name="date_of_randomization")
	public Date getDate_of_randomization() {
		return date_of_randomization;
	}
	public void setDate_of_randomization(Date date_of_randomization) {
		this.date_of_randomization = date_of_randomization;
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
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	

}

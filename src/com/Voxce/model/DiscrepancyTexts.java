package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="discrepancy_texts")
public class DiscrepancyTexts {

	private int DISCREPANCY_TEXT_ID;	 	 	 	 	 	 	
	private int LANGUAGE_ID;		 	 	 	 	 	 	
	private String CODE;			 	 	 	 	 	 	
	private String NAME;			 	 	 	 	 	 	
	private String TEXT;		 	 	 	 	 	 	
	private long CREATED_BY;		 	 	 	 	 	 	
	private Date DATE_CREATED;		 	 	 	 	 	 	
	private long MODIFIED_BY;		 	 	 	 	 	 	
	private Date DATE_MODIFIED;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="DISCREPANCY_TEXT_ID")
	public int getDISCREPANCY_TEXT_ID() {
		return DISCREPANCY_TEXT_ID;
	}
	public void setDISCREPANCY_TEXT_ID(int dISCREPANCY_TEXT_ID) {
		DISCREPANCY_TEXT_ID = dISCREPANCY_TEXT_ID;
	}
	
	@Column(name="LANGUAGE_ID")
	public int getLANGUAGE_ID() {
		return LANGUAGE_ID;
	}
	public void setLANGUAGE_ID(int lANGUAGE_ID) {
		LANGUAGE_ID = lANGUAGE_ID;
	}
	
	@Column(name="CODE")
	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	
	@Column(name="NAME")
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	
	@Column(name="TEXT")
	public String getTEXT() {
		return TEXT;
	}
	public void setTEXT(String tEXT) {
		TEXT = tEXT;
	}
	
	@Column(name="CREATED_BY")
	public long getCREATED_BY() {
		return CREATED_BY;
	}
	public void setCREATED_BY(long cREATED_BY) {
		CREATED_BY = cREATED_BY;
	}
	
	@Column(name="DATE_CREATED")
	public Date getDATE_CREATED() {
		return DATE_CREATED;
	}
	public void setDATE_CREATED(Date dATE_CREATED) {
		DATE_CREATED = dATE_CREATED;
	}
	
	@Column(name="MODIFIED_BY")
	public long getMODIFIED_BY() {
		return MODIFIED_BY;
	}
	public void setMODIFIED_BY(long mODIFIED_BY) {
		MODIFIED_BY = mODIFIED_BY;
	}
	
	@Column(name="DATE_MODIFIED")
	public Date getDATE_MODIFIED() {
		return DATE_MODIFIED;
	}
	public void setDATE_MODIFIED(Date dATE_MODIFIED) {
		DATE_MODIFIED = dATE_MODIFIED;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
}

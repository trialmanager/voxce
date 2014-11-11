package com.Voxce.model;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="countries")
public class Countries {
	
	private int COUNTRY_ID;	 
	private int subscriber_id;
	private String COUNTRY_CODE;			 	 	 	 	 	 	
	private String COUNTRY_NAME;			 	 	 	 	 	 	
	private String DESCRIPTION;		 	 	 	 	 	 	
	private long CREATED_BY;		 	 	 	 	 	 	
	private Date DATE_CREATED;		 	 	 	 	 	 	
	private long MODIFIED_BY;		 	 	 	 	 	 	
	private Date DATE_MODIFIED;
	

	
//DEFAULT CONSTRUCTOR	
	public Countries(){
	
	}
//COPY CONSTRUCTOR	
	public Countries(Countries copyCountry){
		this.COUNTRY_ID = copyCountry.COUNTRY_ID;
		this.COUNTRY_CODE = copyCountry.COUNTRY_CODE;
		this.COUNTRY_NAME = copyCountry.COUNTRY_NAME;
		this.DESCRIPTION = copyCountry.DESCRIPTION;
		this.CREATED_BY = copyCountry.CREATED_BY;
		this.DATE_CREATED = copyCountry.DATE_CREATED;
		this.MODIFIED_BY = copyCountry.MODIFIED_BY;
		this.DATE_MODIFIED = copyCountry.DATE_MODIFIED;
		this.subscriber_id=copyCountry.subscriber_id;
	}

	@Id
	@GeneratedValue
	@Column(name="COUNTRY_ID")
	public int getCOUNTRY_ID() {
		return COUNTRY_ID;
	}
	public void setCOUNTRY_ID(int cOUNTRY_ID) {
		COUNTRY_ID = cOUNTRY_ID;
	}
	
	@Column(name="COUNTRY_CODE")
	public String getCOUNTRY_CODE() {
		return COUNTRY_CODE;
	}
	public void setCOUNTRY_CODE(String cOUNTRY_CODE) {
		COUNTRY_CODE = cOUNTRY_CODE;
	}
	
	@Column(name="COUNTRY_NAME")
	public String getCOUNTRY_NAME() {
		return COUNTRY_NAME;
	}
	public void setCOUNTRY_NAME(String cOUNTRY_NAME) {
		COUNTRY_NAME = cOUNTRY_NAME;
	}
	
	@Column(name="DESCRIPTION")
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}
	
	@Column(name="CREATED_BY")
	public long getCREATED_BY() {
		return CREATED_BY;
	}
	public void setCREATED_BY(long createdBy) {
		CREATED_BY = createdBy;
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
	public void setMODIFIED_BY(long modifiedBy) {
		MODIFIED_BY = modifiedBy;
	}
	
	@Column(name="DATE_MODIFIED")
	public Date getDATE_MODIFIED() {
		return DATE_MODIFIED;
	}
	public void setDATE_MODIFIED(Date dATE_MODIFIED) {
		DATE_MODIFIED = dATE_MODIFIED;
	}
	@Column(name="subscriber_id")
	public int getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(int subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	
}

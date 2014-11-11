package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="group_rights")
public class GroupRights {

	private int GROUP_RIGHT_ID;	 	 	 	 	 	 	
	private int GROUP_ID;		 	 	 	 	 	 	
	private int RESOURCE_ID;		 	 	 	 	 	 	
	private int RIGHT_TYPE_ID;		 	 	 	 	 	 	
	private int CREATED_BY;		 	 	 	 	 	 	
	private Date DATE_CREATED;		 	 	 	 	 	 	
	private int MODIFIED_BY;		 	 	 	 	 	 	
	private Date DATE_MODIFIED;
	
	@Id
	@GeneratedValue
	@Column(name="GROUP_RIGHT_ID")
	public int getGROUP_RIGHT_ID() {
		return GROUP_RIGHT_ID;
	}
	public void setGROUP_RIGHT_ID(int gROUP_RIGHT_ID) {
		GROUP_RIGHT_ID = gROUP_RIGHT_ID;
	}
	
	@Column(name="GROUP_ID")
	public int getGROUP_ID() {
		return GROUP_ID;
	}
	public void setGROUP_ID(int gROUP_ID) {
		GROUP_ID = gROUP_ID;
	}
	
	@Column(name="RESOURCE_ID")
	public int getRESOURCE_ID() {
		return RESOURCE_ID;
	}
	public void setRESOURCE_ID(int rESOURCE_ID) {
		RESOURCE_ID = rESOURCE_ID;
	}
	
	@Column(name="RIGHT_TYPE_ID")
	public int getRIGHT_TYPE_ID() {
		return RIGHT_TYPE_ID;
	}
	public void setRIGHT_TYPE_ID(int rIGHT_TYPE_ID) {
		RIGHT_TYPE_ID = rIGHT_TYPE_ID;
	}
	
	@Column(name="CREATED_BY")
	public int getCREATED_BY() {
		return CREATED_BY;
	}
	public void setCREATED_BY(int cREATED_BY) {
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
	public int getMODIFIED_BY() {
		return MODIFIED_BY;
	}
	public void setMODIFIED_BY(int mODIFIED_BY) {
		MODIFIED_BY = mODIFIED_BY;
	}
	
	@Column(name="DATE_MODIFIED")
	public Date getDATE_MODIFIED() {
		return DATE_MODIFIED;
	}
	public void setDATE_MODIFIED(Date dATE_MODIFIED) {
		DATE_MODIFIED = dATE_MODIFIED;
	}
	
}

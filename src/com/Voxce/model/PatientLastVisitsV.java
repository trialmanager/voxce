package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="patient_last_visits_v")
public class PatientLastVisitsV {
	
	// there is no primary key in this table as per Database
	
	private Date VISIT_DATE;		 
	private int Patient_id;
	
	@Column(name="VISIT_DATE")
	public Date getVISIT_DATE() {
		return VISIT_DATE;
	}
	public void setVISIT_DATE(Date vISIT_DATE) {
		VISIT_DATE = vISIT_DATE;
	}
	
	@Column(name="Patient_id")
	public int getPatient_id() {
		return Patient_id;
	}
	public void setPatient_id(int patient_id) {
		Patient_id = patient_id;
	}	

	
}

package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="enrollment_schedule")
public class EnrollmentSchedule {
 
	private int enrollment_schedule_id;
	private int study_id;
	private int site_id;
	private String protocol_id;
	private String	version;
	private String month_year;	
	private int patients;
	private int display_order; 	
	private int created_by;
	private Date start_date;
	private Date Date_Created;
	private int modified_by;
	private Date date_modified;
	private Date next_protocol_date;
	
	@Id
	@GeneratedValue
	@Column(name="enrollment_schedule_id")
	public int getEnrollment_schedule_id() {
		return enrollment_schedule_id;
	}
	public void setEnrollment_schedule_id(int enrollment_schedule_id) {
		this.enrollment_schedule_id = enrollment_schedule_id;
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
	
	@Column(name="month_year")
	public String getMonth_year() {
		return month_year;
	}
	public void setMonth_year(String month_year) {
		this.month_year = month_year;
	}
	
	@Column(name="patients")
	public int getPatients() {
		return patients;
	}
	public void setPatients(int patients) {
		this.patients = patients;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
	} 	
	
	@Column(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="start_date")
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
	@Column(name="date_created")
	public Date getDate_Created() {
		return Date_Created;
	}
	public void setDate_Created(Date date_Created) {
		Date_Created = date_Created;
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
	
	@Column(name="version")
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	@Column(name="protocol_id")
	public String getProtocol_id() {
		return protocol_id;
	}
	public void setProtocol_id(String protocol_id) {
		this.protocol_id = protocol_id;
	}
	
	@Column(name="next_protocol_date")
	public Date getNext_protocol_date() {
		return next_protocol_date;
	}
	public void setNext_protocol_date(Date next_protocol_date) {
		this.next_protocol_date = next_protocol_date;
	}
	
}  
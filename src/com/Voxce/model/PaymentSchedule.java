package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="payment_schedule")
public class PaymentSchedule {
	
	private int payment_schedule_id;	 	 	 	 	 	 	
	private int study_id;		 	 	 	 	 	 	
	private Integer site;		 	 	 	 	 	 	
	private int payment_type;
	private int visit;		 	 	 	 	 	 	
	private Integer crf;	
	private String status;		 	 	 	 	 	 	
	private double amount;	
	private String description;		
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	@Id
	@GeneratedValue
	@Column(name="payment_schedule_id")
	public int getPayment_schedule_id() {
		return payment_schedule_id;
	}
	public void setPayment_schedule_id(int payment_schedule_id) {
		this.payment_schedule_id = payment_schedule_id;
	}
	
	@Column(name="study_id")
	public int getStudy() {
		return study_id;
	}
	public void setStudy(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="site")
	public Integer getSite() {
		return site;
	}
	public void setSite(Integer site) {
		this.site = site;
	}
	
	@Column(name="payment_type")
	public int getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}
	
	@Column(name="visit")
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	
	@Column(name="crf")
	public Integer getCrf() {
		return crf;
	}
	public void setCrf(Integer crf) {
		this.crf = crf;
	}
	
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="amount")
	public double getAmount() {
		return amount;
	}
	public void setAmount(double d) {
		this.amount = d;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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

}

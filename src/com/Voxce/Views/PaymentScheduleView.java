package com.Voxce.Views;

import java.sql.Date;

public class PaymentScheduleView {

	private int payment_schedule_id;	 	 	 	 	 	 	
	private int study_id;
	
	private Integer site_id;
	private String site_name;
	
	private int payment_type_id;
	private String payment_type_name;
	
	private int visit_id;
	private String visit_name;
	
	private int crf_id;
	private String crf_name;
	
	private String status;		 	 	 	 	 	 	
	private double amount;	
	private String description;	
	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	public int getPayment_schedule_id() {
		return payment_schedule_id;
	}
	public void setPayment_schedule_id(int payment_schedule_id) {
		this.payment_schedule_id = payment_schedule_id;
	}
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	public int getPayment_type_id() {
		return payment_type_id;
	}
	public void setPayment_type_id(int payment_type_id) {
		this.payment_type_id = payment_type_id;
	}
	public String getPayment_type_name() {
		return payment_type_name;
	}
	public void setPayment_type_name(String payment_type_name) {
		this.payment_type_name = payment_type_name;
	}
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_name() {
		return visit_name;
	}
	public void setVisit_name(String visit_name) {
		this.visit_name = visit_name;
	}
	public int getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(int crf_id) {
		this.crf_id = crf_id;
	}
	public String getCrf_name() {
		return crf_name;
	}
	public void setCrf_name(String crf_name) {
		this.crf_name = crf_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	public Date getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Date date_modified) {
		this.date_modified = date_modified;
	}
	public Integer getSite_id() {
		return site_id;
	}
	public void setSite_id(Integer site_id) {
		this.site_id = site_id;
	}
	public String getSite_name() {
		return site_name;
	}
	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}
	
}


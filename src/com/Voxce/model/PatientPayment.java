package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="patient_payment")
public class PatientPayment {
	
	private int patient_payment_id;	 	 	 	 	 	 	
	private int payment_code_id;		 	 	 	 	 	 	
	private int patient_id;		 	 	 	 	 	 	
	private Integer site_id;		 	 	 	 	 	 	
	private int study_id;		 	 	 	 	 	 	
	private int visit_id;		 	 	 	 	 	 	
	private Integer crf_id;		 	 	 	 	 	 	
	private Double payment_amount;		 	 	 	 	 	 	
	private Integer po;		 	 	 	 	 	 	
	private Integer invoice;		 	 	 	 	 	 	
	private Integer over_head;		 	 	 	 	 	 	
	private Integer paid;		 	 	 	 	 	 	
	private Integer pay_to;
	private String pay_to_user_name;
	private String pay_to_user_address;
	private Date cheque_date;
	private String payment_status;
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;	
	private Integer cheque_no;
	private Date date_modified;
	private Double total_payment;
	
	@Id
	@GeneratedValue
	@Column(name="patient_payment_id")
	public int getPatient_payment_id() {
		return patient_payment_id;
	}
	public void setPatient_payment_id(int patient_payment_id) {
		this.patient_payment_id = patient_payment_id;
	}
	
	@Column(name="payment_code_id")
	public int getPayment_code_id() {
		return payment_code_id;
	}
	public void setPayment_code_id(int payment_code_id) {
		this.payment_code_id = payment_code_id;
	}
	
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	@Column(name="site_id")
	public Integer getSite_id() {
		return site_id;
	}
	public void setSite_id(Integer site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="visit_id")
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	
	@Column(name="crf_id")
	public Integer getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(Integer crf_id) {
		this.crf_id = crf_id;
	}
	
	@Column(name="payment_amount")
	public Double getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(Double payment_amount) {
		this.payment_amount = payment_amount;
	}
	
	@Column(name="po")
	public Integer getPo() {
		return po;
	}
	public void setPo(Integer po) {
		this.po = po;
	}
	
	@Column(name="invoice")
	public Integer getInvoice() {
		return invoice;
	}
	public void setInvoice(Integer invoice) {
		this.invoice = invoice;
	}
	
	@Column(name="over_head")
	public Integer getOver_head() {
		return over_head;
	}
	public void setOver_head(Integer over_head) {
		this.over_head = over_head;
	}
	
	@Column(name="paid")
	public Integer getPaid() {
		return paid;
	}
	public void setPaid(Integer paid) {
		this.paid = paid;
	}
	
	@Column(name="pay_to")
	public Integer getPay_to() {
		return pay_to;
	}
	public void setPay_to(Integer pay_to) {
		this.pay_to = pay_to;
	}
	
	@Column(name="pay_to_user_name")
	public String getPay_to_user_name() {
		return pay_to_user_name;
	}
	public void setPay_to_user_name(String pay_to_user_name) {
		this.pay_to_user_name = pay_to_user_name;
	}
	
	@Column(name="pay_to_user_address")
	public String getPay_to_user_address() {
		return pay_to_user_address;
	}
	public void setPay_to_user_address(String pay_to_user_address) {
		this.pay_to_user_address = pay_to_user_address;
	}
	
	@Column(name="cheque_date")
	public Date getCheque_date() {
		return cheque_date;
	}
	public void setCheque_date(Date cheque_date) {
		this.cheque_date = cheque_date;
	}
	
	@Column(name="payment_status")
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
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
	
	@Column(name="cheque_no")
	public Integer getCheque_no() {
		return cheque_no;
	}
	public void setCheque_no(Integer cheque_no) {
		this.cheque_no = cheque_no;
	}
	
	@Column(name="date_modified")
	public Date getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Date date_modified) {
		this.date_modified = date_modified;
	}
	
	@Column(name="total_payment")
	public Double getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(Double total_payment) {
		this.total_payment = total_payment;
	}
}

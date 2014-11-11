package com.Voxce.Views;

import java.sql.Date;

public class PatientPaymentView {

	private Integer study_id;
	private Integer patient_payment_id;
	private Integer payment_code_id;
	private String payment_code_name;
	private Integer patient_id;
	private String patient_number;
	private Integer site_id;
	private String  site_name;
	private Integer visit_id;
	private String visit_name;
	private Integer crf_id;
	private String crf_name;	
	private Double payment_amount;		 	 	 	 	 	 	
	private Double total_payment;
	private Integer over_head;	
	private Integer po;
	private Integer invoice; 	
	private Integer paid;		 	 	 	 	 	 	
	private Integer pay_to;
	private String pay_to_name;
	private String pay_to_user_name;
	private String pay_to_user_address;
	private Integer cheque_no;
	private Date cheque_date;
	private String payment_status;
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;
	private Date date_modified;
	public Integer getStudy_id() {
		return study_id;
	}
	public void setStudy_id(Integer study_id) {
		this.study_id = study_id;
	}
	public Integer getPatient_payment_id() {
		return patient_payment_id;
	}
	public void setPatient_payment_id(Integer patient_payment_id) {
		this.patient_payment_id = patient_payment_id;
	}
	public Integer getPayment_code_id() {
		return payment_code_id;
	}
	public void setPayment_code_id(Integer payment_code_id) {
		this.payment_code_id = payment_code_id;
	}
	public String getPayment_code_name() {
		return payment_code_name;
	}
	public void setPayment_code_name(String payment_code_name) {
		this.payment_code_name = payment_code_name;
	}
	public Integer getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(Integer patient_id) {
		this.patient_id = patient_id;
	}
	public String getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(String patient_number) {
		this.patient_number = patient_number;
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
	public Integer getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(Integer visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_name() {
		return visit_name;
	}
	public void setVisit_name(String visit_name) {
		this.visit_name = visit_name;
	}
	public Integer getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(Integer crf_id) {
		this.crf_id = crf_id;
	}
	public String getCrf_name() {
		return crf_name;
	}
	public void setCrf_name(String crf_name) {
		this.crf_name = crf_name;
	}
	public Double getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(Double payment_amount) {
		this.payment_amount = payment_amount;
	}
	public Double getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(Double total_payment) {
		this.total_payment = total_payment;
	}
	public Integer getOver_head() {
		return over_head;
	}
	public void setOver_head(Integer over_head) {
		this.over_head = over_head;
	}
	public Integer getPo() {
		return po;
	}
	public void setPo(Integer po) {
		this.po = po;
	}
	public Integer getInvoice() {
		return invoice;
	}
	public void setInvoice(Integer invoice) {
		this.invoice = invoice;
	}
	public Integer getPaid() {
		return paid;
	}
	public void setPaid(Integer paid) {
		this.paid = paid;
	}
	public Integer getPay_to() {
		return pay_to;
	}
	public void setPay_to(Integer pay_to) {
		this.pay_to = pay_to;
	}
	public String getPay_to_name() {
		return pay_to_name;
	}
	public void setPay_to_name(String pay_to_name) {
		this.pay_to_name = pay_to_name;
	}
	public String getPay_to_user_name() {
		return pay_to_user_name;
	}
	public void setPay_to_user_name(String pay_to_user_name) {
		this.pay_to_user_name = pay_to_user_name;
	}
	public String getPay_to_user_address() {
		return pay_to_user_address;
	}
	public void setPay_to_user_address(String pay_to_user_address) {
		this.pay_to_user_address = pay_to_user_address;
	}
	public Integer getCheque_no() {
		return cheque_no;
	}
	public void setCheque_no(Integer cheque_no) {
		this.cheque_no = cheque_no;
	}
	public Date getCheque_date() {
		return cheque_date;
	}
	public void setCheque_date(Date cheque_date) {
		this.cheque_date = cheque_date;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
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
}

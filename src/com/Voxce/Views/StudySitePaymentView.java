package com.Voxce.Views;

import java.sql.Date;

public class StudySitePaymentView {

	private int study_payment_id;
	private int	study_id;
	private Integer site_id;
	private String site_name;
	private int payment_code_id;
	private String payment_code_name;
	private Integer visit_id;
	private String visit_name;
	private Integer crf_id;
	private String crf_name;
	private Double pay_amount;
	private Double total_payment;
	private Integer overhead;
	private Integer pay_to;
	private String pay_to_name;
	private String pay_to_user_name;
	private String pay_to_user_address;
	private Integer po_no;
	private Integer cheque_no;
	private Date cheque_date;
	private Integer invoice_no;
	private String payment_status;
	public int getStudy_payment_id() {
		return study_payment_id;
	}
	public void setStudy_payment_id(int study_payment_id) {
		this.study_payment_id = study_payment_id;
	}
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
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
	public int getPayment_code_id() {
		return payment_code_id;
	}
	public void setPayment_code_id(int payment_code_id) {
		this.payment_code_id = payment_code_id;
	}
	public String getPayment_code_name() {
		return payment_code_name;
	}
	public void setPayment_code_name(String payment_code_name) {
		this.payment_code_name = payment_code_name;
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
	public Double getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(Double pay_amount) {
		this.pay_amount = pay_amount;
	}
	public Double getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(Double total_payment) {
		this.total_payment = total_payment;
	}
	public Integer getOverhead() {
		return overhead;
	}
	public void setOverhead(Integer overhead) {
		this.overhead = overhead;
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
	public Integer getPo_no() {
		return po_no;
	}
	public void setPo_no(Integer po_no) {
		this.po_no = po_no;
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
	public Integer getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(Integer invoice_no) {
		this.invoice_no = invoice_no;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
}

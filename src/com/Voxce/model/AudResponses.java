package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="aud_responses")
public class AudResponses {

	private int response_id;
	private String value;
	private String operation;
	private String reason;
	private int received_crf_id;		 	 	 	 	 	 	
	private int crf_question_id;		 	 	 	 	 	 	
	private int answer_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;		 	 	 	 	 	 	
	private Date start_date;
	
	@Id
	@GeneratedValue
	@Column(name="response_id")
	public int getResponse_id() {
		return response_id;
	}
	public void setResponse_id(int response_id) {
		this.response_id = response_id;
	}
	
	@Column(name="value")
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	@Column(name="operation")
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	
	@Column(name="reason")
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Column(name="received_crf_id")
	public int getReceived_crf_id() {
		return received_crf_id;
	}
	public void setReceived_crf_id(int received_crf_id) {
		this.received_crf_id = received_crf_id;
	}
	
	@Column(name="crf_question_id")
	public int getCrf_question_id() {
		return crf_question_id;
	}
	public void setCrf_question_id(int crf_question_id) {
		this.crf_question_id = crf_question_id;
	}
	
	@Column(name="answer_text_id")
	public int getAnswer_text_id() {
		return answer_text_id;
	}
	public void setAnswer_text_id(int answer_text_id) {
		this.answer_text_id = answer_text_id;
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
	
	@Column(name="start_date")
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
}

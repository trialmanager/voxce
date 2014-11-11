package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="discrepancies")
public class Discrepancies {

	private int discrepancy_id;	 	 	 	 	 	 	
	private int received_crf_id;		 	 	 	 	 	 	
	private int discrepancy_number;		 	 	 	 	 	 	
	private int response_id;		 	 	 	 	 	 	
	private String response_value;		 	 	 	 	 	 	
	private int response_answer_text_id;		 	 	 	 	 	 	
	private int resolution_id;		 	 	 	 	 	 	
	private int query_id;		 	 	 	 	 	 	
	private int validation_rule_id;		 	 	 	 	 	 	
	private String discrepancy_text;		 	 	 	 	 	 	
	private int discrepancy_text_id;		 	 	 	 	 	 	
	private String action_text;		 	 	 	 	 	 	
	private int action_text_id;		 	 	 	 	 	 	
	private String explanation;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;		 	 	 	 	 	 	
	private char is_manual_flag;
	
	@Id
	@GeneratedValue
	@Column(name="discrepancy_id")
	public int getDiscrepancy_id() {
		return discrepancy_id;
	}
	public void setDiscrepancy_id(int discrepancy_id) {
		this.discrepancy_id = discrepancy_id;
	}
	
	@Column(name="received_crf_id")
	public int getReceived_crf_id() {
		return received_crf_id;
	}
	public void setReceived_crf_id(int received_crf_id) {
		this.received_crf_id = received_crf_id;
	}
	
	@Column(name="discrepancy_number")
	public int getDiscrepancy_number() {
		return discrepancy_number;
	}
	public void setDiscrepancy_number(int discrepancy_number) {
		this.discrepancy_number = discrepancy_number;
	}
	
	@Column(name="response_id")
	public int getResponse_id() {
		return response_id;
	}
	public void setResponse_id(int response_id) {
		this.response_id = response_id;
	}
	
	@Column(name="response_value")
	public String getResponse_value() {
		return response_value;
	}
	public void setResponse_value(String response_value) {
		this.response_value = response_value;
	}
	
	@Column(name="response_answer_text_id")
	public int getResponse_answer_text_id() {
		return response_answer_text_id;
	}
	public void setResponse_answer_text_id(int response_answer_text_id) {
		this.response_answer_text_id = response_answer_text_id;
	}
	
	@Column(name="resolution_id")
	public int getResolution_id() {
		return resolution_id;
	}
	public void setResolution_id(int resolution_id) {
		this.resolution_id = resolution_id;
	}
	
	@Column(name="query_id")
	public int getQuery_id() {
		return query_id;
	}
	public void setQuery_id(int query_id) {
		this.query_id = query_id;
	}
	
	@Column(name="validation_rule_id")
	public int getValidation_rule_id() {
		return validation_rule_id;
	}
	public void setValidation_rule_id(int validation_rule_id) {
		this.validation_rule_id = validation_rule_id;
	}
	
	@Column(name="discrepancy_text")
	public String getDiscrepancy_text() {
		return discrepancy_text;
	}
	public void setDiscrepancy_text(String discrepancy_text) {
		this.discrepancy_text = discrepancy_text;
	}
	
	@Column(name="discrepancy_text_id")
	public int getDiscrepancy_text_id() {
		return discrepancy_text_id;
	}
	public void setDiscrepancy_text_id(int discrepancy_text_id) {
		this.discrepancy_text_id = discrepancy_text_id;
	}
	
	@Column(name="action_text")
	public String getAction_text() {
		return action_text;
	}
	public void setAction_text(String action_text) {
		this.action_text = action_text;
	}
	
	@Column(name="action_text_id")
	public int getAction_text_id() {
		return action_text_id;
	}
	public void setAction_text_id(int action_text_id) {
		this.action_text_id = action_text_id;
	}
	
	@Column(name="explanation")
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
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
	
	@Column(name="is_manual_flag")
	public char getIs_manual_flag() {
		return is_manual_flag;
	}
	public void setIs_manual_flag(char is_manual_flag) {
		this.is_manual_flag = is_manual_flag;
	}
	
}

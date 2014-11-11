package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="validation_rules")
public class ValidationRules {

	private int validation_rule_id;
	private String text;
	private String name;
	private String type;
	private String argument;
	private int crf_question_id;
	private long created_by;
	private Date date_created;
	private long modified_by;
	private Date date_modified;
	private Integer subscriber_id;
	
	
	@Id
	@GeneratedValue
	@Column(name="validation_rule_id")
	public int getValidation_rule_id() {
		return validation_rule_id;
	}
	public void setValidation_rule_id(int validation_rule_id) {
		this.validation_rule_id = validation_rule_id;
	}
	
	@Column(name="text")
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="argument")
	public String getArgument() {
		return argument;
	}
	public void setArgument(String argument) {
		this.argument = argument;
	}
	
	@Column(name="crf_question_id")
	public int getCrf_question_id() {
		return crf_question_id;
	}
	public void setCrf_question_id(int crf_question_id) {
		this.crf_question_id = crf_question_id;
	}
	
	@Column(name="created_by")
	public long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(long created_by) {
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
	public long getModified_by() {
		return modified_by;
	}
	public void setModified_by(long modified_by) {
		this.modified_by = modified_by;
	}
	
	@Column(name="date_modified")
	public Date getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Date date_modified) {
		this.date_modified = date_modified;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
}

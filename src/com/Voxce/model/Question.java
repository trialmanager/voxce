package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="question_html")
public class Question {

	private Integer question_id;
	private String question_name;
	private String question_edit_html;
	private String question_html;
	private Integer createdBy;
	private Integer modfiedBy;
	private Date createdDate;
	private Date modifiedDate;
	private Integer subsciber_id;
	
	@Id
	@GeneratedValue
	@Column(name="question_id")
	public Integer getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}
	
	
	@Column(name = "question_name")
	public String getQuestion_name() {
		return question_name;
	}
	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}
	
	@Column(name = "question_edit_html")
	public String getQuestion_edit_html() {
		return question_edit_html;
	}
	public void setQuestion_edit_html(String question_edit_html) {
		this.question_edit_html = question_edit_html;
	}
	
	@Column(name = "question_html")
	public String getQuestion_html() {
		return question_html;
	}
	public void setQuestion_html(String question_html) {
		this.question_html = question_html;
	}
	@Column(name = "createdBy")
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	@Column(name = "modfiedBy")
	public Integer getModfiedBy() {
		return modfiedBy;
	}
	public void setModfiedBy(Integer modfiedBy) {
		this.modfiedBy = modfiedBy;
	}
	@Column(name = "createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Column(name = "modifiedDate")
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	@Column(name = "subscriber_id")
	public Integer getSubsciber_id() {
		return subsciber_id;
	}
	public void setSubsciber_id(Integer subsciber_id) {
		this.subsciber_id = subsciber_id;
	}

	
}

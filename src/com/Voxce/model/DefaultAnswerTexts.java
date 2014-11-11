package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="default_answer_texts")
public class DefaultAnswerTexts {

	private int default_answer_text_id;	 	 	 	 	 	 	
	private int question_text_id;		 	 	 	 	 	 	
	private int display_order;		 	 	 	 	 	 	
	private int answer_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="default_answer_text_id")
	public int getDefault_answer_text_id() {
		return default_answer_text_id;
	}
	public void setDefault_answer_text_id(int default_answer_text_id) {
		this.default_answer_text_id = default_answer_text_id;
	}
	
	@Column(name="question_text_id")
	public int getQuestion_text_id() {
		return question_text_id;
	}
	public void setQuestion_text_id(int question_text_id) {
		this.question_text_id = question_text_id;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
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
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	
}

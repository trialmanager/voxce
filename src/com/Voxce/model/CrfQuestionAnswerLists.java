package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_auestion_answer_lists")
public class CrfQuestionAnswerLists {

	private int crf_question_answer_list_id;	 	 	 	 	 	 	
	private int crf_question_id;		 	 	 	 	 	 	
	private int display_order;		 	 	 	 	 	 	
	private int answer_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="crf_question_answer_list_id")
	public int getCrf_question_answer_list_id() {
		return crf_question_answer_list_id;
	}
	public void setCrf_question_answer_list_id(int crf_question_answer_list_id) {
		this.crf_question_answer_list_id = crf_question_answer_list_id;
	}
	
	@Column(name="crf_question_id")
	public int getCrf_question_id() {
		return crf_question_id;
	}
	public void setCrf_question_id(int crf_question_id) {
		this.crf_question_id = crf_question_id;
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

}

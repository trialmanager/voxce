package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_questions")
public class CrfQuestions {

	private int crf_question_id;	 	 	 	 	 	 	
	private int crf_id;		 	 	 	 	 	 	
	private String code;		 	 	 	 	 	 	
	private int crf_section_id;		 	 	 	 	 	 	
	private int display_order;		 	 	 	 	 	 	
	private char is_mandatory;			 	 	 	 	 	 	
	private char is_hidden;			 	 	 	 	 	 	
	private int question_text_id;		 	 	 	 	 	 	
	private int question_type_id;		 	 	 	 	 	 	
	private int question_size;		 	 	 	 	 	 	
	private int lab_id;		 	 	 	 	 	 	
	private int preferred_unit_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="crf_question_id")
	public int getCrf_question_id() {
		return crf_question_id;
	}
	public void setCrf_question_id(int crf_question_id) {
		this.crf_question_id = crf_question_id;
	}
	
	@Column(name="crf_id")
	public int getCrf_id() {
		return crf_id;
	}
	public void setCrf_id(int crf_id) {
		this.crf_id = crf_id;
	}
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="crf_section_id")
	public int getCrf_section_id() {
		return crf_section_id;
	}
	public void setCrf_section_id(int crf_section_id) {
		this.crf_section_id = crf_section_id;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
	}
	
	@Column(name="is_mandatory")
	public char getIs_mandatory() {
		return is_mandatory;
	}
	public void setIs_mandatory(char is_mandatory) {
		this.is_mandatory = is_mandatory;
	}
	
	@Column(name="is_hidden")
	public char getIs_hidden() {
		return is_hidden;
	}
	public void setIs_hidden(char is_hidden) {
		this.is_hidden = is_hidden;
	}
	
	@Column(name="question_text_id")
	public int getQuestion_text_id() {
		return question_text_id;
	}
	public void setQuestion_text_id(int question_text_id) {
		this.question_text_id = question_text_id;
	}
	
	@Column(name="question_type_id")
	public int getQuestion_type_id() {
		return question_type_id;
	}
	public void setQuestion_type_id(int question_type_id) {
		this.question_type_id = question_type_id;
	}
	
	@Column(name="question_size")
	public int getQuestion_size() {
		return question_size;
	}
	public void setQuestion_size(int question_size) {
		this.question_size = question_size;
	}
	
	@Column(name="lab_id")
	public int getLab_id() {
		return lab_id;
	}
	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}
	
	@Column(name="preferred_unit_id")
	public int getPreferred_unit_id() {
		return preferred_unit_id;
	}
	public void setPreferred_unit_id(int preferred_unit_id) {
		this.preferred_unit_id = preferred_unit_id;
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

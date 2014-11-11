package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="rule_action_texts")
public class RuleActionTexts {
	
	private int rule_action_text_id;	 	 	 	 	 	 	
	private int validation_rule_id;		 	 	 	 	 	 	
	private int action_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="rule_action_text_id")
	public int getRule_action_text_id() {
		return rule_action_text_id;
	}
	public void setRule_action_text_id(int rule_action_text_id) {
		this.rule_action_text_id = rule_action_text_id;
	}
	
	@Column(name="validation_rule_id")
	public int getValidation_rule_id() {
		return validation_rule_id;
	}
	public void setValidation_rule_id(int validation_rule_id) {
		this.validation_rule_id = validation_rule_id;
	}
	
	@Column(name="action_text_id")
	public int getAction_text_id() {
		return action_text_id;
	}
	public void setAction_text_id(int action_text_id) {
		this.action_text_id = action_text_id;
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

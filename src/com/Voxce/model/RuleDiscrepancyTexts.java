package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="rule_discrepancy_texts")
public class RuleDiscrepancyTexts {
	
	private int rule_discrepancy_text_id;	 	 	 	 	 	 	
	private int validation_rule_id;		 	 	 	 	 	 	
	private int discrepancy_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="validation_rule_id")
	public int getRule_discrepancy_text_id() {
		return rule_discrepancy_text_id;
	}
	public void setRule_discrepancy_text_id(int rule_discrepancy_text_id) {
		this.rule_discrepancy_text_id = rule_discrepancy_text_id;
	}
	
	@Column(name="validation_rule_id")
	public int getValidation_rule_id() {
		return validation_rule_id;
	}
	public void setValidation_rule_id(int validation_rule_id) {
		this.validation_rule_id = validation_rule_id;
	}
	
	@Column(name="discrepancy_text_id")
	public int getDiscrepancy_text_id() {
		return discrepancy_text_id;
	}
	public void setDiscrepancy_text_id(int discrepancy_text_id) {
		this.discrepancy_text_id = discrepancy_text_id;
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

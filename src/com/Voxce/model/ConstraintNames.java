package com.Voxce.model;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="constraint_names")
public class ConstraintNames {
	
	private int constraint_name_id;
	private String name;
	private String field;
	private String description;
	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="constraint_name_id")
	public int getConstraint_name_id() {
		return constraint_name_id;
	}
	public void setConstraint_name_id(int constraint_name_id) {
		this.constraint_name_id = constraint_name_id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="field")
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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

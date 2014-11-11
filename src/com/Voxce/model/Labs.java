package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="labs")
public class Labs {
	
	private int lab_id;	 	 	 	 	 	 	
	private String code;		 	 	 	 	 	 	
	private String name;		 	 	 	 	 	 	
	private String description;		 	 	 	 	 	 	
	private long created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private long modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
//default constructor
	public Labs(){
		
	}
//copy constructor
	public Labs(Labs copyLab) {
		
		this.lab_id = copyLab.lab_id;
		this.code = copyLab.code;
		this.name = copyLab.name;
		this.description = copyLab.description;
		this.created_by = copyLab.created_by;
		this.date_created = copyLab.date_created;
		this.modified_by = copyLab.modified_by;
		this.date_modified = copyLab.date_modified;

	}
	
	@Id
	@GeneratedValue
	@Column(name="lab_id")
	public int getLab_id() {
		return lab_id;
	}
	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="created_by")
	public long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(long createdBy) {
		this.created_by = createdBy;
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

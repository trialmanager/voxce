package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="groups")
public class Groups  {

	private Long id;
	private Integer subscriber_id;
	private String name;
	private String description;
	private String is_global;
	private Long created_by;
	private Date date_created;
	private Long modified_by;
	private Date date_modified;
	 	 	 	 	 	 	 	
	@Id
	@GeneratedValue
	@Column(name="GROUP_ID")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="GROUP_NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Column(name="DESCRIPTION")
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="IS_GLOBAL")
	public String getIs_global() {
		return is_global;
	}
	public void setIs_global(String is_global) {
		this.is_global = is_global;
	}
	
	@Column(name="CREATED_BY")
	public Long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(Long created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="DATE_MODIFIED")
	public Date getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Date date_modified) {
		this.date_modified = date_modified;
	}
	
	@Column(name="DATE_CREATED")
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	
	
	@Column(name="MODIFIED_BY")
	public Long getModified_by() {
		return modified_by;
	}
	public void setModified_by(Long modified_by) {
		this.modified_by = modified_by;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
}
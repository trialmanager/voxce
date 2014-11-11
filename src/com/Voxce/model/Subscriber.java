package com.Voxce.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="subscriber")
public class Subscriber {

	private int subscriber_id;	 	 	 	 	 	 		 	 	 	 	 	
	private String name;		 	 	 	 	 	 			 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Timestamp date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Timestamp date_modified;
	private int first_visit;
	private int is_active;
	
	@Id
	@GeneratedValue
	@Column(name="subscriber_id")
	public int getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(int subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Column(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="date_created")
	public Timestamp getDate_created() {
		return date_created;
	}
	public void setDate_created(Timestamp date_created) {
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
	public Timestamp getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Timestamp date_modified) {
		this.date_modified = date_modified;
	}
	
	@Column(name="is_active")
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	@Column(name="first_visit")
	public int getFirst_visit() {
		return first_visit;
	}
	public void setFirst_visit(int first_visit) {
		this.first_visit = first_visit;
	}
	
	
}

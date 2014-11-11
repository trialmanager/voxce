package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="queries")
public class Queries {
	
	private int query_id;	 	 	 	 	 	 	
	private int query_number;		 	 	 	 	 	 	
	private int received_crf_id;		 	 	 	 	 	 	
	private int query_status_id;		 	 	 	 	 	 	
	private int verified_by;		 	 	 	 	 	 	
	private Date date_verified;		 	 	 	 	 	 	
	private int received_by;		 	 	 	 	 	 	
	private Date date_reviewed;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="query_id")
	public int getQuery_id() {
		return query_id;
	}
	public void setQuery_id(int query_id) {
		this.query_id = query_id;
	}
	
	@Column(name="query_number")
	public int getQuery_number() {
		return query_number;
	}
	public void setQuery_number(int query_number) {
		this.query_number = query_number;
	}
	
	@Column(name="received_crf_id")
	public int getReceived_crf_id() {
		return received_crf_id;
	}
	public void setReceived_crf_id(int received_crf_id) {
		this.received_crf_id = received_crf_id;
	}
	
	@Column(name="query_status_id")
	public int getQuery_status_id() {
		return query_status_id;
	}
	public void setQuery_status_id(int query_status_id) {
		this.query_status_id = query_status_id;
	}
	
	@Column(name="verified_by")
	public int getVerified_by() {
		return verified_by;
	}
	public void setVerified_by(int verified_by) {
		this.verified_by = verified_by;
	}
	
	@Column(name="date_verified")
	public Date getDate_verified() {
		return date_verified;
	}
	public void setDate_verified(Date date_verified) {
		this.date_verified = date_verified;
	}
	
	@Column(name="received_by")
	public int getReceived_by() {
		return received_by;
	}
	public void setReceived_by(int received_by) {
		this.received_by = received_by;
	}
	
	@Column(name="date_reviewed")
	public Date getDate_reviewed() {
		return date_reviewed;
	}
	public void setDate_reviewed(Date date_reviewed) {
		this.date_reviewed = date_reviewed;
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

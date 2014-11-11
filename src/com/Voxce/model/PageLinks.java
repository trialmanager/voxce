package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="page_link")
public class PageLinks {
	
	private int page_link_id;	 	 	 	 	 	 	
	private int from_page_id;		 	 	 	 	 	 	
	private int to_page_id;		 	 	 	 	 	 	
	private String link_parameters;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="page_link_id")
	public int getPage_link_id() {
		return page_link_id;
	}
	public void setPage_link_id(int page_link_id) {
		this.page_link_id = page_link_id;
	}
	
	@Column(name="from_page_id")
	public int getFrom_page_id() {
		return from_page_id;
	}
	public void setFrom_page_id(int from_page_id) {
		this.from_page_id = from_page_id;
	}
	
	@Column(name="to_page_id")
	public int getTo_page_id() {
		return to_page_id;
	}
	public void setTo_page_id(int to_page_id) {
		this.to_page_id = to_page_id;
	}
	
	@Column(name="link_parameters")
	public String getLink_parameters() {
		return link_parameters;
	}
	public void setLink_parameters(String link_parameters) {
		this.link_parameters = link_parameters;
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

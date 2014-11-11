package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_sections")
public class CrfSections {
	
	private int crf_section_id;	 	 	 	 	 	 	
	private String section_code;			 	 	 	 	 	 	
	private int crf_page_id;		 	 	 	 	 	 	
	private int display_order;		 	 	 	 	 	 	
	private int section_name_text_id;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="crf_section_id")
	public int getCrf_section_id() {
		return crf_section_id;
	}
	public void setCrf_section_id(int crf_section_id) {
		this.crf_section_id = crf_section_id;
	}
	
	@Column(name="section_code")
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	
	@Column(name="crf_page_id")
	public int getCrf_page_id() {
		return crf_page_id;
	}
	public void setCrf_page_id(int crf_page_id) {
		this.crf_page_id = crf_page_id;
	}
	
	@Column(name="display_order")
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int display_order) {
		this.display_order = display_order;
	}
	
	@Column(name="section_name_text_id")
	public int getSection_name_text_id() {
		return section_name_text_id;
	}
	public void setSection_name_text_id(int section_name_text_id) {
		this.section_name_text_id = section_name_text_id;
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

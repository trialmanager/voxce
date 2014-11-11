package com.Voxce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="section_html")
public class Section {
 
 private Integer section_id;
 
 private String section_name;
 
 private String section_edit_html;
 
 private String section_html;
 
 private Integer subscriber_id;

	@Id
	 @GeneratedValue
	 @Column(name = "section_id")
	public Integer getSection_id() {
		return section_id;
	}
	public void setSection_id(Integer section_id) {
		this.section_id = section_id;
	}
	
	
	@Column(name = "section_name")
	public String getSection_name() {
		return section_name;
	}
	 public void setSection_name(String section_name) {
		this.section_name = section_name;
	}
	
	public void setSection_edit_html(String section_edit_html) {
		this.section_edit_html = section_edit_html;
	}
	 @Column(name ="section_edit_html")
	public String getSection_edit_html() {
		return section_edit_html;
	}
	public void setSection_html(String section_html) {
		this.section_html = section_html;
	}
	@Column(name = "section_html")
	public String getSection_html() {
		return section_html;
	}
	@Column(name = "subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}

	
	

 
}
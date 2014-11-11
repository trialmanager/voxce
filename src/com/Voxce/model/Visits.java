package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="visits")
public class Visits {
	
	private Integer visit_id;
	private Integer study_id;
	private String description;
	private int visit_name_text_id;
	private int related_visit_id;
	private boolean is_scheduled;
	private boolean is_mandatory;
	private boolean is_adverse;
	private boolean is_monitor;
	private int window_open;
	private int window_close;
	private int created_by;
	private int visit_optimum;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private Integer subscriber_id;
	private int is_primary;
	
	@Id
	@GeneratedValue
	@Column(name="visit_id")
	public Integer getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(Integer visit_id) {
		this.visit_id = visit_id;
	}
	
	@Column(name="study_id")
	public Integer getStudy_id() {
		return study_id;
	}
	public void setStudy_id(Integer study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="visit_name_text_id")
	public int getVisit_name_text_id() {
		return visit_name_text_id;
	}
	public void setVisit_name_text_id(int visit_name_text_id) {
		this.visit_name_text_id = visit_name_text_id;
	}
	
	@Column(name="is_scheduled")
	@Type(type="yes_no")
	public boolean getIs_scheduled() {
		return is_scheduled;
	}
	public void setIs_scheduled(boolean is_scheduled) {
		this.is_scheduled = is_scheduled;
	}
	
	@Column(name="is_mandatory")
	@Type(type="yes_no")
	public boolean getIs_mandatory() {
		return is_mandatory;
	}
	public void setIs_mandatory(boolean is_mandatory) {
		this.is_mandatory = is_mandatory;
	}
	
	
	@Column(name="is_monitor")
	public boolean getIs_monitor() {
		return is_monitor;
	}
	public void setIs_monitor(boolean is_monitor) {
		this.is_monitor = is_monitor;
	}
	
	@Column(name="window_open")
	public int getWindow_open() {
		return window_open;
	}
	public void setWindow_open(int window_open) {
		this.window_open = window_open;
	}
	
	@Column(name="window_close")
	public int getWindow_close() {
		return window_close;
	}
	public void setWindow_close(int window_close) {
		this.window_close = window_close;
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
	@Column(name="is_adverse")
	@Type(type="yes_no")
	public boolean getIs_adverse() {
		return is_adverse;
	}
	public void setIs_adverse(boolean is_adverse) {
		this.is_adverse = is_adverse;
	}
	@Column(name="visit_optimum")
	public int getVisit_optimum() {
		return visit_optimum;
	}
	public void setVisit_optimum(int visit_optimum) {
		this.visit_optimum = visit_optimum;
	}
	@Column(name="description")
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
	}
	public void setRelated_visit_id(int related_visit_id) {
		this.related_visit_id = related_visit_id;
	}
	@Column(name="	related_visit_id")
	public int getRelated_visit_id() {
		return related_visit_id;
	}
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	@Column(name="is_primary")
	public int getIs_primary() {
		return is_primary;
	}
	public void setIs_primary(int is_primary) {
		this.is_primary = is_primary;
	}
}

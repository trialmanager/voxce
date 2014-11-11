package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lab_normals")
public class LabNormals {
	
	private int lab_normal_id;	 	 	 	 	 	 	
	private int labratory_id;		 	 	 	 	 	 	
	private int lab_id;		 	 	 	 	 	 	
	private int unit_id;		 	 	 	 	 	 	
	private int normal_low;		 	 	 	 	 	 	
	private int normal_low_unit;		 	 	 	 	 	 	
	private int normal_high;		 	 	 	 	 	 	
	private int normal_high_unit;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="lab_normal_id")
	public int getLab_normal_id() {
		return lab_normal_id;
	}
	public void setLab_normal_id(int lab_normal_id) {
		this.lab_normal_id = lab_normal_id;
	}
	
	@Column(name="labratory_id")
	public int getLabratory_id() {
		return labratory_id;
	}
	public void setLabratory_id(int labratory_id) {
		this.labratory_id = labratory_id;
	}
	
	@Column(name="lab_id")
	public int getLab_id() {
		return lab_id;
	}
	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}
	
	@Column(name="unit_id")
	public int getUnit_id() {
		return unit_id;
	}
	public void setUnit_id(int unit_id) {
		this.unit_id = unit_id;
	}
	
	@Column(name="normal_low")
	public int getNormal_low() {
		return normal_low;
	}
	public void setNormal_low(int normal_low) {
		this.normal_low = normal_low;
	}
	
	@Column(name="normal_low_unit")
	public int getNormal_low_unit() {
		return normal_low_unit;
	}
	public void setNormal_low_unit(int normal_low_unit) {
		this.normal_low_unit = normal_low_unit;
	}
	
	@Column(name="normal_high")
	public int getNormal_high() {
		return normal_high;
	}
	public void setNormal_high(int normal_high) {
		this.normal_high = normal_high;
	}
	
	@Column(name="normal_high_unit")
	public int getNormal_high_unit() {
		return normal_high_unit;
	}
	public void setNormal_high_unit(int normal_high_unit) {
		this.normal_high_unit = normal_high_unit;
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
	@Column(name="subscriber_id")
	public Integer getSubscriber_id() {
		return subscriber_id;
	}
	public void setSubscriber_id(Integer subscriber_id) {
		this.subscriber_id = subscriber_id;
	}
	
	

}

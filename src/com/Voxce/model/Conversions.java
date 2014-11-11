package com.Voxce.model;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="conversions")
public class Conversions {

	private int conversion_id;	 	 	 	 	 	 	
	private int from_unit_id;		 	 	 	 	 	 	
	private int to_unit_id_factor;		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	
	@Id
	@GeneratedValue
	@Column(name="conversion_id")
	public int getConversion_id() {
		return conversion_id;
	}
	public void setConversion_id(int conversion_id) {
		this.conversion_id = conversion_id;
	}
	
	@Column(name="from_unit_id")
	public int getFrom_unit_id() {
		return from_unit_id;
	}
	public void setFrom_unit_id(int from_unit_id) {
		this.from_unit_id = from_unit_id;
	}
	
	@Column(name="to_unit_id_factor")
	public int getTo_unit_id_factor() {
		return to_unit_id_factor;
	}
	public void setTo_unit_id_factor(int to_unit_id_factor) {
		this.to_unit_id_factor = to_unit_id_factor;
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

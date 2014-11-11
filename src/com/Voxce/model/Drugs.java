package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="drugs")
public class Drugs {
	
	private int drug_id;	 	 	 	 	 	 	
	private String code;		 	 	 	 	 	 	
	private String name;
	private String type;
	private String dose;
	private int normal_value;
	private int per_normal_value;
	private boolean refillable;
	private String description;
	private String instructions;
	private long created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private long modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	public Drugs() {
		
	}
	
	public Drugs(Drugs copyDrug){
		
		this.drug_id = copyDrug.drug_id;
		this.code = copyDrug.code;
		this.name = copyDrug.name;
		this.type = copyDrug.type;
		this.dose = copyDrug.dose;
		this.normal_value = copyDrug.normal_value;
		this.per_normal_value = copyDrug.per_normal_value;
		this.refillable = copyDrug.refillable;
		this.description = copyDrug.description;
		this.instructions = copyDrug.instructions;
		this.created_by = copyDrug.created_by;
		this.date_created = copyDrug.date_created;
		this.modified_by = copyDrug.modified_by;
		this.date_modified = copyDrug.date_modified;
	}
	
	@Id
	@GeneratedValue
	@Column(name="drug_id")
	public int getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(int drug_id) {
		this.drug_id = drug_id;
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
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="dose")
	public String getDose() {
		return dose;
	}
	public void setDose(String dose) {
		this.dose = dose;
	}
	
	@Column(name="normal_value")
	public int getNormal_value() {
		return normal_value;
	}
	public void setNormal_value(int normal_value) {
		this.normal_value = normal_value;
	}
	
	@Column(name="per_normal_value")
	public int getPer_normal_value() {
		return per_normal_value;
	}
	public void setPer_normal_value(int per_normal_value) {
		this.per_normal_value = per_normal_value;
	}
	
	@Column(name="refillable")
	public boolean isRefillable() {
		return refillable;
	}
	public void setRefillable(boolean refillable) {
		this.refillable = refillable;
	}
	
	@Column(name="instructions")
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	
	@Column(name="created_by")
	public long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(long created_by) {
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

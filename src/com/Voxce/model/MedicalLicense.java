package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="medical_license")
public class MedicalLicense {
	
	private int medical_lic_id;
	private int site_id;		 	 	 	 	 	 	
	private int study_id;		 	 	 	 	 	 	
	private int user_id;		 	 	 	 	 	 	
	private Date begin_dt;		 	 	 	 	 	 	
	private Date start_dt;		 	 	 	 	 	 	
	private Date expire_dt;		 	 	 	 	 	 	
	private String protocol_version;		 	 	 	 	 	 	
	private int type_id;
	private String protocol_id;
	private String description;		 	 	 	 	 	 		 	 	 	 	 	 	
	private int created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private int modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private String type;
	private String filename;
	private String file_description;
	private byte[] data;
	
	@Id
	@GeneratedValue
	@Column(name="medical_lic_id")
	public int getMedical_lic_id() {
		return medical_lic_id;
	}
	public void setMedical_lic_id(int medical_lic_id) {
		this.medical_lic_id = medical_lic_id;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="study_id")
	public int getStudy_id() {
		return study_id;
	}
	
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	@Column(name="protocol_id")
	public String getProtocol_id() {
		return protocol_id;
	}
	public void setProtocol_id(String protocol_id) {
		this.protocol_id = protocol_id;
	}
	
	@Column(name="protocol_version")
	public String getProtocol_version() {
		return protocol_version;
	}
	public void setProtocol_version(String protocol_version) {
		this.protocol_version = protocol_version;
	}
	
		@Column(name="filename")
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Column(name="file_description")
	public String getFile_description() {
		return file_description;
	}
	public void setFile_description(String file_description) {
		this.file_description = file_description;
	}

@Column(name="type")
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}

	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="begin_dt")
	public Date getBegin_dt() {
		return begin_dt;
	}
	public void setBegin_dt(Date begin_dt) {
		this.begin_dt = begin_dt;
	}
	
	@Column(name="start_dt")
	public Date getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}
	
	@Column(name="expire_dt")
	public Date getExpire_dt() {
		return expire_dt;
	}
	public void setExpire_dt(Date expire_dt) {
		this.expire_dt = expire_dt;
	}
	
	
	@Column(name="type_id")
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	
	@Column(name="data")
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}

}

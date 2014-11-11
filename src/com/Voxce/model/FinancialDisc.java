package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="financial_disc")
public class FinancialDisc {

	private int financial_disc_id;	 	 	 	 	 	 	
	private int site_id;		 	 	 	 	 	 	
	private int study_id;		 	 	 	 	 	 	
	private int user_id;		 	 	 	 	 	 	
	private Date signed_dt;	
	private String protocol_id;
	private Date received_dt;		 	 	 	 	 	 	
	private String protocol_version;		 	 	 	 	 	 	
	private int type_id;		 	 	 	 	 	 	
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
	@Column(name="financial_disc_id")
	public int getFinancial_disc_id() {
		return financial_disc_id;
	}
	public void setFinancial_disc_id(int financial_disc_id) {
		this.financial_disc_id = financial_disc_id;
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
	
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="signed_dt")
	public Date getSigned_dt() {
		return signed_dt;
	}
	public void setSigned_dt(Date signed_dt) {
		this.signed_dt = signed_dt;
	}
	@Column(name="protocol_id")
	public String getProtocol_id() {
		return protocol_id;
	}
	public void setProtocol_id(String protocol_id) {
		this.protocol_id = protocol_id;
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

	@Column(name="protocol_version")
	public String getProtocol_version() {
		return protocol_version;
	}
	public void setProtocol_version(String protocol_version) {
		this.protocol_version = protocol_version;
	}
		
	@Column(name="received_dt")
	public Date getReceived_dt() {
		return received_dt;
	}
	public void setReceived_dt(Date received_dt) {
		this.received_dt = received_dt;
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

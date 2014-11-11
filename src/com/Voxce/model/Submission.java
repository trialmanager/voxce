package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="submission")
public class Submission {
	
	private int submission_id;
	private int study_id;
	private String protocol_id;
	private String protocol_version;
	private int submission_type_id;
	private int site_id;	
	private String submission_name;
	private int approval_status_type_id;
	private Date submission_date;
	private Date material_sent_date;
	private Date sched_review_date;
	private Date actual_review_date;
	private Date approval_date;
	private Date expiration_date;
	private Date consent_date;
	private int letter_file;
	private String type;
	private String filename;
	private String file_description;
	private String description;
	private String regulatorybody_country;
	private String regulatorybody_name;

	private int created_by;
	private Date date_created;
	private int modified_by;
	private Date date_modified;
	private byte[] data;
	
	
	@Id
	@GeneratedValue
	@Column(name="submission_id")
	public int getSubmission_id() {
		return submission_id;
	}
	public void setSubmission_id(int submission_id) {
		this.submission_id = submission_id;
	}
	
	
	
	
	@Column(name="protocol_version")
	public String getProtocol_version() {
		return protocol_version;
	}
	public void setProtocol_version(String protocol_version) {
		this.protocol_version = protocol_version;
	}
	
	@Column(name="submission_name")
	public String getSubmission_name() {
		return submission_name;
	}
	public void setSubmission_name(String submission_name) {
		this.submission_name = submission_name;
	}
	
	@Column(name="submission_type_id")
	public int getSubmission_type_id() {
		return submission_type_id;
	}
	public void setSubmission_type_id(int submission_type_id) {
		this.submission_type_id = submission_type_id;
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
	
	@Column(name="regulatorybody_country")
	public String getRegulatorybody_country() {
	return regulatorybody_country;
	}
	public void setRegulatorybody_country(String regulatorybody_country) {
	this.regulatorybody_country = regulatorybody_country;
	}
	
	@Column(name="regulatorybody_name")
	public String getRegulatorybody_name() {
	return regulatorybody_name;
	}
	public void setRegulatorybody_name(String regulatorybody_name) {
	this.regulatorybody_name = regulatorybody_name;
	}
	;
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="site_id")
	public int getSite_id() {
		return site_id;
	}
	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}
	
	@Column(name="approval_status_type_id")
	public int getApproval_status_type_id() {
		return approval_status_type_id;
	}
	public void setApproval_status_type_id(int approval_status_type_id) {
		this.approval_status_type_id = approval_status_type_id;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="submission_date")
	public Date getSubmission_date() {
		return submission_date;
	}
	public void setSubmission_date(Date submission_date) {
		this.submission_date = submission_date;
	}
	
	@Column(name="material_sent_date")
	public Date getMaterial_sent_date() {
		return material_sent_date;
	}
	public void setMaterial_sent_date(Date material_sent_date) {
		this.material_sent_date = material_sent_date;
	}
	
	@Column(name="sched_review_date")
	public Date getSched_review_date() {
		return sched_review_date;
	}
	public void setSched_review_date(Date sched_review_date) {
		this.sched_review_date = sched_review_date;
	}
	
	@Column(name="consent_date")
	public Date getConsent_date() {
		return consent_date;
	}
	public void setConsent_date(Date consent_date) {
		this.consent_date = consent_date;
	}
	
	@Column(name="actual_review_date")
	public Date getActual_review_date() {
		return actual_review_date;
	}
	public void setActual_review_date(Date actual_review_date) {
		this.actual_review_date = actual_review_date;
	}
	
	@Column(name="approval_date")
	public Date getApproval_date() {
		return approval_date;
	}
	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}
	
	@Column(name="expiration_date")
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
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
	
	@Column(name="letter_file")
	public int getLetter_file() {
		return modified_by;
	}
	public void setLetter_file(int letter_file) {
		this.letter_file = letter_file;
	}
	//
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
}

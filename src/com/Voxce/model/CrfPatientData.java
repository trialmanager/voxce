package com.Voxce.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crf_patient_data")
public class CrfPatientData {

private int crf_patient_data_id;
private int subscriber_id;
private int study_id;
private int site_id;
private int patient_id;
private int visit_id;
private int patientCrf_id;

private String section;
private String question;
private String answer;


private long modified_by;
private Timestamp date_modified;

		@Id
		@GeneratedValue
		@Column(name="crf_patient_data_id")
		public int getCrf_patient_data() {
			return crf_patient_data_id;
		}
		public void setCrf_patient_data(int crf_patient_data_id) {
			this.crf_patient_data_id = crf_patient_data_id;
		}
		@Column(name="subscriber_id")
		public int getSubscriber_id() {
			return subscriber_id;
		}
		public void setSubscriber_id(int subscriber_id) {
			this.subscriber_id = subscriber_id;
		}
		@Column(name="study_id")
		public int getStudi_id() {
			return study_id;
		}
		public void setStudi_id(int study_id) {
			this.study_id = study_id;
		}
		
		@Column(name="site_id")
		public int getSite_id() {
			return site_id;
		}
		public void setSite_id(int site_id) {
			this.site_id = site_id;
		}
		
		@Column(name="patient_id")
		public int getPatient_id() {
			return patient_id;
		}
		public void setPatient_id(int patient_id) {
			this.patient_id = patient_id;
		}
		
		@Column(name="visit_id")
		public int getVisit_id() {
			return visit_id;
		}
		public void setVisit_id(int visit_id) {
			this.visit_id = visit_id;
		}
		
		@Column(name="patientCrf_id")
		public int getPatientCrf_id() {
			return patientCrf_id;
		}
		public void setPatientCrf_id(int patientCrf_id) {
			this.patientCrf_id = patientCrf_id;
		}
		
		@Column(name="section")
		public String getSection() {
			return section;
		}
		public void setSection(String section) {
			this.section = section;
		}
		
		@Column(name="question")
		public String getQuestion() {
			return question;
		}
		public void setQuestion(String question) {
			this.question = question;
		}
		
		@Column(name="modified_by")
		public long getModified_by() {
			return modified_by;
		}
		
		public void setModified_by(long modified_by) {
			this.modified_by = modified_by;
		}
		
		@Column(name="date_modified")
		public Timestamp getDate_modified() {
			return date_modified;
		}
		public void setDate_modified(Timestamp date_modified) {
			this.date_modified = date_modified;
		}
		
		@Column(name="answer")
		public String getAnswer() {
			return answer;
		}
		public void setAnswer(String answer) {
			this.answer = answer;
		}
	
 
}
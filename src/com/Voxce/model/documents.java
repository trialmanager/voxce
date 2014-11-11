package com.Voxce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.fileupload.FileItem;

@Entity
@Table(name="documents")
public class documents {
	
	private int study_document_id;
	private FileItem data;
	
	@Id
	@GeneratedValue
	@Column(name="study_document_id")
	public int getStudy_Document_id() {
		return study_document_id;
	}
	public void setStudy_Document_id(int document_id) {
		this.study_document_id = document_id;
	}
	
	@Column(name="data")
	public FileItem getData() {
		return data;
	}
	public void setData(FileItem data) {
		this.data = data;
	}
	
}

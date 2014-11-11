package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="labratory")
// There is a spell difference in Table name and Class name

public class Laboratory {	
	
	private int labratory_id;	 	 	 	 	 	 	
	private String lab_name;			 	 	 	 	 	 	
	private String email;		 	 	 	 	 	 	
	private String address1;		 	 	 	 	 	 	
	private String address2;		 	 	 	 	 	 	
	private String address3;		 	 	 	 	 	 	
	private String city;		 	 	 	 	 	 	
	private String state;		 	 	 	 	 	 	
	private int country_id;		 	 	 	 	 	 	
	private int postal_code;		 	 	 	 	 	 	
	private String phone;		 	 	 	 	 	 	
	private String cell;		 	 	 	 	 	 	
	private String fax;		 	 	 	 	 	 	
	private long created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private long modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	@Id
	@GeneratedValue
	@Column(name="labratory_id")
	public int getLabratory_id() {
		return labratory_id;
	}
	public void setLabratory_id(int labratory_id) {
		this.labratory_id = labratory_id;
	}
	
	@Column(name="lab_name")
	public String getLab_name() {
		return lab_name;
	}
	public void setLab_name(String lab_name) {
		this.lab_name = lab_name;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="address1")
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	
	@Column(name="address2")
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	@Column(name="address3")
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	
	@Column(name="city")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name="state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name="country_id")
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	
	@Column(name="postal_code")
	public int getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
	}
	
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Column(name="cell")
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	
	@Column(name="fax")
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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

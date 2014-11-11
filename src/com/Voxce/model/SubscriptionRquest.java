package com.Voxce.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="subscriptionrquest")
public class SubscriptionRquest {
	
	private int user_id;
	private int is_active;
	private int devision_id;
	private int preferred_language_id;
	private String login;
	private String password;
	private String title;
	private String first_name;
	private String middle_name;
	private String last_name;
	private String suffix;
	private String email;
	private String sha1_password;
	private String salt;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String state;
	private int country_id;
	private String postal_code;
	private String phone;
	private String cell;
	private String fax;
	private String company;
	private Date last_login;
	private Date last_logout;
	private int created_by;
	private Timestamp date_created;
	private int modified_by;
	private Timestamp date_modified;
	private Integer subscription_id;
	private String user_type;
	
	
	
	@Id
	@GeneratedValue
	@Column(name="user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Column(name="is_active")
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	
	@Column(name="devision_id")
	public int getDevision_id() {
		return devision_id;
	}
	public void setDevision_id(int devision_id) {
		this.devision_id = devision_id;
	}
	
	@Column(name="preferred_language_id")
	public int getPreferred_language_id() {
		return preferred_language_id;
	}
	public void setPreferred_language_id(int preferred_language_id) {
		this.preferred_language_id = preferred_language_id;
	}
	
	@Column(name="login")
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="first_name")
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	
	@Column(name="middle_name")
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	
	@Column(name="last_name")
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	@Column(name="suffix")
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="sha1_password")
	public String getSha1_password() {
		return sha1_password;
	}
	public void setSha1_password(String sha1_password) {
		this.sha1_password = sha1_password;
	}
	
	@Column(name="salt")
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
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
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
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
	
	@Column(name="company")
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	@Column(name="last_login")
	public Date getLast_login() {
		return last_login;
	}
	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}
	
	@Column(name="last_logout")
	public Date getLast_logout() {
		return last_logout;
	}
	public void setLast_logout(Date last_logout) {
		this.last_logout = last_logout;
	}
	
	@Column(name="created_by")
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	@Column(name="date_created")
	public Timestamp getDate_created() {
		return date_created;
	}
	public void setDate_created(Timestamp date_created) {
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
	public Timestamp getDate_modified() {
		return date_modified;
	}
	public void setDate_modified(Timestamp date_modified) {
		this.date_modified = date_modified;
	}
	@Column(name="subscriber_id")
	public Integer getSubscription_id() {
		return subscription_id;
	}
	public void setSubscription_id(Integer subscription_id) {
		this.subscription_id = subscription_id;
	}
	@Column(name="user_type")
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
}

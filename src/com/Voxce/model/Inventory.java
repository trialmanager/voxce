package com.Voxce.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="inventory")
public class Inventory {
	
	private int inventory_id;	 	 	 	 	 	 	
	private String part_no;		 	 	 	 	 	 	
	private String name;
	private String objectType;
	private String mass;
	private String BatchNumber;
	private String mass_unit;
	private int volume;
	private String volume_unit;
	private int concentration;
	private String concentration_unit;
	private int storage_temp;
	private String inv_condition;
	private String status;
	private String category;
	private String origin;
	private String cat_nbr;
	private String lot_nbr;
	private String serial_nbr;
	private Date issuedate;
	private Date expirydate;
	private Date gooduntildate;
	private String hazard;
	private long created_by;		 	 	 	 	 	 	
	private Date date_created;		 	 	 	 	 	 	
	private long modified_by;		 	 	 	 	 	 	
	private Date date_modified;
	private Integer subscriber_id;
	
	public Inventory() {
		
	}
	
	public Inventory(Inventory copyInventory){
		
		this.inventory_id = copyInventory.inventory_id;	 	 	 	 	
		this.part_no = copyInventory.part_no;
		this.name  = copyInventory.name;
		this.objectType = copyInventory.objectType;
		this.mass = copyInventory.mass;
		this.BatchNumber = copyInventory.BatchNumber;
		this.mass_unit = copyInventory.mass_unit;
		this.volume = copyInventory.volume;
		this.volume_unit = copyInventory.volume_unit;
		this.concentration = copyInventory.concentration;
		this.concentration_unit = copyInventory.concentration_unit;
		this.storage_temp = copyInventory.storage_temp;
		this.inv_condition = copyInventory.inv_condition;
		this.status = copyInventory.status;
		this.category = copyInventory.category;
		this.origin = copyInventory.origin;
		this.cat_nbr = copyInventory.cat_nbr;
		this.lot_nbr = copyInventory.lot_nbr;
		this.serial_nbr = copyInventory.serial_nbr;
		this.issuedate = copyInventory.issuedate;
		this.expirydate = copyInventory.expirydate;
		this.gooduntildate = copyInventory.gooduntildate;
		this.hazard = copyInventory.hazard;
		this.created_by = copyInventory.created_by;
		this.date_created = copyInventory.date_created;
		this.modified_by = copyInventory.modified_by;
		this.date_modified = copyInventory.date_modified;
	}
	
	@Id
	@GeneratedValue
	@Column(name="inventory_id")
	public int getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(int inventory_id) {
		this.inventory_id = inventory_id;
	}
	
	@Column(name="part_no")
	public String getPartNo() {
		return part_no;
	}
	public void setPartNo(String part_no) {
		this.part_no = part_no;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="objectType")
	public String getObjectType() {
		return objectType;
	}
	
	public void setObjectType(String objectType) {
		this.objectType = objectType;
	}
	
	@Column(name="mass")
	public String getMass() {
		return mass;
	}
	public void setMass(String mass) {
		this.mass = mass;
	}
	
	@Column(name="mass_unit")
	public String getMassUnit() {
		return mass_unit;
	}
	public void setMassUnit(String mass_unit) {
		this.mass_unit = mass_unit;
	}
	
	@Column(name="batchnumber")
	public String getBatchNumber() {
		return BatchNumber;
	}
	public void setBatchNumber(String batch_number) {
		this.BatchNumber = batch_number;
	}
	
	@Column(name="volume")
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	
	@Column(name="volume_unit")
	public String getVolumeUnit() {
		return volume_unit;
	}
	public void setVolumeUnit(String volume_unit) {
		this.volume_unit = volume_unit;
	}
	
	@Column(name="concentration")
	public int getConcentration() {
		return concentration;
	}
	public void setConcentration(int concentration) {
		this.concentration = concentration;
	}
	
	@Column(name="concentration_unit")
	public String getConcentrationUnit() {
		return concentration_unit;
	}
	public void setConcentrationUnit(String concentration_unit) {
		this.concentration_unit = concentration_unit;
	}
	
	@Column(name="storage_temp")
	public int getStorageTemp() {
		return storage_temp;
	}
	public void setStorageTemp(int storage_temp) {
		this.storage_temp = storage_temp;
	}
	
	@Column(name="inv_condition")
	public String getInvCondition() {
		return inv_condition;
	}
	public void setInvCondition(String inv_condition) {
		this.inv_condition = inv_condition;
	}
	
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="category")
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name="origin")
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	@Column(name="cat_nbr")
	public String getCatNbr() {
		return cat_nbr;
	}
	public void setCatNbr(String cat_nbr) {
		this.cat_nbr = cat_nbr;
	}
	
	@Column(name="lot_nbr")
	public String getLotNbr() {
		return lot_nbr;
	}
	public void setLotNbr(String lot_nbr) {
		this.lot_nbr = lot_nbr;
	}
	
	@Column(name="serial_nbr")
	public String getSerialNbr() {
		return serial_nbr;
	}
	public void setSerialNbr(String serial_nbr) {
		this.serial_nbr = serial_nbr;
	}
	
	@Column(name="hazard")
	public String getHazard() {
		return hazard;
	}
	public void setHazard(String hazard) {
		this.hazard = hazard;
	}
	
	@Column(name="issuedate")
	public Date getIssueDate() {
		return issuedate;
	}
	public void setIssueDate(Date issuedate) {
		this.issuedate = issuedate;
	}
	
	@Column(name="expirydate")
	public Date getExpiryDate() {
		return expirydate;
	}
	public void setExpiryDate(Date expirydate) {
		this.expirydate = expirydate;
	}
	
	@Column(name="gooduntildate")
	public Date getGoodUntilDate() {
		return gooduntildate;
	}
	public void setGoodUntilDate(Date gooduntildate) {
		this.gooduntildate = gooduntildate;
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

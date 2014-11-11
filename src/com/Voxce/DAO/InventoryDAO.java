package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Inventory;
import com.Voxce.model.Users;

public class InventoryDAO {
	
	private HibernateTemplate hibernateTemplate;
	List<?> existingPart;
	List<?> existingNames;
	List<Inventory> listInventory;

//******* GET HIBERNATE SESSION FACTORY	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD INVENTORY
	public int saveInventory(Inventory inventory, Users user) {
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		//Check for existing country code or name
		try{
				existingPart = hibernateTemplate.find("SELECT part_no FROM Inventory WHERE subscriber_id="+user.getSubscription_id()+" AND code=?",inventory.getPartNo() );
				existingNames = hibernateTemplate.find("SELECT name FROM Inventory WHERE subscriber_id="+user.getSubscription_id()+" AND name=?", inventory.getName());
			
		}
		catch(Exception exp){
			exp.printStackTrace();
		}

		if(existingNames.size()!=0){	//inventory already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingPart.size()!=0){ //inventory code already exists
			messageCode = 2;
		}
		else if(existingPart.size()==0 && existingNames.size()==0){ //inventory code or name is valid, so save it
			
			inventory.setDate_created(dateCreated);
			inventory.setSubscriber_id(user.getSubscription_id());
	
			hibernateTemplate.saveOrUpdate(inventory);
			hibernateTemplate.flush();
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
	
		return messageCode;
	}
	
//******* GET INVENTORY LIST
	@SuppressWarnings("unchecked")
	public List<Inventory> getInventoryList(Users user) {
		
		List<Inventory> list=hibernateTemplate.find("from Inventory where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Inventory>();
		return list;
	}
	
	
//**** FIND THE INVENTORY	
	public Inventory findInventory(int inventory_id) {
		Inventory inventory = null;
		List<?> foundInventory = null;
		try {
			
			foundInventory = hibernateTemplate.find("FROM Inventory WHERE inventory_id = ?", inventory_id);
			inventory = (Inventory) foundInventory.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Finding Inventory = "+ excp);
		}
			
		return inventory; 
	}
	
	
// **** UPDATE THE INVENTORY
	public int updateInventory(Inventory newInventory) {

		List<?> existingPart = null;
		List<?> existingNames = null;

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		// Check for existing country code or name
		try {
			existingPart = hibernateTemplate.find("SELECT code FROM Inventory WHERE subscriber_id = "+newInventory.getSubscriber_id()+" AND  part_no = ? AND inventory_id <> ?",newInventory.getPartNo(), newInventory.getInventory_id());
			existingNames = hibernateTemplate.find("SELECT name FROM Inventory WHERE subscriber_id = "+newInventory.getSubscriber_id()+" AND name = ? AND inventory_id <> ?",newInventory.getName(), newInventory.getInventory_id());
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		if (existingNames.size() != 0) { // inventory already exists , 0 is left for
			messageCode = 1;	
		} 
		else if (existingPart.size() != 0) { // inventory code already exists
			messageCode = 2;
		}
		else if (existingPart.size() == 0 && existingNames.size() == 0) { // country code or name is valid, so save it
			
			try {
				
				Inventory oldInventory = this.findInventory(newInventory.getInventory_id());
				
				newInventory.setCreated_by(oldInventory.getCreated_by());
				newInventory.setDate_created(oldInventory.getDate_created());
				newInventory.setDate_modified(dateModified);
				
				hibernateTemplate.update(newInventory);
				hibernateTemplate.flush();
			} catch (Exception e) {
				System.out.println(e);
			}
			messageCode = 3;
		} 
		else {
			messageCode = 4;
		}

		return messageCode;
	}
}

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Drugs;
import com.Voxce.model.Users;

public class DrugsDAO {
	
	private HibernateTemplate hibernateTemplate;
	List<?> existingCodes;
	List<?> existingNames;
	List<Drugs> listDrugs;

//******* GET HIBERNATE SESSION FACTORY	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD LAB
	public int saveDrugs(Drugs drug, Users user) {
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		//Check for existing country code or name
		try{
				existingCodes = hibernateTemplate.find("SELECT code FROM Drugs WHERE subscriber_id="+user.getSubscription_id()+" AND code=?", drug.getCode());
				existingNames = hibernateTemplate.find("SELECT name FROM Drugs WHERE subscriber_id="+user.getSubscription_id()+" AND name=?", drug.getName());
			
		}
		catch(Exception exp){
			exp.printStackTrace();
		}

		if(existingNames.size()!=0){	//drug already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //drug code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //drug code or name is valid, so save it
			
			drug.setDate_created(dateCreated);
			drug.setSubscriber_id(user.getSubscription_id());
	
			hibernateTemplate.saveOrUpdate(drug);
			hibernateTemplate.flush();
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
	
		return messageCode;
	}
	
//******* GET DRUG LIST
	@SuppressWarnings("unchecked")
	public List<Drugs> getDrugsList(Users user) {
		
		List<Drugs> list=hibernateTemplate.find("from Drugs where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Drugs>();
		return list;
	}
	
	
//**** FIND THE DRUG	
	public Drugs findDrug(int drug_id) {
		Drugs drug = null;
		List<?> foundDrug = null;
		try {
			
			foundDrug = hibernateTemplate.find("FROM Drugs WHERE drug_id = ?", drug_id);
			drug = (Drugs) foundDrug.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Finding Lab = "+ excp);
		}
			
		return drug; 
	}
	
	
// **** UPDATE THE DRUG
	public int updateDrug(Drugs newDrug) {

		List<?> existingCodes = null;
		List<?> existingNames = null;

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		// Check for existing country code or name
		try {
			existingCodes = hibernateTemplate.find("SELECT code FROM Drugs WHERE subscriber_id = "+newDrug.getSubscriber_id()+" AND  code = ? AND drug_id <> ?",newDrug.getCode(), newDrug.getDrug_id());
			existingNames = hibernateTemplate.find("SELECT name FROM Drugs WHERE subscriber_id = "+newDrug.getSubscriber_id()+" AND name = ? AND drug_id <> ?",newDrug.getName(), newDrug.getDrug_id());
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		if (existingNames.size() != 0) { // drug already exists , 0 is left for
			messageCode = 1;	
		} 
		else if (existingCodes.size() != 0) { // Lab code already exists
			messageCode = 2;
		}
		else if (existingCodes.size() == 0 && existingNames.size() == 0) { // country code or name is valid, so save it
			
			try {
				
				Drugs oldDrug = this.findDrug(newDrug.getDrug_id());
				
				newDrug.setCreated_by(oldDrug.getCreated_by());
				newDrug.setDate_created(oldDrug.getDate_created());
				newDrug.setDate_modified(dateModified);
				
				hibernateTemplate.update(newDrug);
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

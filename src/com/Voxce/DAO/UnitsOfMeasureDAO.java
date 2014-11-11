package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.UnitsOfMeasure;
import com.Voxce.model.Users;

public class UnitsOfMeasureDAO {
	
	private HibernateTemplate hibernateTemplate;
	
	List<UnitsOfMeasure> listUoM;
	
//******* GET HIBERNATE SESSION FACTORY 	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//******* GET UoM LIST
	@SuppressWarnings("unchecked")
	public List<UnitsOfMeasure> getUnitsOfMeasureList(Users user) {
		List<UnitsOfMeasure> list=hibernateTemplate.find("from UnitsOfMeasure where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<UnitsOfMeasure>();
		return list;
	}
	
//*** ADD UoM
		public int saveUnitsOfMeasure(UnitsOfMeasure uom, Users user){
			
			int messageCode = -1;
			
			java.util.Date today = new java.util.Date();
			java.sql.Date dateCreated = new java.sql.Date(today.getTime());
			
			List<?> existingCodes = null;
			List<?> existingNames = null;
			
			//Check for existing UnitsOfMeasure code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT code FROM UnitsOfMeasure WHERE subscriber_id="+user.getSubscription_id()+" AND code=?", uom.getCode());
				existingNames = hibernateTemplate.find("SELECT name FROM UnitsOfMeasure WHERE subscriber_id="+user.getSubscription_id()+" AND name like '"+uom.getName()+"'");
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
			
			if(existingNames.size()!=0){	//UnitsOfMeasure already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //UnitsOfMeasure code already exists
				messageCode = 2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //UnitsOfMeasure code or name is valid, so save it
				uom.setSubscriber_id(user.getSubscription_id());
				
				uom.setDate_created(dateCreated);
				
				hibernateTemplate.saveOrUpdate(uom);
				messageCode = 3;
			}		
			else{
				messageCode = 4;
			}
				
			return messageCode;
		}
		
		
//**** FIND THE UoM	
		public UnitsOfMeasure findUoM(int uom_id) {
			UnitsOfMeasure uom = null;
			List<?> findUoM = null;
			try {
				findUoM = hibernateTemplate.find("FROM UnitsOfMeasure WHERE unit_of_measure_id = ?", uom_id);
				uom = (UnitsOfMeasure) findUoM.get(0);
			}
			catch(Exception excp){
				System.out.println("Exception Finding UnitsOfMeasure = "+ excp);
			}
			
			return uom; 
		}
		
	//**** UPDATE THE UoM	
		public int updateUnitsOfMeasure(UnitsOfMeasure newUoM,Users user){
			
			List<?> existingCodes = null;
			List<?> existingNames = null;
			
			int messageCode = -1;
		
			java.util.Date today = new java.util.Date();
			java.sql.Date dateModified = new java.sql.Date(today.getTime());
			
			//Check for existing UnitsOfMeasure code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT code FROM UnitsOfMeasure WHERE subscriber_id= ? AND code = ? AND unit_of_measure_id <> ?",user.getSubscription_id(), newUoM.getCode(), newUoM.getUnit_of_measure_id());
				existingNames = hibernateTemplate.find("SELECT name FROM UnitsOfMeasure WHERE subscriber_id= ? AND name = ? AND unit_of_measure_id <> ?",user.getSubscription_id(), newUoM.getName(), newUoM.getUnit_of_measure_id());
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
		
			if(existingNames.size()!=0){	//UnitsOfMeasure already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //UnitsOfMeasure code already exists
				messageCode = 2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //UnitsOfMeasure code or name is valid, so save it
				
				try{
					UnitsOfMeasure oldUoM = this.findUoM(newUoM.getUnit_of_measure_id());
					
					newUoM.setCreated_by(oldUoM.getCreated_by());
					newUoM.setDate_created(oldUoM.getDate_created());
					newUoM.setDate_modified(dateModified);
					newUoM.setSubscriber_id(user.getSubscription_id());
					System.out.println("Gonna Save");
					hibernateTemplate.update(newUoM);
					hibernateTemplate.flush();
					System.out.println("Saved");
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				messageCode = 3;
			}
			else{
				messageCode = 4;
			}
			
			return messageCode;
		}
		
	
}

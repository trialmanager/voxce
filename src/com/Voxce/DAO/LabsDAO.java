package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Labs;
import com.Voxce.model.Users;

public class LabsDAO {

	private HibernateTemplate hibernateTemplate;
	
	List<Labs> listLabs;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD LAB
	public int saveLab(Labs lab){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing lab code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM Labs WHERE subscriber_id = "+lab.getSubscriber_id()+" AND code=?", lab.getCode());
			existingNames = hibernateTemplate.find("SELECT name FROM Labs WHERE subscriber_id = "+lab.getSubscriber_id()+" AND name=?", lab.getName());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//lab already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //Lab code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //lab code or name is valid, so save it
			
			lab.setDate_created(dateCreated);
			
			hibernateTemplate.saveOrUpdate(lab);
			messageCode = 3;
		}		
		else{
			messageCode = 4;
		}
			
		return messageCode;
	}
	
//****** GET LABS LIST
	@SuppressWarnings("unchecked")
	public List<Labs> getLabsList(Users user) throws Exception{
		List<Labs> list=(List<Labs>) hibernateTemplate.find("from Labs where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Labs>();
		return list;
	}
	
//**** FIND THE LAB	
	public Labs findLab(int lab_id) {
		Labs lab = null;
		List<?> findLab = null;
		try {
			findLab = hibernateTemplate.find("FROM Labs WHERE lab_id = ?", lab_id);
			lab = (Labs) findLab.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Finding Lab = "+ excp);
		}
		
		return lab; 
	}
	
//**** UPDATE THE LAB	
	public int updateLab(Labs newLab){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing country code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM Labs WHERE subscriber_id = "+newLab.getSubscriber_id()+" AND code = ? AND lab_id <> ?", newLab.getCode(), newLab.getLab_id());
			existingNames = hibernateTemplate.find("SELECT name FROM Labs WHERE subscriber_id = "+newLab.getSubscriber_id()+" AND name = ? AND lab_id <> ?", newLab.getName(), newLab.getLab_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//lab already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //Lab code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //lab code or name is valid, so save it
			
			try{
				Labs oldLab = this.findLab(newLab.getLab_id());
				
				newLab.setCreated_by(oldLab.getCreated_by());
				newLab.setDate_created(oldLab.getDate_created());
				newLab.setDate_modified(dateModified);
				
				hibernateTemplate.update(newLab);
				hibernateTemplate.flush();
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

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Resolutions;
import com.Voxce.model.Users;

public class ResolutionsDAO {

private HibernateTemplate hibernateTemplate;
	
	List<Resolutions> listResolutions;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD RESOLUTIONS
	public int saveResolutions(Resolutions resolution){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing country code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM Resolutions WHERE code=?", resolution.getCode());
			existingNames = hibernateTemplate.find("SELECT name FROM Resolutions WHERE name=?", resolution.getName());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//Resolution already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //Resolution code already exists
			messageCode=2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //Resolution code and name is valid, so save it
		
			resolution.setLanguage_id(language);
			resolution.setDate_created(dateCreated);
						
			hibernateTemplate.saveOrUpdate(resolution);
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
			
		return messageCode;
	}
	
//****** GET RESOLUTION LIST
	
	@SuppressWarnings("unchecked")
	public List<Resolutions> getResolutionsList(Users user) throws Exception{
	
		List<Resolutions> list = null;
		try {
			
				list = (List<Resolutions>) hibernateTemplate.find("from Resolutions where subscriber_id="+user.getSubscription_id());
				if(list==null)
					return new ArrayList<Resolutions>();
		} catch (Exception e) {
			System.out.println("list exception:  "+e); 
		} 
		return list;
	}
	
//**** FIND THE RESOLUTION	
	public Resolutions findResolution(int res_id) {

		Resolutions resolution = null;
		List<?> findRes = null;
		try {
			findRes = hibernateTemplate.find("FROM Resolutions WHERE resolution_id = ?", res_id);
			resolution = (Resolutions) findRes.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Categories = "+ excp);
		}
		
		return resolution; 
	}
	
//**** UPDATE THE RESOLUTION	
	public int updateResolution(Resolutions newRes,Users user){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing Resolutions code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM Resolutions WHERE code = ? AND resolution_id <> ?", newRes.getCode(), newRes.getResolution_id());
			existingNames = hibernateTemplate.find("SELECT name FROM Resolutions WHERE name = ? AND resolution_id <> ?", newRes.getName(), newRes.getResolution_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingCodes.size()!=0){ //Resolution code already exists
			messageCode=1;
		}
		else if(existingNames.size()!=0){	//Resolutions already exists , 0 is left for empty message string
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //Resolutions code or name is valid, so save it
			
			try{
				
				Resolutions oldQS = this.findResolution(newRes.getResolution_id());
				
				newRes.setLanguage_id(oldQS.getLanguage_id());
				newRes.setCreated_by(oldQS.getCreated_by());
				newRes.setDate_created(oldQS.getDate_created());
				newRes.setDate_modified(dateModified);
				newRes.setSubscriber_id(user.getSubscription_id());
				hibernateTemplate.update(newRes);
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

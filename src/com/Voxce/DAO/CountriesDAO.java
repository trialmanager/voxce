package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Countries;
import com.Voxce.model.Users;

public class CountriesDAO{

	private HibernateTemplate hibernateTemplate;
	List<?> existingCodes;
	List<?> existingNames;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public void deleteCountry(Countries country) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(country);
	}
	
//ADD COUNTRY	
	public int saveCountry(Countries country) {
		
		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		//Check for existing country code or name
		try{
			
				existingCodes = hibernateTemplate.find("SELECT COUNTRY_CODE FROM Countries WHERE  COUNTRY_CODE=?", country.getCOUNTRY_CODE());
				existingNames = hibernateTemplate.find("SELECT COUNTRY_NAME FROM Countries WHERE  COUNTRY_NAME=?", country.getCOUNTRY_NAME());		
			
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//country already exists
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //countryCode already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //country code or name is valid, so save it
			
			country.setDATE_CREATED(dateCreated);
			
			hibernateTemplate.saveOrUpdate(country);
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}	
		return messageCode;
	}
		

	@SuppressWarnings("unchecked")
	public List<Countries> listCountry() 
	{
		try
		{
			List<Countries> list=(List<Countries>) hibernateTemplate.find("from Countries ORDER BY COUNTRY_NAME ASC");
			if(list==null)
				return new ArrayList<Countries>();
			return list;
						
		}
		catch(Exception e)
		{
			return new ArrayList<Countries>();
		}		
	}	
	
//	@SuppressWarnings("unchecked")
//	public List<Countries> listCountry(Users Currentuser) 
//	{
//		try
//		{
//			List<Countries> list=(List<Countries>) hibernateTemplate.find("from Countries where subscriber_id="+Currentuser.getSubscription_id()+" ORDER BY COUNTRY_NAME ASC");
//			if(list==null)
//				return new ArrayList<Countries>();
//			return list;
//						
//		}
//		catch(Exception e)
//		{
//			return new ArrayList<Countries>();
//		}		
//	}	
	@SuppressWarnings("unchecked")
	public Countries getCountry(int id) {
		try
		{
			
				List<Countries> obj= (List<Countries>) hibernateTemplate.find("from Countries WHERE COUNTRY_ID='"+id+"'");
				return obj.get(0);
			
		}
		catch(Exception e)
		{
			return new Countries();
		}
	}	

//**** FIND THE COUNTRY	
	public Countries findCountry(int country_id) {
		
		Countries country = null;
		List<?> findCountry = null;
		try {
			
				findCountry = hibernateTemplate.find("FROM Countries WHERE COUNTRY_ID = ?", country_id);
				country = (Countries) findCountry.get(0);			
			
			
		}
		catch(Exception excp){
			System.out.println("Exception Finding Country = "+ excp);
		}
		
		return country; 
	}
	
//** UPDATE THE COUNTRY	
	public int updateCountry(Countries newCountry){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing country code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT COUNTRY_CODE FROM Countries WHERE COUNTRY_CODE = ? AND COUNTRY_ID <> ?", newCountry.getCOUNTRY_CODE(), newCountry.getCOUNTRY_ID());
			existingNames = hibernateTemplate.find("SELECT COUNTRY_NAME FROM Countries WHERE COUNTRY_NAME = ? AND COUNTRY_ID <> ?", newCountry.getCOUNTRY_NAME(), newCountry.getCOUNTRY_ID());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//lab already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //countryCode already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //country code or name is valid, so save it
			
			try{
				Countries oldCountry = this.findCountry(newCountry.getCOUNTRY_ID());
				
				newCountry.setCREATED_BY(oldCountry.getCREATED_BY());
				newCountry.setDATE_CREATED(oldCountry.getDATE_CREATED());
				newCountry.setDATE_MODIFIED(dateModified);
				
				hibernateTemplate.update(newCountry);
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
		
	} //END EDIT COUNTRY
	
} //END CLASS

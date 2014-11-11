package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.QueryStatuses;
import com.Voxce.model.Users;


public class QueryStatusesDAO {

private HibernateTemplate hibernateTemplate;
	
	List<QueryStatuses> listQueryStatuses;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD CATEGORY
	public int saveQueryStatus(QueryStatuses queryStatus){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing Query Status code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM QueryStatuses WHERE code=?", queryStatus.getCode());
			existingNames = hibernateTemplate.find("SELECT name FROM QueryStatuses WHERE name=?", queryStatus.getName());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//Query Status already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //QueryStatus code already exists
			messageCode=2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //query status code and name is valid, so save it
		
			queryStatus.setLanguage_id(language);
			queryStatus.setDate_created(dateCreated);
						
			hibernateTemplate.saveOrUpdate(queryStatus);
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
			
		return messageCode;
	}
	
//****** GET QUERY STATUSES LIST
	
	@SuppressWarnings("unchecked")
	public List<QueryStatuses> getQueryStatusesList(Users user) throws Exception{
		
		List<QueryStatuses> list = null;
		try {
			list = (List<QueryStatuses>) hibernateTemplate.find("from QueryStatuses where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<QueryStatuses>();
			return list;
		} catch (Exception e) {
			System.out.println("list exception:  "+e); 
		} 
		return list;
	}
	
//**** FIND THE QUERY STATUS	
	public QueryStatuses findQueryStatus(int qs_id) {

		QueryStatuses queryStatus = null;
		List<?> findQS = null;
		try {
			findQS = hibernateTemplate.find("FROM QueryStatuses WHERE query_status_id = ?", qs_id);
			queryStatus = (QueryStatuses) findQS.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Categories = "+ excp);
		}
		
		return queryStatus; 
	}
	
//**** UPDATE THE QUERY STATUS	
	public int updateQueryStatuses(QueryStatuses newQS, Users user){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing QueryStatuse code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM QueryStatuses WHERE code = ? AND query_status_id <> ?", newQS.getCode(), newQS.getQuery_status_id());
			existingNames = hibernateTemplate.find("SELECT name FROM QueryStatuses WHERE name = ? AND query_status_id <> ?", newQS.getName(), newQS.getQuery_status_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingCodes.size()!=0){ //QueryStatuse code already exists
			messageCode=1;
		}
		else if(existingNames.size()!=0){	//QueryStatuse already exists , 0 is left for empty message string
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //QueryStatuse code or name is valid, so save it
			
			try{
				
				QueryStatuses oldQS = this.findQueryStatus(newQS.getQuery_status_id());
				
				newQS.setLanguage_id(oldQS.getLanguage_id());
				newQS.setCreated_by(oldQS.getCreated_by());
				newQS.setDate_created(oldQS.getDate_created());
				newQS.setDate_modified(dateModified);
				newQS.setSubscriber_id(user.getSubscription_id());
				hibernateTemplate.update(newQS);
				//hibernateTemplate.flush();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			messageCode = 3;
		}
		
		else{
			messageCode = 4;
		}
		
		return messageCode;
	}
}

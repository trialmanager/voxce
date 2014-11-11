package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.QuestionTypes;
import com.Voxce.model.Users;

public class QuestionTypesDAO {

//******* GET HIBERNATE SESSION FACTORY 
	private HibernateTemplate hibernateTemplate;
	
	List<QuestionTypes> listQuestionTypes;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD QUESTION TYPES
	public int saveQuestionTypes(QuestionTypes addQT){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing QuestionTypes code or name
		try {
			existingCodes = hibernateTemplate.find(
					"SELECT code FROM QuestionTypes WHERE code=?",
					addQT.getCode());
			existingNames = hibernateTemplate.find(
					"SELECT name FROM QuestionTypes WHERE name=?",
					addQT.getName());

			if (existingNames.size() != 0) { // QuestionTypes already exists , 0
												// is left for empty message string
				messageCode = 1;
			} else if (existingCodes.size() != 0) { // QuestionTypes code
													// already exists
				messageCode = 2;
			} else if (existingCodes.size() == 0 && existingNames.size() == 0) { // QuestionTypes code or name is valid, so save it

				addQT.setDate_created(dateCreated);

				hibernateTemplate.saveOrUpdate(addQT);
				messageCode = 3;
			} else {
				messageCode = 4;
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		}
			
		return messageCode;
	}
	
//****** GET QUESTION TYPES LIST
	@SuppressWarnings("unchecked")
	public List<QuestionTypes> getQuestionTypesList(Users user) throws Exception{
		List<QuestionTypes> list=(List<QuestionTypes>) hibernateTemplate.find("from QuestionTypes where subscriber_id=?",user.getSubscription_id());
		if(list==null)
			return new ArrayList<QuestionTypes>();
		return list;
	}
	
//**** FIND THE QUESTION TYPE	
	public QuestionTypes findQuestionType(int qt_id) {
		
		QuestionTypes qt = null;
		List<?> findQuestionType = null;
		
		try {
			findQuestionType = hibernateTemplate.find("FROM QuestionTypes WHERE question_type_id = ?", qt_id);
			qt = (QuestionTypes) findQuestionType.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Finding QuestionTypes = "+ excp);
		}
		
		return qt; 
	}
	
//**** UPDATE THE QUESTION TYPE	
	public int updateQuestionTypes(QuestionTypes newQT){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing QuestionTypes code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM QuestionTypes WHERE code = ? AND question_type_id <> ?", newQT.getCode(), newQT.getQuestion_type_id());
			existingNames = hibernateTemplate.find("SELECT name FROM QuestionTypes WHERE name = ? AND question_type_id <> ?", newQT.getName(), newQT.getQuestion_type_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//QuestionTypes already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //QuestionTypes code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //QuestionTypes code or name is valid, so save it
			
			try{
				QuestionTypes oldQT = this.findQuestionType(newQT.getQuestion_type_id());
				
				newQT.setCreated_by(oldQT.getCreated_by());
				newQT.setDate_created(oldQT.getDate_created());
				newQT.setDate_modified(dateModified);
				
				hibernateTemplate.update(newQT);
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

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.AnswerTexts;
import com.Voxce.model.Users;

public class AnswerTextsDAO {
	
	private HibernateTemplate hibernateTemplate;
	
	List<AnswerTexts> listAnswerTexts;
	
//GET HIBERNATE SESSION FACTORY	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD ANSWER TEXT
	public int saveAnswerText(AnswerTexts answerText,Users user){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;
		int answer_type_id = 0;
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing answertext code or name
		try {
				existingCodes = hibernateTemplate.find("SELECT code FROM AnswerTexts WHERE subscriber_id="+user.getSubscription_id()+" AND code=?",answerText.getCode());
				existingNames = hibernateTemplate.find("SELECT name FROM AnswerTexts WHERE subscriber_id="+user.getSubscription_id()+" AND name=?",answerText.getName());

			if (existingNames.size() != 0) { // AnswerText already exists , 0 is
												// left for empty message string
				messageCode = 1;
			} else if (existingCodes.size() != 0) { // AnswerText code already
													// exists
				messageCode = 2;
			} else if (existingCodes.size() == 0 && existingNames.size() == 0) { // AnswerText code or name is valid, so save it
							
				answerText.setLanguage_id(language);
				answerText.setDate_created(dateCreated);
				answerText.setAnswer_type_id(answer_type_id);
				answerText.setSubscriber_id(user.getSubscription_id());
				hibernateTemplate.saveOrUpdate(answerText);
				messageCode = 3;
			} else {
				messageCode = 4;
			}
		}

		catch (Exception exp) {
			exp.printStackTrace();
		}
			
		return messageCode;
	}
	
//****** GET ANSWER TEXTS LIST
	@SuppressWarnings("unchecked")
	public List<AnswerTexts> getAnswerTextsList(int user_sub_id) throws Exception{
		List<AnswerTexts> list=(List<AnswerTexts>) hibernateTemplate.find("from AnswerTexts WHERE subscriber_id="+user_sub_id+"");
		if(list==null)
		{
			return new ArrayList<AnswerTexts>();
		}
		return list;
	}
	
//**** FIND THE ANSWER TEXT
	public AnswerTexts findAnAnswerText(int ans_id) {

		AnswerTexts answerText = null;
		List<?> findAnswerText = null;
		try {
			findAnswerText = hibernateTemplate.find("FROM AnswerTexts WHERE answer_text_id =?", ans_id);
			answerText = (AnswerTexts) findAnswerText.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception AnswerText = "+ excp);
		}
		
		return answerText; 
	}
	
//**** UPDATE THE ANSWER TEXT	
	public int updateAnswerTexts(AnswerTexts newAT){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing answer text code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT code FROM AnswerTexts WHERE subscriber_id = "+newAT.getSubscriber_id()+" AND code = ? AND answer_text_id <> ?", newAT.getCode(), newAT.getAnswer_text_id());
			existingNames = hibernateTemplate.find("SELECT name FROM AnswerTexts WHERE subscriber_id = "+newAT.getSubscriber_id()+" AND name = ? AND answer_text_id <> ?", newAT.getName(), newAT.getAnswer_text_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//AnswerText already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //AnswerText code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //AnswerText code or name is valid, so save it
			
			newAT.setDate_modified(dateModified);
			
			try{	
				AnswerTexts oldText = this.findAnAnswerText(newAT.getAnswer_text_id());
				
				newAT.setLanguage_id(oldText.getLanguage_id());
				newAT.setCreated_by(oldText.getCreated_by());
				newAT.setDate_created(oldText.getDate_created());
				newAT.setAnswer_type_id(oldText.getAnswer_type_id());
				
				hibernateTemplate.update(newAT);
				hibernateTemplate.flush();
				
			}
			catch(Exception e) {
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

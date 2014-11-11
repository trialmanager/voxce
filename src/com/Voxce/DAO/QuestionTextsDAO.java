package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.QuestionTexts;
import com.Voxce.model.Users;

public class QuestionTextsDAO {

	private HibernateTemplate hibernateTemplate;
	
	List<QuestionTexts> listActionTexts;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//*** ADD QUESTION TEXT
		public int saveQuestionText(QuestionTexts questionText){
				
			int messageCode = -1;
			
			java.util.Date today = new java.util.Date();
			java.sql.Date dateCreated = new java.sql.Date(today.getTime());
			int language = 1;
				
			List<?> existingCodes = null;
			List<?> existingNames = null;
				
			//Check for existing questionText code or name
			try{
					existingCodes = hibernateTemplate.find("SELECT code FROM QuestionTexts WHERE code=?", questionText.getCode());
					existingNames = hibernateTemplate.find("SELECT name FROM QuestionTexts WHERE name=?", questionText.getName());
				}
				catch(Exception exp){
					exp.printStackTrace();
				}
				
				if(existingNames.size()!=0){	//QuestionText already exists , 0 is left for empty message string
					messageCode = 1;
				}
				else if(existingCodes.size()!=0){ //QuestionText code already exists
					messageCode=2;
				}
				else if(existingCodes.size()==0 && existingNames.size()==0){ //QuestionText code or name is valid, so save it
				
					questionText.setLanguage_id(language);
					questionText.setDate_created(dateCreated);
								
					hibernateTemplate.saveOrUpdate(questionText);
					messageCode = 3;
				}
				else{
					messageCode = 4;
				}
					
				return messageCode;
			}
			
//****** GET QUESTION TEXTS LIST
		@SuppressWarnings("unchecked")
		public List<QuestionTexts> getQuestionTextsList(Users user) throws Exception{
			List<QuestionTexts> list=(List<QuestionTexts>) hibernateTemplate.find("from QuestionTexts where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<QuestionTexts>();
			return list;
		}
			
//**** FIND THE QUESTION TEXTS
		public QuestionTexts findAQuestionText(int qt_id) {

			QuestionTexts questionText = null;
			List<?> findQuestionText = null;
			try {
				findQuestionText = hibernateTemplate.find("FROM QuestionTexts WHERE question_text_id = ?", qt_id);
				questionText = (QuestionTexts) findQuestionText.get(0);
			}
			catch(Exception excp){
				System.out.println("Exception QuestionText = "+ excp);
			}
				
			return questionText; 
		}
			
//**** UPDATE THE QUESTION TEXT	
		public int updateQuestionText(QuestionTexts newQT){
				
			List<?> existingCodes = null;
			List<?> existingNames = null;
				
			int messageCode = -1;
			
			java.util.Date today = new java.util.Date();
			java.sql.Date dateModified = new java.sql.Date(today.getTime());
				
			//Check for existing question text code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT code FROM QuestionTexts WHERE code = ? AND question_text_id <> ?", newQT.getCode(), newQT.getQuestion_text_id());
				existingNames = hibernateTemplate.find("SELECT name FROM QuestionTexts WHERE name = ? AND question_text_id <> ?", newQT.getName(), newQT.getQuestion_text_id());
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
			
			if(existingNames.size()!=0){	//QuestionText already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //QuestionText code already exists
				messageCode = 2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //QuestionText code or name is valid, so save it
					
				try{	
					QuestionTexts oldText = this.findAQuestionText(newQT.getQuestion_text_id());
						
					newQT.setLanguage_id(oldText.getLanguage_id());
					newQT.setCreated_by(oldText.getCreated_by());
					newQT.setDate_created(oldText.getDate_created());
					newQT.setDate_modified(dateModified);
						
					hibernateTemplate.update(newQT);
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
		
}  //END QuestionTextsDAO CLASS

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.ActionTexts;
import com.Voxce.model.Users;

public class ActionTextsDAO {

		private HibernateTemplate hibernateTemplate;
		
		List<ActionTexts> listActionTexts;
		
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.hibernateTemplate = new HibernateTemplate(sessionFactory);
		}

	//*** ADD ActionText
		public int saveActionText(ActionTexts actionText, Users user){
			
			int messageCode = -1;
			
			java.util.Date today = new java.util.Date();
			java.sql.Date dateCreated = new java.sql.Date(today.getTime());
			int language = 1;
			
			List<?> existingCodes = null;
			List<?> existingNames = null;
			
			//Check for existing actionText code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT CODE FROM ActionTexts WHERE subscriber_id="+user.getSubscription_id()+" AND CODE=?", actionText.getCODE());
				existingNames = hibernateTemplate.find("SELECT NAME FROM ActionTexts WHERE subscriber_id="+user.getSubscription_id()+" AND NAME=?", actionText.getNAME());
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
			
			if(existingNames.size()!=0){	//ActionText already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //ActionText code already exists
				messageCode=2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //ActionText code or name is valid, so save it
			
				actionText.setLANGUAGE_ID(language);
				actionText.setDATE_CREATED(dateCreated);
				actionText.setSubscriber_id(user.getSubscription_id());
							
				hibernateTemplate.saveOrUpdate(actionText);
				messageCode = 3;
			}
			else{
				messageCode = 4;
			}
				
			return messageCode;
		}
		
//****** GET ActionTexts LIST
		@SuppressWarnings("unchecked")
		public List<ActionTexts> getActionTextsList(Users user) throws Exception{
			try{
				if(user.getUser_type().equals("super admin")){
					return (List<ActionTexts>) hibernateTemplate.find("from ActionTexts");
				}else{
					return (List<ActionTexts>) hibernateTemplate.find("from ActionTexts WHERE subscriber_id="+user.getSubscription_id()+"");
				}
			}catch(Exception ex){
				return new ArrayList<ActionTexts>();
			}
		}
		
//**** FIND THE ActionText	
		public ActionTexts findAnActionText(int at_id) {

			ActionTexts actionText = null;
			List<?> findActionText = null;
			try{
					findActionText = hibernateTemplate.find("FROM ActionTexts WHERE ACTION_TEXT_ID = ?", at_id);

				actionText = (ActionTexts) findActionText.get(0);
			}
			catch(Exception excp){
				System.out.println("Exception ActionText = "+ excp);
			}
			
			return actionText; 
		}
		
//**** UPDATE THE ActionText	
		public int updateActionTexts(ActionTexts newAT, Users user){
			
			List<?> existingCodes = null;
			List<?> existingNames = null;
			
			int messageCode = -1;
		
			java.util.Date today = new java.util.Date();
			java.sql.Date dateModified = new java.sql.Date(today.getTime());
			
			//Check for existing action text code or name
			try{
				
					existingCodes = hibernateTemplate.find("SELECT CODE FROM ActionTexts WHERE subscriber_id="+user.getSubscription_id()+" AND CODE = ? AND ACTION_TEXT_ID <> ?", newAT.getCODE(), newAT.getACTION_TEXT_ID());
					existingNames = hibernateTemplate.find("SELECT NAME FROM ActionTexts WHERE subscriber_id="+user.getSubscription_id()+" AND NAME = ? AND ACTION_TEXT_ID <> ?", newAT.getNAME(), newAT.getACTION_TEXT_ID());
				
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
		
			if(existingNames.size()!=0){	//ActionText already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //ActionText code already exists
				messageCode = 2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //ActionText code or name is valid, so save it
				
				newAT.setDATE_MODIFIED(dateModified);
				
				try{	
					ActionTexts oldText = this.findAnActionText(newAT.getACTION_TEXT_ID());
					
					newAT.setLANGUAGE_ID(oldText.getLANGUAGE_ID());
					newAT.setCREATED_BY(oldText.getCREATED_BY());
					newAT.setDATE_CREATED(oldText.getDATE_CREATED());
					newAT.setSubscriber_id(user.getSubscription_id());
					hibernateTemplate.update(newAT);
				//	hibernateTemplate.flush();
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				messageCode = 3;
			}
			else{
				messageCode = 4;
			}
			return messageCode;
		}
} //END ACTION TEXT CLASS
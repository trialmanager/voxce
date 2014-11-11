package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.DiscrepancyTexts;
import com.Voxce.model.Users;

public class DiscrepancyTextsDAO {
	private HibernateTemplate hibernateTemplate;
	
	List<DiscrepancyTexts> listDiscrepancyTexts;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//*** ADD DISCREPANCY TEXT
		public int saveDiscrepancyText(DiscrepancyTexts discrepancyText){
				
			int messageCode = -1;
				
			java.util.Date today = new java.util.Date();
			java.sql.Date dateCreated = new java.sql.Date(today.getTime());
			int language = 1;
				
			List<?> existingCodes = null;
			List<?> existingNames = null;
				
			//Check for existing DiscrepancyText code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT CODE FROM DiscrepancyTexts WHERE CODE=?", discrepancyText.getCODE());					
				existingNames = hibernateTemplate.find("SELECT NAME FROM DiscrepancyTexts WHERE NAME=?", discrepancyText.getNAME());
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
				
			if(existingNames.size()!=0){	//DiscrepancyText already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //DiscrepancyText code already exists
				messageCode=2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //DiscrepancyText code or name is valid, so save it
				
				discrepancyText.setLANGUAGE_ID(language);
				discrepancyText.setDATE_CREATED(dateCreated);
								
				hibernateTemplate.saveOrUpdate(discrepancyText);
				messageCode = 3;
			}
			else{
				messageCode = 4;
			}
					
			return messageCode;
		}
			
//****** GET DISCREPANCY TEXT LIST
		@SuppressWarnings("unchecked")
		public List<DiscrepancyTexts> getDiscrepancyTextsList(Users user) throws Exception{
			List<DiscrepancyTexts> list=(List<DiscrepancyTexts>) hibernateTemplate.find("from DiscrepancyTexts where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<DiscrepancyTexts>();
			return list;
		}
			
//**** FIND THE DISCREPANCY TEXTS	
		public DiscrepancyTexts findADiscrepancyText(int disct_id) {

			DiscrepancyTexts discrepancyText = null;
			List<?> findDiscrepancyText = null;
			try {
				findDiscrepancyText = hibernateTemplate.find("FROM DiscrepancyTexts WHERE DISCREPANCY_TEXT_ID = ?", disct_id);
				discrepancyText = (DiscrepancyTexts) findDiscrepancyText.get(0);
			}
			catch(Exception excp){
				System.out.println("Exception ActionText = "+ excp);
			}
				
			return discrepancyText; 
		}
			
//**** UPDATE THE DISCREPANCY TEXT	
		public int updateDiscrepancyTexts(DiscrepancyTexts newDT, Users user){
				
			List<?> existingCodes = null;
			List<?> existingNames = null;
				
			int messageCode = -1;
			
			java.util.Date today = new java.util.Date();
			java.sql.Date dateModified = new java.sql.Date(today.getTime());
					
			//Check for existing DiscrepancyText code or name
			try{
				existingCodes = hibernateTemplate.find("SELECT CODE FROM DiscrepancyTexts WHERE CODE = ? AND DISCREPANCY_TEXT_ID <> ?", newDT.getCODE(), newDT.getDISCREPANCY_TEXT_ID());
				existingNames = hibernateTemplate.find("SELECT NAME FROM DiscrepancyTexts WHERE NAME = ? AND DISCREPANCY_TEXT_ID <> ?", newDT.getNAME(), newDT.getDISCREPANCY_TEXT_ID());
			}
			catch(Exception exp){
				exp.printStackTrace();
			}
			
			if(existingNames.size()!=0){	//DiscrepancyText already exists , 0 is left for empty message string
				messageCode = 1;
			}
			else if(existingCodes.size()!=0){ //DiscrepancyText code already exists
				messageCode = 2;
			}
			else if(existingCodes.size()==0 && existingNames.size()==0){ //DiscrepancyText code or name is valid, so save it
					
				try{	
					DiscrepancyTexts oldText = this.findADiscrepancyText(newDT.getDISCREPANCY_TEXT_ID());
						
					newDT.setLANGUAGE_ID(oldText.getLANGUAGE_ID());
					newDT.setCREATED_BY(oldText.getCREATED_BY());
					newDT.setDATE_CREATED(oldText.getDATE_CREATED());
					newDT.setDATE_MODIFIED(dateModified);
					newDT.setSubscriber_id(user.getSubscription_id());
					hibernateTemplate.update(newDT);
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

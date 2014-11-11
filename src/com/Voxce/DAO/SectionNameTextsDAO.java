package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.SectionNameTexts;
import com.Voxce.model.Users;


public class SectionNameTextsDAO {

	private HibernateTemplate hibernateTemplate;
	
	List<SectionNameTexts> listSectionNameTexts;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD SECTION_NAME_TEXT
	public int saveSectionNameText(SectionNameTexts sectionNameText){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing SectionNameText code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT snt_code FROM SectionNameTexts WHERE snt_code=?", sectionNameText.getSnt_code());
			existingNames = hibernateTemplate.find("SELECT snt_name FROM SectionNameTexts WHERE snt_name=?", sectionNameText.getSnt_name());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//SectionNameText already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //SectionNameText code already exists
			messageCode=2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //SectionNameText code or name is valid, so save it
		
			sectionNameText.setLanguage_id(language);
			sectionNameText.setDate_created(dateCreated);
			
			hibernateTemplate.saveOrUpdate(sectionNameText);
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
			
		return messageCode;
	}
	
//****** GET SECTION_NAME_TEXT LIST
	@SuppressWarnings("unchecked")
	public List<SectionNameTexts> getSectionNameTextsList(Users user) throws Exception{
		List<SectionNameTexts> list=(List<SectionNameTexts>) hibernateTemplate.find("from SectionNameTexts where subscriber_id=?",user.getSubscription_id());
		if(list==null)
			return new ArrayList<SectionNameTexts>();
		return list;
	}
	
//**** FIND THE SECTION_NAME_TEXT	
	public SectionNameTexts findASectionNameText(int snt_id) {

		SectionNameTexts sectionNameText = null;
		List<?> findSectionNameText = null;
		try {
			findSectionNameText = hibernateTemplate.find("FROM SectionNameTexts WHERE section_name_text_id = ?", snt_id);
			sectionNameText = (SectionNameTexts) findSectionNameText.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception SectionNameText = "+ excp);
		}
		
		return sectionNameText; 
	}
	
//**** UPDATE THE SECTION_NAME_TEXT
	public int updateSectionNameTexts(SectionNameTexts newSNT){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing SectionNameText code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT snt_code FROM SectionNameTexts WHERE snt_code = ? AND section_name_text_id <> ?", newSNT.getSnt_code(), newSNT.getSection_name_text_id());
			existingNames = hibernateTemplate.find("SELECT snt_name FROM SectionNameTexts WHERE snt_name = ? AND section_name_text_id <> ?", newSNT.getSnt_name(), newSNT.getSection_name_text_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//SectionNameText already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //SectionNameText code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //SectionNameText code or name is valid, so save it
						
			try{	
				SectionNameTexts oldText = this.findASectionNameText(newSNT.getSection_name_text_id());
				
				newSNT.setLanguage_id(oldText.getLanguage_id());
				newSNT.setCreated_by(oldText.getCreated_by());
				newSNT.setDate_created(oldText.getDate_created());
				newSNT.setDate_modified(dateModified);
			
				hibernateTemplate.update(newSNT);
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

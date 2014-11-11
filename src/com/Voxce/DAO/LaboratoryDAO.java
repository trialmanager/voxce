package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Laboratory;
import com.Voxce.model.Users;

public class LaboratoryDAO {

	private HibernateTemplate hibernateTemplate;
	List<Laboratory> listUoM;
	
//******* GET HIBERNATE SESSION FACTORY 	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
		
//******* GET LABORATORY LIST
	@SuppressWarnings("unchecked")
	public List<Laboratory> getLaboratoryList(Users user) {
		List<Laboratory> list=hibernateTemplate.find("from Laboratory where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Laboratory>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Laboratory> LaborotoriesOfStudyList(int studyid) {		
		List<Laboratory> list=(List<Laboratory>) hibernateTemplate.find("SELECT lab FROM Laboratory lab WHERE lab.labratory_id IN(SELECT ssl.lab_id FROM StudySiteLabroratories ssl WHERE ssl.study_site_id IN (SELECT ss.study_site_id FROM StudySites ss WHERE ss.study_id='"+studyid+"' ) )");
		if(list==null)
			return new ArrayList<Laboratory>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Laboratory> LaborotoriesOfStudySiteList(int studyid,int siteid) {		
		List<Laboratory> list=(List<Laboratory>) hibernateTemplate.find("SELECT lab FROM Laboratory lab WHERE lab.labratory_id IN(SELECT ssl.lab_id FROM StudySiteLabroratories ssl WHERE ssl.study_site_id IN (SELECT ss.study_site_id FROM StudySites ss WHERE ss.study_id='"+studyid+"' AND ss.site_id='"+siteid+"' ) )");
		if(list==null)
			return new ArrayList<Laboratory>();
		return list;
	}
	
	
//******* ADD LABORATORY
	public int saveLaboratory(Laboratory lab){
			
		int messageCode = -1;
			
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		
		List<?> existingNames = null;
			
		//Check for existing laboratory name
		try{
			existingNames = hibernateTemplate.find("SELECT lab_name FROM Laboratory WHERE subscriber_id = "+lab.getSubscriber_id()+" AND lab_name=?", lab.getLab_name());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
			
		if(existingNames.size()!=0){	//laboratory already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingNames.size()==0){ //laboratory code or name is valid, so save it
				
			lab.setDate_created(dateCreated);
			
			hibernateTemplate.saveOrUpdate(lab);
			messageCode = 3;
		}		
		else{
			messageCode = 4;
		}
				
		return messageCode;
	}
	
	
//**** FIND THE LAB	
	public Laboratory findLaboratory(int lab_id) {
		Laboratory lab = null;
		List<?> findLab = null;
		try {
			findLab = hibernateTemplate.find("FROM Laboratory WHERE labratory_id = ?", lab_id);
			lab = (Laboratory) findLab.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Finding Lab = "+ excp);
		}
			
		return lab; 
	}
//**** UPDATE THE LABORATORY		
	public int updateLaboratory(Laboratory newLab){
		
		List<?> existingNames = null;
			
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
			
		//Check for existing laboratory name
		try{
			existingNames = hibernateTemplate.find("SELECT lab_name FROM Laboratory WHERE lab_name = ? AND labratory_id <> ?", newLab.getLab_name(), newLab.getLabratory_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//laboratory already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingNames.size()==0){ //lab code or name is valid, so save it
				
			try{
				Laboratory oldLab = this.findLaboratory(newLab.getLabratory_id());
					
				newLab.setCreated_by(oldLab.getCreated_by());
				newLab.setDate_created(oldLab.getDate_created());
				newLab.setDate_modified(dateModified);
				
				hibernateTemplate.update(newLab);
				//hibernateTemplate.flush();
			}
			catch(Exception e){
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

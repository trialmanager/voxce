package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Discrepancy_on_crf;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Patients;
import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;
import com.Voxce.model.studies;
import com.Voxce.model.subStudies;


public class StudiesDAO {

	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	
	
	public int DeleteStudySiteUser(int studyid,int userid)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM Study_Site_Users WHERE study_id='"+studyid+"' AND user_id='"+userid+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int SaveSubStudy(subStudies substudy) {
		try
		{
			hibernateTemplate.saveOrUpdate(substudy);					
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}// End Save or update
	
	public int EditStudy(studies study) {
		try
		{
			hibernateTemplate.bulkUpdate("Update studies SET study_name='"+study.getStudy_name()+"' , client_name='"+study.getClient_name()+"' , study_text='"+study.getStudy_text()+"' , welcome_template='"+study.getWelcome_template()+"' WHERE  study_id = ?",study.getStudy_id());
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}// End Save or update
	
	@SuppressWarnings("unchecked")
	public int SaveStudy(studies study ,ProtocolVersion pobj) {
		try
		{
			hibernateTemplate.saveOrUpdate(study);
			List<studies> li=hibernateTemplate.find("FROM studies WHERE client_name='"+study.getClient_name()+"' AND study_name='"+study.getStudy_name()+"' AND created_by='"+study.getCreated_by()+"' AND code='"+study.getCode()+"' AND date_created='"+study.getDate_created()+"'");
			if(li.size() != 0)
			{
				int studyid=li.get(0).getStudy_id();
				pobj.setStudy_id(studyid);
				hibernateTemplate.saveOrUpdate(pobj);
				return 1;
			}
			return 0;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}// End Save or update
	
	
	
	@SuppressWarnings("unchecked")
	public List<PatientVisits> getPatientVisitList(Users user) {		
		return (List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits where subscriber_id=?",user.getSubscription_id());
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<studies> getStudyDetail(int id) {		
		return (List<studies>) hibernateTemplate.find("FROM studies WHERE study_id='"+id+"'");
	}
	
	@SuppressWarnings("unchecked")
	public List<studies> getStudyDetail(String studyname, int subid ){
		List<studies> list = new ArrayList<studies>();
		try{
		//	System.out.println("**************"+studyname+" "+list.size()+"********************");
			return list=(List<studies>) hibernateTemplate.find("FROM studies WHERE subscriber_id="+subid+" AND study_name like '%"+studyname.trim()+"%'");
			
		}catch(Exception exception){
			return list;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<studies> StudiesList(Users user) {		
		try{
			List<studies> list = new ArrayList<studies>();
			  list = (List<studies>) hibernateTemplate.find("from studies where subscriber_id="+user.getSubscription_id()+" ORDER BY study_name ASC");
			 
			return  list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<studies>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<subStudies> subStudiesList(Users user) {		
		return (List<subStudies>) hibernateTemplate.find("from subStudies where subscriber_id=? ",user.getSubscription_id());
	}
	
	@SuppressWarnings("unchecked")
	public List<Discrepancy_on_crf> discrepancyinStudies(int studyID) {		
		return (List<Discrepancy_on_crf>) hibernateTemplate.find("from Discrepancy_on_crf WHERE study_id='"+studyID+"'");
	}
	@SuppressWarnings("unchecked")
	public List<PatientCRF> pCrfsList(Users user) {		
		return (List<PatientCRF>) hibernateTemplate.find("from PatientCRF where subscriber_id=?",user.getSubscription_id());
	}
	@SuppressWarnings("unchecked")
	public List<CaseReportForms> CrfsList(Users user) {		
		return (List<CaseReportForms>) hibernateTemplate.find("from CaseReportForms where subscriber_id=?",user.getSubscription_id());
	}
	@SuppressWarnings("unchecked")
	public List<Users> studyUser(Users user) {		
		return (List<Users>) hibernateTemplate.find("from Users where subscriber_id=?",user.getSubscription_id());
	}
	@SuppressWarnings("unchecked")
	public List<Patients> getPatients(Users user) {		
		return (List<Patients>) hibernateTemplate.find("FROM Patients where subscriber_id=?",user.getSubscription_id());
	}
	@SuppressWarnings("unchecked")
	public List<Visits> getVisits(Users user) {		
		return (List<Visits>) hibernateTemplate.find("FROM Visits where subscriber_id=?",user.getSubscription_id());
	}
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> getvisitText(Users user) {		
		return (List<VisitNameTexts>) hibernateTemplate.find("FROM VisitNameTexts where subscriber_id=?",user.getSubscription_id());
	}

}// End Class



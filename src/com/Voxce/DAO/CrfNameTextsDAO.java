package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.CaseReportForms;
import com.Voxce.model.CrfNameTexts;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;


public class CrfNameTextsDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public List<CrfNameTexts> listcrfnames(Users user) {	
		List<CrfNameTexts> list=(List<CrfNameTexts>) hibernateTemplate.find("FROM CaseReportForms where subscriber_id=? ORDER BY crf_name ASC",user.getSubscription_id());
		if(list==null)
			return new ArrayList<CrfNameTexts>();
		return list;
	}
	
	 @SuppressWarnings("unchecked")
	 public List<CaseReportForms> listcrf(Users user) { 
		 List<CaseReportForms> list=(List<CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms where subscriber_id=?",user.getSubscription_id());
		 if(list==null)
			 return new ArrayList<CaseReportForms>();
		 return list;
	 }
	 
	 @SuppressWarnings("unchecked")
	 public List<PatientCRF> listPatientcrf(Users user) { 
		 List<PatientCRF> list=(List<PatientCRF>) hibernateTemplate.find("FROM PatientCRF where subscriber_id=?",user.getSubscription_id());
		 if(list==null)
			 return new ArrayList<PatientCRF>();
		 return list;
	 }
	 

		@SuppressWarnings("unchecked")
		public List<CaseReportForms> listVisitcrfnames(Users user,int VisitID) {
			try{
			
				List<VisitCrfs> list=(List<VisitCrfs>) hibernateTemplate.find("FROM VisitCrfs where visit_id='"+VisitID+"' AND subscriber_id='"+user.getSubscription_id()+"'");
				if(list !=null){
					List<CaseReportForms> li=new ArrayList<CaseReportForms>();				
					for(int i=0;i<list.size();i++){
						CaseReportForms obj= (CaseReportForms) hibernateTemplate.find("FROM CaseReportForms where crf_id='"+list.get(i).getCase_report_form_id()+"' AND subscriber_id='"+user.getSubscription_id()+"'").get(0);
						li.add(obj);
					}
					if(li.size()!=0){						
						return li;
					}else{
						return new ArrayList<CaseReportForms>();
					}
				}
				else{
					return new ArrayList<CaseReportForms>();
				}
			}catch(Exception e){
				e.printStackTrace();
				return new ArrayList<CaseReportForms>();
			}
		  
		}
}

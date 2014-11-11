package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.CaseReportForms;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;


public class PatientVisitDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	 public List<PatientVisits> listpatientvisits(Users user) {
		List<PatientVisits> list=(List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits WHERE subscriber_id='"+user.getSubscription_id()+"'");
		if(list==null)
			return new ArrayList<PatientVisits>();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Visits> listvisits(int study_id) {	

		try{
			List<Visits> list=(List<Visits>) hibernateTemplate.find("FROM Visits WHERE study_id='"+study_id+"'");
			if(list==null)
				return new ArrayList<Visits>();
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return null;
		}
		
	}
	public int getPatientId(int p_no){
		try{
			System.out.println("id hey:  ");
			data = hibernateTemplate.find("SELECT patient_id FROM Patients WHERE patient_number ='"+p_no+"'");
			System.out.println("id hey:  " + data.toString());
			String[] temp;
			String res = data.toString();
			String del = "]";
			temp = res.split(del);
			res = temp[0];
			res = res.substring(1);
			temp = res.split(",");
			return  Integer.parseInt(temp[0]);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return 0;
		}
		
		
	}
	public int deleteVisits(List<Integer> notExisit){
		try{
			for(int i = 0 ; i < notExisit.size() ; i ++ ){
				hibernateTemplate.bulkUpdate("DELETE FROM PatientVisits WHERE visit_id='"+notExisit.get(i)+"'");
			}
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int deleteAll(int patientId){
		try{
			
				hibernateTemplate.bulkUpdate("DELETE FROM PatientVisits WHERE patient_id='"+patientId+"'");
		
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public String getVisitDate(int visit_id){
		try{
			data = hibernateTemplate.find("SELECT visit_date FROM Visits WHERE visit_id ='"+visit_id+"'");
			String[] temp;
			String res = data.toString();
			String del = "]";
			temp = res.split(del);
			res = temp[0];
			res = res.substring(1);
			return res;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return null;
		}
		
		
	}
	public String[] getvisit_id(int visit_name_id){
		try{
			data = hibernateTemplate.find("SELECT visit_id FROM Visits WHERE visit_name_text_id ='"+visit_name_id+"'");
			String[] temp;
			String res = data.toString();
			String del = "]";
			temp = res.split(del);
			res = temp[0];
			res = res.substring(1);
			temp = res.split(",");
			return temp;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return null;
		}
		
		
	}
	
	public int assignVisit(PatientVisits patientvisit)
	{

		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		patientvisit.setDate_created(oneDate);
	//	patientvisit.setDate_modified(oneDate);
		
		try{
			hibernateTemplate.saveOrUpdate(patientvisit);
			List<VisitCrfs> visitCrf = (List <VisitCrfs>) hibernateTemplate.find("FROM VisitCrfs WHERE visit_id='"+patientvisit.getVisit_id()+"'");
			for(int i = 0 ; i < visitCrf.size() ; i++){
				List<CaseReportForms> Crf = (List <CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+visitCrf.get(i).getCase_report_form_id()+"'");
				for(int k = 0 ; k < Crf.size() ; k++){
					PatientCRF patientCrf = new PatientCRF();
					patientCrf.setCrf_html(Crf.get(k).getCrf_html());
					patientCrf.setCrf_id(Crf.get(k).getCrf_id());
					patientCrf.setCrf_status("Unfilled");
					patientCrf.setPatient_id(patientvisit.getPatient_id());
					patientCrf.setVisit_id(patientvisit.getVisit_id());
					hibernateTemplate.saveOrUpdate(patientCrf);
				}
			}
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public boolean findPatientVisitByIds(int patientId, int visitId){
		List<PatientVisits> patVisLis  = (List <PatientVisits>) hibernateTemplate.find("FROM PatientVisits WHERE patient_id='"+patientId+"' AND visit_id='"+visitId+"'");
		if(patVisLis.size()>0){
			return true;
		}else{
			return false;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> listvisitsname(Users user) {	
		try{
			List<VisitNameTexts> list=(List<VisitNameTexts>) hibernateTemplate.find("FROM VisitNameTexts WHERE subscriber_id = "+user.getSubscription_id()+" ORDER BY visit_name ASC");
			if(list==null)
				return new ArrayList<VisitNameTexts>();
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return null;
		}
		
	}
}

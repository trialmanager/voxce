package com.Voxce.DAO;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.CaseReportForms;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Patients;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;

public class VisitsDAO {
	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int updateVisitNameText(int id,String name)
	{
		
		return 0;
	}
	
	public List<Visits> getPrimaryVisit(Visits visit)
	{
		List<Visits> lists=new ArrayList<Visits>();
		
		lists= hibernateTemplate.find("FROM Visits Where study_id="+visit.getStudy_id()+" AND is_primary=1");
		return lists;
	}
	public int getPrimaryVisitId(int study_id, int key)
	{
		@SuppressWarnings("unchecked")
		ArrayList <Visits> vlist=(ArrayList<Visits>) hibernateTemplate.find("FROM Visits Where study_id="+study_id+" AND is_primary="+key);
		if(vlist==null || vlist.size()==0)
			return 1;
		if(vlist.size()>0)
			return vlist.get(0).getVisit_id();

		return 0;
	}
	public int updatePrimaryVisit(Visits visit, int option) throws Exception{
		if(option==0){
			ArrayList <Visits> visits=new ArrayList<Visits>();
			visits=(ArrayList<Visits>)hibernateTemplate.find("FROM Visits WHERE study_id ="+visit.getStudy_id()+" AND (is_primary = 1 OR is_primary =2)");
			for(int i=0;i<visits.size();i++){
				visits.get(i).setIs_primary(0);
				hibernateTemplate.update(visits.get(i));
			}
		}else if(option==1){
			ArrayList <Visits> visits=new ArrayList<Visits>();
			//visits=(ArrayList<Visits>)hibernateTemplate.find("FROM Visits WHERE study_id ="+visit.getStudy_id());
			
			while(true){
				
				visits=(ArrayList<Visits>)hibernateTemplate.find("FROM Visits WHERE study_id ="+visit.getStudy_id()+" AND related_visit_id="+visit.getVisit_id());
			//	System.out.println("\n\n\n\n**************"+visit.getStudy_id()+"*********"+visit.getVisit_id());
				if(visits.size()==1){
					visits.get(0).setIs_primary(2);
					visit=visits.get(0);
					hibernateTemplate.update(visit);
					//System.out.println("************visits update *******\n");
				}else{
					break;
				}
			}
		}
		
		return 0;
	}
	
	
	public int SaveVisit(Visits visit, Users user){
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{	
			Integer visit_id = visit.getVisit_id();
			if(visit_id != null){
				
				list =hibernateTemplate.find("FROM Visits WHERE visit_id='"+visit_id+"'");
				if(list.size() == 1){
					Visits exVisit = (Visits)list.get(0);
					exVisit.setDate_modified(date);
					exVisit.setIs_adverse(visit.getIs_adverse());
					exVisit.setIs_mandatory(visit.getIs_mandatory());
					exVisit.setModified_by(visit.getModified_by());
					exVisit.setIs_monitor(visit.getIs_monitor());
					exVisit.setWindow_close(visit.getWindow_close());
					exVisit.setWindow_open(visit.getWindow_open());
					exVisit.setIs_scheduled(visit.getIs_scheduled());
					exVisit.setDescription(visit.getDescription());
					exVisit.setVisit_name_text_id(visit.getVisit_name_text_id());
					exVisit.setStudy_id(visit.getStudy_id());
					exVisit.setIs_primary(visit.getIs_primary());
					exVisit.setRelated_visit_id(visit.getRelated_visit_id());
					exVisit.setVisit_optimum(visit.getVisit_optimum());
					exVisit.setWindow_close(visit.getWindow_close());
					exVisit.setWindow_open(visit.getWindow_open());
					exVisit.setSubscriber_id(user.getSubscription_id());
					hibernateTemplate.saveOrUpdate(exVisit);
				}
 			}else{
 				hibernateTemplate.saveOrUpdate(visit);
 			}
			
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	@SuppressWarnings("unchecked")
	
	public int assignToPAtients(int studyId, int userId){
		try{
			List<Integer> lins = hibernateTemplate.find("SELECT visit_id  FROM Visits ORDER BY visit_id DESC LIMIT 1");
			List<Patients> patientsList = hibernateTemplate.find("FROM Patients WHERE study_id='"+studyId+"'");
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date( cal.getTime().getTime() );
			for(int i= 0 ; i < patientsList.size() ; i++){
				PatientVisits pVist = new PatientVisits();
				pVist.setDate_created(date);
				pVist.setCreated_by(userId);
				//pVist.setDate_modified(date);
				pVist.setModified_by(userId);
				pVist.setPatient_id(patientsList.get(i).getPatient_id());
				pVist.setVisit_id(lins.get(0));
				pVist.setVisit_status("No CRF Attached");
				SimpleDateFormat ts= new SimpleDateFormat("MM/dd/yyyy");
				Date date1  = new java.sql.Date(ts.parse("08/08/1888").getTime());
				pVist.setVisit_date(date1);
				hibernateTemplate.saveOrUpdate(pVist);
			}
		return 1 ;
		}catch(Exception e){
			e.printStackTrace();
			return 0 ;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public int SaveCrfVisits(int visitID,Users CurrentUser,List<Integer> crfs)
	{		
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{
			List<VisitCrfs> listOFvisitCrf = hibernateTemplate.find("FROM VisitCrfs WHERE visit_id='"+visitID+"'");
			hibernateTemplate.bulkUpdate("DELETE FROM VisitCrfs WHERE visit_id='"+visitID+"'");
			for(int i=0;i<crfs.size();i++)
			{
					VisitCrfs obj=new VisitCrfs();
					obj.setCase_report_form_id(crfs.get(i));
					obj.setVisit_id(visitID);
					//hibernateTemplate.find("FROM PatientCRF WHERE visit_id='"+visitID+"'");
					obj.setCreated_by(CurrentUser.getUser_id());
					obj.setDate_created(date);
					obj.setModified_date(date);
					obj.setIs_mandatory("T");
					obj.setIs_repeating("F");
					obj.setSubscriber_id(CurrentUser.getSubscription_id());
					hibernateTemplate.save(obj);					
			}
			
			List<VisitCrfs> lis = hibernateTemplate.find("FROM VisitCrfs WHERE visit_id='"+visitID+"'");
			List<PatientVisits> lispp = hibernateTemplate.find("FROM PatientVisits WHERE visit_id='"+visitID+"'");
			for(int i = 0 ; i < lis.size();i++){
				for(int j = 0 ; j < lispp.size();j++){
					if(lispp.get(j).getVisit_id() == lis.get(i).getVisit_id()){
						boolean bool = false;
						for(int k = 0 ; k < listOFvisitCrf.size() ; k ++ ){
							if(lis.get(i).getVisit_id() == listOFvisitCrf.get(k).getVisit_id() && lis.get(i).getCase_report_form_id() == listOFvisitCrf.get(k).getCase_report_form_id() ){
								bool = true;
							}
						}
						if(bool){
							continue;
						}
						List<CaseReportForms> lisVisitCrfs = hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+lis.get(i).getCase_report_form_id()+"'");
						PatientCRF pa = new PatientCRF();
						pa.setCrf_html(lisVisitCrfs.get(0).getCrf_html());
						pa.setPatient_id(lispp.get(j).getPatient_id());
						pa.setCrf_status("Unfilled");
						pa.setCrf_id(lis.get(i).getCase_report_form_id());
						pa.setCrf_name(lisVisitCrfs.get(0).getCrf_name());
						pa.setVisit_id(lispp.get(j).getVisit_id());
						pa.setSubscriber_id(CurrentUser.getSubscription_id());
						pa.setFilld_by(0);
						if(lispp.get(j).getVisit_status()!="No CRF Attached"){
							lispp.get(j).setVisit_status("Incomplete");
						}else{
							lispp.get(j).setVisit_status("Not Started");
						}
						hibernateTemplate.saveOrUpdate(lispp.get(j));
						SimpleDateFormat ts= new SimpleDateFormat("MM/dd/yyyy");
						Date date1  = new java.sql.Date(ts.parse("08/08/1888").getTime());
						pa.setFilled_date(date1);
						hibernateTemplate.saveOrUpdate(pa);
					}
				}
			}
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public Integer saveVisitText(VisitNameTexts visitNameTexts){
		try{
			hibernateTemplate.saveOrUpdate(visitNameTexts);
			int value = -1;
			
			List<Integer> lins = hibernateTemplate.find("SELECT visit_name_text_id  FROM VisitNameTexts ORDER BY visit_name_text_id DESC LIMIT 1");
			if(lins.size()>0){
				value=lins.get(0);
			}
			return value;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
	}
	public Visits findVisitById(Integer visitId){
		try{
			List<Visits> foundVisit = hibernateTemplate.find("from Visits WHERE visit_id='"+visitId+"'");
			if(foundVisit.size() == 1){
				return foundVisit.get(0);
			}
			
			return null;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public int delete(int visitId){
		try{
			List<?> pVList = hibernateTemplate.find("FROM PatientVisits WHERE visit_id='"+visitId+"'");
			if(pVList.size()>0){
				return 0;
			}
			hibernateTemplate.bulkUpdate("DELETE FROM Visits WHERE visit_id='"+visitId+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<VisitCrfs> assignCrfs(Integer visit_id){
		try{
			List<VisitCrfs> list=hibernateTemplate.find("from VisitCrfs WHERE visit_id='"+visit_id+"'");
			if(list==null)
				return new ArrayList<VisitCrfs>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<VisitCrfs>();
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<Visits> findAll(Users user){
		try{
			List<Visits> list= (List<Visits>) hibernateTemplate.find("from Visits where subscriber_id="+user.getSubscription_id());
			if(list==null)
				return new ArrayList<Visits>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Visits>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public int checkVisitNameText(String vnt,int sid)
	{
		List<VisitNameTexts> list=(List<VisitNameTexts>) hibernateTemplate.find("FROM Visits where study_id="+sid+" and visit_name_text_id in (select visit_name_text_id from VisitNameTexts where visit_name='"+vnt+"')");
		if(list.size()<1)
		{
			return 0;
		}
		return 1;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<VisitCrfs> findVisitCrfs(Users user){
		try{
			List<VisitCrfs> list=hibernateTemplate.find("from VisitCrfs where subscriber_id="+user.getSubscription_id());
			if(list==null)
				return new ArrayList<VisitCrfs>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<VisitCrfs>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> VisitNameTextsList(Users user){
		try{
			List<VisitNameTexts> list= (List<VisitNameTexts>) hibernateTemplate.find("from VisitNameTexts where subscriber_id="+user.getSubscription_id()+" ORDER BY visit_name ASC");
			if(list==null)
				return new ArrayList<VisitNameTexts>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<VisitNameTexts>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> VisitNameTextsList(Users user,int visitnameText){
		try{
			List<VisitNameTexts> list= (List<VisitNameTexts>) hibernateTemplate.find("from VisitNameTexts where subscriber_id="+user.getSubscription_id()+" and visit_name_text_id="+visitnameText+" ORDER BY visit_name ASC");
			if(list==null)
				return new ArrayList<VisitNameTexts>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<VisitNameTexts>();
		}
	}
	
	@SuppressWarnings("unchecked")
	 public List<Visits> listvisits(Users user) {
		try{
			List<Visits> list=(List<Visits>) hibernateTemplate.find("FROM Visits where subscriber_id="+user.getSubscription_id());
			if(list==null)
				return new ArrayList<Visits>();
			return list;
		}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		return new ArrayList<Visits>();
		}
	}
	
	@SuppressWarnings("unchecked")
	 public List<Visits> listvisits(int study_id) {
		try{
			List<Visits> list=(List<Visits>) hibernateTemplate.find("FROM Visits WHERE study_id='"+study_id+"'");
			if(list==null)
				return new ArrayList<Visits>();
			return list;
		}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		return new ArrayList<Visits>();
		}
	}
	
}

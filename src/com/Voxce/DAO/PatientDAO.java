package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.AuditTrail;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.CrfPatientData;
import com.Voxce.model.Discrepancy_on_crf;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientPayment;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Patients;
import com.Voxce.model.PaymentSchedule;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;


public class PatientDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	public void Trigger_CRF_Schedule(int studyID, int SiteID,int patientCrfId, String status,int user, Integer patient_visit_id){
		try{
			PatientCRF patientcrf= (PatientCRF) hibernateTemplate.find("FROM PatientCRF WHERE patient_crf_id='"+patientCrfId+"'").get(0);
			if(patientcrf == null)return;
			List<PaymentSchedule> schedule =new ArrayList<PaymentSchedule>();
			schedule.addAll((List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+studyID+"' AND site='"+SiteID+"' AND visit='"+patientcrf.getVisit_id()+"' AND crf='"+patientcrf.getCrf_id()+"'"));
			if(schedule.size()==0)
				schedule.addAll((List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+studyID+"' AND site IS NULL AND visit='"+patientcrf.getVisit_id()+"' AND crf='"+patientcrf.getCrf_id()+"'"));
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			for(int i=0;i<schedule.size();i++){
				PatientPayment obj=new PatientPayment();
				obj.setPayment_code_id(schedule.get(i).getPayment_type());
				obj.setPatient_id(patientcrf.getPatient_id());
				if(schedule.get(i).getSite() != null)
					obj.setSite_id(schedule.get(i).getSite());
				obj.setStudy_id(schedule.get(i).getStudy());
				obj.setVisit_id(schedule.get(i).getVisit());
				obj.setCrf_id(schedule.get(i).getCrf());
				obj.setPayment_amount(schedule.get(i).getAmount());
				obj.setPayment_status("Sent");
				obj.setTotal_payment(schedule.get(i).getAmount());
				obj.setDate_created(oneDate);
				obj.setDate_modified(oneDate);
				obj.setCreated_by(user);
				obj.setModified_by(user);	
				hibernateTemplate.save(obj);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void Trigger_Visit_Schedule(int studyID, int SiteID,int patientCrfId, String status,int user, Integer visit_id){
		try{
			PatientCRF patientcrf= (PatientCRF) hibernateTemplate.find("FROM PatientCRF WHERE patient_crf_id='"+patientCrfId+"'").get(0);
			if(patientcrf == null)return;
			List<PaymentSchedule> schedule =new ArrayList<PaymentSchedule>();

			schedule.addAll((List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+studyID+"' AND site='"+SiteID+"' AND visit='"+visit_id+"' AND crf IS NULL"));
			if(schedule.size()==0)
				schedule.addAll((List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+studyID+"' AND site IS NULL AND visit='"+visit_id+"' AND crf IS NULL"));

			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			for(int i=0;i<schedule.size();i++){
				PatientPayment obj=new PatientPayment();
				obj.setPayment_code_id(schedule.get(i).getPayment_type());
				obj.setPatient_id(patientcrf.getPatient_id());
				if(schedule.get(i).getSite() != null)
					obj.setSite_id(schedule.get(i).getSite());
				obj.setStudy_id(schedule.get(i).getStudy());
				obj.setVisit_id(schedule.get(i).getVisit());
				obj.setPayment_amount(schedule.get(i).getAmount());
				obj.setPayment_status("Sent");
				obj.setTotal_payment(schedule.get(i).getAmount());
				obj.setDate_created(oneDate);
				obj.setDate_modified(oneDate);
				obj.setCreated_by(user);
				obj.setModified_by(user);	
				hibernateTemplate.save(obj);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public int savePatientCrf(int studyID, int SiteID,int patientCrfId, String html, String status,int user, Integer patient_visit_id) {

		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );

		try{
			List<PatientCRF> lisPatentCrfs = hibernateTemplate.find("FROM PatientCRF where patient_crf_id='"+patientCrfId+"'");
			if(lisPatentCrfs.size()== 1){
				PatientCRF pCrf = lisPatentCrfs.get(0);
				int patient_id = lisPatentCrfs.get(0).getPatient_id();
				html = html.replace("'", "&lsquo;");
				pCrf.setCrf_html(html);
				pCrf.setFilled_date(oneDate);
				pCrf.setFilld_by(user);
				if(status.equals("true")){
					pCrf.setCrf_status("Filled");
					Trigger_CRF_Schedule(studyID,SiteID,patientCrfId,status,user,patient_visit_id);
				}else if(status.equals("false")){
					pCrf.setCrf_status("Unfilled");
				}else if(status.equals("discrepancy")){
					pCrf.setCrf_status("Discrepancy");
				}
				hibernateTemplate.saveOrUpdate(pCrf);
				//		 List<PaymentSchedule> paymentSchedualList=hibernateTemplate.find("FROM paymentSchedualList WHERE crf="+pCrf.getCrf_name());


				int visit = pCrf.getVisit_id();

				List<PatientCRF> vistsBasedList = hibernateTemplate.find("FROM PatientCRF where visit_id='"+visit+"' AND patient_id='"+patient_id+"'");
				int discrepancy = 0 ;
				int unfilled = 0;
				int filled = 0;
				for(int i = 0 ; i < vistsBasedList.size() ; i++){

					if(vistsBasedList.get(i).getCrf_status().equals("Discrepancy")){
						discrepancy++;
					}else if(vistsBasedList.get(i).getCrf_status().equals("Unfilled")){
						unfilled++;
					}else if(vistsBasedList.get(i).getCrf_status().equals("Filled")){
						filled++;
					}
				} 
				String visit_status;
				if(filled == vistsBasedList.size()){
					visit_status = "Completed";
					Trigger_Visit_Schedule(studyID,SiteID,patientCrfId,status,user,visit);
				}else if(discrepancy > 0){
					visit_status = "Discrepancy";
				}else{
					visit_status = "Incomplete";
				}
				List<PatientVisits> visitObj = hibernateTemplate.find("FROM PatientVisits where patient_visit_id='"+patient_visit_id+"'");
				if(visitObj.size() == 1){
					PatientVisits pvisit = visitObj.get(0);
					pvisit.setVisit_status(visit_status);

					hibernateTemplate.saveOrUpdate(pvisit);
				}

			}
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	public int updateOptimumDate(PatientVisits patientVisit){
		try{
			List<PatientVisits> patient= hibernateTemplate.find("From PatientVisits where patient_visit_id="+patientVisit.getPatient_visit_id());
			if(patient!=null && patient.size()==1){
				patient.get(0).setexpected_date(patientVisit.getexpected_date());
				patient.get(0).setOptimum_days(patientVisit.getOptimum_days());
				patient.get(0).setStart_date_for_visit(patientVisit.getStart_date_for_visit());
				patient.get(0).setLast_date_for_visit(patientVisit.getLast_date_for_visit());
				hibernateTemplate.saveOrUpdate(patient.get(0));
				return 1;
			}else{
				return 0;
			}
			//hibernateTemplate.update("UPDATE optimum_date where patient_id="+pat_id);
		}catch(Exception e){

			e.printStackTrace();
			return 0;
		}

	}

	@SuppressWarnings("unchecked")
	public int savePatient(Patients patient) {

		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );

		patient.setDate_created(oneDate);
		patient.setDate_modified(oneDate);
		try{
			data= hibernateTemplate.find("SELECT patient_number FROM Patients where subscriber_id="+patient.getSubscriber_id()+" AND study_id="+patient.getStudy_id()+" AND patient_number=?",patient.getPatient_number());

		}catch(Exception e)
		{
			e.printStackTrace();
		}

		if(data!=null && data.size()!= 0)
		{
			System.out.println(" Record Found");
			return 0;  
		}
		else if(data.size()== 0)
		{

			hibernateTemplate.saveOrUpdate(patient);

			ArrayList<Patients> plist= (ArrayList<Patients>) hibernateTemplate.find("FROM Patients where patient_number= '"+patient.getPatient_number()+"'");
			ArrayList<Visits> list=(ArrayList<Visits>) hibernateTemplate.find("FROM Visits where study_id="+patient.getStudy_id());
			ArrayList<PatientVisits> pvisit=new ArrayList<PatientVisits>(); 
			ArrayList<CaseReportForms> crf=new ArrayList<CaseReportForms>();
			ArrayList<VisitCrfs> vcrfList=new ArrayList<VisitCrfs>();
			for(int i=0;i<list.size();i++){
				PatientVisits p=new PatientVisits();
				vcrfList=(ArrayList<VisitCrfs>) hibernateTemplate.find("FROM VisitCrfs WHERE visit_id="+list.get(i).getVisit_id());

				for(int j=0;j<vcrfList.size();j++){
					crf=(ArrayList<CaseReportForms>)hibernateTemplate.find("FROM CaseReportForms WHERE crf_id="+vcrfList.get(j).getCase_report_form_id());
					for(int k=0;k<crf.size();k++){
						PatientCRF patientCRF=new PatientCRF();
						patientCRF.setSubscriber_id(patient.getSubscriber_id());
						patientCRF.setPatient_id(plist.get(0).getPatient_id());
						patientCRF.setCrf_html(crf.get(k).getCrf_html());
						patientCRF.setCrf_id(crf.get(k).getCrf_id());
						patientCRF.setCrf_name(crf.get(k).getCrf_name());
						patientCRF.setFilld_by(patient.getSubscriber_id());
						patientCRF.setVisit_id(list.get(i).getVisit_id());
						patientCRF.setCrf_status("Unfilled");
						java.sql.Date datefilled = java.sql.Date.valueOf("1901-01-01");
						patientCRF.setFilled_date(datefilled);
						hibernateTemplate.saveOrUpdate(patientCRF);					
					}
				}
				p.setSubscriber_id(patient.getSubscriber_id());
				p.setCreated_by(patient.getCreated_by());
				p.setDate_created(patient.getDate_created());
				p.setModified_by(patient.getModified_by());
				p.setPatient_id(plist.get(0).getPatient_id());
				p.setVisit_id(list.get(i).getVisit_id());
				p.setVisit_status("No CRF Attached");
				p.setVisit_date(java.sql.Date.valueOf("1901-01-01"));
				hibernateTemplate.save(p);
			}


			return 1;			
		}

		else
		{
			return 2;
		}
	}

	public int editPatient(Patients patient)
	{

		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		patient.setDate_modified(oneDate);		
		try{
			hibernateTemplate.update(patient);
			hibernateTemplate.flush();
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	public List<PatientVisits> getPatientVisits(int patientId){
		List<PatientVisits> list=(List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits where patient_id='"+patientId+"'");

		if(list==null)
			return new ArrayList<PatientVisits>();
		return list;
	}

	@SuppressWarnings("unchecked")
	public Map<Integer, List<CaseReportForms>> patientsVistCrfs(int pateintId) {	
		Map<Integer, List<CaseReportForms>> mape = new HashedMap();
		List<PatientVisits> patentVisit = (List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits WHERE patient_id='"+pateintId+"'");
		if(patentVisit != null){
			for(int i = 0 ; i < patentVisit.size() ; i++ ){

				List<VisitCrfs> visitCrfs =	(List<VisitCrfs>) hibernateTemplate.find("FROM VisitCrfs WHERE visit_id='"+patentVisit.get(i).getVisit_id()+"'");
				if(visitCrfs != null){
					for(int j = 0 ;j < visitCrfs.size() ; j ++){
						String nameOfVisit = null;
						List<CaseReportForms> Crfs =	(List<CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+visitCrfs.get(j).getCase_report_form_id()+"'");
						List<Visits> visits = (List<Visits>) hibernateTemplate.find("FROM Visits WHERE visit_id='"+visitCrfs.get(j).getVisit_id()+"'");
						if(visits != null && visits.size() == 1){

							mape.put(visits.get(0).getVisit_id(),Crfs);

						}

					}
				}

			}
		}

		return mape;
	}


	public int deletePatientCrf(int crfId,int patid,int patvisitid){
		try{

			hibernateTemplate.bulkUpdate("DELETE FROM PatientCRF WHERE patient_crf_id='"+crfId+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	@SuppressWarnings("unchecked")
	public int saveDiscrepancies(String[] error, int study, int site,int pacientCrf , Users cUsers){
		try{

			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );

			List<Discrepancy_on_crf> patentVisit = (List<Discrepancy_on_crf>) hibernateTemplate.find("FROM Discrepancy_on_crf WHERE patient_crf_id='"+pacientCrf+"'");
			for( int i = 0 ; i < error.length ; i++){


				boolean yes = true;
				if(patentVisit.size()>0){
					for( int j = 0 ; j < patentVisit.size() ; j++){

						patentVisit.get(j);
						if(patentVisit.get(j).getDiscrepancy_text().equals(error[i+1]) && patentVisit.get(j).getQuestion_text().equals(error[i]) && patentVisit.get(j).getSection().equals(error[i+2]) ){
							yes = false;
							break;
						}

					}
				}
				System.out.println("*****\n\n\n disc    "+yes+"\n\n\n");
				if(yes){
					Discrepancy_on_crf dis_on_crf =new  Discrepancy_on_crf();
					dis_on_crf.setQuestion_text(error[i]);
					dis_on_crf.setDiscrepancy_text(error[i+1]);
					dis_on_crf.setSection(error[i+2]);
					dis_on_crf.setSite_id(site);
					dis_on_crf.setStudy_id(study);
					dis_on_crf.setPatient_crf_id(pacientCrf);
					dis_on_crf.setStatus("Open");
					
					System.out.println("*****\n\n\n disc    "+cUsers.getUser_id()+"\n\n\n");
					
					dis_on_crf.setCreatedBy(cUsers.getUser_id());
					dis_on_crf.setCreatedDate(oneDate);
					dis_on_crf.setModifiedBy(cUsers.getUser_id());
					dis_on_crf.setModifiedDate(oneDate);
				
					hibernateTemplate.save(dis_on_crf);
				}
				i=i+2;
			}
			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}


	@SuppressWarnings("unchecked")
	public int resolveQuery(String discrepancy, String question,int pacientCrf,String type, String action, String reasion, String section, String status, String orignal, String current, Users cUsers){
		try{
			List<Discrepancy_on_crf> patentVisit = (List<Discrepancy_on_crf>) hibernateTemplate.find("FROM Discrepancy_on_crf WHERE patient_crf_id='"+pacientCrf+"'");

			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime());

			if(patentVisit.size()>0){
				for( int j = 0 ; j < patentVisit.size() ; j++){

					patentVisit.get(j);
					if(patentVisit.get(j).getDiscrepancy_text().equals(discrepancy) && patentVisit.get(j).getQuestion_text().equals(question)){
						patentVisit.get(j).setAction(action);
						patentVisit.get(j).setCurrent_value(current);
						patentVisit.get(j).setOrignal_value(orignal);
						patentVisit.get(j).setReasion(reasion);
						patentVisit.get(j).setSection(section);
						patentVisit.get(j).setStatus(status);
						patentVisit.get(j).setType(type);
						patentVisit.get(j).setModifiedBy(cUsers.getUser_id());
						patentVisit.get(j).setModifiedDate(oneDate);
						hibernateTemplate.saveOrUpdate(patentVisit.get(j));
					}

				}
			}


			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}

	@SuppressWarnings({ "unchecked", "unused" })
	public int saveAuditData(int study,int site,Users user, int patient, int patientVisit, int patientCrf, List<String> dataStrings){

		try{
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime());

			List<AuditTrail> auditList = (List<AuditTrail>) hibernateTemplate.find("FROM AuditTrail WHERE patient_id='"+patient+"' AND study_id='"+study+"' AND site_id='"+site+"' AND visit_id='"+patientVisit+"' AND patientCrf_id='"+patientCrf+"'  AND most_recent='yes'");
			List<CrfPatientData> crfPatientDatasList = (List<CrfPatientData>) hibernateTemplate.find("FROM CrfPatientData WHERE patient_id='"+patient+"' AND study_id='"+study+"' AND site_id='"+site+"' AND visit_id='"+patientVisit+"' AND patientCrf_id='"+patientCrf+"'");
			String ans = "";


			for(int j = 0 ; j < dataStrings.size() ; j++){
				AuditTrail trailObject = null;
				boolean flag = false;
				for(int i = 0 ; i < auditList.size() ; i++){

					if(auditList.get(i).getSection().equals(dataStrings.get(j)) && auditList.get(i).getQuestion().equals(dataStrings.get(j+1))){
						flag = true;
						if(!dataStrings.get(j+2).equals(auditList.get(i).getAnswer())){
							trailObject = new AuditTrail();

							trailObject.setQuestion(auditList.get(i).getQuestion());
							trailObject.setSection(auditList.get(i).getSection());
							trailObject.setPatientCrf_id(auditList.get(i).getPatientCrf_id());
							trailObject.setPatient_id(auditList.get(i).getPatient_id());
							trailObject.setVisit_id(auditList.get(i).getVisit_id());
							trailObject.setSite_id(auditList.get(i).getSite_id());
							trailObject.setStudi_id(auditList.get(i).getStudi_id());
							trailObject.setAnswer(dataStrings.get(j+2));
							//trailObject.setDate_modified(oneDate);
							trailObject.setModified_by(user.getUser_id());
							trailObject.setOpration("Update");
							trailObject.setMost_recent("yes");
							auditList.get(i).setMost_recent("no");
							hibernateTemplate.saveOrUpdate(auditList.get(i));
							hibernateTemplate.saveOrUpdate(trailObject);
						}
					}

				}
				if(trailObject == null && !flag){
					if(dataStrings.get(j+2) != "" && dataStrings.get(j+2) != null){
						trailObject = new AuditTrail();
						trailObject.setAnswer(dataStrings.get(j+2));
						trailObject.setQuestion(dataStrings.get(j+1));
						trailObject.setSection(dataStrings.get(j));
						//trailObject.setDate_modified(oneDate);
						trailObject.setModified_by(user.getUser_id());
						trailObject.setPatientCrf_id(patientCrf);
						trailObject.setPatient_id(patient);
						trailObject.setVisit_id(patientVisit);
						trailObject.setSite_id(site);
						trailObject.setStudi_id(study);
						trailObject.setOpration("Insert");
						trailObject.setMost_recent("yes");
						hibernateTemplate.saveOrUpdate(trailObject);
					}
				}

				CrfPatientData crfPatientData = null;
				boolean flagCrf = false;
				for(int i = 0 ; i < crfPatientDatasList.size() ; i++){

					if(crfPatientDatasList.get(i).getSection().equals(dataStrings.get(j)) && crfPatientDatasList.get(i).getQuestion().equals(dataStrings.get(j+1))){
						flagCrf = true;
						if(!dataStrings.get(j+2).equals(crfPatientDatasList.get(i).getAnswer())){

							crfPatientDatasList.get(i).setSubscriber_id(user.getSubscription_id());
							crfPatientDatasList.get(i).getQuestion();
							crfPatientDatasList.get(i).getSection();
							crfPatientDatasList.get(i).getPatientCrf_id();
							crfPatientDatasList.get(i).getPatient_id();
							crfPatientDatasList.get(i).getVisit_id();
							crfPatientDatasList.get(i).getSite_id();
							crfPatientDatasList.get(i).getStudi_id();
							crfPatientDatasList.get(i).setAnswer(dataStrings.get(j+2));
							//crfPatientData.setDate_modified(oneDate);
							crfPatientDatasList.get(i).setModified_by(user.getUser_id());
							hibernateTemplate.update(crfPatientDatasList.get(i));
						}
					}

				}
				if(crfPatientData == null && !flagCrf){
					if(dataStrings.get(j+2) != "" && dataStrings.get(j+2) != null){
						crfPatientData = new CrfPatientData();
						crfPatientData.setSubscriber_id(user.getSubscription_id());
						crfPatientData.setAnswer(dataStrings.get(j+2));
						crfPatientData.setQuestion(dataStrings.get(j+1));
						crfPatientData.setSection(dataStrings.get(j));
						//crfPatientData.setDate_modified(oneDate);
						crfPatientData.setModified_by(user.getUser_id());
						crfPatientData.setPatientCrf_id(patientCrf);
						crfPatientData.setPatient_id(patient);
						crfPatientData.setVisit_id(patientVisit);
						crfPatientData.setSite_id(site);
						crfPatientData.setStudi_id(study);
						hibernateTemplate.saveOrUpdate(crfPatientData);
					}
				}


				j=j+2;
			}			

			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}


	public int saveVisitDate(Date date, Integer patientVisitID){
		try{

			List<PatientVisits> patentVisitList = (List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits WHERE patient_visit_id='"+patientVisitID+"'");

			PatientVisits patientVisits =patentVisitList.get(0);
			patientVisits.setVisit_date(date);
			hibernateTemplate.saveOrUpdate(patientVisits);

			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}
	public int saveRelatedVisitDate(Date date,Date open,Date close,Date due, Integer patientVisitID){
		try{

			List<PatientVisits> patentVisitList = (List<PatientVisits>) hibernateTemplate.find("FROM PatientVisits WHERE patient_visit_id='"+patientVisitID+"'");

			PatientVisits patientVisits =patentVisitList.get(0);
			System.out.println("\n\n\n\\n********"+date+"******"+open+"******"+due+"********"+close);
			if(date.before(open) || date.after(close)){
				patientVisits.setRel_visit_status("Out Of Window");
				patientVisits.setStatus("Out Of Window");
			}else{
				patientVisits.setRel_visit_status("Within Window");
				patientVisits.setStatus("Within Window");
			}
			patientVisits.setVisit_date(date);
			hibernateTemplate.saveOrUpdate(patientVisits);

			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}



	@SuppressWarnings("unchecked")
	public List<AuditTrail> getAuditPatient(int patient_id){
		try{
			List<AuditTrail> auList = hibernateTemplate.find("from AuditTrail where patient_id='"+patient_id+"'");
			if(auList==null)
				return new ArrayList<AuditTrail>();
			return auList;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<AuditTrail>();
		}

	}

	public Integer PatientVisit(int patientid, Integer visit_id){
		try{
			List<PatientVisits> pVisit = hibernateTemplate.find("FROM PatientVisits WHERE patient_id='"+patientid+"' AND visit_id='"+visit_id+"'");
			return pVisit.get(0).getPatient_visit_id();

		}catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	}


	@SuppressWarnings("unchecked")
	public List<PatientCRF> PCrfs(Integer study_id,Integer site_id,Integer patientId){
		try{
			List<PatientCRF> list= (List<PatientCRF>) hibernateTemplate.find("FROM PatientCRF WHERE patient_id='"+patientId+"'");
			if(list==null)
				return new ArrayList<PatientCRF>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<PatientCRF>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Patients> listpatients(int studyid,int siteid) {
		try{
			List<Patients> list=(List<Patients>) hibernateTemplate.find("FROM Patients WHERE study_id='"+studyid+"' AND site_id='"+siteid+"'");

			if(list==null)
				return new ArrayList<Patients>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Patients>();
		}
	}


	@SuppressWarnings("unchecked")
	public List<Patients> listStudySitespatients(int studyid,int siteid) {
		try{
			List<Patients> list=(List<Patients>) hibernateTemplate.find("FROM Patients WHERE study_id='"+studyid+"' AND site_id='"+siteid+"'");
			if(list==null)
				return new ArrayList<Patients>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Patients>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<CaseReportForms> CrfList(Users user) {
		try{
			List<CaseReportForms> list=(List<CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<CaseReportForms>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<CaseReportForms>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> visitsName(Users user) {
		try{
			List<VisitNameTexts> list=(List<VisitNameTexts>) hibernateTemplate.find("FROM VisitNameTexts where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<VisitNameTexts>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<VisitNameTexts>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Discrepancy_on_crf> discrepancyList(List<PatientCRF> pCrfs) {
		try{
			List<Discrepancy_on_crf> discripency_list = new ArrayList<Discrepancy_on_crf>();

			for(int i = 0 ; i < pCrfs.size() ; i ++){
				List<Discrepancy_on_crf> discripency_list_in_crf = (List<Discrepancy_on_crf>) hibernateTemplate.find("FROM Discrepancy_on_crf where patient_crf_id='"+pCrfs.get(i).getPatient_crf_id()+"'");
				for(int j = 0 ; j < discripency_list_in_crf.size() ; j ++){
					discripency_list.add(discripency_list_in_crf.get(j));
				}
			}
			return discripency_list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Discrepancy_on_crf>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<PatientCRF> pCrfsList(Users user) {
		try{
			List<PatientCRF> list=(List<PatientCRF>) hibernateTemplate.find("from PatientCRF where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<PatientCRF>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<PatientCRF>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Users> User(Users user) {
		try{
			List<Users> list= (List<Users>) hibernateTemplate.find("from Users where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<Users>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Users>();
		}
	}


	@SuppressWarnings("unchecked")
	public List<Discrepancy_on_crf> discrepancyofPatient(int patientCrf){
		try{
			List<Discrepancy_on_crf> pDIs = hibernateTemplate.find("from Discrepancy_on_crf");
			List<Discrepancy_on_crf> pDisc = new ArrayList<Discrepancy_on_crf>();
			for(int i = 0 ; i < pDIs.size(); i++){
				List<Integer> pCrf = hibernateTemplate.find("select patient_id from PatientCRF where patient_crf_id="+pDIs.get(i).getPatient_crf_id());
				if(pCrf.get(0) == patientCrf){
					pDisc.add(pDIs.get(i));
				}
			}

			return pDisc;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Discrepancy_on_crf>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Visits> visits(Users user) {
		try{
			List<Visits> list=(List<Visits>) hibernateTemplate.find("FROM Visits where subscriber_id=?",user.getSubscription_id());
			if(list==null)
				return new ArrayList<Visits>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Visits>();
		}
	}
}

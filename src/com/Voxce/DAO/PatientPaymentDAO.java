package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.Views.PatientPaymentView;
import com.Voxce.Views.StudySitePaymentView;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.PatientPayment;
import com.Voxce.model.Patients;
import com.Voxce.model.PaymentCode;
import com.Voxce.model.Sites;
import com.Voxce.model.StudyPayment;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;


public class PatientPaymentDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	
	public int savePatientPayment(PatientPayment patientpayment) {
		
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		patientpayment.setDate_created(oneDate);
		patientpayment.setDate_modified(oneDate);
		try{
			//data= hibernateTemplate.find("SELECT p.payment_code_id FROM PatientPayment p where p.payment_code_id="+patientpayment.getPayment_code_id()+"AND p.patient_id="+patientpayment.getPatient_id());
			hibernateTemplate.saveOrUpdate(patientpayment);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int editPatientPayment(PatientPayment patientpayment) {
		
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		patientpayment.setDate_modified(oneDate);
		try{
			PatientPayment obj = (PatientPayment) hibernateTemplate.find("FROM PatientPayment WHERE patient_payment_id='"+patientpayment.getPatient_payment_id()+"'").get(0);
			if(obj!=null)
			{
				patientpayment.setCreated_by(obj.getCreated_by());
				patientpayment.setDate_created(obj.getDate_created());
				hibernateTemplate.saveOrUpdate(patientpayment);
				return 1;
			}else{
				return 0;
			}

		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int 	getVisitId(int visit_name_id){
		try{
			data = hibernateTemplate.find("Select visit_id FROM Visits WHERE visit_name_text_id = '" + visit_name_id+"'");
			System.out.println("visit id hy:  "+data.toString());
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
	
	@SuppressWarnings("unchecked")
	public List<StudySitePaymentView> listStudySitePayments(Users user,int StudyID) {	
		try{

			List<StudyPayment> list=(List<StudyPayment>) hibernateTemplate.find("FROM StudyPayment WHERE study_id='"+StudyID+"'");
			
			if(list.size()!=0){
				List<StudySitePaymentView> studysitepaymentview=new ArrayList<StudySitePaymentView>();
				for(int i=0;i<list.size();i++){
					StudySitePaymentView obj=new StudySitePaymentView();
				    PaymentCode paymentcode=(PaymentCode) hibernateTemplate.find("FROM PaymentCode where payment_code_id='"+list.get(i).getPayment_code_id()+"' ").get(0);
				    if(list.get(i).getSite_id() != null){
				    	Sites site=(Sites)  hibernateTemplate.find("FROM Sites where site_id='"+list.get(i).getSite_id()+"' ").get(0);
				    	obj.setSite_id(site.getSite_id());
						obj.setSite_name(site.getSite_name());
				    }
					if(list.get(i).getPay_to() !=null){
						Users users = (Users) hibernateTemplate.find("FROM Users WHERE user_id='"+list.get(i).getPay_to()+"' ").get(0);
						obj.setPay_to(users.getUser_id());
						obj.setPay_to_name(users.getFirst_name()+" "+users.getMiddle_name()+" "+users.getLast_name() );
					}else{
						obj.setPay_to_user_name(list.get(i).getPay_to_user_name());
						obj.setPay_to_user_address(list.get(i).getPay_to_user_address());
					}
				    				
				    obj.setStudy_payment_id(list.get(i).getStudy_payment_id());
					obj.setStudy_id(StudyID);
					obj.setPayment_code_id(paymentcode.getPayment_code_id());
					obj.setPayment_code_name(paymentcode.getName());
					obj.setPay_amount(list.get(i).getPay_amount());
					obj.setPo_no(list.get(i).getPo_no());
					obj.setInvoice_no(list.get(i).getInvoice_no());
					obj.setOverhead(list.get(i).getOverhead());	
					obj.setPayment_status(list.get(i).getPayment_status());
					obj.setCheque_date(list.get(i).getCheque_date());
					obj.setCheque_no(list.get(i).getCheque_no());
					obj.setTotal_payment(list.get(i).getTotal_payment());
					studysitepaymentview.add(obj);
				}
				if(studysitepaymentview.size()==0)
					return new ArrayList<StudySitePaymentView>();
				return studysitepaymentview;
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<StudySitePaymentView>();
		}
		return new ArrayList<StudySitePaymentView>();
	}
	
	@SuppressWarnings("unchecked")
	public List<PatientPaymentView> listStudyPatientsPayments(Users user,int StudyID) {	
		try{

			List<PatientPayment> list=(List<PatientPayment>) hibernateTemplate.find("FROM PatientPayment WHERE study_id='"+StudyID+"'");
			if(list.size()!=0){
				List<PatientPaymentView> patientpaymentview=new ArrayList<PatientPaymentView>();
				for(int i=0;i<list.size();i++){
					PatientPaymentView obj=new PatientPaymentView();
				    PaymentCode paymentcode=(PaymentCode) hibernateTemplate.find("FROM PaymentCode where payment_code_id='"+list.get(i).getPayment_code_id()+"' ").get(0);
				    Patients patient =(Patients) hibernateTemplate.find("FROM Patients where patient_id='"+list.get(i).getPatient_id()+"' ").get(0);
				    if(list.get(i).getSite_id() != null){
				    	Sites site=(Sites)  hibernateTemplate.find("FROM Sites where site_id='"+list.get(i).getSite_id()+"' ").get(0);
				    	obj.setSite_id(site.getSite_id());
						obj.setSite_name(site.getSite_name());
				    }				    	
				    Visits vis=(Visits) hibernateTemplate.find("FROM Visits WHERE visit_id='"+list.get(i).getVisit_id()+"' AND study_id = '"+StudyID+"'").get(0);
					if(vis.getVisit_id()!=null){
						VisitNameTexts vnt =  (VisitNameTexts) hibernateTemplate.find("FROM VisitNameTexts WHERE visit_name_text_id = '"+vis.getVisit_name_text_id()+"' AND subscriber_id='"+user.getSubscription_id()+"'").get(0);
						obj.setVisit_name(vnt.getVisit_name());
					}
				    if(list.get(i).getCrf_id() !=null){
				    	CaseReportForms crf=(CaseReportForms) hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+list.get(i).getCrf_id()+"' AND  subscriber_id='"+user.getSubscription_id()+"'").get(0);
				    	obj.setCrf_id(crf.getCrf_id());
						obj.setCrf_name(crf.getCrf_name());
				    }
					
					if(list.get(i).getPay_to() !=null){
						Users users = (Users) hibernateTemplate.find("FROM Users WHERE user_id='"+list.get(i).getPay_to()+"' ").get(0);
						obj.setPay_to(users.getUser_id());
						obj.setPay_to_name(users.getFirst_name()+" "+users.getMiddle_name()+" "+users.getLast_name() );
					}
					 					
					obj.setStudy_id(StudyID);
					obj.setPatient_payment_id(list.get(i).getPatient_payment_id());
					obj.setPayment_code_id(paymentcode.getPayment_code_id());
					obj.setPayment_code_name(paymentcode.getName());
					obj.setPatient_id(patient.getPatient_id());
					obj.setPatient_number(patient.getPatient_number());				
					obj.setVisit_id(vis.getVisit_id());					
					
					obj.setPayment_amount(list.get(i).getPayment_amount());
					obj.setPo(list.get(i).getPo());
					obj.setInvoice(list.get(i).getInvoice());
					obj.setOver_head(list.get(i).getOver_head());
					obj.setPaid(list.get(i).getPaid());					
					obj.setPay_to_user_name(list.get(i).getPay_to_user_name());
					obj.setPay_to_user_address(list.get(i).getPay_to_user_address());
					obj.setPayment_status(list.get(i).getPayment_status());
					obj.setCheque_date(list.get(i).getCheque_date());
					obj.setCheque_no(list.get(i).getCheque_no());
					obj.setTotal_payment(list.get(i).getTotal_payment());
					patientpaymentview.add(obj);
				}
				if(patientpaymentview.size()==0)
					return new ArrayList<PatientPaymentView>();
				return patientpaymentview;
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<PatientPaymentView>();
		}
		return new ArrayList<PatientPaymentView>();
	}

	public PatientPayment getPatientPayment(int id) {	
		PatientPayment obj=(PatientPayment) hibernateTemplate.find("FROM PatientPayment where patient_payment_id='"+id+"'").get(0);
		if(obj==null)
			return new PatientPayment();
		return obj;
	}
	
	@SuppressWarnings("unchecked")
	public List<PatientPayment> listStudyPayment(Users user) {	
		List<PatientPayment> list=(List<PatientPayment>) hibernateTemplate.find("FROM PatientPayment where subsciber_id=?",user.getSubscription_id());
		if(list==null)
			return new ArrayList<PatientPayment>();
		return list;
	}
}

package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.Views.PaymentScheduleView;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.PaymentCode;
import com.Voxce.model.PaymentSchedule;
import com.Voxce.model.Sites;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;


public class PaymentScheduleDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	public int 	getVisitId(int visit_name_id){
		try{
			data = hibernateTemplate.find("Select visit_id FROM Visits WHERE visit_name_text_id = " + visit_name_id);
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
	
	
	public int 	getPatientId(int patient_num){
		try{
			
			data = hibernateTemplate.find("Select patient_id FROM Patients WHERE patient_number = " + patient_num);
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
	
	public int 	getPaymentCode(String Payment_Type){
		try{
			data = hibernateTemplate.find("Select payment_code_id FROM PaymentCode where code='"+Payment_Type+"'");
			String[] temp;
			String res = data.toString();
			String del = "]";
			temp = res.split(del);
			res = temp[0];
			res = res.substring(1);
			temp = res.split(",");
			System.out.println(res);
			return  Integer.parseInt(temp[0]);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return 0;
		}
		
		
	}
	
	public int editPaymentSchedule(PaymentSchedule paymentschedule,int StudyID)
	{

		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		paymentschedule.setDate_modified(oneDate);		
		try{
			if(paymentschedule.getSite()!=null){
				if(paymentschedule.getCrf() == null)
					data = hibernateTemplate.find("FROM PaymentSchedule WHERE site='"+paymentschedule.getSite()+"' AND payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND study_id='"+StudyID+"' ");
				else
					data = hibernateTemplate.find("FROM PaymentSchedule WHERE site='"+paymentschedule.getSite()+"' AND payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND crf='"+paymentschedule.getCrf()+"' AND study_id='"+StudyID+"' ");
			}else{
				if(paymentschedule.getCrf() == null)			
					data = hibernateTemplate.find("FROM PaymentSchedule WHERE  payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND study_id='"+StudyID+"' ");
				else
					data = hibernateTemplate.find("FROM PaymentSchedule WHERE  payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND crf='"+paymentschedule.getCrf()+"' AND study_id='"+StudyID+"' ");
			}
			if(data.size() != 0){
				if(paymentschedule.getPayment_schedule_id()==((PaymentSchedule)data.get(0)).getPayment_schedule_id()){
					
				}
				else{
					return 2;
				}
				
			}
			PaymentSchedule obj=(PaymentSchedule) hibernateTemplate.find("FROM PaymentSchedule WHERE payment_schedule_id='"+paymentschedule.getPayment_schedule_id()+"' ").get(0);
			if(obj==null)return 0;
			paymentschedule.setCreated_by(obj.getCreated_by());
			paymentschedule.setDate_created(obj.getDate_created());
			paymentschedule.setModified_by(obj.getModified_by());
			paymentschedule.setDate_modified(obj.getDate_modified());
			
			hibernateTemplate.saveOrUpdate(paymentschedule);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
public int newPaymentSchedule(PaymentSchedule paymentschedule,int StudyID)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	paymentschedule.setDate_created(oneDate);
	paymentschedule.setDate_modified(oneDate);	
	
	try{
		
		if(paymentschedule.getSite()!=null){
			if(paymentschedule.getCrf() == null)
				data = hibernateTemplate.find("FROM PaymentSchedule WHERE site='"+paymentschedule.getSite()+"' AND payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND study_id='"+StudyID+"' ");
			else
				data = hibernateTemplate.find("FROM PaymentSchedule WHERE site='"+paymentschedule.getSite()+"' AND payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND crf='"+paymentschedule.getCrf()+"' AND study_id='"+StudyID+"' ");
		}else{
			if(paymentschedule.getCrf() == null)			
				data = hibernateTemplate.find("FROM PaymentSchedule WHERE  payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND study_id='"+StudyID+"' ");
			else
				data = hibernateTemplate.find("FROM PaymentSchedule WHERE  payment_type='"+paymentschedule.getPayment_type()+"' AND visit='"+paymentschedule.getVisit()+"' AND crf='"+paymentschedule.getCrf()+"' AND study_id='"+StudyID+"' ");
		}
		if(data.size() != 0){
			return 2;
		}
		else{
			hibernateTemplate.saveOrUpdate(paymentschedule);
			return 1;
		}
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}
	@SuppressWarnings("unchecked")
	public List<PaymentScheduleView> listpaymentschedule(Users user,int study_id) {	
		try{
			List<PaymentSchedule> list=(List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+study_id+"' ");
			if(list!=null){
				List<PaymentScheduleView> li=new ArrayList<PaymentScheduleView>();
				for(int i=0;i<list.size();i++){
					PaymentScheduleView obj=new PaymentScheduleView();
					PaymentCode pc=(PaymentCode) hibernateTemplate.find("FROM PaymentCode WHERE payment_code_id='"+list.get(i).getPayment_type()+"' ").get(0);
					Visits vis=(Visits) hibernateTemplate.find("FROM Visits WHERE visit_id='"+list.get(i).getVisit()+"' AND study_id = '"+study_id+"'").get(0);
					if(vis.getVisit_id() != null){
						VisitNameTexts vnt =  (VisitNameTexts) hibernateTemplate.find("FROM VisitNameTexts WHERE visit_name_text_id = '"+vis.getVisit_name_text_id()+"' AND subscriber_id='"+user.getSubscription_id()+"'").get(0);
						obj.setVisit_name(vnt.getVisit_name());
					}
					if(list.get(i).getCrf() != null){
						CaseReportForms crf=(CaseReportForms) hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+list.get(i).getCrf()+"' AND  subscriber_id='"+user.getSubscription_id()+"'").get(0);
						obj.setCrf_id(crf.getCrf_id());
						obj.setCrf_name(crf.getCrf_name());
					}					
					if( list.get(i).getSite() != null){
						Sites site=(Sites) hibernateTemplate.find("FROM Sites WHERE site_id='"+list.get(i).getSite()+"' AND  subscriber_id='"+user.getSubscription_id()+"' ").get(0);
						obj.setSite_id(site.getSite_id());
						obj.setSite_name(site.getSite_name());
					}
					 
					obj.setPayment_schedule_id(list.get(i).getPayment_schedule_id());
					obj.setStudy_id(list.get(i).getStudy());					
					obj.setVisit_id(vis.getVisit_id());
					
					obj.setPayment_type_id(pc.getPayment_code_id());
					obj.setPayment_type_name(pc.getCode());					
					obj.setStatus(list.get(i).getStatus());
					obj.setAmount(list.get(i).getAmount());
					obj.setDescription(list.get(i).getDescription());
					obj.setDate_created(list.get(i).getDate_created());
					obj.setCreated_by(list.get(i).getCreated_by());
					obj.setDate_modified(list.get(i).getDate_modified());
					obj.setModified_by(list.get(i).getModified_by());
					li.add(obj);
				}
				if(li.size()!=0){
					return li;
				}else{
					return new ArrayList<PaymentScheduleView>();
				}
			}else{
				return new ArrayList<PaymentScheduleView>();
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<PaymentScheduleView>();
		}
	}
	
	public PaymentSchedule getPaymentScheduleByID(int id) {	
		PaymentSchedule obj=(PaymentSchedule) hibernateTemplate.find("FROM PaymentSchedule WHERE payment_schedule_id='"+id+"' ").get(0);
		if(obj==null)return new PaymentSchedule();
		return obj;
	}
	
	@SuppressWarnings("unchecked")
	public List<PaymentSchedule> listpaymentschedule_study(int study_id) {	
		List<PaymentSchedule> list=(List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+study_id+"' AND site='"+null+"'");
		if(list==null)
			return new ArrayList<PaymentSchedule>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<PaymentSchedule> listpaymentschedule_site(int study_id, String site) {	
		List<PaymentSchedule> list=(List<PaymentSchedule>) hibernateTemplate.find("FROM PaymentSchedule WHERE study_id='"+study_id+"' AND site='"+site+"'");
		if(list==null)
			return new ArrayList<PaymentSchedule>();
		return list;
	}
}

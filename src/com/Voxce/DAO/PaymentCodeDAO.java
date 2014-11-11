package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.PaymentCode;
import com.Voxce.model.Users;


public class PaymentCodeDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	public int checkRelated(String type)
	{
		
		try{
			//data= hibernateTemplate.find("SELECT patient_number FROM Patients where patient_number=?",patient.getPatient_number());
			data= hibernateTemplate.find("SELECT related_to FROM PaymentCode where code='"+type+"'");
		String related_to = data.toString();
		if(related_to.equals("[Site]")){
			return 1;
		}
		else
			return 0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	
	
	}
		
@SuppressWarnings("unchecked")
public int newPaymentCode(Users user,PaymentCode paymentcode, int StudyID)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	paymentcode.setDate_created(oneDate);
	paymentcode.setDate_modified(oneDate);		
	try{
		List<PaymentCode> list=(List<PaymentCode>) hibernateTemplate.find("FROM PaymentCode where subscriber_id="+user.getSubscription_id()+" AND study_id ='"+StudyID+"' AND code='"+paymentcode.getCode()+"' ORDER BY name ASC");
		if(list.size()!=0)
			return 2;
		else{
			hibernateTemplate.save(paymentcode);
			return 1;}
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
	
}


@SuppressWarnings("unchecked")
public int editPaymentCode(Users user,PaymentCode paymentcode,int StudyID)
{
	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	paymentcode.setDate_modified(oneDate);		
	try{
		List<PaymentCode> list=(List<PaymentCode>) hibernateTemplate.find("FROM PaymentCode where subscriber_id="+user.getSubscription_id()+" AND study_id ='"+StudyID+"' AND code='"+paymentcode.getCode()+"' ORDER BY name ASC");
		System.out.println("\n\n\n\n\n"+StudyID+"\n");
		if(list.size()!=0){
			if(list.get(0).getPayment_code_id()==paymentcode.getPayment_code_id()){
				hibernateTemplate.update(paymentcode);
				return 1;
			}
			else{
				
				return 2;
			}
		}
		else{
			hibernateTemplate.update(paymentcode);
			return 1;}
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}

	@SuppressWarnings("unchecked")
	public List<PaymentCode> listcodes(Users user, int StudyID) {
		List<PaymentCode> list=(List<PaymentCode>) hibernateTemplate.find("FROM PaymentCode where subscriber_id="+user.getSubscription_id()+" AND study_id ='"+StudyID+"' ORDER BY name ASC");
		if(list==null)
			return new ArrayList<PaymentCode>();
		return list;
	}
	
}

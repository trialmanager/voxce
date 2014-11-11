package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.StudyPayment;
import com.Voxce.model.Users;


public class StudyPaymentDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	
	public int saveStudyPayment(StudyPayment studypayment) {
		
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		studypayment.setDate_created(oneDate);
		studypayment.setDate_modified(oneDate);
		try{
		//	data= hibernateTemplate.find("SELECT payment_code_id FROM StudyPayment where payment_code_id="+studypayment.getPayment_code_id()+"AND pay_to="+studypayment.getPay_to());
			hibernateTemplate.saveOrUpdate(studypayment);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;			
		}		
	}
	
public int editStudySitePayment(StudyPayment studypayment)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	studypayment.setDate_modified(oneDate);		
	try{
		StudyPayment obj= (StudyPayment) hibernateTemplate.find("FROM StudyPayment where study_payment_id='"+studypayment.getStudy_payment_id()+"'").get(0);
		studypayment.setCreated_by(obj.getCreated_by());
		studypayment.setDate_created(obj.getDate_created());
		hibernateTemplate.saveOrUpdate(studypayment);
		return 1;
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}

	@SuppressWarnings("unchecked")
	public List<StudyPayment> listStudyPayment(Users user) {
		List<StudyPayment> list=(List<StudyPayment>) hibernateTemplate.find("FROM StudyPayment where subscriber_id='"+user.getSubscription_id()+"' ORDER BY date_created ASC ");
		if(list==null)
			return new ArrayList<StudyPayment>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public StudyPayment findStudyPayment(int id) {	
		 List<StudyPayment> temp =  hibernateTemplate.find("FROM StudyPayment WHERE study_payment_id = '"+id+"'");
		 return temp.get(0);
	}
	
	public int getSite(String site) {	
		String res = hibernateTemplate.find("SELECT site_id from Sites WHERE site_name = '"+site+"'").toString();
		System.out.println("site id:::"+res);
		String[] temp;
		String del = "]";
		temp = res.split(del);
		res = temp[0];
		res = res.substring(1);
		temp = res.split(",");
		return  Integer.parseInt(temp[0]);
	}
}

package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.PatientPayment;
import com.Voxce.model.Patients;
import com.Voxce.model.StudyPayment;


public class PaymentDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}	
public int newPayment(PatientPayment Ppayment)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	Ppayment.setDate_created(oneDate);
	Ppayment.setDate_modified(oneDate);		
	try{
		hibernateTemplate.update(Ppayment);
		hibernateTemplate.flush();
		return 1;
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}

	public Patients getPatient(int patientid) {
		Patients obj=(Patients) hibernateTemplate.find("FROM Patients WHERE patient_id='"+patientid+"' ").get(0);
		if(obj==null)
			return new Patients();
		return obj;
	}
	@SuppressWarnings("unchecked")
	public List<Patients> listpatients(int study_id) {
		List<Patients> list=(List<Patients>) hibernateTemplate.find("FROM Patients WHERE study_id='"+study_id+"' ORDER BY patient_number ASC");
		if(list==null)
			return new ArrayList<Patients>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Patients> listpatients_site(int study_id, int site) {	
		List<Patients> list=(List<Patients>) hibernateTemplate.find("FROM Patients WHERE study_id='"+study_id+"' AND site_id = '"+site+"' ORDER BY patient_number ASC");
		if(list==null)
			return new ArrayList<Patients>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<PatientPayment> listpatientpayments(int study_id) {	
		List<PatientPayment> list=(List<PatientPayment>) hibernateTemplate.find("FROM PatientPayment WHERE study_id='"+study_id+"' ORDER BY date_created ASC");
		if(list==null)
			return new ArrayList<PatientPayment>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public PatientPayment findpatientpayments(int id) {	
		 List<PatientPayment> temp;
		temp = hibernateTemplate.find("FROM PatientPayment WHERE patient_payment_id='"+id+"'");
		return temp.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<StudyPayment> liststudypayments(int study_id) {	
		List<StudyPayment> list=(List<StudyPayment>) hibernateTemplate.find("FROM StudyPayment WHERE study_id='"+study_id+"'");
		if(list==null)
			return new ArrayList<StudyPayment>();
		return list;
	}
}

package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.SubmissionType;


public class SubmissionTypeDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
public int saveSubmissionType(SubmissionType submissiontype)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	submissiontype.setDate_created(oneDate);
	submissiontype.setDate_modified(oneDate);	
	try{
		data= hibernateTemplate.find("FROM SubmissionType where code='"+submissiontype.getCode()+"' AND study_id='"+submissiontype.getStudy_id()+"' ");
		if(data.size()!= 0)
		{
			System.out.println("Record Found");
			return 0;  
		}
		// Code Does not Exists //
		else if(data.size()== 0)
		{
			hibernateTemplate.saveOrUpdate(submissiontype);
			hibernateTemplate.flush();
			return 1;		
		}
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}	
	return 2;
}
public int editSubmissionType(SubmissionType submissiontype)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	submissiontype.setDate_modified(oneDate);		
	try{
		hibernateTemplate.update(submissiontype);
		hibernateTemplate.flush();
		return 1;
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}
	@SuppressWarnings("unchecked")
	public List<SubmissionType> listsubmissiontype(int studyid) {	
		List<SubmissionType> list=(List<SubmissionType>) hibernateTemplate.find("FROM SubmissionType WHERE study_id='"+studyid+"' ORDER BY name ASC");
		if(list==null)
			return new ArrayList<SubmissionType>();
		return list;
	}
	
}

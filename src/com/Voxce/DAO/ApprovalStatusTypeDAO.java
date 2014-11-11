package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.ApprovalStatusType;


public class ApprovalStatusTypeDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
public int saveApprovalStatusType(ApprovalStatusType approvalstatustype)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	
	approvalstatustype.setDate_created(oneDate);
	approvalstatustype.setDate_modified(oneDate);	
	try{
		data= hibernateTemplate.find("SELECT code FROM ApprovalStatusType where code='"+approvalstatustype.getCode()+"' AND study_id='"+approvalstatustype.getStudy_id()+"' ");
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	if(data.size()!= 0)
	{
		System.out.println("Record Found");
		return 0;  
	}
	// Code Does not Exists //
	else if(data.size()== 0)
	{
		hibernateTemplate.saveOrUpdate(approvalstatustype);
		hibernateTemplate.flush();
		return 1;		
	}
	return 2;
}
public int editApprovalStatusType(ApprovalStatusType approvalstatustype)
{

	Calendar cal = Calendar.getInstance();
	Date oneDate =new java.sql.Date(cal.getTime().getTime() );
	approvalstatustype.setDate_modified(oneDate);		
	try{
		hibernateTemplate.update(approvalstatustype);
		hibernateTemplate.flush();
		return 1;
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
}
	@SuppressWarnings("unchecked")
	public List<ApprovalStatusType> listapprovals(int studyid) {	
		List<ApprovalStatusType> list=(List<ApprovalStatusType>) hibernateTemplate.find("FROM ApprovalStatusType WHERE study_id='"+studyid+"' ORDER BY name ASC");
		if(list==null)
		  return new ArrayList<ApprovalStatusType>();
		return list; 
	}
	
	/*
	public int getapprovalstatusid(String app) {	
		data = hibernateTemplate.find("FROM ApprovalStatusType WHERE name='"+app+"'");
		String[] temp;
		String res = data.toString();
		String del = "]";
		temp = res.split(del);
		res = temp[0];
		res = res.substring(1);
		temp = res.split(",");
		return  Integer.parseInt(temp[0]);
		
	}
	*/
}

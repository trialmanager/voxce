package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.UserCV;

public class UserCVDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int UploadDocument(FileItem item,UserCV usercv,int idnum)
	{
		
	UserCV obj=new UserCV();
	if(item != null){
		obj.setData(item.get());
		obj.setFilename(item.getName());
		obj.setType(item.getContentType());
	}
	else{
		obj.setData(usercv.getData());
		obj.setFilename(usercv.getFilename());
		obj.setType(usercv.getType());
	}
	obj.setReceived_dt(usercv.getReceived_dt());
	obj.setStudy_id(usercv.getStudy_id());
	obj.setCreated_by(usercv.getCreated_by());
	obj.setUser_cv_id(usercv.getUser_cv_id());
	obj.setUser_id(usercv.getUser_id());
	obj.setFile_description(usercv.getFile_description());
	if(idnum == 0){
		//save new cv
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		obj.setDate_created(oneDate);
		obj.setDate_modified(oneDate);
		try{
			
			data= hibernateTemplate.find("SELECT user_id FROM UserCV where user_id='"+usercv.getUser_id()+"' AND study_id='"+usercv.getStudy_id()+"'");
		
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
			hibernateTemplate.saveOrUpdate(obj);
			return 1;		
		}
	}
	else{
		//edit previous cv
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		obj.setDate_modified(oneDate);	
		obj.setDate_created(usercv.getDate_created());
		try{
			hibernateTemplate.update(obj);
			hibernateTemplate.flush();
			return 4;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 3;
		}
	}
		
	try{
		hibernateTemplate.saveOrUpdate(obj);
					
	}catch(Exception e)
	{
		e.printStackTrace();
		return 0;
	}
	return 0;
	}

	
	public int DeleteDocument(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM UserCV WHERE study_document_id='"+id+"' ");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public UserCV find(int id) {
		try{
			data= (List<UserCV>) hibernateTemplate.find("FROM UserCV WHERE user_cv_id='"+id+"'");
			return (UserCV) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<UserCV> listusercv(int study_id) {	
		List<UserCV> list=(List<UserCV>) hibernateTemplate.find("FROM UserCV WHERE study_id='"+study_id+"'");
		if(list==null)
			return new ArrayList<UserCV>();
		return list;
	}
	
}

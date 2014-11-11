package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.TrainingUser;


public class TrainingUserDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public TrainingUser find(int id) {
		try{
			data= (List<TrainingUser>) hibernateTemplate.find("FROM TrainingUser WHERE training_user_id='"+id+"'");
			return (TrainingUser) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	public int UploadDocument(FileItem item,TrainingUser training,int idnum,int studyid)
	{
		
		TrainingUser obj=new TrainingUser();
		
		if(item != null){
			obj.setData(item.get());
			obj.setFilename(item.getName());
			obj.setType(item.getContentType());
		}
		else{
			obj.setData(training.getData());
			obj.setFilename(training.getFilename());
			obj.setType(training.getType());
		}
		
		obj.setCreated_by(training.getCreated_by());
		obj.setModified_by(training.getModified_by());
		obj.setDescription(training.getDescription());
		obj.setSite_id(training.getSite_id());
		obj.setApproval(training.getApproval());
		obj.setStudy_id(training.getStudy_id());
		obj.setFile_description(training.getFile_description());
		obj.setTraining_dt(training.getTraining_dt());
		obj.setTraining_type(training.getTraining_type());
		obj.setType_id(training.getType_id());
		obj.setUser_id(training.getUser_id());
		obj.setProtocol_id(training.getProtocol_id());
		obj.setProtocol_version(training.getProtocol_version());

	if(idnum == 0){
		//save new user training
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime());
		
		obj.setDate_created(oneDate);
		obj.setDate_modified(oneDate);
		try{
			data= hibernateTemplate.find("FROM TrainingUser where study_id='"+studyid+"' AND user_id='"+training.getUser_id()+"' ");
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(data.size()!= 0)
		{
			return 0;  
		}
		// Code Does not Exists //
		else if(data.size()== 0)
		{
			hibernateTemplate.saveOrUpdate(obj);
			hibernateTemplate.flush();
			return 1;		
		}
	}
	else{
		//edit previous user training
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		obj.setDate_modified(oneDate);	
		obj.setDate_created(training.getDate_created());
		obj.setTraining_user_id(training.getTraining_user_id());
		try{
			hibernateTemplate.saveOrUpdate(obj);
			return 3;
		}catch(Exception e)
		{	
			return 4;
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

	
	public int getprotocolid(int protocol_version_id){
		
		try{
			data= hibernateTemplate.find("SELECT protocol_id FROM ProtocolVersion where protocol_version_id=?",protocol_version_id);
			String[] temp;
			String res = data.toString();
			String del = "]";
			temp = res.split(del);
			res = temp[0];
			res = res.substring(1);
			System.out.println("protocol number: "+res);
			return  Integer.parseInt(res);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("exception...");
			return 0;
		}
	}
	
	public String getprotocolversion(int protocol_version_id){
		data= hibernateTemplate.find("SELECT version FROM ProtocolVersion where protocol_version_id=?",protocol_version_id);
		String[] temp;
		String res = data.toString();
		String del = "]";
		temp = res.split(del);
		res = temp[0];
		res = res.substring(1);
		System.out.println("protocol version: "+res);
		return res;
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainingUser> listtraininguser(int studyid) {	
		List<TrainingUser> list=(List<TrainingUser>) hibernateTemplate.find("FROM TrainingUser WHERE study_id='"+studyid+"'");
		if(list==null)
			return new ArrayList<TrainingUser>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProtocolVersion> listprotocolversions(int studyid) {
		List<ProtocolVersion> list=(List<ProtocolVersion>) hibernateTemplate.find("FROM ProtocolVersion WHERE study_id=?",studyid);
		if(list==null)
			return new ArrayList<ProtocolVersion>();
		return list;
	}
	
}

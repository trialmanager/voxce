package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Submission;


public class SubmissionDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int UploadSubmission(FileItem item,Submission submission,int idnum){
		Submission obj = new Submission();
		if(item != null){
			obj.setData(item.get());
			obj.setFilename(item.getName());
			obj.setType(item.getContentType());
		}
		else{
			obj.setData(submission.getData());
			obj.setFilename(submission.getFilename());
			obj.setType(submission.getType());
		}
		obj.setSubmission_id(submission.getSubmission_id());
		obj.setStudy_id(submission.getStudy_id());
		obj.setCreated_by(submission.getCreated_by());
		obj.setModified_by(submission.getModified_by());
		obj.setModified_by(submission.getModified_by());
		obj.setCreated_by(submission.getCreated_by());
		obj.setApproval_status_type_id(submission.getApproval_status_type_id());
		obj.setFile_description(submission.getFile_description());
		obj.setSubmission_name(submission.getSubmission_name());
		obj.setProtocol_id(submission.getProtocol_id());
		obj.setActual_review_date(submission.getActual_review_date());
		obj.setApproval_date(submission.getApproval_date());
		obj.setExpiration_date(submission.getExpiration_date());
		obj.setMaterial_sent_date(submission.getMaterial_sent_date());
		obj.setSubmission_type_id(submission.getSubmission_type_id());
		obj.setProtocol_id(submission.getProtocol_id());
		obj.setSite_id(submission.getSite_id());
		obj.setDescription(submission.getDescription());
		obj.setSubmission_date(submission.getSubmission_date());
		obj.setSched_review_date(submission.getSched_review_date());
		obj.setConsent_date(submission.getConsent_date());
		obj.setProtocol_id(submission.getProtocol_id());
		obj.setProtocol_version(submission.getProtocol_version());
		obj.setRegulatorybody_country(submission.getRegulatorybody_country());
		obj.setRegulatorybody_name(submission.getRegulatorybody_name());
		if(idnum == 0){
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			obj.setDate_created(oneDate);
			obj.setDate_modified(oneDate);
		

			try{
				data=hibernateTemplate.find("FROM Submission WHERE protocol_id='"+submission.getProtocol_id()+"' AND submission_type_id='"+submission.getSubmission_id()+"' AND submission_date='"+submission.getSubmission_date()+"' AND submission_name='"+submission.getSubmission_name()+"' AND study_id='"+obj.getStudy_id()+"' ");
				
			
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
				hibernateTemplate.flush();
				return 1;		
			}
		}
		else{
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			obj.setDate_modified(oneDate);
			obj.setDate_created(submission.getDate_created());
			try{
				hibernateTemplate.saveOrUpdate(obj);
				hibernateTemplate.flush();
				return 1;
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
		return 0;
	}

	
	@SuppressWarnings("unchecked")
	public Submission find(int id) {
		try{
			data= (List<Submission>) hibernateTemplate.find("FROM Submission WHERE submission_id='"+id+"'");
			return (Submission) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
/*	@SuppressWarnings("unchecked")
	public List<Countries> listcountries() {	
		return (List<Countries>) hibernateTemplate.find("FROM Countries WHERE  ORDER BY COUNTRY_NAME ASC");
	}*/
	
	@SuppressWarnings("unchecked")
	public List<Submission> listsubmission(int studyid) {
		List<Submission> list=(List<Submission>) hibernateTemplate.find("FROM Submission WHERE study_id='"+studyid+"' ORDER BY submission_name ASC");
		if(list==null)
			return new ArrayList<Submission>();
		return list;
	}
	
}

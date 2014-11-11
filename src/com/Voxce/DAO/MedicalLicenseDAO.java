package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.MedicalLicense;


public class MedicalLicenseDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public MedicalLicense find(int id) {
		try{
			data= (List<MedicalLicense>) hibernateTemplate.find("FROM MedicalLicense WHERE medical_lic_id='"+id+"'");
			return (MedicalLicense) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	public int UploadMedicalLicense(FileItem item,MedicalLicense medicallicense,int idnum){
	
		if(item!= null){
			medicallicense.setData(item.get());
			medicallicense.setFilename(item.getName());
			medicallicense.setType(item.getContentType());
		}
		if(idnum == 0){
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			
			medicallicense.setDate_created(oneDate);
			medicallicense.setDate_modified(oneDate);	
			try{
				data=hibernateTemplate.find("FROM MedicalLicense WHERE site_id='"+medicallicense.getSite_id()+"' AND study_id='"+medicallicense.getStudy_id()+"' AND user_id='"+medicallicense.getUser_id()+"' AND begin_dt='"+medicallicense.getBegin_dt()+"' AND start_dt='"+medicallicense.getStart_dt()+"' AND expire_dt='"+medicallicense.getExpire_dt()+"'");
				
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
				hibernateTemplate.saveOrUpdate(medicallicense);
				
				return 1;		
			}
		}
		else{
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			medicallicense.setDate_modified(oneDate);		
			
			try{
				System.out.println("editing...");
				hibernateTemplate.saveOrUpdate(medicallicense);
			
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
	public List<MedicalLicense> listmedical(int study_id) {	
		List<MedicalLicense> list=(List<MedicalLicense>) hibernateTemplate.find("FROM MedicalLicense WHERE study_id='"+study_id+"'");
		if(list==null)
			return new ArrayList<MedicalLicense>();
		return list;
	}
	
}

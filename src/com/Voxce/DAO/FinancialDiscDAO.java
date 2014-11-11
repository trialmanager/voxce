package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.FinancialDisc;


public class FinancialDiscDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int UploadFinancialDisc(FileItem item,FinancialDisc financialdisc,int idnum){
		if(item != null){
			financialdisc.setData(item.get());
			financialdisc.setFilename(item.getName());
			financialdisc.setType(item.getContentType());
		}
		if(idnum == 0){
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			
			financialdisc.setDate_created(oneDate);
			financialdisc.setDate_modified(oneDate);	
			try{
				data=hibernateTemplate.find("FROM FinancialDisc WHERE site_id='"+financialdisc.getSite_id()+"' AND study_id='"+financialdisc.getStudy_id()+"' AND user_id='"+financialdisc.getUser_id()+"' AND signed_dt='"+financialdisc.getSigned_dt()+"' AND received_dt='"+financialdisc.getReceived_dt()+"' AND type_id='"+financialdisc.getReceived_dt()+"'");
			
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
				hibernateTemplate.saveOrUpdate(financialdisc);
				
				return 1;		
			}
			return 0;
		}
		else{
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			
			financialdisc.setDate_modified(oneDate);		
			try{
				hibernateTemplate.saveOrUpdate(financialdisc);
				
				return 1;
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
			
	}

	@SuppressWarnings("unchecked")
	public FinancialDisc find(int id) {
		try{
			data= (List<FinancialDisc>) hibernateTemplate.find("FROM FinancialDisc WHERE financial_disc_id='"+id+"'");
			return (FinancialDisc) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public List<FinancialDisc> listfinancialdisc(int studyid) {	
		List<FinancialDisc> list=(List<FinancialDisc>) hibernateTemplate.find("FROM FinancialDisc WHERE study_id='"+studyid+"'");
		if(list==null)
			return new ArrayList<FinancialDisc>();
		return list;
	}
	
}

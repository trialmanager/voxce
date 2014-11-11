package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Contracts;


public class ContractsDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public Contracts find(int id) {
		try{
			data= (List<Contracts>) hibernateTemplate.find("FROM Contracts WHERE contract_id='"+id+"'");
			return (Contracts) data.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	public int DeleteDocument(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE data FROM Contracts WHERE contract_id='"+id+"' ");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int UpdateContracts(FileItem item,Contracts contracts,int idnum){
		if(item != null){
			contracts.setData(item.get());
			contracts.setFilename(item.getName());
			contracts.setType(item.getContentType());
		}
		if(idnum == 0){
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		contracts.setDate_created(oneDate);
		contracts.setDate_modified(oneDate);	
		try{
			data=hibernateTemplate.find("FROM Contracts WHERE site_id='"+contracts.getSite_id()+"' AND study_id='"+contracts.getStudy_id()+"' AND user_id='"+contracts.getUser_id()+"' AND signed_dt='"+contracts.getSigned_dt()+"' AND protocol_id='"+contracts.getProtocol_id()+"' AND type_id='"+contracts.getType_id()+"'");
			
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
			hibernateTemplate.saveOrUpdate(contracts);
			hibernateTemplate.flush();
			return 1;		
		}
		return 2;
		}
		else{
			Calendar cal = Calendar.getInstance();
			Date oneDate =new java.sql.Date(cal.getTime().getTime() );
			contracts.setDate_modified(oneDate);		
			try{
				hibernateTemplate.saveOrUpdate(contracts);
				hibernateTemplate.flush();
				return 1;
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
	}


	@SuppressWarnings("unchecked")
	public List<Contracts> listcontracts(int study_id) {
		List<Contracts> list=(List<Contracts>) hibernateTemplate.find("FROM Contracts WHERE study_id='"+study_id+"'");
		if(list==null)
			return new ArrayList<Contracts>();
		return list;
	}
	
}

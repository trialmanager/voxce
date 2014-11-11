package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Training;


public class TrainingDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int saveTraining(Training training){
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		training.setDate_created(oneDate);
		training.setDate_modified(oneDate);
		try{
			data= hibernateTemplate.find("SELECT code FROM Training where code='"+training.getCode()+"' AND study_id='"+training.getStudy_id()+"' ");
		
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
			hibernateTemplate.saveOrUpdate(training);
			hibernateTemplate.flush();
			return 1;		
		}
		return 2;
	}
	
	public int editTraining(Training training){
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		training.setDate_modified(oneDate);	

		try{
			hibernateTemplate.update(training);
			hibernateTemplate.flush();
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	
/*

*/
	@SuppressWarnings("unchecked")
	public List<Training> listtrainings(int studyid) {	
		List<Training> list=(List<Training>) hibernateTemplate.find("FROM Training WHERE study_id='"+studyid+"' ORDER BY name ASC");
		if(list==null)
			return new ArrayList<Training>();
		return list;
	}
	
}

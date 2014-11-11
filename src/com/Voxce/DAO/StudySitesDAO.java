package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.ui.ModelMap;

import com.Voxce.model.EnrollmentSchedule;
import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Sites;
import com.Voxce.model.StudySiteLabroratories;
import com.Voxce.model.StudySites;
import com.Voxce.model.Users;
import com.Voxce.model.sitePatientView;

public class StudySitesDAO {

	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}


	
	public int SaveEnrollmentSchedule(int currentuser,int studyid,List<Sites> sites, List<Integer>  patients,ProtocolVersion currentprotocol,List<String> schedule)
	{
		/*
		Calendar Cal = Calendar.getInstance();	
		Cal.setTime(currentprotocol.getStart_date());
		String monthname="";
		int year=Cal.get(Calendar.YEAR);
		int monthnumber = Cal.get(Calendar.MONTH);
		List<String> schedule=new ArrayList<String>();
		
		for(int i=1; i<=currentprotocol.getDuration() ;i++)
		{	
			Cal.set(year, monthnumber, 1);
			Date startdate =new java.sql.Date( Cal.getTime().getTime() );
			monthname=new SimpleDateFormat("MMM").format(startdate);
			String yearstr= Integer.toString(year);
			schedule.add(monthname+"("+yearstr+")");
			monthnumber++;
			if(monthnumber==12)
			{
				monthnumber=0;
				year++;
			}
		}
		*/
		boolean date_temp=false;		
		Calendar cal = Calendar.getInstance();	
		Calendar cal1 = Calendar.getInstance();	
		cal1.set(0000, 00, 00);
		Date date =new java.sql.Date( cal.getTime().getTime() );
		Date nextdate =new java.sql.Date(cal1.getTime().getTime());
		list=hibernateTemplate.find("SELECT DISTINCT start_date FROM ProtocolVersion WHERE study_id='"+studyid+"' ORDER BY start_date ASC");
		
		if(list.indexOf(currentprotocol.getStart_date()) +1 >= list.size()){
			date_temp=true;
		}else{
			cal1.setTime((java.util.Date) list.get(list.indexOf(currentprotocol.getStart_date()) +1));
			nextdate.setTime(cal1.getTime().getTime());
		}
		int temp=0;
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM EnrollmentSchedule WHERE study_id='"+studyid+"'  AND protocol_id='"+currentprotocol.getProtocol_id()+"' AND version='"+currentprotocol.getVersion()+"'" );								
			
			
			for(int i=0;i<sites.size();i++)
			{
				for(int j=0;j<schedule.size();j++)
				{					
					EnrollmentSchedule obj=new EnrollmentSchedule();
					obj.setStudy_id(studyid);
					obj.setSite_id(sites.get(i).getSite_id());
					obj.setProtocol_id(currentprotocol.getProtocol_id());
					obj.setVersion(currentprotocol.getVersion());
					obj.setMonth_year(schedule.get(j));
					obj.setPatients(patients.get(temp));
					obj.setDisplay_order(temp+1);
					obj.setCreated_by(currentuser);					
					obj.setStart_date(currentprotocol.getStart_date());
					obj.setDate_Created(date);
					obj.setModified_by(currentuser);
					obj.setDate_modified(date);
					if(date_temp != true){
					obj.setNext_protocol_date(nextdate);		
					}
					hibernateTemplate.saveOrUpdate(obj);
					temp++;
				}				
			}
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int DeleteStudySiteLaborotory(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM StudySiteLabroratories WHERE study_site_lab_id='"+id+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int DeleteStudySite(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM StudySites WHERE study_site_id='"+id+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public int SaveStudySiteLaborotory(int studyid,int siteid,Users CurrentUser,List<Integer> labs)
	{
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{
			List<StudySites> stsili=hibernateTemplate.find("FROM StudySites WHERE study_id='"+studyid+"' AND site_id='"+siteid+"'");
			hibernateTemplate.bulkUpdate("DELETE FROM StudySiteLabroratories WHERE study_site_id='"+stsili.get(0).getStudy_site_id()+"'");
			
			if(labs.size()!=0)
			{
				for(int i=0;i<labs.size();i++)
				{
					StudySiteLabroratories obj=new StudySiteLabroratories();
					obj.setStudy_site_id(stsili.get(0).getStudy_site_id());
					obj.setLab_id(labs.get(i));			
					obj.setIs_default("Y");
					obj.setCreated_by(CurrentUser.getUser_id());
					obj.setModified_by(CurrentUser.getUser_id());
					obj.setDate_created(date);
					obj.setDate_modified(date);
					obj.setSubscriber_id(CurrentUser.getSubscription_id());
					hibernateTemplate.saveOrUpdate(obj);													
				}
				return 1;
			}			
			return 0;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public List<Sites> getStudySitesNoPatients(int id)
	{
		List<Sites> sites= new ArrayList<Sites>();				
		try{
			sites= hibernateTemplate.find("SELECT si FROM Sites si WHERE si.site_id IN(SELECT ss.site_id FROM StudySites ss WHERE ss.study_id='"+id+"')");
			if(sites==null)
				return new ArrayList<Sites>();
			return sites;
			
		}catch(Exception e)
		{
			return null;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap getStudySites(int id)
	{
		List<Sites> sites= new ArrayList<Sites>();		
		List<sitePatientView> sitepatientlist=new ArrayList<sitePatientView>();
		ModelMap map=new ModelMap();
		
		try{
			sites= hibernateTemplate.find("SELECT si FROM Sites si WHERE si.site_id IN(SELECT ss.site_id FROM StudySites ss WHERE ss.study_id='"+id+"')");
			
			if(sites.size()!=0)
			{ 
			    for(int i=0; i<sites.size();i++)
				{
			    	int a=DataAccessUtils.intResult(hibernateTemplate.find("SELECT COUNT(patient_id) FROM  Patients  WHERE site_id='"+sites.get(i).getSite_id()+"' AND study_id='"+id+"' "));
			    	sitePatientView obj=new sitePatientView();
			    	obj.setSite_id(sites.get(i).getSite_id());
			    	obj.setPatient_count(a);
			    	sitepatientlist.add(obj);
				}
			}
			map.addAttribute("error",1);
			map.addAttribute("sitepatientlist",sitepatientlist);
			map.addAttribute("siteslist",sites);
			return map;
			
		}catch(Exception e)
		{
			map.addAttribute("error",0);
			return map;
		}		
	}
	@SuppressWarnings("unchecked")
	public int SaveStudySite(StudySites studysites,int SSN) { 
		try{
				
			List<StudySites> li1 =  hibernateTemplate.find("FROM StudySites where study_id='"+studysites.getStudy_id()+"' AND study_site_number='"+SSN+"'");
			
			if(li1.size()!=0)
			{
				return 2;
			}
			else
			{
				List<StudySites> li  =  hibernateTemplate.find("FROM StudySites where study_id='"+studysites.getStudy_id()+"' AND site_id='"+studysites.getSite_id()+"'");
				if(li.size()!=0)
				{			
					return 0;
				}
				else if(li.size()==0)
				{				
					hibernateTemplate.saveOrUpdate(studysites);
					return 1;
				}
			}			
					
		}catch(Exception e)
		{
			e.printStackTrace();
			return 2;
		}
		return 0;
	}// End Save or update
	
	public int EditStudySite(StudySites studysites) {
		try{
			
			list= hibernateTemplate.find("FROM StudySites where study_id='"+studysites.getStudy_id()+"' and site_id='"+studysites.getSite_id()+"'");	
			
			if(list.size()!=0)
			{
				return 0;
			}
			else if(list.size()==0)
			{
				hibernateTemplate.saveOrUpdate(studysites);
				return 1;
			}
					
		}catch(Exception e)
		{
			e.printStackTrace();
			return 2;
		}
		return 0;
	}// End Save or update
	
	
	@SuppressWarnings("unchecked")
	public List<StudySiteLabroratories> StudySiteLaborotoriesList(Users user) {		
		List<StudySiteLabroratories> list=(List<StudySiteLabroratories>) hibernateTemplate.find("from StudySiteLabroratories where subscriber_id=?",user.getSubscription_id());
		if(list==null)
			return new ArrayList<StudySiteLabroratories>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudySites> StudySiteList(Users user) {	
		List<StudySites> list=(List<StudySites>) hibernateTemplate.find("from StudySites where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<StudySites>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Sites> StudySitesList(int id) {		
		List<Sites> list=(List<Sites>) hibernateTemplate.find("SELECT s FROM Sites s WHERE s.site_id IN(SELECT ss.site_id FROM StudySites ss WHERE ss.study_id='"+id+"')");
		if(list==null)
			return new ArrayList<Sites>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<EnrollmentSchedule> getEnrollmentSchedule(int studyid,ProtocolVersion currentprotocol) {
		try{
		List<EnrollmentSchedule> list=(List<EnrollmentSchedule>) hibernateTemplate.find("FROM EnrollmentSchedule WHERE study_id='"+studyid+"' AND protocol_id='"+currentprotocol.getProtocol_id()+"' AND version='"+currentprotocol.getVersion()+"' ORDER BY display_order ASC");
		if(list==null)
			return new ArrayList<EnrollmentSchedule>();
		return list;
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<EnrollmentSchedule>();
		}
		
	}	
}

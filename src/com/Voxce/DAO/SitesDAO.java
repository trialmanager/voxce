package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Discrepancy_on_crf;
import com.Voxce.model.Sites;
import com.Voxce.model.SitesUsers;
import com.Voxce.model.Study_Site_Users;
import com.Voxce.model.Users;

public class SitesDAO {
	
	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	
	
	public int DeleteStudySiteUser(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM Study_Site_Users WHERE study_site_user_id='"+id+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int SaveStudySiteUser(int studyid,int siteid,Users CurrentUser,List<Integer> users)
	{
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{		
			hibernateTemplate.bulkUpdate("DELETE FROM Study_Site_Users WHERE study_id='"+studyid+"' AND site_id='"+siteid+"'");
			if(users.size()!=0)
			{
				for(int i=0;i<users.size();i++)
				{
					Study_Site_Users obj=new Study_Site_Users();
				
					obj.setStudy_id(studyid);
					obj.setSite_id(siteid);
					obj.setUser_id(users.get(i));
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
	
	public int DeleteSiteUser(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM SitesUsers WHERE site_user_id='"+id+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int SaveSiteUsers(int siteid,Users user,List<Integer> users)
	{		
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		
		try
		{
			hibernateTemplate.bulkUpdate("DELETE FROM SitesUsers WHERE site_id='"+siteid+"'");
			if(users.size()!=0)
			{
				for(int i=0;i<users.size();i++)
				{
						SitesUsers obj=new SitesUsers();
						obj.setSite_id(siteid);
						obj.setUser_id(users.get(i));
						obj.setAssigned_by(user.getUser_id());
						obj.setAssigned_date(date);
						obj.setSubscriber_id(user.getSubscription_id());
						hibernateTemplate.saveOrUpdate(obj);					
				}
			}
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int ChangeStatus(int id, int status) {
		
		if(status == 1)
		{
			
			try{
			 	 hibernateTemplate.bulkUpdate("Update Sites SET status='"+status+"' where site_id = ?", id);
				 return 1;							
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
		else if(status==0)
		{			
			try{				
				list=hibernateTemplate.find("FROM Patients WHERE site_id='"+id+"'");
				
				if(list.size()==0)
				{
					hibernateTemplate.bulkUpdate("Update Sites SET status='"+status+"' where site_id = ?", id);
					return 1;
				}
				else if(list.size() != 0)
				{
					return 2;
				}
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
		return 0;
	}// End Save or update
	
	public int SaveSite(Sites site) {

		try{			
					
				hibernateTemplate.save(site);
				return 1;
						
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}// End Save or update
	
	public int EditSite(Sites site) {
		
		try{
			hibernateTemplate.saveOrUpdate(site);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}// End Save or update
	
	@SuppressWarnings("unchecked")
	public List<Discrepancy_on_crf> discrepancyinSites(int siteID) {		
		List<Discrepancy_on_crf> list=(List<Discrepancy_on_crf>) hibernateTemplate.find("from Discrepancy_on_crf WHERE site_id='"+siteID+"'");
		if(list==null)
			return new ArrayList<Discrepancy_on_crf>();
		return list;
	}	
	
	@SuppressWarnings("unchecked")
	public Sites getSite(int id) {		
		List<Sites> obj= hibernateTemplate.find("FROM Sites WHERE site_id='"+id+"'");
		return obj.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<Sites> getSite(String sitename, int subid) {		
		ArrayList<Sites> list=new ArrayList<Sites>();
		list= (ArrayList<Sites>) hibernateTemplate.find("FROM Sites WHERE subscriber_id='"+subid+"' AND site_name like '%"+sitename+"%' ");
		if(list==null)
			return new ArrayList<Sites>();
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<SitesUsers> RequestSitesUsersList(int id) {
		List<SitesUsers> list=(List<SitesUsers>) hibernateTemplate.find("from SitesUsers WHERE site_id='"+id+"'");
		if(list==null)
			return new ArrayList<SitesUsers>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<SitesUsers> SitesUsersList(Users user) {	
		List<SitesUsers> list=(List<SitesUsers>) hibernateTemplate.find("from SitesUsers where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<SitesUsers>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Sites> SitesList(Users user) {	
		List<Sites> list=(List<Sites>) hibernateTemplate.find("from Sites where subscriber_id=? ORDER BY site_name ASC",user.getSubscription_id());
		if(list==null)
			return new ArrayList<Sites>();
		return list; 
	}
	
	@SuppressWarnings("unchecked")
	public List<Sites> StudySitesList(Users user,int StudyID) {	
		List<Sites> list=(List<Sites>) hibernateTemplate.find("SELECT si FROM Sites si WHERE si.site_id IN (SELECT ss.site_id FROM StudySites ss WHERE ss.study_id='"+StudyID+"' AND ss.subscriber_id ='"+user.getSubscription_id()+"') AND  si.subscriber_id='"+user.getSubscription_id()+"'");
		if(list==null)
			return new ArrayList<Sites>();
		return list; 
	}
	
	@SuppressWarnings("unchecked")
	public List<Study_Site_Users> StudySitesUsersList(Users user) {	
		List<Study_Site_Users> list=(List<Study_Site_Users>) hibernateTemplate.find("from Study_Site_Users where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Study_Site_Users>();
		return list;	
	}

}

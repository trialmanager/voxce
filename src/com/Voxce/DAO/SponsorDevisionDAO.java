package com.Voxce.DAO;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.SponsorDevision;
import com.Voxce.model.SponsorDevisionUser;
import com.Voxce.model.Users;

public class SponsorDevisionDAO{

	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	
	public int SaveSponsorDevision(SponsorDevision obj) {
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date( cal.getTime().getTime() );
		//Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		obj.setDate_created(date);
		obj.setDate_modified(date);
		
		try{
			hibernateTemplate.saveOrUpdate(obj);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<SponsorDevision> getSelectedSponsorDivsions(int sponsorid){		
		return (List<SponsorDevision>) hibernateTemplate.find("FROM SponsorDevision WHERE sponsor_id='"+sponsorid+"' ORDER BY name ASC");
	}
	
	@SuppressWarnings("unchecked")
	public List<SponsorDevisionUser> getSelectedSponsorDivsionsUser(int sponsorid, int division_id){		
		return (List<SponsorDevisionUser>) hibernateTemplate.find("FROM SponsorDevisionUser WHERE sponsor_id='"+sponsorid+"' AND devision_id='"+division_id+"'");
	}
	
	@SuppressWarnings("unchecked")
	public List<SponsorDevision> SponsorDevisionList(Users user) {		
		return (List<SponsorDevision>) hibernateTemplate.find("from SponsorDevision where subscriber_id="+user.getSubscription_id()+"  ORDER BY name ASC");
	}	
}

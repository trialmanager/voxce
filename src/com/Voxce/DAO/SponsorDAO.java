package com.Voxce.DAO;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.Voxce.model.Sponsor;
import com.Voxce.model.Users;

@Transactional
public class SponsorDAO {

	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public int SaveSponsor(Sponsor sponsor) {
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date( cal.getTime().getTime() );
		//Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		sponsor.setDate_created(date);
		sponsor.setDate_modified(date);
		
		try{
			
			List<Sponsor> li=hibernateTemplate.find("FROM Sponsor WHERE name='"+sponsor.getName()+"'");			
			if(li.size() != 0)
			{
				return 4;
			}			
			hibernateTemplate.saveOrUpdate(sponsor);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public int EditSponsor(Sponsor sponsor) {
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date( cal.getTime().getTime() );
		//Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		sponsor.setDate_created(date);
		sponsor.setDate_modified(date);
		
		try{
			
				List<Sponsor> li=hibernateTemplate.find("FROM Sponsor WHERE name='"+sponsor.getName()+"' AND sponsor_id != '"+sponsor.getSponsor_id()+"'");			
				System.out.println("size->"+li.size());
				if(li.size() >= 1)
				{
			
					return 5;
				}			
			
				//hibernateTemplate.bulkUpdate("DELETE FROM Sponsor WHERE sponsor_id='"+sponsor.getSponsor_id()+"'");
				hibernateTemplate.saveOrUpdate(sponsor);
				return 1;
		}catch(Exception e)
		{
			System.out.println(6);
			e.printStackTrace();
			return 0;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public Sponsor getSponsor(int id) {		
		List<Sponsor> te= hibernateTemplate.find("FROM Sponsor WHERE sponsor_id='"+id+"'");
		return te.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<Sponsor> SponsorList(Users user) {
		
			return (List<Sponsor>) hibernateTemplate.find("from Sponsor where subscriber_id="+user.getSubscription_id()+" ORDER BY name ASC");
			
	}
}

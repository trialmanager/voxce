package com.Voxce.DAO;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.SponsorDevisionUser;
import com.Voxce.model.Users;

public class SponsorDivisionUserDAO {
	
	private HibernateTemplate hibernateTemplate;
	List<?> list;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int DeleteSponsorDivisionUser(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM SponsorDevisionUser WHERE sponsor_devision_user_id='"+id+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int SaveSponsorDivisionUser(int sponid,int divid,int created_by,int modby, List<Integer> users, Users user)
	{
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{
			hibernateTemplate.bulkUpdate("DELETE FROM SponsorDevisionUser WHERE sponsor_id='"+sponid+"' AND devision_id='"+divid+"'");
			for(int i=0;i<users.size();i++)
			{
				list=hibernateTemplate.find("FROM SponsorDevisionUser WHERE sponsor_id='"+sponid+"' AND devision_id='"+divid+"' AND user_id='"+users.get(i)+"' ");
				
				
				if(list.size()==0)
				{
					SponsorDevisionUser obj=new SponsorDevisionUser();
					obj.setSponsor_id(sponid);
					obj.setDevision_id(divid);
					obj.setUser_id(users.get(i));
					obj.setCreated_by(created_by);
					obj.setModified_by(modby);
					obj.setDate_created(date);
					obj.setDate_modified(date);
					obj.setUser_id(users.get(i));
					obj.setSubscriber_id(user.getSubscription_id());
					hibernateTemplate.saveOrUpdate(obj);					
				}
				list.clear();				
			}
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<SponsorDevisionUser> SponsorDevisionUserList(Users user) {	
		return (List<SponsorDevisionUser>) hibernateTemplate.find("from SponsorDevisionUser where subscriber_id="+user.getSubscription_id());
	}

}

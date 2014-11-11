package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Users;


public class UsersGroupsDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	
	@SuppressWarnings("unchecked")
	public List<Users> listinvestigators(Users user) {	
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ug.user_id FROM UserGroups ug WHERE ug.subscriber_id="+user.getSubscription_id()+"  ug.group_id IN ( SELECT g.id FROM Groups g WHERE  g.name LIKE '%Investigator%')) ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	
}

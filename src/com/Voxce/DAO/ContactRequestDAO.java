package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.Voxce.model.ContactRequest;

@Transactional
public class ContactRequestDAO {
	private HibernateTemplate hibernateTemplate;
	SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int saveContactRequest(ContactRequest contactRequest) {
		try{
			hibernateTemplate.save(contactRequest);
			return 1;
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			return 0;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<ContactRequest> getContectRequests()
	{
		List<ContactRequest> crlist=(List<ContactRequest>) hibernateTemplate.find("from ContactRequest");
		if(crlist==null)
			return new ArrayList<ContactRequest>();
		else
			return crlist;
		
	}
	

	
}

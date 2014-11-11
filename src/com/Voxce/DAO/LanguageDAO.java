package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Languages;

public class LanguageDAO {
	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public List<Languages> listLanguages() {
		List<Languages> list= (List<Languages>) hibernateTemplate.find("from Languages ORDER BY name ASC");
		if(list==null)
			return new ArrayList<Languages>();
		return list;
	}
	
}

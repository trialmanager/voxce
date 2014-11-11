package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.DefaultAnswerTexts;
import com.Voxce.model.Users;

public class DefaultAnswerTextsDAO {

	private HibernateTemplate hibernateTemplate;
	
	List<DefaultAnswerTexts> listDefaultAnswerTexts;
	
	// GET HIBERNATE SESSION FACTORY
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

// *** ADD DEFAULT ANSWER TEXT
	public int saveDefaultAnswerTexts(DefaultAnswerTexts answerText) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		answerText.setDate_created(dateCreated);

		try {
			
			hibernateTemplate.saveOrUpdate(answerText);
			messageCode = 3;
		
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		return messageCode;
	}

// ****** GET DEFAULT ANSWER TEXTS LIST
	@SuppressWarnings("unchecked")
	public List<DefaultAnswerTexts> getDefaultAnswerTextsList(Users user) throws Exception {
		List<DefaultAnswerTexts> list=(List<DefaultAnswerTexts>) hibernateTemplate.find("from DefaultAnswerTexts");
		if(list==null)
			return new ArrayList<DefaultAnswerTexts>();
		return list;
	}

// **** FIND THE DEFAULT ANSWER TEXT
	public DefaultAnswerTexts findADefaultAnswerTexts(int ans_id) {

		DefaultAnswerTexts answerText = null;
		List<?> findAnswerText = null;
		try {
			
			findAnswerText = hibernateTemplate.find("FROM DefaultAnswerTexts WHERE default_answer_text_id = ?", ans_id);
			answerText = (DefaultAnswerTexts) findAnswerText.get(0);
		
		} catch (Exception excp) {
			System.out.println("Exception DefaultAnswerTexts = " + excp);
		}

		return answerText;
	}

// **** UPDATE THE DEFAULT ANSWER TEXT
	public int updateDefaultAnswerTexts(DefaultAnswerTexts newDAT) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());

		newDAT.setDate_modified(dateModified);

		try {
			DefaultAnswerTexts oldText = this.findADefaultAnswerTexts(newDAT.getDefault_answer_text_id());

			newDAT.setCreated_by(oldText.getCreated_by());
			newDAT.setDate_created(oldText.getDate_created());

			hibernateTemplate.update(newDAT);
			hibernateTemplate.flush();

			messageCode = 3;

		} catch (Exception e) {
			System.out.println(e);
		}

		return messageCode;
	}		
	
}

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Users;
import com.Voxce.model.ValidationRules;

public class ValidationRulesDAO {

	private HibernateTemplate hibernateTemplate;
	List<ValidationRules> vRulesList;
	
//GET HIBERNATE SESSION FACTORY
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//*** ADD VALIDATION RULES
	public int saveValidationRule(ValidationRules addRule,Users user) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int question_id = 1;

		List<?> existingNames = null;

		// Check for existing ValidationRules name
		try {
			existingNames = hibernateTemplate.find("SELECT name FROM ValidationRules WHERE subscriber_id="+user.getSubscription_id()+" AND name=?", addRule.getName());

			if (existingNames.size() != 0) { // ValidationRules already exists 
				messageCode = 1;
			
			} else if (existingNames.size() == 0) { // ValidationRules name is valid, so save it

				addRule.setDate_created(dateCreated);
				addRule.setCrf_question_id(question_id);
				addRule.setSubscriber_id(user.getSubscription_id());
				hibernateTemplate.saveOrUpdate(addRule);
				
				messageCode = 3;
				
			} else {
				messageCode = 4;
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		return messageCode;
	}

// ****** GET VALIDATION RULE LIST
	@SuppressWarnings("unchecked")
	public List<ValidationRules> getValidationRulesList(Users user) throws Exception {
		List<ValidationRules> list=(List<ValidationRules>) hibernateTemplate.find("from ValidationRules where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<ValidationRules>();
		return list;
	}

// **** FIND THE LAB
	public ValidationRules findValidationRule(int rule_id) {
		
		ValidationRules rule = null;
		List<?> findRule = null;
		try {
			findRule = hibernateTemplate.find("FROM ValidationRules WHERE validation_rule_id = ?",rule_id);
			rule = (ValidationRules) findRule.get(0);
			
		} catch (Exception excp) {
			System.out.println("Exception Finding ValidationRules = " + excp);
		}

		return rule;
	}

// **** UPDATE VALIDATION RULE
	public int updateValidationRule(ValidationRules updateRule,Users user) {

		List<?> existingNames = null;

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());

		// Check for existing ValidationRules name
		try {
			existingNames = hibernateTemplate.find("SELECT name FROM ValidationRules WHERE subscriber_id="+user.getSubscription_id()+" AND name = ? AND validation_rule_id <> ?",updateRule.getName(), updateRule.getValidation_rule_id());
		
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		if (existingNames.size() != 0) { // ValidationRules already exists empty message string
			messageCode = 1;
	
		} else if (existingNames.size() == 0) { // ValidationRules name is valid, so save it
																				
			try {
				ValidationRules oldRule = this.findValidationRule(updateRule.getValidation_rule_id());

				updateRule.setCreated_by(oldRule.getCreated_by());
				updateRule.setDate_created(oldRule.getDate_created());
				updateRule.setDate_modified(dateModified);
				updateRule.setCrf_question_id(oldRule.getCrf_question_id());
				updateRule.setSubscriber_id(user.getSubscription_id());
				System.out.println("Gonna update id = "+ updateRule.getValidation_rule_id());
				hibernateTemplate.update(updateRule);
				hibernateTemplate.flush();
				messageCode = 3;
			} catch (Exception e) {
				messageCode = 4;
			}
			
		} else {
			messageCode = 4;
		}

		return messageCode;
	}
}

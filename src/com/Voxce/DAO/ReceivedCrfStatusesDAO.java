package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.ReceivedCrfStatuses;
import com.Voxce.model.Users;

public class ReceivedCrfStatusesDAO {
	
	private HibernateTemplate hibernateTemplate;
	List<ReceivedCrfStatuses> listCategories;
	
//GET HIBERNATE SESSION FACTORY
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//*** ADD CATEGORY
	public int saveReceivedCrfStatuses(ReceivedCrfStatuses rcsAdd) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;

		List<?> existingCodes = null;
		List<?> existingNames = null;

		// Check for existing ReceivedCrfStatuses code or name
		try {
			existingCodes = hibernateTemplate.find(
					"SELECT code FROM ReceivedCrfStatuses WHERE code=?",
					rcsAdd.getCode());
			existingNames = hibernateTemplate.find(
					"SELECT name FROM ReceivedCrfStatuses WHERE name=?",
					rcsAdd.getName());

			if (existingNames.size() != 0) { // ReceivedCrfStatuses already
												// exists , 0 is left for empty
												// message string
				messageCode = 1;
			} else if (existingCodes.size() != 0) { // ReceivedCrfStatuses code
													// already exists
				messageCode = 2;
			} else if (existingCodes.size() == 0 && existingNames.size() == 0) { // ReceivedCrfStatus code or name is valid, so save it

				rcsAdd.setLanguage_id(language);
				rcsAdd.setDate_created(dateCreated);

				hibernateTemplate.saveOrUpdate(rcsAdd);
				messageCode = 3;
			} else {
				messageCode = 4;
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		return messageCode;
	}

// ****** GET ReceivedCrfStatuses LIST
	@SuppressWarnings("unchecked")
	public List<ReceivedCrfStatuses> getReceivedCrfStatusesList(Users user)throws Exception {
		try{
			List<ReceivedCrfStatuses> reciveList = (List<ReceivedCrfStatuses>) hibernateTemplate.find("from ReceivedCrfStatuses WHERE subscriber_id="+user.getSubscription_id());
				
			if(reciveList == null){
				return new ArrayList<ReceivedCrfStatuses>();
			}else{
				return reciveList;
			}
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<ReceivedCrfStatuses>();
		}
		
	}

// **** FIND THE CATEGORY
	public ReceivedCrfStatuses findReceivedCrfStatuses(int rcs_id) {

		ReceivedCrfStatuses rcs = null;
		List<?> findReceivedCrfStatuses = null;
		try {
			findReceivedCrfStatuses = hibernateTemplate
					.find("FROM ReceivedCrfStatuses WHERE received_crf_status_id = ?",
							rcs_id);
			rcs = (ReceivedCrfStatuses) findReceivedCrfStatuses.get(0);
		} catch (Exception excp) {
			System.out.println("Exception Categories = " + excp);
		}

		return rcs;
	}

// **** UPDATE THE ReceivedCrfStatuses
	public int updateReceivedCrfStatuses(ReceivedCrfStatuses rcsUpdate,Users user) {

		List<?> existingCodes = null;
		List<?> existingNames = null;

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());

		// Check for existing ReceivedCrfStatuses code or name
		try {
			existingCodes = hibernateTemplate
					.find("SELECT code FROM ReceivedCrfStatuses WHERE code = ? AND received_crf_status_id <> ?",
							rcsUpdate.getCode(),
							rcsUpdate.getReceived_crf_status_id());
			existingNames = hibernateTemplate
					.find("SELECT name FROM ReceivedCrfStatuses WHERE name = ? AND received_crf_status_id <> ?",
							rcsUpdate.getName(),
							rcsUpdate.getReceived_crf_status_id());
		} catch (Exception exp) {
			exp.printStackTrace();
		}

		if (existingNames.size() != 0) { // ReceivedCrfStatuses already exists ,0 is left for empty message string
											
			messageCode = 1;
		} else if (existingCodes.size() != 0) { // ReceivedCrfStatuses code
												// already exists
			messageCode = 2;
		} else if (existingCodes.size() == 0 && existingNames.size() == 0) { // ReceivedCrfStatuses code and name is valid, save it
																				

			try {
				ReceivedCrfStatuses oldRCS = this.findReceivedCrfStatuses(rcsUpdate.getReceived_crf_status_id());

				rcsUpdate.setLanguage_id(oldRCS.getLanguage_id());
				rcsUpdate.setCreated_by(oldRCS.getCreated_by());
				rcsUpdate.setDate_created(oldRCS.getDate_created());
				rcsUpdate.setDate_modified(dateModified);
				rcsUpdate.setSubscriber_id(user.getSubscription_id());
				hibernateTemplate.update(rcsUpdate);
				hibernateTemplate.flush();
			} catch (Exception e) {
				System.out.println(e);
			}
			messageCode = 3;
		} else {
			messageCode = 4;
		}

		return messageCode;
	}

}

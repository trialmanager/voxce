package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.LabNormals;
import com.Voxce.model.Users;


public class LabNormalsDAO {
	
private HibernateTemplate hibernateTemplate;
	
	List<LabNormals> listLabNormals;
	
//******* GET HIBERNATE SESSION FACTORY 	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
//******* GET LAB NORMALS LIST
	@SuppressWarnings("unchecked")
	public List<LabNormals> getLabNormalsList(Users user) {
		
			return hibernateTemplate.find("from LabNormals where subscriber_id="+user.getSubscription_id());
	}
	
// *** ADD LAB NOORMALS
	public int saveLabNormals(LabNormals addNorms) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());


		try {
			addNorms.setDate_created(dateCreated);
			hibernateTemplate.saveOrUpdate(addNorms);
			messageCode = 5;
			
		} catch (Exception exp) {
			messageCode = 6;
			exp.printStackTrace();
		}

		return messageCode;
	}
	
// **** FIND THE LAB
	@SuppressWarnings("unchecked")
	public List<LabNormals> getALabNormals(int laboratory_id) {
		
		List<LabNormals> labNormals = null;
		
		try {
			
			labNormals = hibernateTemplate.find("FROM LabNormals WHERE labratory_id = ?",laboratory_id);
			if(labNormals==null)
				return new ArrayList<LabNormals>();
		
		} catch (Exception excp) {
			System.out.println("Exception Finding Lab Normals= " + excp);
		}

		return labNormals;
	}

//**** FIND THE LAB	
	public LabNormals findLabNormal(int labnorm_id) {
		
		LabNormals labNorm = null;
		List<?> findLabNorms = null;
		
		try {
			findLabNorms = hibernateTemplate.find(
					"FROM LabNormals WHERE lab_normal_id = ?", labnorm_id);
			labNorm = (LabNormals) findLabNorms.get(0);
			
		} catch (Exception excp) {
			System.out.println("Exception Finding Lab Normals = " + excp);
		}

		return labNorm;
	}

// **** UPDATE THE LAB NORMAL
	public int updateLabNormals(LabNormals newLabNorm) {

		int messageCode = -1;

		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());

		// Check for existing country code or name
		try {

			LabNormals oldLab = this.findLabNormal(newLabNorm.getLab_normal_id());

			newLabNorm.setCreated_by(oldLab.getCreated_by());
			newLabNorm.setDate_created(oldLab.getDate_created());
			newLabNorm.setDate_modified(dateModified);

			hibernateTemplate.update(newLabNorm);
			hibernateTemplate.flush();
			messageCode = 3;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return messageCode;
	}	
	
}

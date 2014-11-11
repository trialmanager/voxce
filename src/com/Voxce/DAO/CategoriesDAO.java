package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.Categories;
import com.Voxce.model.Users;

public class CategoriesDAO {

	private HibernateTemplate hibernateTemplate;
	List<Categories> listCategories;
	
//GET HIBERNATE SESSION FACTORY
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

//*** ADD CATEGORY
	public int saveCategory(Categories category, Users user){
		
		int messageCode = -1;
		
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		int language = 1;
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		//Check for existing category code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT category_code FROM Categories WHERE subscriber_id = "+user.getSubscription_id()+" AND category_code=?", category.getCategory_code());
			existingNames = hibernateTemplate.find("SELECT category_name FROM Categories WHERE subscriber_id = "+user.getSubscription_id()+" AND category_name=?", category.getCategory_name());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
		
		if(existingNames.size()!=0){	//Category already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //Category code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //Category code or name is valid, so save it
		
			category.setLanguage_id(language);
			category.setDate_created(dateCreated);
						
			hibernateTemplate.saveOrUpdate(category);
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
			
		return messageCode;
	}
	
//****** GET CATEGORIES LIST
	@SuppressWarnings("unchecked")
	public List<Categories> getCategoriesList(Users user) throws Exception{
		List<Categories> list=(List<Categories>) hibernateTemplate.find("from Categories where subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<Categories>();
		return list;
		
	}

//**** FIND THE CATEGORY	
	public Categories findCategory(int cat_id) {

		Categories category = null;
		List<?> findCategory = null;
		try {
			findCategory = hibernateTemplate.find("FROM Categories WHERE Category_id = ?", cat_id);
			category = (Categories) findCategory.get(0);
		}
		catch(Exception excp){
			System.out.println("Exception Categories = "+ excp);
		}
		
		return category; 
	}
	
//**** UPDATE THE CATEGORY	
	public int updateCategories(Categories newCat){
		
		List<?> existingCodes = null;
		List<?> existingNames = null;
		
		int messageCode = -1;
	
		java.util.Date today = new java.util.Date();
		java.sql.Date dateModified = new java.sql.Date(today.getTime());
		
		//Check for existing Category code or name
		try{
			existingCodes = hibernateTemplate.find("SELECT category_code FROM Categories WHERE subscriber_id = "+newCat.getSubscriber_id()+" AND category_code = ? AND category_id <> ?", newCat.getCategory_code(), newCat.getCategory_id());
			existingNames = hibernateTemplate.find("SELECT category_name FROM Categories WHERE subscriber_id = "+newCat.getSubscriber_id()+" AND category_name = ? AND category_id <> ?", newCat.getCategory_name(), newCat.getCategory_id());
		}
		catch(Exception exp){
			exp.printStackTrace();
		}
	
		if(existingNames.size()!=0){	//Category already exists , 0 is left for empty message string
			messageCode = 1;
		}
		else if(existingCodes.size()!=0){ //Category code already exists
			messageCode = 2;
		}
		else if(existingCodes.size()==0 && existingNames.size()==0){ //category code or name is valid, so save it
			
			try{
				Categories oldCat = this.findCategory(newCat.getCategory_id());
			
				newCat.setLanguage_id(oldCat.getLanguage_id());
				newCat.setCreated_by(oldCat.getCreated_by());
				newCat.setDate_created(oldCat.getDate_created());
				newCat.setDate_modified(dateModified);
				hibernateTemplate.update(newCat);
				hibernateTemplate.flush();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			messageCode = 3;
		}
		else{
			messageCode = 4;
		}
		
		return messageCode;
	}
	
}//END CLASS

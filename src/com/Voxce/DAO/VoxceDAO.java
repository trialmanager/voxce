package com.Voxce.DAO;

import java.util.List;

import org.hibernate.SessionFactory;
import org.jasypt.util.password.rfc2307.RFC2307SMD5PasswordEncryptor;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.Voxce.model.Subscriber;
import com.Voxce.model.Users;

@Transactional
public class VoxceDAO {
	
	private HibernateTemplate hibernateTemplate;
	 
	

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public Users AuthenticateUser(String name,String pass) {
		//Calendar cal = Calendar.getInstance();
		//Date oneDate =new java.sql.Date( cal.getTime().getTime() );
		//Date oneDate = new Date(new java.util.Date().getTime());
		RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
		
		try{
			
			List<Users>  list= (List<Users>) hibernateTemplate.find("FROM Users where login='"+name+"'");
			//user_id 	is_active 	devision_id 	preferred_language_id 	login 	password 	title 	first_name 	middle_name 	last_name 	suffix 	email 	sha1_password 	salt 	address1 	address2 	address3 	city 	state 	country_id 	postal_code 	phone 	cell 	fax 	company 	last_login 	last_logout 	created_by 	date_created 	modified_by 	date_modified
				for(int i  = 0 ; i < list.size() ; i++ ){
					
					if(encriptorClass.checkPassword(pass, list.get(i).getPassword())){
						
						if(list.get(i).getIs_active() == 1){
							return list.get(i);
						}else{
							return null;
						}
					}
							
				}
			return null;
			
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
				
	}
	@SuppressWarnings("unchecked")
	public Subscriber getSubscriber(int subscriber_id) {
		
		try{		
			List<Subscriber> list= (List<Subscriber>) hibernateTemplate.find("FROM Subscriber where subscriber_id="+subscriber_id);			
			Subscriber subscriber=new Subscriber();
			subscriber=(Subscriber) list.get(0);
			return subscriber;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
public String saveSub(Subscriber sub) {
		
		try{		
			hibernateTemplate.update(sub);			
			return "success";
		}catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}
}

package com.Voxce.DAO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.jasypt.util.password.rfc2307.RFC2307SMD5PasswordEncryptor;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.Voxce.mail.Mail;
import com.Voxce.model.Countries;
import com.Voxce.model.Resources;
import com.Voxce.model.ServerConfiguration;
import com.Voxce.model.Subscriber;
import com.Voxce.model.SubscriptionRquest;
import com.Voxce.model.UserGroups;
import com.Voxce.model.Users;
import com.Voxce.model.email_message;

@Transactional
public class AdminDAO {
	private HibernateTemplate hibernateTemplate;
	List<?> data;
	SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	
	
	public int DeactiveUser(int id){
		try{			
			hibernateTemplate.bulkUpdate("Update Users SET is_active='0' where user_id = ?", id);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int ActiveUser(int id){
		try{			
			hibernateTemplate.bulkUpdate("Update Users SET is_active='1' where user_id = ?", id);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int editUser(Users user){
		Calendar cal = Calendar.getInstance();
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		user.setDate_modified(timestamp);
		
		try{
			hibernateTemplate.saveOrUpdate(user);
			hibernateTemplate.flush();
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int saveSubscriber(Users user) {
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
				
		user.setIs_active(1);
		user.setDate_created(timestamp);
		user.setDate_modified(timestamp);
		user.setUser_type("subscriber");
		try{
			data= hibernateTemplate.find("SELECT login FROM Users where login=?",user.getLogin());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(data.size()!= 0)
		{
			for(int i=0;i<data.size();i++)
			{
				System.out.println(data.get(0));
			}
			return 0;  
		}
		else if(data.size()== 0)
		{
			this.email_Welcome_message(user);
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			user.setPassword(encriptorClass.encryptPassword(user.getPassword()));
			hibernateTemplate.flush();
			return 1;
		}
		else
		{
			return 2;
		}
	}
	public int saveSuperAdmin(Users user) {
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
				
		user.setIs_active(1);
		user.setDate_created(timestamp);
		user.setDate_modified(timestamp);
		user.setUser_type("super admin");
		try{
			data= hibernateTemplate.find("SELECT login FROM Users where login=?",user.getLogin());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(data.size()!= 0)
		{
			for(int i=0;i<data.size();i++)
			{
				System.out.println(data.get(0));
			}
			return 0;  
		}
		else if(data.size()== 0)
		{
			this.email_Welcome_message(user);
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			user.setPassword(encriptorClass.encryptPassword(user.getPassword()));
			hibernateTemplate.saveOrUpdate(user);
			hibernateTemplate.flush();
			System.out.println("here....");
			return 1;
		}
		else
		{
			return 2;
		}
	}
	
	@SuppressWarnings("unchecked")
	public SubscriptionRquest getSubscriptionRequestByID(Integer user_id) {
		try{
			List<SubscriptionRquest> lisUser = (List<SubscriptionRquest>) hibernateTemplate.find("FROM SubscriptionRquest WHERE user_id ="+user_id);
			return lisUser.get(0);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public int activateSubscription(int sub_user_id,Integer user_id) {
		
		try{
		SubscriptionRquest sub_Rquest = this.getSubscriptionRequestByID(sub_user_id);
		Users user = new Users();
		user.setAddress1(sub_Rquest.getAddress1());
		user.setAddress2(sub_Rquest.getAddress2());
		user.setAddress3(sub_Rquest.getAddress3());
		user.setCell(sub_Rquest.getCell());
		user.setCity(sub_Rquest.getCity());
		user.setCompany(sub_Rquest.getCompany());
		user.setCountry_id(sub_Rquest.getCountry_id());
		user.setCreated_by(user_id);
		user.setDate_created(sub_Rquest.getDate_created());
		
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
		user.setDate_modified(timestamp);
		user.setDevision_id(sub_Rquest.getDevision_id());
		user.setEmail(sub_Rquest.getEmail());
		user.setFax(sub_Rquest.getFax());
		user.setFirst_name(sub_Rquest.getFirst_name());
		user.setIs_active(sub_Rquest.getIs_active());
		user.setLast_login(sub_Rquest.getLast_login());
		user.setLast_logout(sub_Rquest.getLast_logout());
		user.setLast_name(sub_Rquest.getLast_name());
		user.setLogin(sub_Rquest.getLogin());
		user.setMiddle_name(sub_Rquest.getMiddle_name());
		user.setModified_by(user_id);
		RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
		user.setPassword(encriptorClass.encryptPassword(sub_Rquest.getPassword()));
		user.setPhone(sub_Rquest.getPhone());
		user.setPostal_code(sub_Rquest.getPostal_code());
		user.setPreferred_language_id(sub_Rquest.getPreferred_language_id());
		user.setState(sub_Rquest.getState());
		user.setSuffix(sub_Rquest.getSuffix());
		user.setSubscription_id(sub_Rquest.getSubscription_id());
		Subscriber userSubsription = this.getSubscriberById(sub_Rquest.getSubscription_id());
		userSubsription.setIs_active(1);
		hibernateTemplate.update(userSubsription);
		user.setTitle(sub_Rquest.getTitle());
		user.setUser_type(sub_Rquest.getUser_type());
		hibernateTemplate.save(user);
		user.setPassword(sub_Rquest.getPassword());
		this.email_Welcome_message(user);
		hibernateTemplate.delete(sub_Rquest);
		
		return 1;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}
	
	
	
	public String sendEmail(String to, String email_message, String subject){
		ServerConfiguration serConfig = this.getEmailServerConfigrations();
		Mail mail = new Mail();
		return mail.send_mail(serConfig.getHost(), serConfig.getUser(), serConfig.getPassword(), serConfig.getPort(), serConfig.getFrom(), to, subject, email_message);
		
		
	}
	public Subscriber addSubscription(String name, int user_id) {
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Subscriber subscriber = new Subscriber();
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
		
		try{
			subscriber.setName(name);		
			subscriber.setIs_active(0);
			subscriber.setDate_created(timestamp);
			subscriber.setDate_modified(timestamp);
			subscriber.setCreated_by(user_id);
			subscriber.setModified_by(user_id);
			subscriber.setFirst_visit(1);
			hibernateTemplate.saveOrUpdate(subscriber);
			List<Subscriber> suList = (List<Subscriber>) hibernateTemplate.find("FROM Subscriber ORDER BY subscriber_id DESC LIMIT 1");
			return suList.get(0);
		
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}

	}
	@SuppressWarnings("unchecked")
	public String email_Welcome_message(Users user) {
		
		try{
		List<email_message> emailList =(List<email_message>) hibernateTemplate.find("FROM email_message");
		email_message email = emailList.get(0);
		String messahe = email.getMessage();
		System.out.println("\n\n\n ****************** \n\n\n");
		System.out.println(user.getAddress2()+"  "+user.getAddress2().length());
		System.out.println(user.getCell()+"  "+user.getCell());
		System.out.println(user.getFax()+"  "+user.getFax().length());
		
		messahe = messahe.replaceAll("USERNAME", user.getLogin());
		messahe = messahe.replaceAll("PASSWORD", user.getPassword());
		if(user.getFirst_name() != null && user.getFirst_name().length()>0)
		messahe =messahe.replaceAll("FNAME", user.getFirst_name());
		else
			messahe =messahe.replaceAll("FNAME","Not Provided");
		if(user.getMiddle_name() != null && user.getMiddle_name().length()>0)
		messahe =messahe.replaceAll("MNAME", user.getMiddle_name());
		else
			messahe =messahe.replaceAll("MNAME","Not Provided");
		if(user.getLast_name() != null && user.getLast_name().length()>0)
		messahe =messahe.replaceAll("LNAME", user.getLast_name());
		else
			messahe =messahe.replaceAll("LNAME","Not Provided");
		if(user.getEmail() != null && user.getEmail().length()>0)
		messahe = messahe.replaceAll("EMAIL", user.getEmail());
		else
			messahe =messahe.replaceAll("EMAIL", "Not Provided");
		if(user.getAddress1() != null && user.getAddress1().length()>0)
		messahe =messahe.replaceAll("ADD1", user.getAddress1());
		else
			messahe =messahe.replaceAll("ADD1","Not Provided");
		if(user.getAddress2() != null && user.getAddress2().length()>0)
		messahe =messahe.replaceAll("ADD2", user.getAddress2());
		else
			messahe =messahe.replaceAll("ADD2","Not Provided");
		if(user.getAddress3() != null && user.getAddress3().length()>0)
		messahe =messahe.replaceAll("ADD3", user.getAddress3());
		else
			messahe =messahe.replaceAll("ADD3","Not Provided");
		
		List<Countries> findCountry =(List<Countries>) hibernateTemplate.find("FROM Countries WHERE COUNTRY_ID = ?", user.getCountry_id());
		Countries country = (Countries) findCountry.get(0);
		
		if(country.getCOUNTRY_NAME() != null)
			messahe =messahe.replaceAll("COUNTRY",country.getCOUNTRY_NAME());
		else
			messahe =messahe.replaceAll("COUNTRY","Not Provided");
		if(user.getState() != null && user.getState().length()>0)
			messahe =messahe.replaceAll("STATE", user.getState());
		else
			messahe =messahe.replaceAll("STATE","Not Provided");
		if(user.getCity() != null && user.getCity().length()>0)
			messahe =messahe.replaceAll("CITY", user.getCity());
		else
			messahe =messahe.replaceAll("CITY","Not Provided");
		if(user.getPostal_code() != null && user.getPostal_code().length()>0)
			messahe =messahe.replaceAll("ZIP", user.getPostal_code());
		else
			messahe =messahe.replaceAll("ZIP","Not Provided");
		if(user.getPhone() != null && user.getPhone().length()>0)
			messahe =messahe.replaceAll("PHONE", user.getPhone());
		else
			messahe =messahe.replaceAll("PHONE","Not Provided");
		if(user.getCell() != null && user.getCell().length()>0)
			messahe =messahe.replaceAll("CELL", user.getCell());
		else
			messahe =messahe.replaceAll("CELL","Not Provided");
		if(user.getFax() != null && user.getFax().length()>0)
			messahe =messahe.replaceAll("FAX", user.getFax());
		else
			messahe =messahe.replaceAll("FAX","Not Provided");
		if(user.getCompany() != null && user.getCompany().length()>0)
		messahe =messahe.replaceAll("COMPANY", user.getCompany());
		else
			messahe =messahe.replaceAll("COMPANY","Not Provided");
		
		
		Mail mail = new Mail();
	
		 ServerConfiguration serverConfiguration = this.getEmailServerConfigrations();
		
		mail.send_mail(serverConfiguration.getHost(), serverConfiguration.getUser(), serverConfiguration.getPassword(),serverConfiguration.getPort(), serverConfiguration.getFrom(), user.getEmail(), "Welcome to Voxce", messahe);
			return "success";
		
		}catch(Exception e)
		{
			e.printStackTrace();
			return "Fail";
		}
	}

	@SuppressWarnings("unchecked")
	public List<Subscriber> getSubsriptionsList() {
		try{
			List<Subscriber> subscriber = (List<Subscriber>) hibernateTemplate.find("FROM Subscriber where is_active=1");
			return subscriber;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Subscriber>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<UserGroups> getUserGroups(Users user) {		
		return (List<UserGroups>) hibernateTemplate.find("FROM UserGroups WHERE subscirber_id ='"+user.getSubscription_id()+"' ");
	}
	@SuppressWarnings("unchecked")
	public List<UserGroups> getUserGroups(int id) {		
		return (List<UserGroups>) hibernateTemplate.find("FROM UserGroups WHERE user_id ='"+id+"' ");
	}
	
	

	
	@SuppressWarnings("unchecked")
	public List<Users> listSuperAdminActive(Users user) {
		try{
			return (List<Users>) hibernateTemplate.find("from Users where is_active=1 AND user_type = 'super admin' ORDER BY first_name ASC");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Users>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Users> listSuperAdminInactive(Users user) {	
		try{
			return (List<Users>) hibernateTemplate.find("from Users where is_active=0 AND user_type = 'super admin' ORDER BY first_name ASC");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Users>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Users> listSubscriberActive() {	
		try{
			return (List<Users>) hibernateTemplate.find("from Users where is_active=1 AND user_type = 'subscriber' ORDER BY first_name ASC");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Users>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listSubscriberInactive() {
		try{
			return (List<Users>) hibernateTemplate.find("from Users where is_active=0 AND user_type = 'subscriber' ORDER BY first_name ASC");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Users>();
		}
	}
	

	@SuppressWarnings("unchecked")
	public List<Resources> getUserResources(int resource_id)
	{
		 try{
			 return (List<Resources>) hibernateTemplate.find("from Resources where resource_id=?",resource_id);
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
			 return new ArrayList<Resources>();
		}
		
	}
	@SuppressWarnings("unchecked")
	public ServerConfiguration getEmailServerConfigrations()
	{
		 try{
			 List<ServerConfiguration> listserver = (List<ServerConfiguration>) hibernateTemplate.find("from ServerConfiguration");
			 return listserver.get(0);
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
			 return null;
		}
		
	}
	@SuppressWarnings("unchecked")
	public Subscriber getSubscriberById(int subId){
		
		 try{
			 List<Subscriber> listserver = (List<Subscriber>) hibernateTemplate.find("from Subscriber where subscriber_id = "+subId);
			 return listserver.get(0);
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
			 return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<SubscriptionRquest> getSubscrptionRequestList()
	{
		 try{
			 List<SubscriptionRquest> listserver = (List<SubscriptionRquest>) hibernateTemplate.find("from SubscriptionRquest");
			 return listserver;
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
			 return new ArrayList<SubscriptionRquest>();
		}
		
	}
	
	
}

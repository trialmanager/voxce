package com.Voxce.DAO;

import java.sql.Date;
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
import com.Voxce.model.SubscriptionRquest;
import com.Voxce.model.UserGroups;
import com.Voxce.model.Users;
import com.Voxce.model.email_message;

@Transactional
public class UsersDAO {
	private HibernateTemplate hibernateTemplate;
	List<?> data;
	SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public int SaveUserGroups(Users user,int userid,List<Integer> groups){		
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		
		try
		{
			hibernateTemplate.bulkUpdate("DELETE FROM UserGroups WHERE  user_id='"+userid+"'");
			if(groups != null)	
			for(int i=0;i<groups.size();i++)
				{
					UserGroups obj=new UserGroups();
					obj.setUser_id(userid);
					obj.setSubscriber_id(user.getSubscription_id());
					obj.setGroup_id(groups.get(i));
					obj.setCreated_by(user.getUser_id());
					obj.setModified_by(user.getUser_id());
					obj.setDate_created(date);
					obj.setDate_modified(date);
					hibernateTemplate.saveOrUpdate(obj);					
				}
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public String passwordReset(int user_id, String oldPassword , String newpassword){
		try{
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			Users user = this.getUserByID(user_id);
			if(encriptorClass.checkPassword(oldPassword,user.getPassword())){
				user.setPassword(encriptorClass.encryptPassword(newpassword));
				//user.setLogin(user.getLogin());
				hibernateTemplate.saveOrUpdate(user);
				return "success";
			}else{
				return "fail old";
			}
		}catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}	
	}
	
	public String passwordReset(int user_id, String oldPassword , String newpassword, String userName){
		try{
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			Users user = this.getUserByID(user_id);
			if(encriptorClass.checkPassword(oldPassword,user.getPassword())){
				user.setPassword(encriptorClass.encryptPassword(newpassword));
				user.setLogin(userName);
				hibernateTemplate.saveOrUpdate(user);
				return "success";
			}else{
				return "fail old";
			}
		}catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}	
	}
	
	@SuppressWarnings("unchecked")
	public String forgetPassword(String email){
		
		try{	
			
			List<Users> userList = (List<Users>) hibernateTemplate.find("from Users where email = ?", email);
			Users user = userList.get(0);
			List<ServerConfiguration> servConfig = (List<ServerConfiguration>) hibernateTemplate.find("from ServerConfiguration");
			ServerConfiguration serConfig = servConfig.get(0);
			Mail sendMail = new Mail();
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			String password = this.genrateRendomPassword();
			user.setPassword(encriptorClass.encryptPassword(password));
			String subject = "Forget Password";
			hibernateTemplate.update(user);
			String email_message = "user name: "+user.getLogin()+"<br> password: "+password;
			String result = sendMail.send_mail(serConfig.getHost(), serConfig.getUser(), serConfig.getPassword(),serConfig.getPort(), serConfig.getFrom(), email, subject, email_message);
			if(result.equals("fail")){
				return "fail";
			}else{
				return "success";
			}
		
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	
	@SuppressWarnings("unchecked")
	public String emailExists(String email){
		
		try{			
			List<Users> userList = (List<Users>) hibernateTemplate.find("from Users where email = ?", email);
			if( userList != null && userList.size() == 0 ){
				
						
				return "success";
			}else{
				return "fail";
			}
		
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	
	@SuppressWarnings("unchecked")
	public String subReqEmailExists(String email){
		
		try{	
			List<SubscriptionRquest> userList = new ArrayList<SubscriptionRquest>();
			userList = (List<SubscriptionRquest>) hibernateTemplate.find("from SubscriptionRquest where email='"+email+"'");
			if( userList != null && userList.size() == 0 ){
				System.out.println("***--**-nnnnnnnnnnnnnnnnnnnnnnnn*-*-*-*-*-*");
				return "success";
			}else{
				System.out.println("***--**-ppppppppppppppppppppp*-*-*-*-*-*");
				return "fail";
			}
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("***--**-lllllllllllllllllllllll*-*-*-*-*-*");
			return "fail";
		}
	}
	
	@SuppressWarnings("unchecked")
	public String userNameExists(String userName){
		
		try{			
			List<Users> userList = (List<Users>) hibernateTemplate.find("from Users where login = ?", userName);
			if( userList != null && userList.size() == 0 ){
				
						
				return "success";
			}else{
				return "fail";
			}
		
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	
	public int DeleteUser(int id)
	{
		try{			
			hibernateTemplate.bulkUpdate("Update Users SET is_active='0' where user_id = ?", id);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int ActiveUser(int id)
	{
		try{			
			hibernateTemplate.bulkUpdate("Update Users SET is_active='1' where user_id = ?", id);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int editUser(Users user) {
		Calendar cal = Calendar.getInstance();
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		user.setDate_modified(timestamp);
		
		try{
			
			
			//RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			//user.setPassword(encriptorClass.encryptPassword(user.getPassword()));
			hibernateTemplate.update(user);
			hibernateTemplate.flush();
		
			//this.email_Welcome_message(user);
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public int saveUser(Users user) {
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
				
		user.setIs_active(1);
		user.setDate_created(timestamp);
		user.setDate_modified(timestamp);
		
		try{
			data= hibernateTemplate.find("SELECT login FROM Users where login=?",user.getLogin());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(data.size()!= 0)
		{
			return 0;  
		}
		else if(data.size()== 0)
		{
			String password  = user.getPassword();
			
			RFC2307SMD5PasswordEncryptor encriptorClass = new RFC2307SMD5PasswordEncryptor();
			user.setPassword(encriptorClass.encryptPassword(user.getPassword()));
			hibernateTemplate.saveOrUpdate(user);
			hibernateTemplate.flush();
			user.setPassword(password);
			this.email_Welcome_message(user);
			return 1;
		}
		else
		{
			return 2;
		}
	}
	
	public int saveSubscriber(SubscriptionRquest user) {
		Calendar cal = Calendar.getInstance();
		//Date date =new java.sql.Date( cal.getTime().getTime() );
		Timestamp timestamp =new java.sql.Timestamp( cal.getTime().getTime() );
		
				
		user.setIs_active(1);
		user.setDate_created(timestamp);
		user.setDate_modified(timestamp);
		
		try{
			data= hibernateTemplate.find("SELECT login FROM SubscriptionRquest where email=?",user.getEmail());
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
			hibernateTemplate.saveOrUpdate(user);
			hibernateTemplate.flush();
			return 1;
		}
		else
		{
			return 2;
		}
	}
	
	public String myAccountSetting(Users user){
		return "succuess";
	}
	
	public String genrateRendomPassword(){
		int PASSWORD_LENGTH = 8;  
	    StringBuffer sb = new StringBuffer();  
	    for (int x = 0; x < PASSWORD_LENGTH; x++)  
	    {  
	      sb.append((char)((int)(Math.random()*26)+97));  
	    }
	    return sb.toString();
	}
	
	@SuppressWarnings("unchecked")
	public Users getUserByID(Integer user_id) {
		try{
			List<Users> lisUser = (List<Users>) hibernateTemplate.find("FROM Users WHERE user_id ="+user_id);
			return lisUser.get(0);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<UserGroups> getUserGroups(Users user){
		List<UserGroups> list=(List<UserGroups>) hibernateTemplate.find("FROM UserGroups WHERE user_id='"+user.getUser_id()+"' ");
		if(list==null)
			return new ArrayList<UserGroups>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<UserGroups> getUserGroups(int id) {
		List<UserGroups> list=(List<UserGroups>) hibernateTemplate.find("FROM UserGroups WHERE user_id ='"+id+"' ");
		if(list==null)
			return new ArrayList<UserGroups>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listStudySiteinvestigators(int studyid,int siteid) {			
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ug.user_id FROM UserGroups ug WHERE  ug.group_id IN ( SELECT g.id FROM Groups g WHERE  g.name LIKE '%Investigator%')) AND us.user_id IN ( SELECT ssu.user_id FROM Study_Site_Users ssu WHERE ssu.study_id ='"+studyid+"' AND ssu.site_id='"+siteid+"') ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listStudyUsers(Users user ,int studyid) {
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ssu.user_id FROM Study_Site_Users ssu WHERE ssu.study_id ='"+studyid+"') AND us.subscription_id='"+user.getSubscription_id()+"' ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listStudySiteUsers(int studyid,int siteid) {		
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ssu.user_id FROM Study_Site_Users ssu WHERE ssu.study_id ='"+studyid+"' AND ssu.site_id='"+siteid+"') ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> Sitelistinvestigators(int id) {
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ug.user_id FROM UserGroups ug WHERE  ug.group_id IN ( SELECT g.id FROM Groups g WHERE  g.name LIKE '%Investigator%')) AND us.user_id IN( SELECT su.user_id FROM SitesUsers su WHERE su.site_id ='"+id+"') ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listinvestigators(Users user) {	
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.subscription_id="+user.getSubscription_id()+" AND us.user_id IN( SELECT ug.user_id FROM UserGroups ug WHERE ug.group_id IN ( SELECT g.id FROM Groups g WHERE  g.name LIKE '%Investigator%')) ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listStudyinvestigators(int id) {		
		List<Users> list=(List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN( SELECT ug.user_id FROM UserGroups ug WHERE  ug.group_id IN ( SELECT g.id FROM Groups g WHERE  g.name LIKE '%Investigator%')) AND us.user_id IN ( SELECT ssu.user_id FROM Study_Site_Users ssu WHERE ssu.study_id ='"+id+"') ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listusers(Users user) {		
		List<Users> list=(List<Users>) hibernateTemplate.find("from Users where subscription_id="+user.getSubscription_id()+" AND is_active=1 ORDER BY first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listusersAndSuperAdmin(Users user) {		
		List<Users> list=(List<Users>) hibernateTemplate.find("from Users where (subscription_id="+user.getSubscription_id()+" OR user_type = 'super admin') AND is_active=1 ORDER BY first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> listusersInactive(Users user) {		
		List<Users> list= (List<Users>) hibernateTemplate.find("from Users where subscription_id="+user.getSubscription_id()+" AND is_active=0 ORDER BY first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> SitesUsersList(int id) {		
		List<Users> list= (List<Users>) hibernateTemplate.find("SELECT us FROM Users us WHERE us.user_id IN (SELECT su.user_id FROM SitesUsers su WHERE su.site_id='"+id+"') ORDER BY us.first_name ASC");
		if(list==null)
			return new ArrayList<Users>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	
	
	public List<Resources> getUserResources(int resource_id)

	{
		List<Resources> list=null;
		list= hibernateTemplate.find("from Resources where resource_id=?",resource_id); 
		if(list==null)
			return new ArrayList<Resources>();
		return list;
		
	}
	
	@SuppressWarnings("unchecked")
	public String email_Welcome_message(Users user){
		
		try{
		
		List<email_message> emailList =(List<email_message>) hibernateTemplate.find("FROM email_message");
		email_message email = emailList.get(0);
		String messahe = email.getMessage();
		
		messahe = messahe.replaceAll("USERNAME", user.getLogin());
		messahe = messahe.replaceAll("PASSWORD", user.getPassword());
		if(user.getFirst_name() != null)
		messahe =messahe.replaceAll("FNAME", user.getFirst_name());
		else
			messahe =messahe.replaceAll("FNAME","");
		if(user.getMiddle_name() != null)
		messahe =messahe.replaceAll("MNAME", user.getMiddle_name());
		else
			messahe =messahe.replaceAll("MNAME","");
		if(user.getLast_name() != null)
		messahe =messahe.replaceAll("LNAME", user.getLast_name());
		else
			messahe =messahe.replaceAll("LNAME","");
		if(user.getEmail() != null)
		messahe = messahe.replaceAll("EMAIL", user.getEmail());
		else
			messahe =messahe.replaceAll("EMAIL", "");
		if(user.getAddress1() != null)
		messahe =messahe.replaceAll("ADD1", user.getAddress1());
		else
			messahe =messahe.replaceAll("ADD1","");
		if(user.getAddress2() != null)
		messahe =messahe.replaceAll("ADD2", user.getAddress2());
		else
			messahe =messahe.replaceAll("ADD2","");
		if(user.getAddress3() != null)
		messahe =messahe.replaceAll("ADD3", user.getAddress3());
		else
			messahe =messahe.replaceAll("ADD3","");
		
		List<Countries> findCountry =(List<Countries>) hibernateTemplate.find("FROM Countries WHERE COUNTRY_ID = ?", user.getCountry_id());
		Countries country = (Countries) findCountry.get(0);
		
		if(country.getCOUNTRY_NAME() != null)
		messahe =messahe.replaceAll("COUNTRY",country.getCOUNTRY_NAME());
		else
			messahe =messahe.replaceAll("COUNTRY","");
		if(user.getState() != null)
		messahe =messahe.replaceAll("STATE", user.getState());
		else
			messahe =messahe.replaceAll("STATE","");
		if(user.getCity() != null)
		messahe =messahe.replaceAll("CITY", user.getCity());
		else
			messahe =messahe.replaceAll("CITY","");
		if(user.getPostal_code() != null)
		messahe =messahe.replaceAll("ZIP", user.getPostal_code());
		else
			messahe =messahe.replaceAll("ZIP","");
		if(user.getPhone() != null)
		messahe =messahe.replaceAll("PHONE", user.getPhone());
		else
			messahe =messahe.replaceAll("PHONE","");
		if(user.getCell() != null)
		messahe =messahe.replaceAll("CELL", user.getCell());
		else
			messahe =messahe.replaceAll("CELL","");
		if(user.getFax() != null)
		messahe =messahe.replaceAll("FAX", user.getFax());
		else
			messahe =messahe.replaceAll("FAX","");
		if(user.getCompany() != null)
		messahe =messahe.replaceAll("COMPANY", user.getCompany());
		else
			messahe =messahe.replaceAll("COMPANY","");
		
		
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
	

	
}

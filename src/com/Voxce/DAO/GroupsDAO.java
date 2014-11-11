package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.GroupRights;
import com.Voxce.model.Groups;
import com.Voxce.model.Resources;
import com.Voxce.model.Users;


public class GroupsDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public int saveGroupRights(int userid,long groupID, List<Integer> Rights)
	{
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		try{
			List<Resources> resource= hibernateTemplate.find("FROM Resources ORDER BY resource_id ASC");
			
			hibernateTemplate.bulkUpdate("DELETE FROM GroupRights WHERE GROUP_ID='"+groupID+"'");
			int temp=-1;
			
			/*for(int i=0;i<resource.size();i++)
			{
				if(resource.get(i).getResource_id()==9 ||resource.get(i).getResource_id()==10 ||resource.get(i).getResource_id()==11)
				{
					for(int j=0;j<3;j++)
					{
							GroupRights obj=new GroupRights();
							obj.setGROUP_ID((int)groupID);						
							obj.setRESOURCE_ID(resource.get(i).getResource_id());
							obj.setRIGHT_TYPE_ID(Rights.get(temp));
							obj.setDATE_CREATED(oneDate);
							obj.setCREATED_BY(userid);
							obj.setDATE_MODIFIED(oneDate);
							obj.setMODIFIED_BY(userid);
							temp++;
							hibernateTemplate.saveOrUpdate(obj);
					}
				}
				else
				{
					for(int j=0;j<4;j++)
					{
						GroupRights obj=new GroupRights();
						obj.setGROUP_ID((int)groupID);						
						obj.setRESOURCE_ID(resource.get(i).getResource_id());
						obj.setRIGHT_TYPE_ID(Rights.get(temp));
						obj.setDATE_CREATED(oneDate);
						obj.setCREATED_BY(userid);
						obj.setDATE_MODIFIED(oneDate);
						obj.setMODIFIED_BY(userid);
						temp++;
						hibernateTemplate.saveOrUpdate(obj);
					}
				}
				
				
				
			}*/
				//-------------------------------------------------------
			
			
			for(int i=5;i<Rights.size();i++)
			{
				
				GroupRights rights=new GroupRights();
				rights.setGROUP_ID((int)groupID);						
				
				if(Rights.get(i)==9){
					rights.setRIGHT_TYPE_ID(1);
					//temp++;
				}
				else if(Rights.get(i)==8){
					rights.setRIGHT_TYPE_ID(0);
					//temp++;
				}
				else if(Rights.get(i)==4){
					temp++;
					continue;
				}
				else{
					rights.setRIGHT_TYPE_ID(Rights.get(i));
				}
				
				if(temp>179)
					break;
				
				rights.setRESOURCE_ID(resource.get(temp).getResource_id());
				
				rights.setDATE_CREATED(oneDate);
				rights.setCREATED_BY(userid);
				rights.setDATE_MODIFIED(oneDate);
				rights.setMODIFIED_BY(userid);
				hibernateTemplate.saveOrUpdate(rights);
			}
			System.out.println("Completed");		
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int saveGroup(Groups group, Users user) {
		Calendar cal = Calendar.getInstance();
		Date oneDate =new java.sql.Date(cal.getTime().getTime() );
		
		group.setDate_created(oneDate);
		group.setDate_modified(oneDate);
		
		try{
			data= hibernateTemplate.find("SELECT name FROM Groups where name='"+group.getName()+"' AND subscriber_id='"+user.getSubscription_id()+"'");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(data.size()!= 0)
		{
			
			return 0;  
		}
		// Group Name Does not Exists //
		else if(data.size()== 0)
		{
			hibernateTemplate.saveOrUpdate(group);
			hibernateTemplate.flush();
			return 1;			
		}
		return 0;
	}
	@SuppressWarnings("unchecked")
	public List<Resources> getResources(){
		List<Resources> list=new ArrayList<Resources>();
		list=hibernateTemplate.find("FROM Resources ORDER BY resource_id ASC");
		if(list==null)
			return new ArrayList<Resources>();
		return list;
	}
	
	public int deleteGroup(Groups group) 
	{
		  try{
			//  Calendar cal = Calendar.getInstance();
		     // Date oneDate =new java.sql.Date( cal.getTime().getTime() );
		
		      hibernateTemplate.delete(group);
		      hibernateTemplate.bulkUpdate("DELETE FROM GroupRights WHERE GROUP_ID='"+group.getId()+"'");
		      hibernateTemplate.flush();
		   }
		   catch(Exception e){return 0;}		   
		   return 1;		  
	}
		 
	 public int editGroup(Groups group) {	  
	  
	  Calendar cal = Calendar.getInstance();
	  Date oneDate =new java.sql.Date( cal.getTime().getTime() );
	  //Date oneDate = new Date(new java.util.Date().getTime());
	  long modified_by = 1;
	   
	  group.setModified_by(modified_by);
	  group.setDate_modified(oneDate);
	  
	  group.setCreated_by(1L);
	  group.setDate_created(oneDate);
	  group.setIs_global("y");
	 
	   try{
	   hibernateTemplate.update(group);
	   hibernateTemplate.flush();
	   }
	   catch(Exception e){System.out.println(e);}
	   return 1;
	 }
	
	@SuppressWarnings("unchecked")
	
	public List<GroupRights> listGroupRights(long groupid) {
		try{
			List<GroupRights> list= (List<GroupRights>) hibernateTemplate.find("from GroupRights WHERE GROUP_ID='"+groupid+"'");
			if(list==null)
				return new ArrayList<GroupRights>();
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<GroupRights>();
			
			// TODO: handle exception
		}
	}
	
	@SuppressWarnings("unchecked")
	
	public List<Resources> listResources() {
		try{
			List<Resources> list=(List<Resources>) hibernateTemplate.find("from Resources");
			if(list==null)
				return new ArrayList<Resources>();
			return list;
		}
		catch (Exception e) {
			return new ArrayList<Resources>();
			// TODO: handle exception
		}
	}
	
	@SuppressWarnings("unchecked")
	
	public List<Groups> listGroup(Users user) {
		try{
				List<Groups> list=(List<Groups>) hibernateTemplate.find("from Groups where subscriber_id="+user.getSubscription_id()+" ORDER BY name ASC");
				if(list==null)
				{
					return new ArrayList<Groups>();
				}
				return list;
		}
		catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Groups>();
		}
	}
	
	
	
	public void saveResource(Resources resource)
	{
		hibernateTemplate.save(resource);
	}
	public void deleteResources()
	{
		hibernateTemplate.deleteAll(getResources());
	}
	
			
	
}

package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Users;

public class protocolVersionDAO {

		private HibernateTemplate hibernateTemplate;		
		List<ProtocolVersion> list;
		
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.hibernateTemplate = new HibernateTemplate(sessionFactory);
		}
		
		@SuppressWarnings("unchecked")
		public int SaveNewProtocol(ProtocolVersion obj)
		{
			try
			{
				list=hibernateTemplate.find("FROM ProtocolVersion WHERE protocol_id = '"+obj.getProtocol_id()+"' AND version = '"+obj.getVersion()+"'");
				
				if(list.size()==0)
				{
					hibernateTemplate.saveOrUpdate(obj);
					return 1;
				}
				else
				{
					return 2;
				}
				
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
		
		public int EditProtocol(ProtocolVersion obj)
		{
			try
			{				
			   hibernateTemplate.saveOrUpdate(obj);
			   return 1;
				
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
		}
		
		public int EditProtocol()
		{
			return 0;
		}
		
		public int DeleteProtocol()
		{
			return 0;
		}
		
		
		@SuppressWarnings("unchecked")
		public List<ProtocolVersion> getProtocolVersionList(Users user) {
			List<ProtocolVersion> list= (List<ProtocolVersion>) hibernateTemplate.find("FROM ProtocolVersion WHERE subscriber_id='"+user.getSubscription_id()+"' ORDER BY start_date ASC");
			if(list==null)
				return new ArrayList<ProtocolVersion>();
			return list;
		}
		
		@SuppressWarnings("unchecked")
		public List<ProtocolVersion> getStudyProtocolVersionList(int studyid) {		
			List<ProtocolVersion> list=(List<ProtocolVersion>) hibernateTemplate.find("FROM ProtocolVersion WHERE study_id='"+studyid+"' ORDER BY start_date ASC");
			if(list==null)
				return new ArrayList<ProtocolVersion>();
			return list;
		}
		
		@SuppressWarnings("unchecked")
		public ProtocolVersion getProtocol(int id) {		
			try{
				List<ProtocolVersion> li= hibernateTemplate.find("FROM ProtocolVersion WHERE protocol_version_id='"+id+"'");
				return li.get(0);
			}
			catch (Exception e) {
				// TODO: handle exception
				return new ProtocolVersion();
			}
		}
		
		
		public Date GetLastProtocolStartDate(int studyid) {		
			try{
				Date protocoldate= (Date) hibernateTemplate.find("SELECT MAX(start_date) AS startdate FROM ProtocolVersion WHERE study_id='"+studyid+"'").get(0);
				return protocoldate;
			}
			catch (Exception e) {
				// TODO: handle exception
				Calendar cal = Calendar.getInstance();	
				Date date =new java.sql.Date( cal.getTime().getTime() );
				return date;
			}
		}
	
}
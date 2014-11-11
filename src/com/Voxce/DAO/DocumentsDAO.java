package com.Voxce.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JFrame;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.StudyDocuments;
import com.Voxce.model.StudySites;
import com.Voxce.model.Users;

public class DocumentsDAO {

	private HibernateTemplate hibernateTemplate;
	List<StudyDocuments> list;
	String query = null;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	
	@SuppressWarnings("unchecked")
	public StudyDocuments find(int id) {
		try{
			list= (List<StudyDocuments>) hibernateTemplate.find("FROM StudyDocuments WHERE study_document_id='"+id+"'");
			return list.get(0);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	public int  SaveDocument(int id)
	{
		System.out.println("here in dialog");
		JFileChooser kbFileDialogWin = new JFileChooser();
		kbFileDialogWin.setAcceptAllFileFilterUsed(false);
		//kbFileDialogWin.addChoosableFileFilter(new PDFFileFilter());
		//kbFileDialogWin.addChoosableFileFilter(new PNGFileFilter());
		kbFileDialogWin.setDialogType(JFileChooser.SAVE_DIALOG);
		kbFileDialogWin.showDialog(new JFrame(),"one");
		return 0;
	}
	
	
	public int DeleteDocument(int id)
	{
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM StudyDocuments WHERE study_document_id='"+id+"' ");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public int UploadSiteDocument(FileItem item,String Type,Users currentuser,int studyid,int siteid)
	{		
		List<StudySites> temp=hibernateTemplate.find("FROM StudySites WHERE study_id='"+studyid+"' AND site_id='"+siteid+"'");
		int studysiteid=temp.get(0).getStudy_site_id();
		if(temp.size()!=0)
		{
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date( cal.getTime().getTime() );
			StudyDocuments obj=new StudyDocuments();
			obj.setDocument_name(item.getName());
			obj.setDescription(item.getFieldName());
			obj.setType(Type);
			obj.setFilename(item.getName());
			obj.setStudy_id(studyid);
			obj.setStudy_site_id(studysiteid);
			obj.setCreated_by(currentuser.getUser_id());
			obj.setDate_created(date);
			obj.setModified_by(currentuser.getUser_id());
			obj.setDate_modified(date);
			obj.setData(item.get());
			
			try{
				hibernateTemplate.saveOrUpdate(obj);
				return 1;
							
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}			
		}
		else
		{
			return 0;
		}
	}
	
	public int UploadDocument(FileItem item,String Type,Users currentuser,int id)
	{
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		StudyDocuments obj=new StudyDocuments();
		obj.setDocument_name(item.getName());
		obj.setDescription(item.getFieldName());
		obj.setType(Type);
		obj.setFilename(item.getName());
		obj.setStudy_id(id);
		obj.setCreated_by(currentuser.getUser_id());
		obj.setDate_created(date);
		obj.setModified_by(currentuser.getUser_id());
		obj.setDate_modified(date);
		obj.setData(item.get());
		
		try{
			hibernateTemplate.saveOrUpdate(obj);
						
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	public List<StudyDocuments> getStudyDocuments(int id) {		
		List<StudyDocuments> list= (List<StudyDocuments>) hibernateTemplate.find("FROM StudyDocuments WHERE study_id='"+id+"'");
		if(list==null)
			return new ArrayList<StudyDocuments>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudyDocuments> getStudySiteDocuments(int studyid,int siteid) {		
		List<StudyDocuments> list=(List<StudyDocuments>) hibernateTemplate.find("SELECT sd FROM StudyDocuments sd WHERE sd.study_site_id IN(SELECT ss.study_site_id FROM StudySites ss WHERE ss.study_id='"+studyid+"' AND ss.site_id='"+siteid+"')");
		if(list==null)
			return new ArrayList<StudyDocuments>();
		return list;
	}


}// End Class



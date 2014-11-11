package com.Voxce.DAO;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Question;
import com.Voxce.model.Question_Logs;
import com.Voxce.model.Section;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;

public class CRFDAO {
	private HibernateTemplate hibernateTemplate;
;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	public int SaveQestion(Question question, Users user){
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{	
			Integer question_id = question.getQuestion_id();
			if(question_id != null){
				
				List<Question> list =(List<Question>) hibernateTemplate.find("FROM Question WHERE subscriber_id = "+user.getSubscription_id()+" AND question_id='"+question_id+"'");
				if(list.size() == 1){
					Question exQuestion = (Question)list.get(0);
					exQuestion.setQuestion_name(question.getQuestion_name());
					exQuestion.setQuestion_html(question.getQuestion_html());
					exQuestion.setQuestion_edit_html(question.getQuestion_edit_html());
					exQuestion.setModfiedBy(question.getModfiedBy());
					
					hibernateTemplate.saveOrUpdate(exQuestion);
				}
 			}else{
 				hibernateTemplate.saveOrUpdate(question);
 			}
			
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public int SaveSection(Section section,Users user){
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{	
			Integer section_id = section.getSection_id();
			if(section_id != null){
				
				List<Section> list =(List<Section>) hibernateTemplate.find("FROM Section WHERE subscriber_id = "+user.getSubscription_id()+" AND section_id='"+section_id+"'");
				if(list.size() == 1){
					Section exSection = (Section)list.get(0);
					exSection.setSection_name(section.getSection_name());
					exSection.setSection_html(section.getSection_html());
					exSection.setSection_edit_html(section.getSection_edit_html());
					
					hibernateTemplate.saveOrUpdate(exSection);
				}
 			}else{
 				hibernateTemplate.saveOrUpdate(section);
 			}
			
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	public int SaveCRF(CaseReportForms caseReportForms, Users user){
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		try
		{	
			Integer crfId = caseReportForms.getCrf_id();
			if(crfId != null){
				
				List<CaseReportForms> list =(List<CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms WHERE subscriber_id = "+user.getSubscription_id()+" AND crf_id='"+crfId+"'");
				if(list.size() == 1){
					CaseReportForms exCaseReportForms = (CaseReportForms)list.get(0);
					exCaseReportForms.setCrf_name(caseReportForms.getCrf_name());
					exCaseReportForms.setCrf_html(caseReportForms.getCrf_html());
					exCaseReportForms.setCrf_edit_html(caseReportForms.getCrf_edit_html());
					exCaseReportForms.setDate_modified(date);
					exCaseReportForms.setModified_by(caseReportForms.getModified_by());
					
					
					hibernateTemplate.saveOrUpdate(exCaseReportForms);
				}
 			}else{
 				caseReportForms.setDate_created(date);
 				caseReportForms.setDate_modified(date);
 				caseReportForms.setSubscriber_id(user.getSubscription_id());
 				hibernateTemplate.saveOrUpdate(caseReportForms);
 			}
			
			
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public int questionTrail(Users user, Date timeDate, String questionName,String change, String action, String oldQuestionName){
		try{
			Integer questionId = getQuestionIdByName(oldQuestionName, user);
			Calendar cal = Calendar.getInstance();
			  Date onDate =new java.sql.Date(cal.getTime().getTime());  
			  Time onTime=new java.sql.Time(cal.getTime().getTime());
			   Question_Logs obj=new Question_Logs();
			   obj.setQuestion_id(1);
			   obj.setQuestion_name(questionName);
			   obj.setModified_by(user.getUser_id());
			   obj.setUser_name(user.getFirst_name()+" "+user.getLast_name());
			   obj.setChange_info(change);
			   obj.setQuestion_id(questionId);
			   obj.setDate(onDate);
			   obj.setTime(onTime);
			   hibernateTemplate.saveOrUpdate(obj);
		return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public int sectionTrail(String username,Date timeDate, String sectionName, String action){
		
		return 1;
	}
	public int CrfTrail(String username,Date timeDate, String crfName, String action){
		
		return 1;
	}
	@SuppressWarnings("unchecked")
	public String getQuestionName(int questionId){
		try{
			List<Question> qlist = new ArrayList<Question>();
			qlist =(List<Question>) hibernateTemplate.find("FROM Question WHERE question_id='"+questionId+"'");
			return qlist.get(0).getQuestion_name();
		}catch(Exception e)
		{
			e.printStackTrace();
			return "`-`-`false`-`-`";
		}
		
		
	}
	
	
	@SuppressWarnings("unchecked")
	public Integer getQuestionIdByName(String questionName,Users user){
		try{
			List<Question> qlist = new ArrayList<Question>();
			qlist = (List<Question>) hibernateTemplate.find("FROM Question WHERE subscriber_id = "+user.getSubscription_id()+" AND question_name='"+questionName+"'");
			return (Integer)qlist.get(0).getQuestion_id();
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		
		
	}
	
	@SuppressWarnings("unchecked")
	public String getSectionName(int sectionId){
		try{
			List<Section> slist = new ArrayList<Section>();
			slist = (List<Section>) hibernateTemplate.find("FROM Section WHERE section_id='"+sectionId+"'");
			return slist.get(0).getSection_name();
		}catch(Exception e)
		{
			e.printStackTrace();
			return "`-`-`false`-`-`";
		}
		
		
	}
	@SuppressWarnings("unchecked")
	public String getCRFName(int crfId){
		try{
			List<CaseReportForms> slist = new ArrayList<CaseReportForms>();
			slist = (List<CaseReportForms>) hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+crfId+"'");
			return slist.get(0).getCrf_name();
		}catch(Exception e)
		{
			e.printStackTrace();
			return "`-`-`false`-`-`";
		}
		
		
	}
	
	public int delete(int questionId){
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM Question WHERE question_id='"+questionId+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		
	}
	public int deleteSection(int sectionId){
		try{
			hibernateTemplate.bulkUpdate("DELETE FROM Section WHERE section_id='"+sectionId+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		
	}
	@SuppressWarnings("unchecked")
	public int deleteCRF(int crfId){
		try{
		
		List<VisitCrfs> crfList = (List<VisitCrfs>) hibernateTemplate.find("FROM VisitCrfs WHERE case_report_form_id='"+crfId+"'");
		if(crfList.size() != 0){
			return -1;
		}
			hibernateTemplate.bulkUpdate("DELETE FROM CaseReportForms WHERE crf_id='"+crfId+"'");
			return 1;
		}catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		
	}
	@SuppressWarnings("unchecked")
	public Question findQuestionById(Integer questionId){
		if(questionId != null){
			
			List<Question> list = (List<Question>) hibernateTemplate.find("FROM Question WHERE question_id='"+questionId+"'");
			if(list.size() == 1){
				return (Question)list.get(0);
			}
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public Section findSectionById(Integer sectionId){
		
		
		if(sectionId != null){
			
			List<Section> list = (List<Section>) hibernateTemplate.find("FROM Section WHERE section_id='"+sectionId+"'");
			if(list.size() == 1){
				return (Section)list.get(0);
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public CaseReportForms findCRFById(Integer crfId){
		
		
		if(crfId != null){
			
			List<CaseReportForms> list =hibernateTemplate.find("FROM CaseReportForms WHERE crf_id='"+crfId+"'");
			if(list.size() == 1){
				return (CaseReportForms)list.get(0);
			}
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Question> questionsList(Users user){
		try{
			List<Question> list=(List<Question>) hibernateTemplate.find("from Question WHERE subscriber_id="+user.getSubscription_id()+"");
			if(list==null)
				return new ArrayList<Question>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<Question>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Section> sectionList(Users user){
		try{
			
			List<Section> list= (List<Section>) hibernateTemplate.find("from Section WHERE subscriber_id="+user.getSubscription_id()+"");
			if(list==null)
				return new ArrayList<Section>();
			return list;
		
		}catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Section>();
		}
	}
	@SuppressWarnings("unchecked")
	public List<CaseReportForms> cfrList(Users user){
		try{
			List<CaseReportForms> list= (List<CaseReportForms>) hibernateTemplate.find("from CaseReportForms WHERE subscriber_id="+user.getSubscription_id()+"");
			if(list==null)
				return new ArrayList<CaseReportForms>();
			return list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<CaseReportForms>();
		}
	}
	
}

package com.Voxce.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Voxce.Views.VisitNamesView;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;


public class VisitNameTextsDAO  {

	private HibernateTemplate hibernateTemplate;
	List<?> data;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public List<VisitNameTexts> listvisitnames(Users user) {	
		List<VisitNameTexts> list=(List<VisitNameTexts>) hibernateTemplate.find("FROM VisitNameTexts WHERE subscriber_id="+user.getSubscription_id());
		if(list==null)
			return new ArrayList<VisitNameTexts>();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<VisitNamesView> listStudyvisitsnames(Users user,int StudyID) {	
		try{
			List<Visits> list=(List<Visits>)  hibernateTemplate.find("FROM Visits WHERE study_id = '"+StudyID+"'");
			if(list!=null){
				List<VisitNamesView> li=new ArrayList<VisitNamesView>();	
				
				for(int i=0;i<list.size();i++){
					VisitNameTexts obj =  (VisitNameTexts) hibernateTemplate.find("FROM VisitNameTexts WHERE visit_name_text_id = '"+list.get(i).getVisit_name_text_id()+"' AND subscriber_id='"+user.getSubscription_id()+"'").get(0);
					VisitNamesView vnw=new VisitNamesView();
					vnw.setVisitid(list.get(i).getVisit_id());
					vnw.setVisitsvisitnametextid(list.get(i).getVisit_name_text_id());
					vnw.setVisitnametextid(obj.getVisit_name_text_id());
					vnw.setVisitname(obj.getVisit_name());
					li.add(vnw);
				}
				if(li.size()==0)
					return new ArrayList<VisitNamesView>();
				else
					return li;
			}else{
				return new ArrayList<VisitNamesView>();
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return new ArrayList<VisitNamesView>();
		}
		
	}// End OF Method
	
}

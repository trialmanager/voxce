package com.Voxce.Controllers;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.LaboratoryDAO;
import com.Voxce.DAO.SitesDAO;
import com.Voxce.DAO.SponsorDivisionUserDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.StudySitesDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.Countries;
import com.Voxce.model.Laboratory;
import com.Voxce.model.Sites;
import com.Voxce.model.SitesUsers;
import com.Voxce.model.SponsorDevisionUser;
import com.Voxce.model.StudySites;
import com.Voxce.model.Study_Site_Users;
import com.Voxce.model.Users;
import com.Voxce.model.studies;

@Controller
public class SitesController extends MultiActionController{

	Users CurrentUser;	
	private CountriesDAO countriesdao;	
	private SitesDAO sitesDAO;
	private StudiesDAO studiesdao;
	private StudySitesDAO studysiteDAO;
	private UsersDAO usersdao;
	private SponsorDivisionUserDAO sponsordivisionuserdao;
	private LaboratoryDAO laborotoriesdao;





	public ModelAndView ShowSitesIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String CurrentForm=request.getParameter("CurrentForm");


		List<Countries> countrieslist;
		List<Sites> siteslist;
		
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		
		/*Load_All();*/
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("Site_Head", "current_btn");
		modelMap.addAttribute("CurrentForm",CurrentForm);
		return new ModelAndView("siteindex",modelMap);
	}


	public ModelAndView ShowSitesStudyUserIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		

		List<Sites> siteslist;
		List<studies> studieslist; 
		
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		
		List<Sites> currentstudysites=null;
		List<Users> siteusers=null;
		List<Users> siteusers_sel=null;
		if(studieslist.size()!=0)
		{
			currentstudysites=studysiteDAO.StudySitesList(studieslist.get(0).getStudy_id());
			if(currentstudysites.size()!=0)
			{
				siteusers=usersdao.SitesUsersList(currentstudysites.get(0).getSite_id());
				siteusers_sel=usersdao.listStudySiteUsers(studieslist.get(0).getStudy_id(), currentstudysites.get(0).getSite_id());
			}			
		}

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudysites",currentstudysites);
		modelMap.addAttribute("siteusers",siteusers);				
		modelMap.addAttribute("siteusers_sel",siteusers_sel);		
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("sitestudyuserindex",modelMap);
	}

	public ModelAndView ShowSitesUserIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{			

		List<Sites> siteslist;
		List<Users> users;
		
		siteslist= sitesDAO.SitesList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		
		String CurrentForm=request.getParameter("CurrentForm");		
		List<Users> siteusers=null;
		ModelMap modelMap = new ModelMap();
		if(siteslist.size()!=0){
			siteusers=usersdao.SitesUsersList(siteslist.get(0).getSite_id());}		
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("siteusers",siteusers);	
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("siteuserindex",modelMap);
	}

	public ModelAndView CheckSite(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{				
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		int message=sitesDAO.getSite(request.getParameter("sitename"), CurrentUser.getSubscription_id()).size();
		if(message>=1)
			return new ModelAndView("error",new ModelMap());
		else
			return new ModelAndView("success",new ModelMap());
	}

	public ModelAndView ShowSitesStudyIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	

		
		List<Countries> countrieslist;
		List<Sites> siteslist;
		List<studies> studieslist; 
		List<StudySites> studysitelist;
		List<Users> investigators;
		
		investigators=usersdao.listinvestigators(CurrentUser);
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);
		String CurrentForm=request.getParameter("CurrentForm");
		List<Users> studysiteinvestigators;

		this.Load_All();

		if(siteslist.size()>0){
			studysiteinvestigators=usersdao.Sitelistinvestigators(siteslist.get(0).getSite_id());	
		}
		else{
			studysiteinvestigators=new ArrayList<Users>();
		}



		ModelMap modelMap = new ModelMap();		
		modelMap.addAttribute("investigators",investigators);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("siteinvestigators",studysiteinvestigators);
		modelMap.addAttribute("studysitelist",studysitelist);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("sitestudyindex",modelMap);
	}

	public ModelAndView SaveStudySiteLaborotory(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		int StudyId=Integer.parseInt(request.getParameter("sitelab_StudySelection"));
		int SiteId=Integer.parseInt(request.getParameter("SiteLaborotory_Add_Site_Selection"));
		String values[] = request.getParameterValues("SiteLaborotory_Add_Laborotory_Selection");

		List<Laboratory> laboratorylist;	
		List<studies> studieslist; 
		
		studieslist=studiesdao.StudiesList(CurrentUser);
		laboratorylist=laborotoriesdao.getLaboratoryList(CurrentUser);


		List<Integer> labs=new ArrayList<Integer>();
		if(values!=null)
			for(int i=0;i<values.length;i++)
				labs.add(Integer.parseInt(values[i]));

		int MessageCode=studysiteDAO.SaveStudySiteLaborotory(StudyId, SiteId, CurrentUser, labs);
		ModelMap modelMap = new ModelMap();

		if(MessageCode==1)
			modelMap.addAttribute("AddSuccessMessage","Laborotory Successfully Assigned to Study Site...");
		else
			modelMap.addAttribute("AddErrorMessage","No laboratory assigned to site !");

		List<Sites> Currentsiteslist=null;
		List<Laboratory> laboratorylist_Sel=null;
		if(studieslist.size()!=0)
		{
			Currentsiteslist=studysiteDAO.StudySitesList(StudyId);
			if(Currentsiteslist.size()!=0)
				laboratorylist_Sel=laborotoriesdao.LaborotoriesOfStudySiteList(StudyId,SiteId);
		}

		modelMap.addAttribute("PreSelectedStudy1",StudyId);
		modelMap.addAttribute("PreSelectedSite",SiteId);
		modelMap.addAttribute("laboratorylist",laboratorylist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("Currentsiteslist",Currentsiteslist);
		modelMap.addAttribute("laboratorylist_Sel",laboratorylist_Sel);	
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("siteLaborotoryindex",modelMap);
	}

	public ModelAndView StudyChangeSaveStudySiteLaborotory(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		int StudyId=Integer.parseInt(request.getParameter("SiteLaborotory_Add_study_Selection_preselect"));


		List<Laboratory> laboratorylist;	
		List<studies> studieslist; 
		studieslist=studiesdao.StudiesList(CurrentUser);
		laboratorylist=laborotoriesdao.getLaboratoryList(CurrentUser);
		List<Sites> Currentsiteslist=null;
		List<Laboratory> laboratorylist_Sel=null;


		if(studieslist.size()!=0)
		{
			Currentsiteslist=studysiteDAO.StudySitesList(StudyId);
			if(Currentsiteslist.size()!=0)
				laboratorylist_Sel=laborotoriesdao.LaborotoriesOfStudySiteList(StudyId, Currentsiteslist.get(0).getSite_id());
		}


		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("PreSelectedStudy",StudyId);
		modelMap.addAttribute("laboratorylist",laboratorylist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("Currentsiteslist",Currentsiteslist);
		modelMap.addAttribute("laboratorylist_Sel",laboratorylist_Sel);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("siteLaborotoryindex",modelMap);
	}

	public ModelAndView StudySiteChangeSaveStudySiteLaborotory(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		List<Laboratory> laboratorylist;	
		List<studies> studieslist; 
		studieslist=studiesdao.StudiesList(CurrentUser);
		laboratorylist=laborotoriesdao.getLaboratoryList(CurrentUser);


		int StudyId=Integer.parseInt(request.getParameter("SiteLaborotory_Add_study_Selection_preselect1"));
		int SiteId=Integer.parseInt(request.getParameter("SiteLaborotory_Site_Selection_preselect"));

		List<Sites> Currentsiteslist=null;
		List<Laboratory> laboratorylist_Sel=null;
		if(studieslist.size()!=0)
		{
			Currentsiteslist=studysiteDAO.StudySitesList(StudyId);
			if(Currentsiteslist.size()!=0)
				laboratorylist_Sel=laborotoriesdao.LaborotoriesOfStudySiteList(StudyId, SiteId);
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("PreSelectedStudy1",StudyId);
		modelMap.addAttribute("PreSelectedSite",SiteId);
		modelMap.addAttribute("laboratorylist",laboratorylist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("Currentsiteslist",Currentsiteslist);
		modelMap.addAttribute("laboratorylist_Sel",laboratorylist_Sel);				
		return new ModelAndView("siteLaborotoryindex",modelMap);
	}


	public ModelAndView OpenSiteLaborotoryIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	


		List<Laboratory> laboratorylist;	
		List<studies> studieslist; 
		studieslist=studiesdao.StudiesList(CurrentUser);
		laboratorylist=laborotoriesdao.getLaboratoryList(CurrentUser);


		List<Sites> Currentsiteslist=null;
		List<Laboratory> laboratorylist_Sel=null;
		if(studieslist.size()!=0)
		{
			Currentsiteslist=studysiteDAO.StudySitesList(studieslist.get(0).getStudy_id());
			if(Currentsiteslist.size()!=0)
				laboratorylist_Sel=laborotoriesdao.LaborotoriesOfStudySiteList(studieslist.get(0).getStudy_id(), Currentsiteslist.get(0).getSite_id());
		}


		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("laboratorylist",laboratorylist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("Currentsiteslist",Currentsiteslist);
		modelMap.addAttribute("laboratorylist_Sel",laboratorylist_Sel);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("siteLaborotoryindex",modelMap);
	}

	public ModelAndView OpenSiteIndexFromLab(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		List<Countries> countrieslist;
		List<Sites> siteslist;
		List<studies> studieslist; 
		List<StudySites> studysitelist;
		List<Users> investigators;
		List<Users> users;
		List<SitesUsers> siteuserlist;
		List<SponsorDevisionUser> sponsoruserlist;
		List<Study_Site_Users> StudySiteUserslist;
		investigators=usersdao.listinvestigators(CurrentUser);
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);
		siteuserlist=sitesDAO.SitesUsersList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		sponsoruserlist=sponsordivisionuserdao.SponsorDevisionUserList(CurrentUser);
		StudySiteUserslist=sitesDAO.StudySitesUsersList(CurrentUser);
		String CurrentForm=request.getParameter("CurrentForm");		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("investigators",investigators);
		modelMap.addAttribute("StudySiteUserslist",StudySiteUserslist);
		modelMap.addAttribute("sponsoruserlist",sponsoruserlist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("studysitelist",studysitelist);
		modelMap.addAttribute("siteuserlist",siteuserlist);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("Site_Head", "current_btn");
		return new ModelAndView("siteindex",modelMap);
	}

	public ModelAndView SaveStudySiteuser(HttpServletRequest request, HttpServletResponse response)
	{

		List<Sites> siteslist;
		List<studies> studieslist; 
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		int siteid=Integer.parseInt(request.getParameter("Add_StudySiteUser_Site_Selection"));		
		int studyid=Integer.parseInt(request.getParameter("Add_StudySiteUser_Study_Selection"));
		String values[] = request.getParameterValues("Add_StudySiteUser_select_siteuser");

		List<Integer> us=new ArrayList<Integer>();
		if(values!=null)
		{
			for(int i=0;i<values.length;i++)
				us.add(Integer.parseInt(values[i]));
		}
		int MessageCode=sitesDAO.SaveStudySiteUser(studyid,siteid,CurrentUser, us);

		List<Sites> currentstudysites=null;
		List<Users> siteusers=null;
		List<Users> siteusers_sel=null;
		currentstudysites=studysiteDAO.StudySitesList(studyid);
		if(currentstudysites.size()!=0){
			siteusers=usersdao.SitesUsersList(siteid);
			if(siteusers.size()!=0)	
				siteusers_sel=usersdao.listStudySiteUsers(studyid, siteid);		
		}

		ModelMap modelMap = new ModelMap();
		if(MessageCode==0)
			modelMap.addAttribute("Add_StudySiteUser_Main_Error","No Site users assigned to study !");
		else if(MessageCode==1)
			modelMap.addAttribute("Add_StudySiteUser_Main_Success","Site Users added to Study successfully ...");


		modelMap.addAttribute("currentstudysites",currentstudysites);
		modelMap.addAttribute("siteusers",siteusers);				
		modelMap.addAttribute("siteusers_sel",siteusers_sel);		
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("CurrentStudy",studyid);
		modelMap.addAttribute("CurrentSiteID",siteid);
		return new ModelAndView("sitestudyuserindex",modelMap);
	}
	public ModelAndView ReturnSiteUsers(HttpServletRequest request, HttpServletResponse response)
	{

		List<Sites> siteslist;
		List<Users> users;
		List<SitesUsers> siteuserlist;
		List<SitesUsers> Rsiteuserlist;	
		siteslist= sitesDAO.SitesList(CurrentUser);
		siteuserlist=sitesDAO.SitesUsersList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		int siteid=Integer.parseInt(request.getParameter("Add_StudySiteUser_Form_hidden_siteid"));		
		int studyid=Integer.parseInt(request.getParameter("Add_StudySiteUser_Form_hidden_studyid"));

		Rsiteuserlist=sitesDAO.RequestSitesUsersList(siteid);

		ModelMap modelMap = new ModelMap();

		modelMap.addAttribute("AddstudySiteUsersiteid",siteid);
		modelMap.addAttribute("AddstudySiteUserstudyid",studyid);		
		modelMap.addAttribute("Rsiteuserlist",Rsiteuserlist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("siteuserlist",siteuserlist);
		modelMap.addAttribute("CurrentForm","Add_StudySiteUser_div");
		return new ModelAndView("siteuserindex",modelMap);
	}

	public ModelAndView DeleteSitesUser(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Sites> siteslist;
		List<Users> users;
		List<SitesUsers> siteuserlist;
		siteslist= sitesDAO.SitesList(CurrentUser);
		siteuserlist=sitesDAO.SitesUsersList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("ID->"+id);
		int MessageCode=sitesDAO.DeleteSiteUser(id);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("CurrentForm","View_Site_User_Div");


		if(MessageCode==0)
		{
			modelMap.addAttribute("Deletesiteusermessage",MessageCode);			
			modelMap.addAttribute("siteuserlist",siteuserlist);
			return new ModelAndView("siteuserindex",modelMap);
		}
		else if(MessageCode==1)
		{
			siteuserlist=sitesDAO.SitesUsersList(CurrentUser);
			modelMap.addAttribute("Deletesiteusermessage",MessageCode);			
			modelMap.addAttribute("siteuserlist",siteuserlist);
			return new ModelAndView("siteuserindex",modelMap);
		}
		return null;	
	}

	public ModelAndView SaveSiteUser(HttpServletRequest request, HttpServletResponse response)
	{		

		List<Sites> siteslist;
		List<Users> users;
		siteslist= sitesDAO.SitesList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		int Siteid=Integer.parseInt(request.getParameter("Add_Site_User_Site_name"));
		String values[] = request.getParameterValues("Add_Site_User_select_user");
		List<Integer> us=null;
		if(values!=null)
		{
			us=new ArrayList<Integer>();
			for(int i=0;i<values.length;i++)
				us.add(Integer.parseInt(values[i]));
		}
		int MessageCode=sitesDAO.SaveSiteUsers(Siteid,CurrentUser,us);
		List<Users> siteusers=null;
		ModelMap modelMap = new ModelMap();
		if(siteslist.size()!=0){
			siteusers=usersdao.SitesUsersList(Siteid);}		
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("siteusers",siteusers);	
		modelMap.addAttribute("currentsite",Siteid);
		modelMap.addAttribute("users",users);

		if(MessageCode==0)
			modelMap.addAttribute("SiteUserReturnMessageError","No Users assigned to this site !");
		else if(MessageCode==1)
			modelMap.addAttribute("SiteUserReturnMessageSuccess","Users assigned to site successfully...");

		return new ModelAndView("siteuserindex",modelMap);		
	}

	public ModelAndView ChangeSiteStatus(HttpServletRequest request, HttpServletResponse response)
	{

		List<Countries> countrieslist;
		List<Sites> siteslist;
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		int id=(Integer.parseInt(request.getParameter("Site_id")));
		int status=(Integer.parseInt(request.getParameter("Status")));	

		int EditMessageCode=sitesDAO.ChangeStatus(id, status);
		if(EditMessageCode==0 )
		{
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("CurrentForm","Sites_View_Div");
			modelMap.addAttribute("EditMessageCode",EditMessageCode);
			return new ModelAndView("siteindex",modelMap);
		}
		else if(EditMessageCode==1)
		{
			siteslist= sitesDAO.SitesList(CurrentUser);
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("CurrentForm","Sites_View_Div");
			modelMap.addAttribute("EditMessageCode",EditMessageCode);
			return new ModelAndView("siteindex",modelMap);
		}
		else if(EditMessageCode==2)
		{
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("CurrentForm","Sites_View_Div");
			modelMap.addAttribute("EditMessageCode",EditMessageCode);
			return new ModelAndView("siteindex",modelMap);
		}
		return new ModelAndView("siteindex");			
	}

	public  ModelAndView SaveStudySite(HttpServletRequest request , HttpServletResponse response) throws Exception
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}

		List<Countries> countrieslist;
		List<Sites> siteslist;
		List<studies> studieslist; 
		List<StudySites> studysitelist;
		List<Users> investigators;
		investigators=usersdao.listinvestigators(CurrentUser);
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);
		StudySites obj=new StudySites();
		int SSN=Integer.parseInt(request.getParameter("Add_StudySite_studysitenumber"));

		obj.setStudy_site_number(Integer.parseInt(request.getParameter("Add_StudySite_studysitenumber")));
		obj.setStudy_id(Integer.parseInt(request.getParameter("Add_StudySite_Study_Selection")));		 
		obj.setSite_id(Integer.parseInt(request.getParameter("Add_StudySite_Site_Selection")));
		obj.setPrincipal_investigator_id(Integer.parseInt(request.getParameter("Add_StudySite_Investigator_Selection")));
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setModified_by(CurrentUser.getUser_id());
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		Calendar cal = Calendar.getInstance();

		Date date =new java.sql.Date( cal.getTime().getTime() );		 
		obj.setDate_activated(date);
		obj.setDate_created(date);
		obj.setDate_modified(date);
		obj.setSubscriber_id(CurrentUser.getSubscription_id());

		int MessageCode=studysiteDAO.SaveStudySite(obj,SSN);
		List<Users> studysiteinvestigators=usersdao.Sitelistinvestigators(siteslist.get(0).getSite_id());
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("investigators",investigators);					 
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("studysitelist",studysitelist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("siteinvestigators",studysiteinvestigators);			 
		modelMap.addAttribute("Sites_Study_add_div_studyid",obj.getStudy_id());
		modelMap.addAttribute("Sites_Study_add_div_siteid",obj.getSite_id());
		modelMap.addAttribute("SSN",SSN);
		modelMap.addAttribute("CurrentForm","Sites_Study_add_div");

		if(MessageCode==1)
			modelMap.addAttribute("Add_StudySite_Main_Success","Site successfully assigned to Study ...");
		else if(MessageCode==0)
			modelMap.addAttribute("Add_StudySite_Main_Error","Site already assigned to this Study !");
		else if (MessageCode==2)
			modelMap.addAttribute("Add_StudySite_Main_Error1","Study Site number already exist !");
		return new ModelAndView("sitestudyindex",modelMap);
	}

	public  ModelAndView EditStudySite(HttpServletRequest request, HttpServletResponse response)
	{
		int studysiteid=Integer.parseInt(request.getParameter("studysiteid"));
		int MessageCode=studysiteDAO.DeleteStudySite(studysiteid);		 
		List<Countries> countrieslist;
		List<Sites> siteslist;
		List<studies> studieslist; 
		List<StudySites> studysitelist;
		List<Users> investigators;
		investigators=usersdao.listinvestigators(CurrentUser);
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);
		if(MessageCode == 0 )
		{
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("investigators",investigators);
			List<Users> studysiteinvestigators=usersdao.Sitelistinvestigators(siteslist.get(0).getSite_id());

			modelMap.addAttribute("siteinvestigators",studysiteinvestigators);			 
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("studysitelist",studysitelist);

			modelMap.addAttribute("EditSSMessageCode",MessageCode);
			modelMap.addAttribute("CurrentForm","Sites_Study_view_div");
			return new ModelAndView("sitestudyindex",modelMap);
		}
		else if(MessageCode == 1)
		{
			studysitelist=studysiteDAO.StudySiteList(CurrentUser);
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("investigators",investigators);
			List<Users> studysiteinvestigators=usersdao.Sitelistinvestigators(siteslist.get(0).getSite_id());
			modelMap.addAttribute("siteinvestigators",studysiteinvestigators);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("studysitelist",studysitelist);
			modelMap.addAttribute("EditSSMessageCode",MessageCode);
			modelMap.addAttribute("CurrentForm","Sites_Study_view_div");
			return new ModelAndView("sitestudyindex",modelMap);
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("studysitelist",studysitelist);
		return new ModelAndView("sitestudyindex",modelMap);		 		 
	}



	public ModelAndView SaveSite(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Countries> countrieslist;
		List<Sites> siteslist;
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		Sites site=new Sites();
		site.setSite_name(request.getParameter("Add_Site_Name").trim());
		site.setEmail(request.getParameter("Add_Site_Email").trim());
		site.setAddress1(request.getParameter("Add_Site_Address_1").trim());
		site.setAddress2(request.getParameter("Add_Site_Address_2").trim());
		site.setAddress3(request.getParameter("Add_Site_Address_3").trim());
		site.setCity(request.getParameter("Add_Site_City").trim());
		site.setState(request.getParameter("Add_Site_State").trim());
		site.setCountry_id(Integer.parseInt(request.getParameter("Add_Site_Country").trim()));
		site.setPostal_code(request.getParameter("Add_Site_Postal_Code").trim());
		site.setPhone(request.getParameter("Add_Site_Phone").trim());
		site.setFax(request.getParameter("Add_Site_Fax").trim());
		site.setCell(request.getParameter("Add_Site_Cell").trim());
		site.setSubscriber_id(CurrentUser.getSubscription_id());
		String OperationType=request.getParameter("Add_Site_Siteid").trim();
		int MessageCode=0;
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date( cal.getTime().getTime() );
		ModelMap modelMap = new ModelMap();
		if(OperationType.trim().toString().equals(""))
		{
			site.setCreated_by(CurrentUser.getUser_id());
			site.setDate_created(date);
			site.setModified_by(CurrentUser.getUser_id());
			site.setDate_modified(date);
			site.setStatus(0);
			MessageCode=sitesDAO.SaveSite(site);
			if(MessageCode==0)
			{	
				
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("MessageCode",MessageCode);
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("CurrentForm","Sites_Add_Div");
				return new ModelAndView("siteindex",modelMap);
			}
			else if(MessageCode==1)
			{
				
				siteslist= sitesDAO.SitesList(CurrentUser);
				modelMap.addAttribute("MessageCode",MessageCode);
				modelMap.addAttribute("siteslist",siteslist);				
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("CurrentForm","Sites_Add_Div");
				return new ModelAndView("siteindex",modelMap);
			}
		}
		else if(!OperationType.trim().toString().equals(""))
		{
			site.setModified_by(CurrentUser.getUser_id());
			site.setDate_modified(date);
			site.setDate_created(date);
			site.setCreated_by(CurrentUser.getUser_id());
			site.setSite_id(Integer.parseInt(request.getParameter("Add_Site_Siteid")));
			site.setStatus(sitesDAO.getSite(site.getSite_id()).getStatus());
			MessageCode=sitesDAO.EditSite(site);
			if(MessageCode==0)
			{
				MessageCode=2;
				modelMap.addAttribute("MessageCode",MessageCode);
				modelMap.addAttribute("siteslist",siteslist);				
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("CurrentForm","Sites_View_Div");
				return new ModelAndView("siteindex",modelMap);
			}
			else if(MessageCode==1)
			{
				MessageCode=3;
				siteslist= sitesDAO.SitesList(CurrentUser);
				modelMap.addAttribute("MessageCode",MessageCode);
				modelMap.addAttribute("siteslist",siteslist);				
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("CurrentForm","Sites_View_Div");
				return new ModelAndView("siteindex",modelMap);
			}

		}
		return null;
	}

	public CountriesDAO getCountriesdao() {
		return countriesdao;
	}

	public void setCountriesdao(CountriesDAO countriesdao) {
		this.countriesdao = countriesdao;
	}

	public SitesDAO getSitesDAO() {
		return sitesDAO;
	}

	public void setSitesDAO(SitesDAO sitesDAO) {
		this.sitesDAO = sitesDAO;
	}


	public StudiesDAO getStudiesdao() {
		return studiesdao;
	}


	public void setStudiesdao(StudiesDAO studiesdao) {
		this.studiesdao = studiesdao;
	}


	public StudySitesDAO getStudysiteDAO() {
		return studysiteDAO;
	}

	public void setStudysiteDAO(StudySitesDAO studysiteDAO) {
		this.studysiteDAO = studysiteDAO;
	}

	public UsersDAO getUsersdao() {
		return usersdao;
	}

	public void setUsersdao(UsersDAO usersdao) {
		this.usersdao = usersdao;
	}

	public SponsorDivisionUserDAO getSponsordivisionuserdao() {
		return sponsordivisionuserdao;
	}

	public void setSponsordivisionuserdao(SponsorDivisionUserDAO sponsordivisionuserdao) {
		this.sponsordivisionuserdao = sponsordivisionuserdao;
	}


	public LaboratoryDAO getLaborotoriesdao() {
		return laborotoriesdao;
	}


	public void setLaborotoriesdao(LaboratoryDAO laborotoriesdao) {
		this.laborotoriesdao = laborotoriesdao;
	}



	public void Load_All()
	{

	}

	public ModelAndView HiddenActions(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		List<Countries> countrieslist;
		List<Sites> siteslist;
		List<studies> studieslist; 
		List<StudySites> studysitelist;
		List<Users> investigators;
		List<Users> users;
		investigators=usersdao.listinvestigators(CurrentUser);
		countrieslist=countriesdao.listCountry();
		siteslist= sitesDAO.SitesList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		studysitelist=studysiteDAO.StudySiteList(CurrentUser);
		users= usersdao.listusers(CurrentUser);
		String type=request.getParameter("typeofaction");
		/*this.Load_All();*/
		if(type.equals("SiteUserChangeListener"))
		{
			int SiteID=Integer.parseInt(request.getParameter("HiddenValue1"));

			List<Users> siteusers=null;
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				siteusers=usersdao.SitesUsersList(SiteID);}		
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("siteusers",siteusers);	
			modelMap.addAttribute("currentsite",SiteID);
			modelMap.addAttribute("users",users);

			return new ModelAndView("siteuserindex",modelMap);

		}
		else if(type.equals("StudySiteInvestigators"))
		{
			System.out.println("study site changed");
			int StudyID=Integer.parseInt(request.getParameter("HiddenValue1"));
			int SiteID=Integer.parseInt(request.getParameter("HiddenValue2"));

			List<Users> studysiteinvestigators=usersdao.Sitelistinvestigators(SiteID);

			ModelMap modelMap = new ModelMap();

			modelMap.addAttribute("Sites_Study_add_div_studyid",StudyID);
			modelMap.addAttribute("Sites_Study_add_div_siteid",SiteID);

			modelMap.addAttribute("investigators",investigators);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("siteinvestigators",studysiteinvestigators);
			modelMap.addAttribute("studysitelist",studysitelist);
			modelMap.addAttribute("CurrentForm","Sites_Study_add_div");
			return new ModelAndView("sitestudyindex",modelMap);

		}
		else if(type.equals("GetStudySites"))
		{
			int StudyID=Integer.parseInt(request.getParameter("HiddenValue1"));
			List<Sites> currentstudysites=null;
			List<Users> siteusers=null;
			List<Users> siteusers_sel=null;
			currentstudysites=studysiteDAO.StudySitesList(StudyID);
			System.out.println(currentstudysites.size());
			if(currentstudysites.size()!=0)	
			{
				siteusers=usersdao.SitesUsersList(currentstudysites.get(0).getSite_id());
				if(siteusers.size()!=0)
					siteusers_sel=usersdao.listStudySiteUsers(StudyID, currentstudysites.get(0).getSite_id());
			}			

			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudysites",currentstudysites);
			modelMap.addAttribute("siteusers",siteusers);				
			modelMap.addAttribute("siteusers_sel",siteusers_sel);		
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("CurrentStudy",StudyID);
			return new ModelAndView("sitestudyuserindex",modelMap);
		}
		else if(type.equals("GetSiteUsers"))
		{			
			int StudyID=Integer.parseInt(request.getParameter("HiddenValue1"));
			int SiteID=Integer.parseInt(request.getParameter("HiddenValue2"));


			List<Sites> currentstudysites=null;
			List<Users> siteusers=null;
			List<Users> siteusers_sel=null;
			currentstudysites=studysiteDAO.StudySitesList(StudyID);
			if(currentstudysites.size()!=0)	
			{
				siteusers=usersdao.SitesUsersList(SiteID);
				if(siteusers.size()!=0)
					siteusers_sel=usersdao.listStudySiteUsers(StudyID, SiteID);
			}	
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudysites",currentstudysites);
			modelMap.addAttribute("siteusers",siteusers);				
			modelMap.addAttribute("siteusers_sel",siteusers_sel);		
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("CurrentStudy",StudyID);
			modelMap.addAttribute("CurrentSiteID",SiteID);
			return new ModelAndView("sitestudyuserindex",modelMap);

		}
		return null;
	}
}// End of Controller

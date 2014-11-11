package com.Voxce.Controllers;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.LanguageDAO;
import com.Voxce.DAO.SponsorDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.StudySitesDAO;
import com.Voxce.DAO.protocolVersionDAO;
import com.Voxce.model.Languages;
import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Sponsor;
import com.Voxce.model.StudySites;
import com.Voxce.model.Users;
import com.Voxce.model.studies;
import com.Voxce.model.subStudies;

@Controller
public class HomeController extends MultiActionController{

	Users CurrentUser;
	private StudiesDAO studiesdao;
	private StudySitesDAO studysiteDAO;
	private LanguageDAO languageDAO;
	private SponsorDAO sponsorDAO;
	private protocolVersionDAO protocolDAO;
	
	
	
	public ModelAndView ShowHomeIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		System.out.println("\n\n\n");
		System.out.print(request.getRequestURL().toString());
		System.out.println("\n\n\n");
		List<subStudies> substudieslist=studiesdao.subStudiesList(CurrentUser);
		List<ProtocolVersion> protocollist=protocolDAO.getProtocolVersionList(CurrentUser);
		List<studies> studieslist=studiesdao.StudiesList(CurrentUser);
		List<Languages> languagelist=languageDAO.listLanguages();
		List<Sponsor> sponsorlist = sponsorDAO.SponsorList(CurrentUser);
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Home", "current_btn");
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("protocollist",protocollist);
		modelMap.addAttribute("languagelist",languagelist);
		modelMap.addAttribute("sponsorlist",sponsorlist);
		modelMap.addAttribute("substudieslist",substudieslist);
		return new ModelAndView("index",modelMap);
	}	
	
	public ModelAndView CheckStudy(HttpServletRequest request, HttpServletResponse response) throws Exception{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		int message=studiesdao.getStudyDetail(request.getParameter("studyname"),CurrentUser.getSubscription_id()).size();
		
		if(message>=1){
			return new ModelAndView("error",new ModelMap());
		}else{
			return new ModelAndView("success",new ModelMap());
		}
		
	}
	
	
	public ModelAndView CreateSubStudy(HttpServletRequest request, HttpServletResponse response) throws Exception{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<subStudies> substudieslist=studiesdao.subStudiesList(CurrentUser);
		List<studies> studieslist=studiesdao.StudiesList(CurrentUser);
		List<Languages> languagelist=languageDAO.listLanguages();
		List<Sponsor> sponsorlist = sponsorDAO.SponsorList(CurrentUser);
		
		subStudies obj=new subStudies();
		
		Calendar cal = Calendar.getInstance();
		Calendar cal1 = Calendar.getInstance();		
		Date date =new java.sql.Date( cal.getTime().getTime() );
		
		obj.setStudy_id(Integer.parseInt(request.getParameter("Home_Study_createSubstudy_superstudyname")));
		obj.setClient_name(Integer.parseInt(request.getParameter("Home_Study_createSubstudy_clientname")));
		
		String Code=request.getParameter("Home_Study_createSubstudy_code_field");
		if(Code.equals("") || Code== null)
			Code=request.getParameter("Home_Study_createSubstudy_code_select");	
		
		obj.setCode(Code);
		obj.setStudy_name(request.getParameter("Home_Study_createSubstudy_studyname"));
		obj.setStudy_text(request.getParameter("Home_Study_createSubstudy_studytext"));
		obj.setProtocol_number(Integer.parseInt(request.getParameter("Home_Study_createSubstudy_protocolnumber")));
		
		obj.setWelcome_template(request.getParameter("Home_Study_createSubstudy_wellcometemplate"));
		String StartDate=request.getParameter("Home_Study_createSubstudy_startdate");
		String arr[]=StartDate.split("-");
		cal1.set(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), Integer.parseInt(arr[2]));
		Date startdate =new java.sql.Date( cal1.getTime().getTime() );
		obj.setStart_date(startdate);
		obj.setDuration(Integer.parseInt(request.getParameter("Home_Study_createSubstudy_duration")));
		obj.setMax_enrollment(Integer.parseInt(request.getParameter("Home_Study_createSubstudy_enrollment")));
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setDate_created(date);
		obj.setModified_by(CurrentUser.getUser_id());
		
		obj.setDate_modified(date);
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		int MessageCode=studiesdao.SaveSubStudy(obj);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Home", "current_btn");
		modelMap.addAttribute("languagelist",languagelist);
		modelMap.addAttribute("sponsorlist",sponsorlist);
		modelMap.addAttribute("studieslist",studieslist);
		modelMap.addAttribute("CurrentForm","Home_Study_createSubstudy_div");	
		
		if(MessageCode==0)
		{
			modelMap.addAttribute("substudieslist",substudieslist);			
			modelMap.addAttribute("CreateSubStudyMessageCodeError","Sub Study could not be created at this time...");			
		}
		else if(MessageCode==1)
		{
			substudieslist=studiesdao.subStudiesList(CurrentUser);
			modelMap.addAttribute("substudieslist",substudieslist);
			modelMap.addAttribute("CreateSubStudyMessageCodeSuccess","New Sub Study created successfully !");			
		}	
		return new ModelAndView("index",modelMap);
	}
	public ModelAndView CreateStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
	//	study_id 	client_name 	code 	study_name 	study_text 	protocol_number 	welcome_template 	start_date 	duration 	max_enrollment 	created_by 	date_created 	modified_by 	date_modified
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<subStudies> substudieslist=studiesdao.subStudiesList(CurrentUser);
		List<ProtocolVersion> protocollist=protocolDAO.getProtocolVersionList(CurrentUser);
		List<studies> studieslist=studiesdao.StudiesList(CurrentUser);
		List<Languages> languagelist=languageDAO.listLanguages();
		List<Sponsor> sponsorlist = sponsorDAO.SponsorList(CurrentUser);
		
		studies obj=new studies();
		ProtocolVersion pobj =new ProtocolVersion();
		
		
		
		Calendar cal = Calendar.getInstance();
		Calendar cal1 = Calendar.getInstance();		
		Date date =new java.sql.Date( cal.getTime().getTime() );
		String StartDate=request.getParameter("StartDate").trim();
		String arr[]=StartDate.split("-");
		cal1.set(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), Integer.parseInt(arr[2]));
		Date startdate =new java.sql.Date( cal1.getTime().getTime() );
		
		
		
		pobj.setProtocol_id(request.getParameter("ProtocolNumber"));
		pobj.setVersion(request.getParameter("ProtocolVersion").trim());
		pobj.setName(request.getParameter("ProtocolName").trim());
		pobj.setStart_date(startdate);		
		pobj.setDuration(Integer.parseInt(request.getParameter("ProtocolDuration").trim()));
		pobj.setMax_enrollment(Integer.parseInt(request.getParameter("ProtocolEnrollment").trim()));
		pobj.setDescription(request.getParameter("protocoldesc").trim());
		pobj.setCreated_by(CurrentUser.getUser_id());
		pobj.setDate_created(date);
		pobj.setModified_by(CurrentUser.getUser_id());
		pobj.setDate_modified(date);
		pobj.setSubscriber_id(CurrentUser.getSubscription_id());
		
		obj.setStudy_name(request.getParameter("studyname").trim());
		obj.setClient_name(Integer.parseInt(request.getParameter("clientname").trim()));
		obj.setStudy_text(request.getParameter("studytext").trim());
		obj.setWelcome_template(request.getParameter("wellcometemplate").trim());
		
		String Code=request.getParameter("Home_Study_createstudy_code_field");
		/*
		if(Code.equals("") || Code== null)
			Code=request.getParameter("Home_Study_createstudy_code_select");	
		*/
		obj.setCode(Code);
	
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setDate_created(date);
		obj.setModified_by(CurrentUser.getUser_id());
		obj.setDate_modified(date);
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		
		int MessageCode=studiesdao.SaveStudy(obj,pobj);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Home", "current_btn");
		modelMap.addAttribute("languagelist",languagelist);
		modelMap.addAttribute("sponsorlist",sponsorlist);
		modelMap.addAttribute("substudieslist",substudieslist);
		modelMap.addAttribute("protocollist",protocollist);
		modelMap.addAttribute("CurrentForm","Home_Study_createstudy_div");	
		
		if(MessageCode==0)
		{
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("protocollist",protocollist);
			modelMap.addAttribute("CreateStudyMessageCodeError","Study could not be created at this time...");			
		}
		else if(MessageCode==1)
		{
			studieslist=studiesdao.StudiesList(CurrentUser);
			protocollist=protocolDAO.getProtocolVersionList(CurrentUser);
			modelMap.addAttribute("protocollist",protocollist);
			modelMap.addAttribute("studieslist",studieslist);
			modelMap.addAttribute("CreateStudyMessageCodeSuccess","New study created successfully !");			
		}		
		return new ModelAndView("index",modelMap);
	}	
	
	

	public StudySitesDAO getStudysiteDAO() {
		return studysiteDAO;
	}

	public void setStudysiteDAO(StudySitesDAO studysiteDAO) {
		this.studysiteDAO = studysiteDAO;
	}

	public LanguageDAO getLanguageDAO() {
		return languageDAO;
	}

	public void setLanguageDAO(LanguageDAO languageDAO) {
		this.languageDAO = languageDAO;
	}

	public SponsorDAO getSponsorDAO() {
		return sponsorDAO;
	}

	public void setSponsorDAO(SponsorDAO sponsorDAO) {
		this.sponsorDAO = sponsorDAO;
	}
	
	
	public protocolVersionDAO getProtocolDAO() {
		return protocolDAO;
	}
	public void setProtocolDAO(protocolVersionDAO protocolDAO) {
		this.protocolDAO = protocolDAO;
	}
	public StudiesDAO getStudiesdao() {
		return studiesdao;
	}
	public void setStudiesdao(StudiesDAO studiesdao) {
		this.studiesdao = studiesdao;
	}
}// End of Controller

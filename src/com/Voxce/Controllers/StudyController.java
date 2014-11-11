package com.Voxce.Controllers;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.DocumentsDAO;
import com.Voxce.DAO.LaboratoryDAO;
import com.Voxce.DAO.SitesDAO;
import com.Voxce.DAO.SponsorDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.StudySitesDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.DAO.protocolVersionDAO;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Countries;
import com.Voxce.model.Discrepancy_on_crf;
import com.Voxce.model.EnrollmentSchedule;
import com.Voxce.model.Laboratory;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Patients;
import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Sites;
import com.Voxce.model.Sponsor;
import com.Voxce.model.StudyDocuments;
import com.Voxce.model.StudySiteLabroratories;
import com.Voxce.model.StudySites;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;
import com.Voxce.model.studies;

@Controller
public class StudyController extends MultiActionController{

	Users CurrentUser;
	private int StudyID;	
	private int SiteID;
	private studies currentstudy;
	private Sites currentsite;

	
	private DocumentsDAO documentsdao;
	private SitesDAO sitesDAO;
	private StudiesDAO studiesdao;
	private SponsorDAO sponsorDAO;
	private StudySitesDAO studysiteDAO;
	private UsersDAO usersdao;
	private CountriesDAO countriesDAO;
	private LaboratoryDAO laboratoryDAO;
	private protocolVersionDAO protocolDAO;

	




	public ModelAndView EditStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<Sponsor> sponsorlist;
		
		List<ProtocolVersion> protocolList;
		
		
		
		protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());
		
		
		
		studies obj=new studies();
		obj.setStudy_id(currentstudy.getStudy_id());
		obj.setStudy_name(request.getParameter("studyname"));
		obj.setClient_name(Integer.parseInt(request.getParameter("clientname")));
		obj.setWelcome_template(request.getParameter("wellcometemplate"));
		obj.setStudy_text(request.getParameter("studytext"));
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		int Message=studiesdao.EditStudy(obj);

		currentstudy=studiesdao.getStudyDetail(currentstudy.getStudy_id()).get(0);		
		sponsorlist=sponsorDAO.SponsorList(CurrentUser);		
		Sponsor currentsponsor=sponsorDAO.getSponsor(currentstudy.getClient_name());
		Date lastdate=protocolDAO.GetLastProtocolStartDate(currentstudy.getStudy_id());

		ModelMap map=new ModelMap();	
		map.addAttribute("LastProtocolDate",lastdate);
		map.addAttribute("sponsorlist",sponsorlist);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("client",currentsponsor);
		map.addAttribute("CurrentForm","ViewStudyDetailDiv");
		map.addAttribute("protocolList",protocolList);

		if(Message==0){
			map.addAttribute("EditError","Study cannot be updated at this time !");
		}
		else{
			map.addAttribute("EditSuccess","Study Updated Successfully");
		}	
		map.addAttribute("Library","current");
		return new ModelAndView("studyDetail",map);
	}

	public ModelAndView AddProtocol(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
	
		List<Sponsor> sponsorlist;
		
		List<ProtocolVersion> protocolList;
		
		
		Calendar cal = Calendar.getInstance();
		Calendar cal1 = Calendar.getInstance();		
		Date date =new java.sql.Date( cal.getTime().getTime() );

		String StartDate=request.getParameter("AddProtocolStartDate");
		String arr[]=StartDate.split("-");

		cal1.set(Integer.parseInt(arr[0]), Integer.parseInt(arr[1])-1, Integer.parseInt(arr[2]));
		Date startdate =new java.sql.Date( cal1.getTime().getTime() );

		ProtocolVersion obj=new ProtocolVersion();
		obj.setStudy_id(currentstudy.getStudy_id());
		obj.setProtocol_id(request.getParameter("AddProtocolIdentifier"));
		obj.setVersion(request.getParameter("AddProtocolVersion"));
		obj.setName(request.getParameter("AddProtocolName"));
		obj.setDescription(request.getParameter("AddProtocolDescription"));		
		obj.setStart_date(startdate);		
		obj.setDuration(Integer.parseInt(request.getParameter("AddProtocolDuration")));
		obj.setMax_enrollment(Integer.parseInt(request.getParameter("AddProtocolMaxEroll")));
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setDate_created(date);
		obj.setModified_by(CurrentUser.getUser_id());
		obj.setDate_modified(date);
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		sponsorlist=sponsorDAO.SponsorList(CurrentUser);		
		Sponsor currentsponsor=sponsorDAO.getSponsor(currentstudy.getClient_name());


		ModelMap map=new ModelMap();
		map.addAttribute("sponsorlist",sponsorlist);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("client",currentsponsor);

		String action=request.getParameter("ActionType");
		int Message=0;
		if(action.equals("1"))
		{			
			obj.setProtocol_version_id(Integer.parseInt(request.getParameter("protocol_version_id")));
			Message=protocolDAO.EditProtocol(obj);
			protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());
			if(Message==0)
			{
				map.addAttribute("Errorunsuccessful","Sorry Protocol Cannot be Edited at this time !");
			}
			else if(Message==1)
			{
				map.addAttribute("Success","Protocol Edited Successfully...");
			}
		}
		else
		{
			Message=protocolDAO.SaveNewProtocol(obj);
			protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());
			if(Message==0)
			{
				map.addAttribute("Errorunsuccessful","Sorry Protocol Cannot be Edited at this time !");
			}
			else if(Message==1)
			{
				map.addAttribute("Success","New Protocol saved.. ");
			}
			else if(Message==2)
			{
				map.addAttribute("Errorpresent","Sorry Protocol Version already Exist !");
			}
		}
		Date lastdate=protocolDAO.GetLastProtocolStartDate(currentstudy.getStudy_id());		
		map.addAttribute("LastProtocolDate",lastdate);
		map.addAttribute("CurrentForm","ViewStudyDetailDiv");
		map.addAttribute("protocolList",protocolList);
		return new ModelAndView("studyDetail",map);
	}

	public ModelAndView OpenViewStudyLaboratory(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		
		
		List<Laboratory> laboratorylist;	
		
		
		laboratorylist=laboratoryDAO.LaborotoriesOfStudyList(currentstudy.getStudy_id());		

		ModelMap map=new ModelMap();		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("laboratorylist",laboratorylist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studyLaborotory",map);
	}
	//**************************************************************************************************************************
	//************************************Study Site Handlers*******************************************************************
	public ModelAndView OpenStudySite(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		ModelMap map=new ModelMap();		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteDetail",map);
	}

	public ModelAndView OpenStudySitePatient(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		ModelMap map=new ModelMap();		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		return new ModelAndView("sitepatients",map);
	}

	public ModelAndView OpenStudySiteUsers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		List<Users> tempuserlist=usersdao.listStudySiteUsers(currentstudy.getStudy_id(), currentsite.getSite_id());
		ModelMap map=new ModelMap();		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("userslist",tempuserlist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteusers",map);
	}

	public ModelAndView OpenStudySiteDocuments(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		List<StudyDocuments> tempdoc =documentsdao.getStudySiteDocuments(currentstudy.getStudy_id(), currentsite.getSite_id());

		for(int i=0;i<tempdoc.size();i++)
			tempdoc.get(i).setData(null);

		ModelMap map=new ModelMap();		
		map.addAttribute("doclist",tempdoc);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteDocument",map);
	}

	public ModelAndView OpenStudySiteLaborotories(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		
		List<Laboratory> laboratorylist;	
		
		
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		laboratorylist=laboratoryDAO.LaborotoriesOfStudySiteList(currentstudy.getStudy_id(),currentsite.getSite_id());	
		ModelMap map=new ModelMap();		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("laboratorylist",laboratorylist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteLaborotories",map);
	}

	public ModelAndView OpenStudySiteChange(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{				
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		ModelMap map=studysiteDAO.getStudySites(currentstudy.getStudy_id());
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("sitechange",map);
	}

	public ModelAndView EditSiteDetail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		System.out.println("\n\n\n\nIn edit site detail\n\n\n\n\n");
		Sites site=new Sites();
		site.setSubscriber_id(CurrentUser.getSubscription_id());
		site.setSite_id(currentsite.getSite_id());
		site.setStatus(Integer.parseInt(request.getParameter("sitestatus")));
		site.setSite_name(request.getParameter("Add_Site_Name"));
		site.setEmail(request.getParameter("Add_Site_Email"));
		site.setAddress1(request.getParameter("Add_Site_Address_1"));
		site.setAddress2(request.getParameter("Add_Site_Address_2"));
		site.setAddress3(request.getParameter("Add_Site_Address_3"));
		site.setCity(request.getParameter("Add_Site_City"));
		site.setState(request.getParameter("Add_Site_State"));
		site.setCountry_id(Integer.parseInt(request.getParameter("Add_Site_Country")));		
		site.setPostal_code(request.getParameter("Add_Site_Postal_Code"));
		site.setPhone(request.getParameter("Add_Site_Phone"));
		site.setFax(request.getParameter("Add_Site_Fax"));
		site.setCell(request.getParameter("Add_Site_Cell"));
		site.setModified_by(CurrentUser.getUser_id());
		site.setCreated_by(currentsite.getCreated_by());
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date( cal.getTime().getTime() );
		site.setDate_modified(date);
		site.setDate_created(currentsite.getDate_created());

		int MessageCode=sitesDAO.EditSite(site);

		ModelMap map=new ModelMap();		

		if(MessageCode==1)
			map.addAttribute("SMessage","Site information Updated...");
		else if(MessageCode==0)
			map.addAttribute("EMessage","Site information cannot be updated at this time !");

		List<Countries> countrieslist=countriesDAO.listCountry();
		currentsite=sitesDAO.getSite(SiteID);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("countrieslist",countrieslist);
		Countries country=countriesDAO.findCountry(currentsite.getCountry_id());
		map.addAttribute("country",country);		
		return new ModelAndView("siteDetail",map);
	}

	public ModelAndView OpenStudySiteDetail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		SiteID=Integer.parseInt(request.getParameter("siteid").trim());
		currentsite=sitesDAO.getSite(SiteID);
		ModelMap map=new ModelMap();		


		List<Countries> countrieslist=countriesDAO.listCountry();
		map.addAttribute("countrieslist",countrieslist);		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		Countries country=countriesDAO.findCountry(currentsite.getCountry_id());
		map.addAttribute("country",country);
		map.addAttribute("Home", "current_btn");

		return new ModelAndView("siteDetail",map);
	}

	public ModelAndView OpenStudySiteInvestigators(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		SiteID=Integer.parseInt(request.getParameter("siteid"));
		currentsite=sitesDAO.getSite(SiteID);
		List<Users> temp=usersdao.listStudySiteinvestigators(currentstudy.getStudy_id(),currentsite.getSite_id());
		ModelMap map=new ModelMap();
		map.addAttribute("userslist",temp);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteInvestigators",map);	

	}


	@SuppressWarnings("unchecked")
	public ModelAndView uploadSitedocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		if (!ServletFileUpload.isMultipartContent(request)) {

			List<StudyDocuments> tempdoc =documentsdao.getStudySiteDocuments(currentstudy.getStudy_id(), currentsite.getSite_id());

			for(int i=0;i<tempdoc.size();i++)
				tempdoc.get(i).setData(null);

			ModelMap map=new ModelMap();		
			map.addAttribute("doclist",tempdoc);
			map.addAttribute("currentstudy",currentstudy);
			map.addAttribute("currentsite",currentsite);
			map.addAttribute("UploadErrorMessage","Request is not multipart, please 'multipart/form-data' enctype for your form.");
			return new ModelAndView("siteDocument",map);
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					String [] arr= item.getContentType().split("\\.");
					String Type=arr[arr.length-1];

					if(item.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + Type + "\",\"size\":\"" + item.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						documentsdao.UploadSiteDocument(item, Type, CurrentUser,currentstudy.getStudy_id(),currentsite.getSite_id() );
						writer.write("{\"name\":\""+ item.getName() + "\",\"type\":\"" + Type + "\",\"size\":\"" + item.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			writer.close();
		}
		return new ModelAndView("siteDocument");		
	}

	public ModelAndView DeleteSiteDocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		List<StudyDocuments> doclist;
		
		
		doclist=documentsdao.getStudyDocuments(StudyID);
		
		int docid=Integer.parseInt(request.getParameter("docid"));
		int MessageCode=documentsdao.DeleteDocument(docid);
		ModelMap map=new ModelMap();
		if(MessageCode==0)
		{
			map.addAttribute("MessageError","Document cannot be deleted at this time...");
		}
		else if(MessageCode==1)
		{
			map.addAttribute("MessageSuccess","Document Deleted !");
			
			for(int i=0;i<doclist.size();i++)
				doclist.get(i).setData(null);
		}
		map.addAttribute("doclist",doclist);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		return new ModelAndView("siteDocument",map);
	}

	public ModelAndView DownloadSiteDocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		List<StudyDocuments> doclist;
		
		
		StudyDocuments doc=new StudyDocuments();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc=documentsdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		doclist=documentsdao.getStudyDocuments(StudyID);
		for(int i=0;i<doclist.size();i++)
			doclist.get(i).setData(null);

		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("doclist",doclist);
		return new ModelAndView("siteDocument",map);
	}

	//*************************************Study Site Handlers******************************************************************
	//**************************************************************************************************************************

	public ModelAndView ViewStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		StudyID=Integer.parseInt(request.getParameter("studyid"));

		List<studies> li=studiesdao.getStudyDetail(StudyID);
		currentstudy=li.get(0);
		ModelMap map=studysiteDAO.getStudySites(StudyID);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studysite",map);
	}


	public ModelAndView SaveEnrollment(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");		
		
		
		
		List<ProtocolVersion> protocolList;
		
		
		protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());

		
		ProtocolVersion currentprotocol=protocolDAO.getProtocol(Integer.parseInt(request.getParameter("protocolselection")));
		List<Sites> silist=studysiteDAO.getStudySitesNoPatients(currentstudy.getStudy_id());

		Calendar Cal = Calendar.getInstance();		 
		Cal.setTime(currentprotocol.getStart_date());
		String monthname="";
		int year=Cal.get(Calendar.YEAR);
		int monthnumber = Cal.get(Calendar.MONTH);
		List<String> schedule=new ArrayList<String>();


		if(protocolList.size()!=0)
		{
			for(int i=1; i<=currentprotocol.getDuration() ;i++)
			{	
				Cal.set(year, monthnumber, 1);
				Date startdate =new java.sql.Date( Cal.getTime().getTime() );
				monthname=new SimpleDateFormat("MMM").format(startdate);
				String yearstr= Integer.toString(year);
				schedule.add(monthname+"("+yearstr+")");
				monthnumber++;
				if(monthnumber==12)
				{
					monthnumber=0;
					year++;
				}
			}
		}

		List<Integer> patients=new ArrayList<Integer>();
		for(int i=0;i<silist.size();i++)
		{
			for(int j=1;j<=currentprotocol.getDuration();j++)
			{
				String get=(silist.get(i).getSite_id()+"-"+j);
				patients.add(Integer.parseInt(request.getParameter(get)));
			}
		}

		int Message=studysiteDAO.SaveEnrollmentSchedule(CurrentUser.getUser_id(),currentstudy.getStudy_id(),silist,patients,currentprotocol,schedule);
		protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());


		List<EnrollmentSchedule> ensch=studysiteDAO.getEnrollmentSchedule(currentstudy.getStudy_id(),currentprotocol);

		ModelMap map=new ModelMap();			
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("SitesList",silist);
		map.addAttribute("Schedule",schedule);
		map.addAttribute("protocolList",protocolList);
		map.addAttribute("currentprotocol",currentprotocol);
		map.addAttribute("ensch",ensch);
		if(Message==0)
		{
			map.addAttribute("Error","Sorry Schedule cannot be created at this time..");
		}
		else if(Message ==1)
		{
			map.addAttribute("Success","Enrollment Schedule created successfully !");
		}
		return new ModelAndView("StudyEnrollment",map);
	}

	public ModelAndView GetEnrollmentStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		ProtocolVersion currentprotocol=protocolDAO.getProtocol(Integer.parseInt(request.getParameter("protocol_version_id")));
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		
		
		
		List<ProtocolVersion> protocolList;
		
		
		
		
		protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());

		Calendar Cal = Calendar.getInstance();		 
		Cal.setTime(currentprotocol.getStart_date());
		String monthname="";
		int year=Cal.get(Calendar.YEAR);
		int monthnumber = Cal.get(Calendar.MONTH);
		List<String> schedule=new ArrayList<String>();


		if(protocolList.size()!=0)
		{
			for(int i=1; i<=currentprotocol.getDuration() ;i++)
			{	
				Cal.set(year, monthnumber, 1);
				Date startdate =new java.sql.Date( Cal.getTime().getTime() );
				monthname=new SimpleDateFormat("MMM").format(startdate);
				String yearstr= Integer.toString(year);
				schedule.add(monthname+"("+yearstr+")");
				monthnumber++;
				if(monthnumber==12)
				{
					monthnumber=0;
					year++;
				}
			}


		}
		List<EnrollmentSchedule> ensch=studysiteDAO.getEnrollmentSchedule(currentstudy.getStudy_id(),currentprotocol);
		List<Sites> silist=studysiteDAO.getStudySitesNoPatients(currentstudy.getStudy_id());
		ModelMap map=new ModelMap();		
		map.addAttribute("ensch",ensch);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("SitesList",silist);
		map.addAttribute("Schedule",schedule);
		map.addAttribute("protocolList",protocolList);
		map.addAttribute("currentprotocol",currentprotocol);				
		return new ModelAndView("StudyEnrollment",map);
	}

	public ModelAndView OpenEnrollmentStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			
			
			
			List<ProtocolVersion> protocolList;
			
			
			
			protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());

			Calendar Cal = Calendar.getInstance();		 
			Cal.setTime(protocolList.get(0).getStart_date());
			String monthname="";
			int year=Cal.get(Calendar.YEAR);
			int monthnumber = Cal.get(Calendar.MONTH);
			List<String> schedule=new ArrayList<String>();


			if(protocolList.size()!=0)
			{
				for(int i=1; i<=protocolList.get(0).getDuration() ;i++)
				{	
					Cal.set(year, monthnumber, 1);
					Date startdate =new java.sql.Date( Cal.getTime().getTime() );
					monthname=new SimpleDateFormat("MMM").format(startdate);
					String yearstr= Integer.toString(year);
					schedule.add(monthname+"("+yearstr+")");
					monthnumber++;
					if(monthnumber==12)
					{
						monthnumber=0;
						year++;
					}
				}
			}

			List<EnrollmentSchedule> ensch=studysiteDAO.getEnrollmentSchedule(currentstudy.getStudy_id(),protocolList.get(0));
			List<Sites> silist=studysiteDAO.getStudySitesNoPatients(currentstudy.getStudy_id());
			Date date=protocolDAO.GetLastProtocolStartDate(currentstudy.getStudy_id());

			ModelMap map=new ModelMap();		
			map.addAttribute("ensch",ensch);
			map.addAttribute("LastProtocolDate",date);
			map.addAttribute("currentstudy",currentstudy);
			map.addAttribute("SitesList",silist);
			map.addAttribute("Schedule",schedule);
			map.addAttribute("protocolList",protocolList);
			map.addAttribute("currentprotocol",protocolList.get(0));
			map.addAttribute("Home", "current_btn");
			return new ModelAndView("StudyEnrollment",map);
		}
		catch(Exception exception){
			return new ModelAndView("StudyEnrollment",new ModelMap());
		}
	}


	@SuppressWarnings("unchecked")
	public ModelAndView uploaddocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		
		
		List<StudyDocuments> doclist;
		
		
		

		if (!ServletFileUpload.isMultipartContent(request)) {

			doclist=documentsdao.getStudyDocuments(StudyID);
			for(int i=0;i<doclist.size();i++)
				doclist.get(i).setData(null);

			ModelMap map=new ModelMap();
			map.addAttribute("currentstudy",currentstudy);
			map.addAttribute("doclist",doclist);
			map.addAttribute("Home", "current_btn");
			map.addAttribute("ErrorMessage","Request is not multipart, please 'multipart/form-data' enctype for your form.");
			return new ModelAndView("studyDocument",map);
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {					
					String [] arr= item.getContentType().split("\\.");
					String Type=arr[arr.length-1];
					if(item.getSize()>9999000)
					{						
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + Type + "\",\"size\":\"" + item.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{	
						int Message=documentsdao.UploadDocument(item,Type, CurrentUser,StudyID );
						writer.write("{\"name\":\""+ item.getName() + "\",\"type\":\"" + Type + "\",\"size\":\"" + item.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			writer.close();
		}

		ModelMap map=studysiteDAO.getStudySites(StudyID);
		map.addAttribute("currentstudy",currentstudy);
		return new ModelAndView("studysite",map);
	}




	public ModelAndView DeleteDocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		List<StudyDocuments> doclist;
		
		doclist=documentsdao.getStudyDocuments(StudyID);
		
		int docid=Integer.parseInt(request.getParameter("docid"));
		int MessageCode=documentsdao.DeleteDocument(docid);
		ModelMap map=new ModelMap();
		if(MessageCode==0)
		{
			map.addAttribute("MessageError","Document cannot be deleted at this time...");
		}
		else if(MessageCode==1)
		{
			map.addAttribute("MessageSuccess","Document Deleted !");
			
			for(int i=0;i<doclist.size();i++)
				doclist.get(i).setData(null);
		}
		map.addAttribute("doclist",doclist);
		map.addAttribute("currentstudy",currentstudy);
		return new ModelAndView("studyDocument",map);
	}

	public ModelAndView DownloadDocument(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		List<StudyDocuments> doclist;
		
		
		
		StudyDocuments doc=new StudyDocuments();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc=documentsdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		doclist=documentsdao.getStudyDocuments(StudyID);
		for(int i=0;i<doclist.size();i++)
			doclist.get(i).setData(null);

		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("doclist",doclist);
		return new ModelAndView("studyDocument",map);
	}

	public ModelAndView OpenStudyDocuments(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		List<StudyDocuments> doclist;
		
		
		
		doclist=documentsdao.getStudyDocuments(StudyID);
		for(int i=0;i<doclist.size();i++)
			doclist.get(i).setData(null);

		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("doclist",doclist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studyDocument",map);
	}

	public ModelAndView OpenViewStudyDetail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<Sponsor> sponsorlist;
		List<ProtocolVersion> protocolList;
		
		
		currentstudy=studiesdao.getStudyDetail(StudyID).get(0);		
		sponsorlist=sponsorDAO.SponsorList(CurrentUser);		
		Sponsor currentsponsor=sponsorDAO.getSponsor(currentstudy.getClient_name());

		protocolList=protocolDAO.getStudyProtocolVersionList(currentstudy.getStudy_id());
		Date date=protocolDAO.GetLastProtocolStartDate(currentstudy.getStudy_id());
		ModelMap map=new ModelMap();
		map.addAttribute("LastProtocolDate",date);
		map.addAttribute("sponsorlist",sponsorlist);		
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("client",currentsponsor);
		map.addAttribute("Home", "current_btn");
		map.addAttribute("protocolList",protocolList);
		return new ModelAndView("studyDetail",map);
	}

	public ModelAndView OpenViewStudyInvestigators(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<Users> investigators;
		
		
		investigators=usersdao.listStudyinvestigators(StudyID);
		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("userslist",investigators);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studyInvestigators",map);
	}

	public ModelAndView OpenViewStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		ModelMap map=studysiteDAO.getStudySites(StudyID);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studysite",map);
	}

	public ModelAndView discrepenciesInStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		List<Discrepancy_on_crf> disc_list=studiesdao.discrepancyinStudies(StudyID);
		List<CaseReportForms> crfList = studiesdao.CrfsList(CurrentUser);
		List<PatientCRF> pList = studiesdao.pCrfsList(CurrentUser);
		List<Users> studyUser = studiesdao.studyUser(CurrentUser);
		List<Patients> patients = studiesdao.getPatients(CurrentUser);
		List<Visits> visits = studiesdao.getVisits(CurrentUser);
		List<VisitNameTexts> visitText = studiesdao.getvisitText(CurrentUser);
		ModelMap map=new ModelMap();
		map.addAttribute("disc_list",disc_list);
		map.addAttribute("crfList",crfList);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("pList", pList);
		map.addAttribute("patients",patients);
		map.addAttribute("visits",visits);
		map.addAttribute("visitText",visitText);
		map.addAttribute("userList",studyUser);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studyDiscrepancies",map);
	}

	public ModelAndView discrepenciesInSite(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int siteId = Integer.parseInt(request.getParameter("stiteId"));
		List<Discrepancy_on_crf> disc_list=sitesDAO.discrepancyinSites(siteId);
		currentsite=sitesDAO.getSite(siteId);
		List<CaseReportForms> crfList = studiesdao.CrfsList(CurrentUser);
		List<PatientCRF> pList = studiesdao.pCrfsList(CurrentUser);
		List<Users> studyUser = studiesdao.studyUser(CurrentUser);
		List<Patients> patients = studiesdao.getPatients(CurrentUser);
		List<Visits> visits = studiesdao.getVisits(CurrentUser);
		List<VisitNameTexts> visitText = studiesdao.getvisitText(CurrentUser);
		ModelMap map=new ModelMap();
		map.addAttribute("disc_list",disc_list);
		map.addAttribute("crfList",crfList);
		map.addAttribute("pList", pList);
		map.addAttribute("patients",patients);
		map.addAttribute("visits",visits);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("visitText",visitText);

		map.addAttribute("userList",studyUser);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("siteDiscrepancies",map);
	}

	public ModelAndView OpenChangeStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<studies> studieslist;	 
		List<Sponsor> sponsorlist;
		
		
		
		sponsorlist=sponsorDAO.SponsorList(CurrentUser);
		studieslist=studiesdao.StudiesList(CurrentUser);
		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("sponsorlist",sponsorlist);
		map.addAttribute("studieslist",studieslist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studychange",map);
	}

	public ModelAndView OpenUsersStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<Users> userslist;	
		
		
		userslist=usersdao.listStudyUsers(CurrentUser,StudyID); 
		ModelMap map=new ModelMap();
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("userslist",userslist);
		map.addAttribute("Home", "current_btn");
		return new ModelAndView("studyusers",map);
	}

	public ModelAndView DeleteUserStudy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		List<Users> userslist;	
		
		
		userslist=usersdao.listStudyUsers(CurrentUser,StudyID); 
		
		int userid=Integer.parseInt(request.getParameter("User_ID"));
		int Message=studiesdao.DeleteStudySiteUser(StudyID, userid);
		ModelMap map=new ModelMap();
		if(Message==0)
		{
			map.addAttribute("DeleteUserStudyReturnMessageError","User cannot be deleted from study at this time...");
		}
		else if(Message==1)
		{
			map.addAttribute("DeleteUserStudyReturnMessageSuccess","User deleted from study");
			
		}

		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("userslist",userslist);
		return new ModelAndView("studyusers",map);
	}

	public int getStudyID() {
		return StudyID;
	}

	public void setStudyID(int studyID) {
		StudyID = studyID;
	}	


	public Users getCurrentUser() {
		return CurrentUser;
	}

	public void setCurrentUser(Users currentUser) {
		this.CurrentUser = currentUser;
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

	public SponsorDAO getSponsorDAO() {
		return sponsorDAO;
	}

	public void setSponsorDAO(SponsorDAO sponsorDAO) {
		this.sponsorDAO = sponsorDAO;
	}

	public DocumentsDAO getDocumentsdao() {
		return documentsdao;
	}

	public void setDocumentsdao(DocumentsDAO documentsdao) {
		this.documentsdao = documentsdao;
	}


	public CountriesDAO getCountriesDAO() {
		return countriesDAO;
	}

	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}
	public LaboratoryDAO getLaboratoryDAO() {
		return laboratoryDAO;
	}
	public void setLaboratoryDAO(LaboratoryDAO laboratoryDAO) {
		this.laboratoryDAO = laboratoryDAO;
	}
	public protocolVersionDAO getProtocolDAO() {
		return protocolDAO;
	}
	public void setProtocolDAO(protocolVersionDAO protocolDAO) {
		this.protocolDAO = protocolDAO;
	}
}// End of Controller

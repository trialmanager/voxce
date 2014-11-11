package com.Voxce.Controllers;


import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.ActionTextsDAO;
import com.Voxce.DAO.PatientDAO;
import com.Voxce.DAO.PatientVisitDAO;
import com.Voxce.DAO.QueryStatusesDAO;
import com.Voxce.DAO.SitesDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.ActionTexts;
import com.Voxce.model.AuditTrail;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Discrepancy_on_crf;
import com.Voxce.model.PatientCRF;
import com.Voxce.model.PatientVisits;
import com.Voxce.model.Patients;
import com.Voxce.model.QueryStatuses;
import com.Voxce.model.Sites;
import com.Voxce.model.Users;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;
import com.Voxce.model.studies;

@Controller
public class PatientController extends MultiActionController{

	private studies currentstudy;
	private Sites currentsite;
	private Users CurrentUser;


	private SitesDAO sitesdao;
	private StudiesDAO studiesdao;
	private UsersDAO useDao;
	private Patients patient;
	private PatientDAO patientdao;
	private PatientVisitDAO patvisitdao;
	private ActionTextsDAO actionDao;
	private QueryStatusesDAO statusDao;



	public ModelAndView ShowPatientIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		try{

			List<Patients> patientlist;
			List<PatientVisits> patientvisitlist;
			List<Visits> visitslist;
			List<VisitNameTexts> visitnamelist;

			int studyid=Integer.parseInt(request.getParameter("studyid"));
			int siteid=Integer.parseInt(request.getParameter("siteid"));
			// this is not a good approach of code.... (ZS)
			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);
			currentsite=sitesdao.getSite(siteid);
			patientvisitlist = patvisitdao.listpatientvisits(CurrentUser);
			patientlist=patientdao.listpatients(currentstudy.getStudy_id(),currentsite.getSite_id());
			visitslist = patvisitdao.listvisits(currentstudy.getStudy_id());
			visitnamelist = patvisitdao.listvisitsname(CurrentUser);

			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("currentsite",currentsite);
			modelMap.addAttribute("patientlist",patientlist);
			modelMap.addAttribute("patientvisitlist",patientvisitlist);
			modelMap.addAttribute("visitslist",visitslist);
			modelMap.addAttribute("visitnamelist",visitnamelist);
			return new ModelAndView("patient_index",modelMap);  
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("patient_index",new ModelMap());  
	}


	public ModelAndView updateOptimum(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		try{



			String d=request.getParameter("optimumDate");
			String open=request.getParameter("open");
			String close=request.getParameter("close");
			int opt_days=Integer.parseInt(request.getParameter("opt"));
			int patid=Integer.parseInt(request.getParameter("pvid"));
			DateFormat tempdate=new SimpleDateFormat("dd MMM, yy");
			DateFormat sqlDateFormat=new SimpleDateFormat("yyyy-M-dd");
			PatientVisits patientVisits=new PatientVisits();
			String tempstr=sqlDateFormat.format(tempdate.parse(d).getTime()).toString();


			Date date = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());

			tempstr=sqlDateFormat.format(tempdate.parse(open).getTime()).toString();
			Date openDate = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());

			tempstr=sqlDateFormat.format(tempdate.parse(close).getTime()).toString();
			Date closeDate = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());

			patientVisits.setPatient_visit_id(patid);
			patientVisits.setOptimum_days(opt_days);
			patientVisits.setexpected_date(date);
			patientVisits.setLast_date_for_visit(closeDate);
			patientVisits.setStart_date_for_visit(openDate);

			//	System.out.println("*******"+tempstr+"******"+date+"******"+patid+"*****"+openDate+"*****"+closeDate+"\n");
			int msg=0;
			msg=patientdao.updateOptimumDate(patientVisits);
			if(msg==1){
				return new ModelAndView("../success",new ModelMap());
			}else{
				return new ModelAndView("../error",new ModelMap());
			}

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//response.sendRedirect("login.htm");
		}
		return new ModelAndView("patient_index",new ModelMap());  
	}

	public ModelAndView savePatient(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Patients> patientlist;
		List<PatientVisits> patientvisitlist;
		List<Visits> visitslist;
		List<VisitNameTexts> visitnamelist;

		patientlist=patientdao.listpatients(currentstudy.getStudy_id(),currentsite.getSite_id());
		patientvisitlist = patvisitdao.listpatientvisits(CurrentUser);
		visitslist = patvisitdao.listvisits(currentstudy.getStudy_id());
		visitnamelist = patvisitdao.listvisitsname(CurrentUser);

		Patients patient=new Patients();
		String id = request.getParameter("edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the patient record...
			patient.setPatient_id(idnum);

			String str = request.getParameter("date_created");
			/*String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];*/
			DateFormat tempdate=new SimpleDateFormat("dd-MM-yyyy");
			DateFormat sqlDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			//System.out.println("\n\n\n\nDate Created : "+str+"\n\n\n");
			//String tempstr=sqlDateFormat.format(tempdate.parse(str).getTime()).toString();
			//System.out.print("\n\n\n Date Created "+tempstr+"\n\n\n");

			//	Date date = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			patient.setDate_created(datecreated);
			patient.setCreated_by(Integer.parseInt(request.getParameter("created_by")));
			patient.setModified_by((int) CurrentUser.getUser_id());


		}
		else{
			patient.setCreated_by((int) CurrentUser.getUser_id());
			patient.setModified_by((int) CurrentUser.getUser_id());
		}
		patient.setSubscriber_id(CurrentUser.getSubscription_id());
		patient.setPatient_number(request.getParameter("number"));
		patient.setInitials(request.getParameter("initials"));
		String str = request.getParameter("gender");


		char a[] = str.toCharArray();
		patient.setGender(a[0]);
		//=================================================study and study site id will be from sessions========================//
		patient.setStudy_id(currentstudy.getStudy_id());
		patient.setSite_id(currentsite.getSite_id());
		//=================================================study and study site id will be from sessions========================//
		str = request.getParameter("dateofbirth");

		String str2 = request.getParameter("dateofinformedconsent");
		String str3 = request.getParameter("dateofrandomization");
		/*
		String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		DateFormat tempdate=new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat sqlDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String tempstr=sqlDateFormat.format(tempdate.parse(str).getTime());
		System.out.println("\n*************string******"+tempstr+"****************"+str+"\n");

		//	Date td=



		java.sql.Date dateOB = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());

		patient.setDate_of_birth(dateOB);
		/*temp = str2.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */

		tempstr=sqlDateFormat.format(tempdate.parse(str2).getTime());

		dateOB = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());
		patient.setDate_of_informed_consent(dateOB);
		if(str3 != "")
		{
			/*temp = str3.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			tempstr=sqlDateFormat.format(tempdate.parse(str3).getTime());
			dateOB = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());
			patient.setDate_of_randomization(dateOB);
		}
		//	System.out.println("\n*******************"+patient.getDate_of_birth()+"****************\n");
		if(idnum == 0)
		{

			int Message=patientdao.savePatient(patient);	
			try
			{
				patientlist=patientdao.listpatients(currentstudy.getStudy_id(),currentsite.getSite_id());
				if(Message== 0)
				{

					
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("currentsite",currentsite);
					modelMap.addAttribute("patientlist",patientlist);
					modelMap.addAttribute("patientvisitlist",patientvisitlist);
					modelMap.addAttribute("visitslist",visitslist);
					modelMap.addAttribute("visitnamelist",visitnamelist);
					modelMap.addAttribute("MessageCode",Message);
					return new ModelAndView("patient_index",modelMap);
				}
				else if(Message == 1)
				{


					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("currentsite",currentsite);
					modelMap.addAttribute("patientlist",patientlist);
					modelMap.addAttribute("patientvisitlist",patientvisitlist);
					modelMap.addAttribute("visitslist",visitslist);
					modelMap.addAttribute("visitnamelist",visitnamelist);
					modelMap.addAttribute("MessageCode",Message);
					return new ModelAndView("patient_index",modelMap);
				}

			}
			catch(Exception expObj)
			{
				return new ModelAndView("patient_index");
			}
		}

		//=====================================================edit patient========================================================//
		else
		{
			patientdao.editPatient(patient);	
			patientlist=patientdao.listpatients(currentstudy.getStudy_id(),currentsite.getSite_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("currentsite",currentsite);
			modelMap.addAttribute("patientlist",patientlist);
			modelMap.addAttribute("patientvisitlist",patientvisitlist);
			modelMap.addAttribute("visitslist",visitslist);
			modelMap.addAttribute("visitnamelist",visitnamelist);
			modelMap.addAttribute("CurrentForm","View_Patient_Div");
			return new ModelAndView("patient_index",modelMap);
		}
		return new ModelAndView("patient_index");
	}



	public ModelAndView assignPatientVisit(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	

		/*	PatientVisits patientvisit=new PatientVisits();
		int patientid = patvisitdao.getPatientId(Integer.parseInt(request.getParameter("patient_no")));
		patientvisit.setPatient_id(patientid);

		(ZS)
		 */		

		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Patients> patientlist;
		List<PatientVisits> patientvisitlist;
		List<Visits> visitslist;
		List<VisitNameTexts> visitnamelist;


		// The Commented code of the (patientid) thing should b here(ZS)
		int patientid = patvisitdao.getPatientId(Integer.parseInt(request.getParameter("patient_no")));

		if(request.getParameterValues("patient_visit") != null){
			String values[] = request.getParameterValues("patient_visit");
			List<Integer> us=new ArrayList<Integer>();
			for(int i=0;i<values.length;i++){
				us.add(Integer.parseInt(values[i]));  
			}

			for(int i=0;i< us.size();i++){

				boolean flag =  patvisitdao.findPatientVisitByIds(patientid,us.get(i));
				if(!flag){
					PatientVisits patientvisit=new PatientVisits();
					/*
					 * 
					 *  this not right here to write (ZS)
					 *  
					 *  
				int patientid = patvisitdao.getPatientId(Integer.parseInt(request.getParameter("patient_no")));*/
					patientvisit.setPatient_id(patientid);
					patientvisit.setVisit_id(us.get(i));
					String str = patvisitdao.getVisitDate(us.get(i));
					/*
					 * this is not required thing because the time is already in the same pattern. (ZS)
					 * 
					 * 
				String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
				savePatient
					 */
					java.sql.Date dateOB = java.sql.Date.valueOf(str);


					//(ZS) this date is set when user set the patient visit date
					//-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-**-*-*-***-
					//patientvisit.setVisit_date(dateOB);
					//*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
					//=================================================visit status id is hard coded========================//
					patientvisit.setVisit_status("Pandding");
					//=================================================visit status id is hard coded========================//
					patientvisit.setCreated_by((int) CurrentUser.getUser_id());
					patientvisit.setModified_by((int) CurrentUser.getUser_id());
					patvisitdao.assignVisit(patientvisit);
				}else{
					continue;
				}

			}
			List<PatientVisits> selectedVisits = patientdao.getPatientVisits(patientid);

			List<Integer> notExisit = new ArrayList<Integer>();
			boolean falgeForVist = false;
			for(int h = 0 ; h < selectedVisits.size() ; h++){
				falgeForVist = false;
				for(int k = 0 ; k < us.size() ; k++ ){
					if(selectedVisits.get(h).getVisit_id() == us.get(k)){
						falgeForVist = true;
						break;
					}
				}
				if(!falgeForVist){
					notExisit.add(selectedVisits.get(h).getVisit_id());
				}
			}

			patvisitdao.deleteVisits(notExisit);
		}
		else{
			patvisitdao.deleteAll(patientid);
		}

		patientlist=patientdao.listpatients(currentstudy.getStudy_id(),currentsite.getSite_id());
		// this update of list update is also keep here because new visits are updated in this 
		patientvisitlist = patvisitdao.listpatientvisits(CurrentUser);
		visitslist = patvisitdao.listvisits(currentstudy.getStudy_id());
		visitnamelist = patvisitdao.listvisitsname(CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("currentsite",currentsite);
		modelMap.addAttribute("patientlist",patientlist);
		modelMap.addAttribute("patientvisitlist",patientvisitlist);
		modelMap.addAttribute("visitslist",visitslist);
		modelMap.addAttribute("visitnamelist",visitnamelist);
		modelMap.addAttribute("CurrentForm","View_Patient_Div");

		return new ModelAndView("patient_index",modelMap); 
	}
	//************************************************************************************************************//
	public ModelAndView PatientVisitCRF(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


		List<Visits> visitslist;
		List<VisitNameTexts> visitnamelist;
		List<PatientCRF> paCrfs;
		List<CaseReportForms> crf ;

		int patientid=Integer.parseInt(request.getParameter("patientId").trim());
		int PatientNumber=Integer.parseInt(request.getParameter("patientNumber").trim());
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try{
			List<studies> li=studiesdao.getStudyDetail(Integer.parseInt(request.getParameter("studyid").trim()));
			currentstudy=li.get(0);
			Integer siteId = Integer.parseInt(request.getParameter("siteid").trim());
			currentsite=sitesdao.getSite(Integer.parseInt(request.getParameter("siteid").trim()));


		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}
		List<PatientVisits> selectedVisits = patientdao.getPatientVisits(patientid);
		paCrfs=patientdao.PCrfs(currentstudy.getStudy_id(),currentsite.getSite_id() ,patientid);
		crf = patientdao.CrfList(CurrentUser);
		List<Discrepancy_on_crf> discrepancyList = patientdao.discrepancyList(paCrfs);
		visitslist = patvisitdao.listvisits(currentstudy.getStudy_id());
		visitnamelist = patvisitdao.listvisitsname(CurrentUser);
		List<Users> usersList = useDao.listusersAndSuperAdmin(CurrentUser);
		Integer patien_visit_id = -20;
		try{
			patien_visit_id = Integer.parseInt(request.getParameter("patient_visit_id").trim());
		}catch (Exception e) {
			// TODO: handle exception
			Integer result = patientdao.PatientVisit(patientid, Integer.parseInt(request.getParameter("visitid")));
			if(result == null){
				response.sendRedirect("login.htm");
			}else{
				patien_visit_id = result;
			}
		}

		//these are commented because this is live controller and the data is already in the lists 
		//visitnamelist = patientdao.visitsName();
		//visitslist = patientdao.visits();
		List<ActionTexts> actionList = actionDao.getActionTextsList(CurrentUser);
		List<QueryStatuses> statusList = statusDao.getQueryStatusesList(CurrentUser);
		List<AuditTrail> audit = patientdao.getAuditPatient(patientid);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("currentsite",currentsite);
		modelMap.addAttribute("patentCrf",crf);
		modelMap.addAttribute("visitslist",visitslist);
		modelMap.addAttribute("mape",paCrfs);
		modelMap.addAttribute("audit",audit);
		modelMap.addAttribute("visitsName",visitnamelist);
		modelMap.addAttribute("patientid",patientid);
		modelMap.addAttribute("selectedVisits",selectedVisits);
		modelMap.addAttribute("patientNumber",PatientNumber);
		modelMap.addAttribute("visitName",request.getParameter("visitName"));
		modelMap.addAttribute("users",usersList);
		modelMap.addAttribute("action",actionList);
		modelMap.addAttribute("statusText",statusList);
		modelMap.addAttribute("discrepancyList",discrepancyList);
		modelMap.addAttribute("patient_visit_id",patien_visit_id);
		return new ModelAndView("patientcrf",modelMap);
	}

	public ModelAndView PatientVisits(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Visits> visitslist;
		List<VisitNameTexts> visitnamelist;
		List<PatientCRF> paCrfs;
		List<CaseReportForms> crf ;

		visitnamelist = patvisitdao.listvisitsname(CurrentUser);
		visitslist = patvisitdao.listvisits(currentstudy.getStudy_id());

		int patientid=Integer.parseInt(request.getParameter("patientId").trim());
		int PatientNumber=Integer.parseInt(request.getParameter("patientNumber").trim());
		try{
			List<studies> li=studiesdao.getStudyDetail(Integer.parseInt(request.getParameter("studyid").trim()));
			currentstudy=li.get(0);
			currentsite=sitesdao.getSite(Integer.parseInt(request.getParameter("siteid").trim()));
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}


		List<PatientVisits> selectedVisits = patientdao.getPatientVisits(patientid);
		paCrfs=patientdao.PCrfs(currentstudy.getStudy_id(),currentsite.getSite_id(),patientid);
		crf = patientdao.CrfList(CurrentUser);
		//these are commented because this is live controller and the data is already in the lists 
		//	visitnamelist = patientdao.visitsName();
		//	visitslist = patientdao.visits();

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("currentsite",currentsite);
		modelMap.addAttribute("patentCrf",crf);
		modelMap.addAttribute("visitslist",visitslist);
		modelMap.addAttribute("mape",paCrfs);
		modelMap.addAttribute("visitsName",visitnamelist);
		modelMap.addAttribute("patientid",patientid);
		modelMap.addAttribute("selectedVisits",selectedVisits);
		modelMap.addAttribute("patientNumber",PatientNumber);
		return new ModelAndView("patientVisit",modelMap);
	}
	//************************************************************************************************************//

	public ModelAndView savePatientCrfs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		int patientCrfID=Integer.parseInt(request.getParameter("id").trim());
		String html_data = request.getParameter("data_html");
		String status = request.getParameter("status");
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}

		patientdao.savePatientCrf(currentstudy.getStudy_id(),currentsite.getSite_id(),patientCrfID, html_data, status,CurrentUser.getUser_id(), Integer.parseInt(request.getParameter("patient_visit_id")));


		ModelMap modelMap = new ModelMap();


		response.sendRedirect("PatientVisitCRF.pat?patientId="+request.getParameter("patientid").trim()+"&patientNumber="+request.getParameter("patientNumber")+"&studyid="+request.getParameter("studyid")+"&siteid="+request.getParameter("siteid")+"&visitName="+request.getParameter("visitName")+"&patient_visit_id="+request.getParameter("patient_visit_id").trim());	

		return new ModelAndView("patientcrf",modelMap); 

	}
	
	public ModelAndView deletePatientCrfs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		int patientCrfID=Integer.parseInt(request.getParameter("patientCrfID").trim());
		int patientid=Integer.parseInt(request.getParameter("patientid").trim());
		int pvid=Integer.parseInt(request.getParameter("patient_visit_id").trim());


		patientdao.deletePatientCrf(patientCrfID,patientid,pvid);




		ModelMap modelMap = new ModelMap();

		response.sendRedirect("PatientVisitCRF.pat?patientId="+request.getParameter("patientid").trim()+"&patientNumber="+request.getParameter("patientNumber")+"&patient_visit_id="+request.getParameter("patient_visit_id")+"&studyid="+request.getParameter("studyid")+"&siteid="+request.getParameter("siteid"));	

		return new ModelAndView("patientcrf",modelMap); 

	}


	public ModelAndView saveDiscrepancies(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		String[] err = request.getParameterValues("errors");
		String[] errors = err[0].split(",");
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		
		int result = 0;
		if(CurrentUser != null){
			System.out.println("\n\n\n\n in pateitn discrepency\n\n\n\n");
			result = patientdao.saveDiscrepancies(errors,currentstudy.getStudy_id(),currentsite.getSite_id(),Integer.parseInt(request.getParameter("patientCrfID").trim()),CurrentUser );
		}else{
			response.sendRedirect("login.htm");
		}
		
		ModelMap modelMap = new ModelMap();
		if(result == 1){
			return new ModelAndView("../success",modelMap);
		}else{
			return new ModelAndView("../error",modelMap);
		}

	}
	
	public ModelAndView discrepenciesInPatient(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		List<Discrepancy_on_crf> disc_list=patientdao.discrepancyofPatient(patientId);

		List<CaseReportForms> crfList = patientdao.CrfList(CurrentUser);
		List<PatientCRF> pList = patientdao.pCrfsList(CurrentUser);
		List<Users> studyUser = patientdao.User(CurrentUser);

		
		ModelMap map=new ModelMap();
		map.addAttribute("disc_list",disc_list);
		map.addAttribute("crfList",crfList);
		map.addAttribute("pList", pList);
		map.addAttribute("currentstudy",currentstudy);
		map.addAttribute("currentsite",currentsite);
		map.addAttribute("userList",studyUser);
		map.addAttribute("patientid",patientId);
		map.addAttribute("patientNumber",request.getParameter("patientNumber"));
		return new ModelAndView("patientDiscrepancies",map);
	}


	public ModelAndView responseOnQuery(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		int result = patientdao.resolveQuery(request.getParameter("discrepancy"), request.getParameter("question"), Integer.parseInt(request.getParameter("pacientCrf")),request.getParameter("type"), request.getParameter("action"), request.getParameter("reasion"), request.getParameter("section"), request.getParameter("status"), request.getParameter("orignal"), request.getParameter("current"),CurrentUser);


		ModelMap modelMap = new ModelMap();

		if(result == 1){
			return new ModelAndView("../success",modelMap);
		}else{
			return new ModelAndView("../error",modelMap);
		}

	}



	public ModelAndView RelatedVisitDate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			Integer patientVisitId = Integer.parseInt(request.getParameter("patientVisitId").trim());

			SimpleDateFormat ts= new SimpleDateFormat("dd MMM, yy");
			SimpleDateFormat ts1= new SimpleDateFormat("dd MMM, yy");
			SimpleDateFormat ts2= new SimpleDateFormat("dd MMM, yy");
			SimpleDateFormat ts3= new SimpleDateFormat("dd MMM, yy");

			DateFormat tempdate=new SimpleDateFormat("dd MMM, yy");
			DateFormat sqlDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String tempstr=sqlDateFormat.format(tempdate.parse(request.getParameter("date")).getTime());

			Date date  = new java.sql.Date(sqlDateFormat.parse(tempstr).getTime());
			Date close  = new java.sql.Date(ts2.parse(request.getParameter("close_date")).getTime());
			Date open  = new java.sql.Date(ts1.parse(request.getParameter("open_date")).getTime());
			Date due  = new java.sql.Date(ts3.parse(request.getParameter("due_date")).getTime());
			int result = patientdao.saveRelatedVisitDate(date,open,close,due, patientVisitId);
			ModelMap modelMap = new ModelMap();

			if(result == 1){
				return new ModelAndView("../success",modelMap);
			}else{
				return new ModelAndView("../error",modelMap);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ModelAndView("../error",new ModelMap());
		}
	}



	public ModelAndView visitDate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser != null){
				Integer patientVisitId = Integer.parseInt(request.getParameter("patientVisitId").trim());

				SimpleDateFormat ts= new SimpleDateFormat("dd MMM, yy");

				Date date  = new java.sql.Date(ts.parse(request.getParameter("date")).getTime());
				int result = patientdao.saveVisitDate(date, patientVisitId);
				ModelMap modelMap = new ModelMap();

				if(result == 1){
					return new ModelAndView("../success",modelMap);
				}else{
					return new ModelAndView("../error",modelMap);
				}
			}else{
				response.sendRedirect("login.htm");
				return new ModelAndView("../error",new ModelMap());
			}
		}catch (Exception e) {
			// TODO: handle exception
			return new ModelAndView("../error",new ModelMap());
		}
	}

	public ModelAndView auditTrail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser == null){
				response.sendRedirect("login.htm");
			}

			Integer patientid = Integer.parseInt(request.getParameter("patientid").trim());
			Integer studyid = Integer.parseInt(request.getParameter("studyid").trim());
			Integer siteid = Integer.parseInt(request.getParameter("siteid").trim());
			Integer patientVisitId = Integer.parseInt(request.getParameter("patientVisitId").trim());
			Integer patientCrf = Integer.parseInt(request.getParameter("patientCrf").trim());

			String valu[] = request.getParameterValues("dataArray");
			String[] values = valu[0].split(",");
			List<String> dataStrings=new ArrayList<String>();
			for(int i=0;i<values.length;i++){
				dataStrings.add(values[i]);  
			}

			int result = patientdao.saveAuditData(studyid, siteid, CurrentUser, patientid, patientVisitId, patientCrf, dataStrings);
			ModelMap modelMap = new ModelMap();

			if(result == 1){
				return new ModelAndView("../success",modelMap);
			}else{
				return new ModelAndView("../error",modelMap);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ModelAndView("../error",new ModelMap());
		}
	}

	public SitesDAO getSitesdao() {
		return sitesdao;
	}

	public void setSitesdao(SitesDAO sitesdao) {
		this.sitesdao = sitesdao;
	}

	public StudiesDAO getStudiesdao() {
		return studiesdao;
	}

	public void setStudiesdao(StudiesDAO studiesdao) {
		this.studiesdao = studiesdao;
	}

	public UsersDAO getUseDao() {
		return useDao;
	}

	public void setUseDao(UsersDAO useDao) {
		this.useDao = useDao;
	}

	public ActionTextsDAO getActionDao() {
		return actionDao;
	}

	public void setActionDao(ActionTextsDAO actionDao) {
		this.actionDao = actionDao;
	}

	public QueryStatusesDAO getStatusDao() {
		return statusDao;
	}

	public void setStatusDao(QueryStatusesDAO statusDao) {
		this.statusDao = statusDao;
	}
	public PatientDAO getPatientDAO() {
		return patientdao;
	}

	public void setPatientDAO(PatientDAO patdao) {
		this.patientdao = patdao;
	}
	public void setPatientVisitDAO(PatientVisitDAO patvisitdao) {
		this.patvisitdao = patvisitdao;
	}
	//


	/*
	 * */
}


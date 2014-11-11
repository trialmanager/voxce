package com.Voxce.Controllers;


import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CrfNameTextsDAO;
import com.Voxce.DAO.PatientPaymentDAO;
import com.Voxce.DAO.PaymentCodeDAO;
import com.Voxce.DAO.PaymentDAO;
import com.Voxce.DAO.PaymentScheduleDAO;
import com.Voxce.DAO.SitesDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.StudyPaymentDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.DAO.VisitNameTextsDAO;
import com.Voxce.DAO.VisitsDAO;
import com.Voxce.Views.PatientPaymentView;
import com.Voxce.Views.PaymentScheduleView;
import com.Voxce.Views.StudySitePaymentView;
import com.Voxce.Views.VisitNamesView;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.PatientPayment;
import com.Voxce.model.Patients;
import com.Voxce.model.PaymentCode;
import com.Voxce.model.PaymentSchedule;
import com.Voxce.model.Sites;
import com.Voxce.model.StudyPayment;
import com.Voxce.model.Users;
import com.Voxce.model.studies;

@Controller
public class PaymentController extends MultiActionController{
	private studies currentstudy;
	Users CurrentUser;
	PaymentSchedule paymentschedule;
	PatientPayment Ppayment;
	PaymentCode paymentcode;
	StudyPayment Spayment;
	
	PaymentScheduleDAO paymentscheduledao;
	StudiesDAO studydao;
	VisitNameTextsDAO visitnamedao;
	CrfNameTextsDAO crfnamedao;
	PaymentDAO paymentdao;
	PatientPaymentDAO patientpaymentdao;
	PaymentCodeDAO paymentcodedao;
	StudyPaymentDAO studypaymentdao;
	SitesDAO sitedao;
	VisitsDAO visitsdao;
	UsersDAO userdao;
	
	String selected_site,selected_site2;
	int patient_edit_id,site_edit_id;
	
	DecimalFormat df= new DecimalFormat("#0.00");	 
	public ModelAndView ShowSitePayments(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			currentstudy=studydao.getStudyDetail(Integer.parseInt(request.getParameter("studyid"))).get(0);
		
			List<StudySitePaymentView> studysitepaymentview= patientpaymentdao.listStudySitePayments(CurrentUser, currentstudy.getStudy_id());
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}		
			
			modelMap.addAttribute("studysitepaymentview",studysitepaymentview);
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("CurrentForm","View_Payment_Div");
			return new ModelAndView("paymentStudySiteView",modelMap);
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("paymentStudySiteView",null);
		}
	}
	
	public ModelAndView ShowCreateStudySitePayments(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			currentstudy=studydao.getStudyDetail(Integer.parseInt(request.getParameter("studyid"))).get(0);
		
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}		
			
			
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			if(request.getParameter("payment_form") != null){
				int form=Integer.parseInt(request.getParameter("payment_form"));
				if(form == 2)modelMap.addAttribute("CurrentForm","Study_Payment_Div");
				else if(form == 3)modelMap.addAttribute("CurrentForm","Site_Payment_Div");
				else if(form == 4)modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
			}else modelMap.addAttribute("CurrentForm","Study_Payment_Div");
			
			return new ModelAndView("payment",modelMap);
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("payment",null);
		}	
	}
	
	public ModelAndView ShowPayments(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			currentstudy=studydao.getStudyDetail(Integer.parseInt(request.getParameter("studyid"))).get(0);
		    
			List<PatientPaymentView> patientpaymentview= patientpaymentdao.listStudyPatientsPayments(CurrentUser, currentstudy.getStudy_id());
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}					
			modelMap.addAttribute("patientpaymentview",patientpaymentview);
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("CurrentForm","View_Payment_Div");			
			return new ModelAndView("paymentPatientView",modelMap);
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("paymentPatientView",null);
		}
	}
	
	public ModelAndView ShowPaymentCode(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		currentstudy=studydao.getStudyDetail(Integer.parseInt(request.getParameter("studyid"))).get(0);
		
		List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("codelist",codelist);
		int form=Integer.parseInt(request.getParameter("payment_code_form"));
		if(form == 1)
			modelMap.addAttribute("CurrentForm","View_Payment_Code_Div");
		else if(form == 2)
			modelMap.addAttribute("CurrentForm","New_Payment_Code_Div");
		return new ModelAndView("paymentcode",modelMap);
	}
	
	public ModelAndView ShowPaymentSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int studyid=Integer.parseInt(request.getParameter("studyid"));
		
		ModelMap modelMap = new ModelMap();
		List<studies> li=studydao.getStudyDetail(studyid);
		currentstudy=li.get(0);
		List<PaymentScheduleView> paymentschedulelist = paymentscheduledao.listpaymentschedule(CurrentUser,currentstudy.getStudy_id());
		List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
		List<Sites> siteslist = sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
		List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
		if(VisitsWithNames.size()!=0){
			List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
			modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
		}
		else{
			modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
		}
			
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("codelist",codelist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("VisitsWithNames",VisitsWithNames);		
		modelMap.addAttribute("paymentschedulelist",paymentschedulelist);
		int form=Integer.parseInt(request.getParameter("pay_sched_form"));
		if(form == 1)
			modelMap.addAttribute("CurrentForm","View_Payment_Schedule_Div");
		else if(form == 2)
			modelMap.addAttribute("CurrentForm","New_Payment_Schedule_Div");
		return new ModelAndView("payment_schedule",modelMap);
	}
 
	public ModelAndView newPaymentschedule(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		PaymentSchedule paymentschedule = new PaymentSchedule();
		ModelMap modelMap = new ModelMap();		
		int idnum = Integer.parseInt(request.getParameter("edit_id"));
		
		paymentschedule.setStudy(currentstudy.getStudy_id());		
		if(request.getParameter("payment_schedule_site") != null)
			paymentschedule.setSite(Integer.parseInt(request.getParameter("payment_schedule_site")));

		paymentschedule.setPayment_type(Integer.parseInt(request.getParameter("Add_Payment_Type")));
		paymentschedule.setVisit(Integer.parseInt(request.getParameter("visit")));
		if(request.getParameter("crf") != null && request.getParameter("crf") != "" )
			paymentschedule.setCrf(Integer.parseInt(request.getParameter("crf")));
		paymentschedule.setStatus(request.getParameter("status"));		
		Float f = (Float.parseFloat(request.getParameter("amount").trim()));
		paymentschedule.setAmount(Double.parseDouble(df.format(f.doubleValue())));
		paymentschedule.setDescription(request.getParameter("description"));		
		paymentschedule.setModified_by((int) CurrentUser.getUser_id());
		
		if(idnum == 0)
		{
			paymentschedule.setCreated_by((int) CurrentUser.getUser_id());
			int Message=paymentscheduledao.newPaymentSchedule(paymentschedule, currentstudy.getStudy_id());
		
			try
			{
				List<PaymentScheduleView> paymentschedulelist = paymentscheduledao.listpaymentschedule(CurrentUser,currentstudy.getStudy_id());
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist = sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}
				else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}
					
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);		
				modelMap.addAttribute("paymentschedulelist",paymentschedulelist);
				modelMap.addAttribute("Message",Message);
				modelMap.addAttribute("CurrentForm","New_Payment_Schedule_Div");
				return new ModelAndView("payment_schedule",modelMap);	
			}
			catch(Exception expObj)
			{
				return new ModelAndView("payment_schedule");
			}
		}
		else
		{		
			paymentschedule.setPayment_schedule_id(Integer.parseInt(request.getParameter("edit_id")));
			int Message=paymentscheduledao.editPaymentSchedule(paymentschedule, currentstudy.getStudy_id());
			
			try
			{				
				List<PaymentScheduleView> paymentschedulelist = paymentscheduledao.listpaymentschedule(CurrentUser,currentstudy.getStudy_id());
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist = sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}
				else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}
					
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);		
				modelMap.addAttribute("paymentschedulelist",paymentschedulelist);
				modelMap.addAttribute("Message",Message);
				modelMap.addAttribute("CurrentForm","View_Payment_Schedule_Div");
				if(Message==1){	modelMap.addAttribute("SMessage","Schedule updated successfully...");}
				else if(Message==0){modelMap.addAttribute("EMessage","Sorry Schedule cannot be updated at this time !");}
				else if(Message==2){modelMap.addAttribute("EMessage","Sorry Schedule already exists. Please choose different criteria for Schedule !");}
				return new ModelAndView("payment_schedule",modelMap);	
				
			}catch(Exception e){
				e.printStackTrace();
				return new ModelAndView("payment_schedule",null);
			}
			
		}
	}

	
	public ModelAndView newPaymentCode(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		//currentstudy =(studies) request.getSession().getAttribute("currentstudy");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		paymentcode = new PaymentCode();
		paymentcode.setStudy_id(currentstudy.getStudy_id());
		String id = request.getParameter("edit_id");
		int idnum = Integer.parseInt(id);
		if(idnum !=0 )
		paymentcode.setPayment_code_id(idnum);
		paymentcode.setName(request.getParameter("name"));
		paymentcode.setCode(request.getParameter("code"));
		paymentcode.setText(request.getParameter("text"));
		paymentcode.setSubscriber_id(CurrentUser.getSubscription_id());
		paymentcode.setRelated_to("Study");
		if(request.getParameter("related_to_site") != null)
			paymentcode.setRelated_to(request.getParameter("related_to_site"));
		paymentcode.setDescription(request.getParameter("description"));
		paymentcode.setCreated_by((int) CurrentUser.getUser_id());
		paymentcode.setModified_by((int) CurrentUser.getUser_id());
		if(idnum == 0)
		{
			int Message=paymentcodedao.newPaymentCode(CurrentUser,paymentcode,currentstudy.getStudy_id());
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			try
			{				
				if(Message == 1)
				{					
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CSMessage","New Payment Code Created Successfully ...");					
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("CurrentForm","New_Payment_Code_Div");				
					return new ModelAndView("paymentcode",modelMap);
				}
				else if(Message == 0)
				{
				
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CurrentForm","New_Payment_Code_Div");
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("CEMessage","New Payment code cannot be created at this time !");
					return new ModelAndView("paymentcode",modelMap);
				}
				else if(Message == 2)
				{				
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CurrentForm","New_Payment_Code_Div");
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("CEMessage","Payment Code Already Exists!");
					return new ModelAndView("paymentcode",modelMap);
				}	
			}
			catch(Exception expObj)
			{
				expObj.printStackTrace();
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("CurrentForm","New_Payment_Code_Div");
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("CEMessage","New Payment code cannot be created at this time !");
				return new ModelAndView("paymentcode",modelMap);
			}
//			System.out.println("\n\n\n\n\nNew\n\n\n\n\n");
		}
		else
		{
			
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date( cal.getTime().getTime() );
			
			paymentcode.setDate_created(date);
			int messagek=paymentcodedao.editPaymentCode(CurrentUser,paymentcode,currentstudy.getStudy_id());
			
			try{
				if(messagek==1)
				{
					List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CurrentForm","View_Payment_Code_Div");
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("SMessage","Payment Code Successfully Edited...");
					return new ModelAndView("paymentcode",modelMap);
				}
				else if(messagek==0)
				{
					List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CurrentForm","View_Payment_Code_Div");
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("EMessage","Payment Code cannot be edited this time !");
					return new ModelAndView("paymentcode",modelMap);
				}	
				else if(messagek == 2)
				{				
					List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("currentstudy",currentstudy);
					modelMap.addAttribute("CurrentForm","View_Payment_Code_Div");
					modelMap.addAttribute("codelist",codelist);
					modelMap.addAttribute("EMessage","Payment Code Already Exists!");
					return new ModelAndView("paymentcode",modelMap);
				}	
			}catch(Exception e)
			{
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("CurrentForm","View_Payment_Code_Div");
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("EMessage","Payment Code cannot be edited this time !");
				return new ModelAndView("paymentcode",modelMap);				
			}
		}
		return new ModelAndView("paymentcode");
	
	}
	
	public ModelAndView studyPayment(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			
			StudyPayment studypayment =new StudyPayment();
			studypayment.setStudy_id(currentstudy.getStudy_id());
			studypayment.setPayment_code_id(Integer.parseInt(request.getParameter("Study_Payment_Type").trim()));				
			if(request.getParameter("study_overhead").trim() != "" && request.getParameter("study_overhead").trim() != null)
				studypayment.setOverhead(Integer.parseInt(request.getParameter("study_overhead").trim()));
			if(request.getParameter("Payment_To_User").trim() != "" && request.getParameter("Payment_To_User").trim() != null){
				studypayment.setPay_to(Integer.parseInt(request.getParameter("Payment_To_User")));
			}else{
				studypayment.setPay_to_user_name(request.getParameter("Study_Payment_To_User_name"));
				studypayment.setPay_to_user_address(request.getParameter("Study_Payment_To_User_address"));
			}
				
			if(request.getParameter("po_no").trim() != "" && request.getParameter("po_no").trim() != null)
				studypayment.setPo_no(Integer.parseInt(request.getParameter("po_no")));
			if(request.getParameter("cheque_no").trim() != "" && request.getParameter("cheque_no").trim() != null)
				studypayment.setCheque_no(Integer.parseInt(request.getParameter("cheque_no")));
			if(request.getParameter("study_chequedate").trim() != "" && request.getParameter("study_chequedate").trim() != null)
				studypayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("study_chequedate")));
			if(request.getParameter("invoice_no").trim() != "" && request.getParameter("invoice_no").trim() != null)
				studypayment.setInvoice_no(Integer.parseInt(request.getParameter("invoice_no")));
			studypayment.setPay_amount(Double.parseDouble(request.getParameter("payment_amount_study")));
			studypayment.setTotal_payment(Double.parseDouble(request.getParameter("total_pay_study")));
			studypayment.setPayment_status(request.getParameter("payment_status"));
			studypayment.setModified_by(CurrentUser.getUser_id());
			
			int AddOrEdit=Integer.parseInt(request.getParameter("payment_level"));
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}		
			
			
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			
			if(AddOrEdit == 0){// Create Study Payment
				studypayment.setCreated_by(CurrentUser.getUser_id());
				int Message = studypaymentdao.saveStudyPayment(studypayment);								
				if(Message==1){
					modelMap.addAttribute("SMessage","New payment for study created successfully...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","New payment for study created cannot be created at this time !");
				}
				modelMap.addAttribute("CurrentForm","Study_Payment_Div");
				return new ModelAndView("payment",modelMap);
			}else if(AddOrEdit == 1){// Edit Study Payment
				studypayment.setStudy_payment_id(Integer.parseInt(request.getParameter("edit_id_study_payment")));
				int Message = studypaymentdao.saveStudyPayment(studypayment);								
				if(Message==1){
					modelMap.addAttribute("SMessage","Payment Updated successfully...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","Payment cannot be updates at this time !");
				}
				List<StudySitePaymentView> studysitepaymentview= patientpaymentdao.listStudySitePayments(CurrentUser, currentstudy.getStudy_id());
				modelMap.addAttribute("CurrentForm","View_Payment_Div");
				modelMap.addAttribute("studysitepaymentview",studysitepaymentview);
				return new ModelAndView("paymentStudySiteView",modelMap);
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("payment",null);
		}
		return new ModelAndView("payment",null);
	}
	
	public ModelAndView sitePayment(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			
			StudyPayment studypayment =new StudyPayment();
			studypayment.setStudy_id(currentstudy.getStudy_id());
			studypayment.setSite_id(Integer.parseInt(request.getParameter("site")));
			studypayment.setPayment_code_id(Integer.parseInt(request.getParameter("Site_Payment_Type").trim()));				
			
			if(request.getParameter("siteoverhead").trim() != "" && request.getParameter("siteoverhead").trim() != null)
				studypayment.setOverhead(Integer.parseInt(request.getParameter("siteoverhead").trim()));
			if(request.getParameter("Payment_To_User").trim() != "" && request.getParameter("Payment_To_User").trim() != null){
				studypayment.setPay_to(Integer.parseInt(request.getParameter("Payment_To_User")));
			}else{
				studypayment.setPay_to_user_name(request.getParameter("Payment_To_User_name"));
				studypayment.setPay_to_user_address(request.getParameter("Payment_To_User_address"));
			}
				
			if(request.getParameter("po_no").trim() != "" && request.getParameter("po_no").trim() != null)
				studypayment.setPo_no(Integer.parseInt(request.getParameter("po_no")));
			if(request.getParameter("cheque_no").trim() != "" && request.getParameter("cheque_no").trim() != null)
				studypayment.setCheque_no(Integer.parseInt(request.getParameter("cheque_no")));
			if(request.getParameter("chequedate").trim() != "" && request.getParameter("chequedate").trim() != null)
				studypayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("chequedate")));
			if(request.getParameter("invoice_no").trim() != "" && request.getParameter("invoice_no").trim() != null)
				studypayment.setInvoice_no(Integer.parseInt(request.getParameter("invoice_no")));
			
			studypayment.setPay_amount(Double.parseDouble(request.getParameter("payment_amount_site")));
			studypayment.setTotal_payment(Double.parseDouble(request.getParameter("total_pay_site")));
			studypayment.setPayment_status(request.getParameter("payment_status"));
			studypayment.setModified_by(CurrentUser.getUser_id());
			
			int AddOrEdit=Integer.parseInt(request.getParameter("SitePaymentAddEdit"));
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}		
			
			
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			
			if(AddOrEdit == 0){// Create Study Payment
				studypayment.setCreated_by(CurrentUser.getUser_id());
				int Message = studypaymentdao.saveStudyPayment(studypayment);
				if(Message==1){
					modelMap.addAttribute("SMessage","New payment for site created successfully...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","New payment for site created cannot be created at this time !");
				}
				modelMap.addAttribute("CurrentForm","Site_Payment_Div");
				return new ModelAndView("payment",modelMap);
			}else if(AddOrEdit == 1){// Edit Study Payment
				studypayment.setStudy_payment_id(Integer.parseInt(request.getParameter("Study_payment_id")));
				int Message = studypaymentdao.editStudySitePayment(studypayment);
				if(Message==1){
					modelMap.addAttribute("SMessage","Payment updated successfully...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","Payment cannot be updated at this time !");
				}
				List<StudySitePaymentView> studysitepaymentview= patientpaymentdao.listStudySitePayments(CurrentUser, currentstudy.getStudy_id());
				modelMap.addAttribute("CurrentForm","View_Payment_Div");
				modelMap.addAttribute("studysitepaymentview",studysitepaymentview);
				return new ModelAndView("paymentStudySiteView",modelMap);
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("payment",null);
		}
		return new ModelAndView("payment",null);
	}
	
	public ModelAndView patientPayment(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try{
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null){response.sendRedirect("login.htm");}
			
			PatientPayment patientPayment=new PatientPayment();
			patientPayment.setPayment_code_id(Integer.parseInt(request.getParameter("Patient_Payment_Type")));
			patientPayment.setPatient_id(Integer.parseInt(request.getParameter("patient_payment_num")));
			patientPayment.setSite_id(Integer.parseInt(request.getParameter("patient_site")));
			patientPayment.setStudy_id(currentstudy.getStudy_id());
			patientPayment.setVisit_id(Integer.parseInt(request.getParameter("patient_visit")));
			patientPayment.setCrf_id(Integer.parseInt(request.getParameter("patient_payment_crf")));
			if(request.getParameter("payment_amount_patient")!= "" && request.getParameter("payment_amount_patient")!= null)
				patientPayment.setPayment_amount(Double.parseDouble(request.getParameter("payment_amount_patient")));
			if(request.getParameter("patient_payment_po_no")!= "" && request.getParameter("patient_payment_po_no")!= null)
				patientPayment.setPo(Integer.parseInt(request.getParameter("patient_payment_po_no")));
			if(request.getParameter("patient_payment_invoice_no")!= "" && request.getParameter("patient_payment_invoice_no")!= null)
				patientPayment.setInvoice(Integer.parseInt(request.getParameter("patient_payment_invoice_no")));
			if(request.getParameter("patient_payment_overhead")!= "" && request.getParameter("patient_payment_overhead")!= null)
				patientPayment.setOver_head(Integer.parseInt(request.getParameter("patient_payment_overhead")));
			if(request.getParameter("Patient_Payment_To_User")!= "" && request.getParameter("Patient_Payment_To_User")!= null)
				patientPayment.setPay_to(Integer.parseInt(request.getParameter("Patient_Payment_To_User")));
			else{
				patientPayment.setPay_to_user_name(request.getParameter("Patient_Payment_To_User_name"));
				patientPayment.setPay_to_user_address(request.getParameter("Patient_Payment_To_User_address"));
			}
			if(request.getParameter("patient_payment_chequedate")!= "" && request.getParameter("patient_payment_chequedate")!= null)
				patientPayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("patient_payment_chequedate")));
			if(request.getParameter("patient_payment_cheque_no")!= "" && request.getParameter("patient_payment_cheque_no")!= null)
				patientPayment.setCheque_no(Integer.parseInt(request.getParameter("patient_payment_cheque_no")));
			if(request.getParameter("total_pay_crf")!= "" && request.getParameter("total_pay_crf")!= null)
				patientPayment.setTotal_payment(Double.parseDouble(request.getParameter("total_pay_crf")));
			patientPayment.setPayment_status(request.getParameter("patient_payment_status"));			
			patientPayment.setModified_by(CurrentUser.getUser_id());
			
			int AddOrEdit=Integer.parseInt(request.getParameter("PatientPaymentAddEdit"));
			List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
			List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
			List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
			List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			if(siteslist.size()!=0){
				List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),siteslist.get(0).getSite_id());
				modelMap.addAttribute("patientsList",patientsList);
			}			
			if(VisitsWithNames.size()!=0){
				List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
				modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
			}else{
				modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
			}		
			
			
			modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
			modelMap.addAttribute("codelist",codelist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("siteslist",siteslist);
			
			if(AddOrEdit == 0){// Create Study Payment
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				patientPayment.setCreated_by(CurrentUser.getUser_id());
				int Message = patientpaymentdao.savePatientPayment(patientPayment);
				if(Message==1){
					modelMap.addAttribute("SMessage","New payment for patient created successfully...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","New payment for patient cannot be created at this time !");
				}
				return new ModelAndView("payment",modelMap);
			}else if(AddOrEdit == 1){// Edit Study Payment
				modelMap.addAttribute("CurrentForm","View_Payment_Div");
				patientPayment.setPatient_payment_id(Integer.parseInt(request.getParameter("current_patient_payment_id")));
				int Message = patientpaymentdao.savePatientPayment(patientPayment);
				if(Message==1){
					modelMap.addAttribute("SMessage","Payment successfully Updated...");
				}else if(Message ==0){
					modelMap.addAttribute("EMessage","Payment cannot be updated at this time !");
				}
				List<PatientPaymentView> patientpaymentview= patientpaymentdao.listStudyPatientsPayments(CurrentUser, currentstudy.getStudy_id());
				modelMap.addAttribute("patientpaymentview",patientpaymentview);
				modelMap.addAttribute("CurrentForm","View_Payment_Div");
				return new ModelAndView("paymentPatientView",modelMap);
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("payment",null);
		}
		return new ModelAndView("payment",null);
	}
	
	
	public ModelAndView HiddenActions(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String type=request.getParameter("typeofaction");
		if(type.equals("OnVisitChange")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				PaymentSchedule currentpaymentSchedule=new PaymentSchedule();
				if(request.getParameter("HiddenValue13") != null && request.getParameter("HiddenValue13") != "")
					currentpaymentSchedule.setPayment_schedule_id(Integer.parseInt(request.getParameter("HiddenValue13")));	
				if(request.getParameter("HiddenValue14") != null && request.getParameter("HiddenValue14") != "")
					currentpaymentSchedule.setPayment_type(Integer.parseInt(request.getParameter("HiddenValue14")));
				if(request.getParameter("HiddenValue1") != null && request.getParameter("HiddenValue1") != "")
					currentpaymentSchedule.setVisit(Integer.parseInt(request.getParameter("HiddenValue1")));
				if(request.getParameter("HiddenValue10") != null && request.getParameter("HiddenValue10") != ""){
					Float f = (Float.parseFloat(request.getParameter("HiddenValue10").trim()));
					currentpaymentSchedule.setAmount(Double.parseDouble(df.format(f.doubleValue())));}
				if(request.getParameter("HiddenValue11") != null && request.getParameter("HiddenValue11") != "")
					currentpaymentSchedule.setDescription(request.getParameter("HiddenValue11"));
				if(request.getParameter("HiddenValue9") != null && request.getParameter("HiddenValue9") != "")
					currentpaymentSchedule.setStatus(request.getParameter("HiddenValue9"));
				
				ModelMap modelMap = new ModelMap();
				List<PaymentScheduleView> paymentschedulelist = paymentscheduledao.listpaymentschedule(CurrentUser,currentstudy.getStudy_id());
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist = sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,currentpaymentSchedule.getVisit());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}
					
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("currentpaymentSchedule",currentpaymentSchedule);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);		
				modelMap.addAttribute("paymentschedulelist",paymentschedulelist);
				modelMap.addAttribute("CurrentForm","New_Payment_Schedule_Div");
				return new ModelAndView("payment_schedule",modelMap);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(type.equals("EditPaymentSchedule")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}
				int PaymentScheduleID= Integer.parseInt(request.getParameter("HiddenValue2"));
				PaymentSchedule paymentSchedule=paymentscheduledao.getPaymentScheduleByID(PaymentScheduleID);
				ModelMap modelMap = new ModelMap();
				List<PaymentScheduleView> paymentschedulelist = paymentscheduledao.listpaymentschedule(CurrentUser,currentstudy.getStudy_id());
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist = sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,paymentSchedule.getVisit());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}
					
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("currentpaymentSchedule",paymentSchedule);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);		
				modelMap.addAttribute("paymentschedulelist",paymentschedulelist);
				modelMap.addAttribute("CurrentForm","New_Payment_Schedule_Div");
				return new ModelAndView("payment_schedule",modelMap);
			}catch(Exception e){
				return new ModelAndView("payment_schedule",null);
			}
		}else if(type.equals("PatientPaymentSiteChange")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}				
				PatientPayment patientpayment=new PatientPayment();				
				if(request.getParameter("ppHiddenValue5")!= "" && request.getParameter("ppHiddenValue5")!= null)
					patientpayment.setPayment_code_id(Integer.parseInt(request.getParameter("ppHiddenValue5")));
				if(request.getParameter("ppHiddenValue1")!= "" && request.getParameter("ppHiddenValue1")!= null)
					patientpayment.setSite_id(Integer.parseInt(request.getParameter("ppHiddenValue1")));
				if(request.getParameter("ppHiddenValue3")!= "" && request.getParameter("ppHiddenValue3")!= null)
					patientpayment.setVisit_id(Integer.parseInt(request.getParameter("ppHiddenValue3")));
				if(request.getParameter("ppHiddenValue4")!= "" && request.getParameter("ppHiddenValue4")!= null)
					patientpayment.setCrf_id(Integer.parseInt(request.getParameter("ppHiddenValue4")));
				if(request.getParameter("ppHiddenValue6")!= "" && request.getParameter("ppHiddenValue6")!= null)
					patientpayment.setPayment_amount(Double.parseDouble(request.getParameter("ppHiddenValue6")));
				if(request.getParameter("ppHiddenValue13")!= "" && request.getParameter("ppHiddenValue13")!= null)
					patientpayment.setPo(Integer.parseInt(request.getParameter("ppHiddenValue13")));
				if(request.getParameter("ppHiddenValue14")!= "" && request.getParameter("ppHiddenValue14")!= null)
					patientpayment.setInvoice(Integer.parseInt(request.getParameter("ppHiddenValue14")));
				if(request.getParameter("ppHiddenValue7")!= "" && request.getParameter("ppHiddenValue7")!= null)
					patientpayment.setOver_head(Integer.parseInt(request.getParameter("ppHiddenValue7")));
				if(request.getParameter("ppHiddenValue9")!= "" && request.getParameter("ppHiddenValue9")!= null)
					patientpayment.setPay_to(Integer.parseInt(request.getParameter("ppHiddenValue9")));
				if(request.getParameter("ppHiddenValue10")!= "" && request.getParameter("ppHiddenValue10")!= null)
					patientpayment.setPay_to_user_name(request.getParameter("ppHiddenValue10"));
				if(request.getParameter("ppHiddenValue11")!= "" && request.getParameter("ppHiddenValue11")!= null)
					patientpayment.setPay_to_user_address(request.getParameter("ppHiddenValue11"));
				if(request.getParameter("ppHiddenValue15")!= "" && request.getParameter("ppHiddenValue15")!= null)
					patientpayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("ppHiddenValue15")));
				if(request.getParameter("ppHiddenValue12")!= "" && request.getParameter("ppHiddenValue12")!= null)
					patientpayment.setCheque_no(Integer.parseInt(request.getParameter("ppHiddenValue12")));
				if(request.getParameter("ppHiddenValue8")!= "" && request.getParameter("ppHiddenValue8")!= null)
					patientpayment.setTotal_payment(Double.parseDouble(request.getParameter("ppHiddenValue8")));
				
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(siteslist.size()!=0){
					List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),patientpayment.getSite_id());
					modelMap.addAttribute("patientsList",patientsList);
				}			
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}		
				
				modelMap.addAttribute("TypeOfAction","PatientPaymentSiteChange");
				modelMap.addAttribute("currentpatientpayment",patientpayment);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				return new ModelAndView("payment",modelMap);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(type.equals("PatientPaymentVisitChange")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}
				
				PatientPayment patientpayment=new PatientPayment();
				
				if(request.getParameter("ppHiddenValue5")!= "" && request.getParameter("ppHiddenValue5")!= null)
					patientpayment.setPayment_code_id(Integer.parseInt(request.getParameter("ppHiddenValue5")));
				if(request.getParameter("ppHiddenValue1")!= "" && request.getParameter("ppHiddenValue1")!= null)
					patientpayment.setSite_id(Integer.parseInt(request.getParameter("ppHiddenValue1")));
				if(request.getParameter("ppHiddenValue3")!= "" && request.getParameter("ppHiddenValue3")!= null)
					patientpayment.setVisit_id(Integer.parseInt(request.getParameter("ppHiddenValue3")));
				if(request.getParameter("ppHiddenValue6")!= "" && request.getParameter("ppHiddenValue6")!= null)
					patientpayment.setPayment_amount(Double.parseDouble(request.getParameter("ppHiddenValue6")));
				if(request.getParameter("ppHiddenValue13")!= "" && request.getParameter("ppHiddenValue13")!= null)
					patientpayment.setPo(Integer.parseInt(request.getParameter("ppHiddenValue13")));
				if(request.getParameter("ppHiddenValue14")!= "" && request.getParameter("ppHiddenValue14")!= null)
					patientpayment.setInvoice(Integer.parseInt(request.getParameter("ppHiddenValue14")));
				if(request.getParameter("ppHiddenValue7")!= "" && request.getParameter("ppHiddenValue7")!= null)
					patientpayment.setOver_head(Integer.parseInt(request.getParameter("ppHiddenValue7")));
				if(request.getParameter("ppHiddenValue9")!= "" && request.getParameter("ppHiddenValue9")!= null)
					patientpayment.setPay_to(Integer.parseInt(request.getParameter("ppHiddenValue9")));
				if(request.getParameter("ppHiddenValue10")!= "" && request.getParameter("ppHiddenValue10")!= null)
					patientpayment.setPay_to_user_name(request.getParameter("ppHiddenValue10"));
				if(request.getParameter("ppHiddenValue11")!= "" && request.getParameter("ppHiddenValue11")!= null)
					patientpayment.setPay_to_user_address(request.getParameter("ppHiddenValue11"));
				if(request.getParameter("ppHiddenValue15")!= "" && request.getParameter("ppHiddenValue15")!= null)
					patientpayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("ppHiddenValue15")));
				if(request.getParameter("ppHiddenValue12")!= "" && request.getParameter("ppHiddenValue12")!= null)
					patientpayment.setCheque_no(Integer.parseInt(request.getParameter("ppHiddenValue12")));
				if(request.getParameter("ppHiddenValue8")!= "" && request.getParameter("ppHiddenValue8")!= null)
					patientpayment.setTotal_payment(Double.parseDouble(request.getParameter("ppHiddenValue8")));
				
				
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(siteslist.size()!=0){
					List<Patients> patientsList =paymentdao.listpatients_site(currentstudy.getStudy_id(),patientpayment.getSite_id());
					modelMap.addAttribute("patientsList",patientsList);
				}			
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,patientpayment.getVisit_id());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}		
				
				modelMap.addAttribute("TypeOfAction","PatientPaymentVisitChange");
				modelMap.addAttribute("currentpatientpayment",patientpayment);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				return new ModelAndView("payment",modelMap);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(type.equals("EditPatientpayment")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}
				
				int patientpaymentid=Integer.parseInt(request.getParameter("ppHiddenValue16"));
				PatientPayment patientpayment=patientpaymentdao.getPatientPayment(patientpaymentid);
								
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(siteslist.size()!= 0 ){
					List<Patients> patientslist = new ArrayList<Patients>();
					Patients patient =paymentdao.getPatient(patientpayment.getPatient_id());
					patientslist.add(patient);
					modelMap.addAttribute("patientsList",patientslist);
				}	
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,patientpayment.getVisit_id());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}		
				
				modelMap.addAttribute("TypeOfAction","EditPatientpayment");
				modelMap.addAttribute("currentpatientpayment",patientpayment);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				return new ModelAndView("paymentPatientView",modelMap);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(type.equals("EditPatientPaymentSiteChange")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}
				PatientPayment patientpayment=new PatientPayment();
				patientpayment.setPatient_payment_id(Integer.parseInt(request.getParameter("ppHiddenValue16")));
				if(request.getParameter("ppHiddenValue5")!= "" && request.getParameter("ppHiddenValue5")!= null)
					patientpayment.setPayment_code_id(Integer.parseInt(request.getParameter("ppHiddenValue5")));
				if(request.getParameter("ppHiddenValue1")!= "" && request.getParameter("ppHiddenValue1")!= null)
					patientpayment.setSite_id(Integer.parseInt(request.getParameter("ppHiddenValue1")));
				if(request.getParameter("ppHiddenValue3")!= "" && request.getParameter("ppHiddenValue3")!= null)
					patientpayment.setVisit_id(Integer.parseInt(request.getParameter("ppHiddenValue3")));
				if(request.getParameter("ppHiddenValue4")!= "" && request.getParameter("ppHiddenValue4")!= null)
					patientpayment.setCrf_id(Integer.parseInt(request.getParameter("ppHiddenValue4")));
				if(request.getParameter("ppHiddenValue6")!= "" && request.getParameter("ppHiddenValue6")!= null)
					patientpayment.setPayment_amount(Double.parseDouble(request.getParameter("ppHiddenValue6")));
				if(request.getParameter("ppHiddenValue13")!= "" && request.getParameter("ppHiddenValue13")!= null)
					patientpayment.setPo(Integer.parseInt(request.getParameter("ppHiddenValue13")));
				if(request.getParameter("ppHiddenValue14")!= "" && request.getParameter("ppHiddenValue14")!= null)
					patientpayment.setInvoice(Integer.parseInt(request.getParameter("ppHiddenValue14")));
				if(request.getParameter("ppHiddenValue7")!= "" && request.getParameter("ppHiddenValue7")!= null)
					patientpayment.setOver_head(Integer.parseInt(request.getParameter("ppHiddenValue7")));
				if(request.getParameter("ppHiddenValue9")!= "" && request.getParameter("ppHiddenValue9")!= null)
					patientpayment.setPay_to(Integer.parseInt(request.getParameter("ppHiddenValue9")));
				if(request.getParameter("ppHiddenValue10")!= "" && request.getParameter("ppHiddenValue10")!= null)
					patientpayment.setPay_to_user_name(request.getParameter("ppHiddenValue10"));
				if(request.getParameter("ppHiddenValue11")!= "" && request.getParameter("ppHiddenValue11")!= null)
					patientpayment.setPay_to_user_address(request.getParameter("ppHiddenValue11"));
				if(request.getParameter("ppHiddenValue15")!= "" && request.getParameter("ppHiddenValue15")!= null)
					patientpayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("ppHiddenValue15")));
				if(request.getParameter("ppHiddenValue12")!= "" && request.getParameter("ppHiddenValue12")!= null)
					patientpayment.setCheque_no(Integer.parseInt(request.getParameter("ppHiddenValue12")));
				if(request.getParameter("ppHiddenValue8")!= "" && request.getParameter("ppHiddenValue8")!= null)
					patientpayment.setTotal_payment(Double.parseDouble(request.getParameter("ppHiddenValue8")));
				
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(siteslist.size()!= 0 ){
					List<Patients> patientslist = new ArrayList<Patients>();
					Patients patient =paymentdao.getPatient(patientpayment.getPatient_id());
					patientslist.add(patient);
					modelMap.addAttribute("patientsList",patientslist);
				}		
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,VisitsWithNames.get(0).getVisitid());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}		
				
				modelMap.addAttribute("TypeOfAction","EditPatientPaymentSiteChange");
				modelMap.addAttribute("currentpatientpayment",patientpayment);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				return new ModelAndView("paymentPatientView",modelMap);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(type.equals("EditPatientPaymentVisitChange")){
			try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null){	response.sendRedirect("login.htm");	}
				
				PatientPayment patientpayment=new PatientPayment();
				patientpayment.setPatient_payment_id(Integer.parseInt(request.getParameter("ppHiddenValue16")));
				if(request.getParameter("ppHiddenValue5")!= "" && request.getParameter("ppHiddenValue5")!= null)
					patientpayment.setPayment_code_id(Integer.parseInt(request.getParameter("ppHiddenValue5")));
				if(request.getParameter("ppHiddenValue1")!= "" && request.getParameter("ppHiddenValue1")!= null)
					patientpayment.setSite_id(Integer.parseInt(request.getParameter("ppHiddenValue1")));
				if(request.getParameter("ppHiddenValue3")!= "" && request.getParameter("ppHiddenValue3")!= null)
					patientpayment.setVisit_id(Integer.parseInt(request.getParameter("ppHiddenValue3")));
				if(request.getParameter("ppHiddenValue6")!= "" && request.getParameter("ppHiddenValue6")!= null)
					patientpayment.setPayment_amount(Double.parseDouble(request.getParameter("ppHiddenValue6")));
				if(request.getParameter("ppHiddenValue13")!= "" && request.getParameter("ppHiddenValue13")!= null)
					patientpayment.setPo(Integer.parseInt(request.getParameter("ppHiddenValue13")));
				if(request.getParameter("ppHiddenValue14")!= "" && request.getParameter("ppHiddenValue14")!= null)
					patientpayment.setInvoice(Integer.parseInt(request.getParameter("ppHiddenValue14")));
				if(request.getParameter("ppHiddenValue7")!= "" && request.getParameter("ppHiddenValue7")!= null)
					patientpayment.setOver_head(Integer.parseInt(request.getParameter("ppHiddenValue7")));
				if(request.getParameter("ppHiddenValue9")!= "" && request.getParameter("ppHiddenValue9")!= null)
					patientpayment.setPay_to(Integer.parseInt(request.getParameter("ppHiddenValue9")));
				if(request.getParameter("ppHiddenValue10")!= "" && request.getParameter("ppHiddenValue10")!= null)
					patientpayment.setPay_to_user_name(request.getParameter("ppHiddenValue10"));
				if(request.getParameter("ppHiddenValue11")!= "" && request.getParameter("ppHiddenValue11")!= null)
					patientpayment.setPay_to_user_address(request.getParameter("ppHiddenValue11"));
				if(request.getParameter("ppHiddenValue15")!= "" && request.getParameter("ppHiddenValue15")!= null)
					patientpayment.setCheque_date(java.sql.Date.valueOf(request.getParameter("ppHiddenValue15")));
				if(request.getParameter("ppHiddenValue12")!= "" && request.getParameter("ppHiddenValue12")!= null)
					patientpayment.setCheque_no(Integer.parseInt(request.getParameter("ppHiddenValue12")));
				if(request.getParameter("ppHiddenValue8")!= "" && request.getParameter("ppHiddenValue8")!= null)
					patientpayment.setTotal_payment(Double.parseDouble(request.getParameter("ppHiddenValue8")));
				
				
				List<PaymentCode> codelist =paymentcodedao.listcodes(CurrentUser,currentstudy.getStudy_id());
				List<Users> userslist = userdao.listStudyUsers(CurrentUser,currentstudy.getStudy_id());
				List<Sites> siteslist= sitedao.StudySitesList(CurrentUser,currentstudy.getStudy_id());
				List<VisitNamesView> VisitsWithNames = visitnamedao.listStudyvisitsnames(CurrentUser,currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(siteslist.size()!= 0 ){
					List<Patients> patientslist = new ArrayList<Patients>();
					Patients patient =paymentdao.getPatient(patientpayment.getPatient_id());
					patientslist.add(patient);
					modelMap.addAttribute("patientsList",patientslist);
				}		
				if(VisitsWithNames.size()!=0){
					List<CaseReportForms> CaseReportFormsli= crfnamedao.listVisitcrfnames(CurrentUser,patientpayment.getVisit_id());
					modelMap.addAttribute("CaseReportFormsli",CaseReportFormsli);
				}else{
					modelMap.addAttribute("CaseReportFormsli",new ArrayList<CaseReportForms>());
				}		
				
				modelMap.addAttribute("TypeOfAction","EditPatientPaymentVisitChange");
				modelMap.addAttribute("currentpatientpayment",patientpayment);
				modelMap.addAttribute("VisitsWithNames",VisitsWithNames);
				modelMap.addAttribute("codelist",codelist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("siteslist",siteslist);
				modelMap.addAttribute("CurrentForm","Visit_Payment_Div");
				return new ModelAndView("paymentPatientView",modelMap);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return null;
	}// End Method
	
	public PaymentDAO getPaymentDAO() {
		return paymentdao;
	}

	public void setPaymentDAO(PaymentDAO paydao) {
		this.paymentdao = paydao;
	}
	public void setPaymentScheduleDAO(PaymentScheduleDAO payscheduledao) {
		this.paymentscheduledao = payscheduledao;
	}
	public void setStudiesDAO(StudiesDAO studydao) {
		this.studydao = studydao;
	}
	public void setPaymentCodeDAO(PaymentCodeDAO paycodedao) {
		this.paymentcodedao = paycodedao;
	}
	public void setSitesDAO(SitesDAO sitedao) {
		this.sitedao = sitedao;
	}
	public void setVisitNameTextsDAO(VisitNameTextsDAO visitnamedao) {
		this.visitnamedao = visitnamedao;
	}
	public void setVisitsDAO(VisitsDAO visitsdao) {
		this.visitsdao = visitsdao;
	}
	public void setCrfNameTextsDAO(CrfNameTextsDAO crfnamedao) {
		this.crfnamedao = crfnamedao;
	}
	public void setUsersDAO(UsersDAO usersdao) {
		this.userdao = usersdao;
	}
	public void setStudyPaymentDAO(StudyPaymentDAO studypaymentdao) {
		this.studypaymentdao = studypaymentdao;
	}
	public void setPatientPaymentDAO(PatientPaymentDAO patientpaymentdao) {
		this.patientpaymentdao = patientpaymentdao;
	}	
}


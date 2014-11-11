package com.Voxce.Controllers;


import java.io.PrintWriter;
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

import com.Voxce.DAO.ApprovalStatusTypeDAO;
import com.Voxce.DAO.ContractsDAO;
import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.FinancialDiscDAO;
import com.Voxce.DAO.MedicalLicenseDAO;
import com.Voxce.DAO.SitesDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.SubmissionDAO;
import com.Voxce.DAO.SubmissionTypeDAO;
import com.Voxce.DAO.TrainingDAO;
import com.Voxce.DAO.TrainingUserDAO;
import com.Voxce.DAO.UserCVDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.ApprovalStatusType;
import com.Voxce.model.Contracts;
import com.Voxce.model.Countries;
import com.Voxce.model.FinancialDisc;
import com.Voxce.model.MedicalLicense;
import com.Voxce.model.ProtocolVersion;
import com.Voxce.model.Sites;
import com.Voxce.model.StudyDocuments;
import com.Voxce.model.Submission;
import com.Voxce.model.SubmissionType;
import com.Voxce.model.Training;
import com.Voxce.model.TrainingUser;
import com.Voxce.model.UserCV;
import com.Voxce.model.Users;
import com.Voxce.model.studies;



@Controller
public class TrialsController extends MultiActionController{

	private studies currentstudy;
	Users CurrentUser;

	boolean CV = false;

	ApprovalStatusType approvalstatustype;
	SubmissionType submissiontype;
	Training training;
	UserCV usercv;
	TrainingUser traininguser;

	ApprovalStatusTypeDAO approvalstatustypedao;
	SubmissionTypeDAO submissiontypedao;
	TrainingUserDAO traininguserdao;
	TrainingDAO trainingdao;
	UserCVDAO usercvdao;
	StudiesDAO studiesdao;
	UsersDAO userdao;
	SitesDAO sitedao;
	SubmissionDAO submissiondao;
	ContractsDAO contractsdao;
	MedicalLicenseDAO medicaldao;
	FinancialDiscDAO financialdiscdao;
	CountriesDAO countriesDAO;



	FileItem CVitem,Contractitem,Financialdiscitem,medicallicenseitem,traininguseritem,submissionitem;
	int downloaded = 0;



	public ModelAndView ShowTrials(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}


		List<ApprovalStatusType> approvalstatustypelist;
		


		try{
			int studyid=Integer.parseInt(request.getParameter("studyid"));		
			currentstudy=studiesdao.getStudyDetail(studyid).get(0);

			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());

			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			if(request.getParameter("app_type_form") != null){
				int form=Integer.parseInt(request.getParameter("app_type_form"));
				if(form == 1)
					modelMap.addAttribute("CurrentFormApprovalType","View_Approval_Status_Type_div");
				else
					modelMap.addAttribute("CurrentFormApprovalType","Create_Approval_Status_Type_div");
			}
			else
				modelMap.addAttribute("CurrentFormApprovalType","View_Approval_Status_Type_div");
			return new ModelAndView("trials",modelMap); 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");

		}
		return new ModelAndView("trials",new ModelMap());  

	}

	//up done
	//==============================================show submission type=======================================================================//

	public ModelAndView ShowSubmissionType(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}

		List<ApprovalStatusType> approvalstatustypelist;
		List<SubmissionType> submissiontypelist;
		


		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		try{
			int studyid=Integer.parseInt(request.getParameter("studyid"));


			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);		
			submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());

			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("submissiontypelist",submissiontypelist);
			int form=Integer.parseInt(request.getParameter("sub_type_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormSubmissionType","View_Submission_Type_div");
			else
				modelMap.addAttribute("CurrentFormSubmissionType","Create_Submission_Type_div");

			return new ModelAndView("submission_type",modelMap);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}

		return new ModelAndView("submission_type",new ModelMap());    
	}


	//=====================================================Show training type form=================================================//


	public ModelAndView ShowTrainingType(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}


		
		List<Training> traininglist;
		

		try{


			int studyid=Integer.parseInt(request.getParameter("studyid"));


			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);
			traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());		
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("traininglist",traininglist);
			int form=Integer.parseInt(request.getParameter("train_type_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormTrainingType","View_Training_div");
			else
				modelMap.addAttribute("CurrentFormTrainingType","Create_Training_div");

			return new ModelAndView("training_type",modelMap); 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}

		return new ModelAndView("training_type",new ModelMap());    
	}


	//up done
	//=====================================================Show UserCV form=================================================//


	public ModelAndView ShowUserCV(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


	
		List<UserCV> usercvlist;
		List<Users> userslist;
		

		try{
			int studyid=Integer.parseInt(request.getParameter("studyid"));


			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);
			usercvlist = usercvdao.listusercv(currentstudy.getStudy_id());
			userslist = userdao.listusers(CurrentUser);
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("usercvlist",usercvlist);
			modelMap.addAttribute("userslist",userslist);
			int form=Integer.parseInt(request.getParameter("user_cv_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormUserCV","View_UserCV_div");
			else
				modelMap.addAttribute("CurrentFormUserCV","Create_UserCV_div");

			return new ModelAndView("usercv",modelMap);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}

		return new ModelAndView("usercv",new ModelMap());    
	}

	//up done
	//=====================================================Show Financial Disc form=================================================//


	public ModelAndView ShowFinancialDisc(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		List<Sites> siteslist;
		
		List<FinancialDisc> financialdisclist;
		
		List<ProtocolVersion> versionlist;
	



		try{
			int studyid=Integer.parseInt(request.getParameter("studyid"));


			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);
			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
			financialdisclist = financialdiscdao.listfinancialdisc(currentstudy.getStudy_id());
			versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());
			userslist = userdao.listusers(CurrentUser);
			siteslist = sitedao.SitesList(CurrentUser);
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);	
			modelMap.addAttribute("financialdisclist",financialdisclist);
			int form=Integer.parseInt(request.getParameter("financial_disc_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormFinancial","View_Financial_Disclosure_div");
			else
				modelMap.addAttribute("CurrentFormFinancial","Create_Financial_Disclosure_div");

			return new ModelAndView("financial_disc",modelMap); 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}

		return new ModelAndView("financial_disc",new ModelMap());    
	}

	//up done
	//=====================================================Show Contracts form=================================================//


	public ModelAndView ShowContracts(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<Contracts> contractslist;
		
		
		List<ProtocolVersion> versionlist;
		
		
		int studyid=Integer.parseInt(request.getParameter("studyid"));		
		List<studies> li=studiesdao.getStudyDetail(studyid);
		currentstudy=li.get(0);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());
		userslist = userdao.listusers(CurrentUser);	
		siteslist = sitedao.SitesList(CurrentUser);
		contractslist = contractsdao.listcontracts(currentstudy.getStudy_id());
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("versionlist",versionlist);		
		modelMap.addAttribute("contractslist",contractslist);

		int form=Integer.parseInt(request.getParameter("contract_form"));
		if(form == 1)
			modelMap.addAttribute("CurrentFormContract","View_Contract_div");
		else
			modelMap.addAttribute("CurrentFormContract","Create_Contract_div");

		return new ModelAndView("contracts",modelMap);    
	}
	//up done
	//=====================================================Show Medical License form=================================================//


	public ModelAndView ShowMedicalLicense(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
	
		List<Sites> siteslist;
		
		List<MedicalLicense> medicallist;

		List<ProtocolVersion> versionlist;
		


		try{


			int studyid=Integer.parseInt(request.getParameter("studyid"));
			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);	
			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
			versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());
			userslist = userdao.listusers(CurrentUser);
			siteslist = sitedao.SitesList(CurrentUser);
			medicallist = medicaldao.listmedical(currentstudy.getStudy_id());
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);	
			modelMap.addAttribute("medicallist",medicallist);
			int form=Integer.parseInt(request.getParameter("medical_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormMedical","View_Medical_License_div");
			else
				modelMap.addAttribute("CurrentFormMedical","Create_Medical_License_div");
			return new ModelAndView("medical_license",modelMap);  
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("medical_license",new ModelMap());    
	}


	//=====================================================Show Submission form=================================================//


	public ModelAndView ShowSubmission(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<ApprovalStatusType> approvalstatustypelist;
		List<SubmissionType> submissiontypelist;
		
		List<Sites> siteslist;
		List<Submission> submissionlist;
		
		List<ProtocolVersion> versionlist;
		List<Countries> countrieslist;
		

		try{
			int studyid=Integer.parseInt(request.getParameter("studyid"));


			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);
			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
			submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
			versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
			siteslist = sitedao.SitesList(CurrentUser);
			submissionlist = submissiondao.listsubmission(currentstudy.getStudy_id());

			//CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			countrieslist=countriesDAO.listCountry();
			ModelMap modelMap = new ModelMap();

			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("submissiontypelist",submissiontypelist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("submissionlist",submissionlist);
			modelMap.addAttribute("versionlist",versionlist);		
			int form=Integer.parseInt(request.getParameter("submission_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormSubmission","View_Submission_div");
			else
				modelMap.addAttribute("CurrentFormSubmission","Create_Submission_div");

			return new ModelAndView("submissions",modelMap); 
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}	
		return new ModelAndView("submissions",new ModelMap());    
	}


	//=====================================================Show Training User form=================================================//


	public ModelAndView ShowTrainingUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Training> traininglist;
		
		List<TrainingUser> traininguserlist;
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<ProtocolVersion> versionlist;
		List<Countries> countrieslist;
		
		
		countrieslist=countriesDAO.listCountry();

		try{


			int studyid=Integer.parseInt(request.getParameter("studyid"));					

			List<studies> li=studiesdao.getStudyDetail(studyid);
			currentstudy=li.get(0);

			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
			traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());
			traininguserlist = traininguserdao.listtraininguser(currentstudy.getStudy_id());
			versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());
			userslist = userdao.listusers(CurrentUser);

			siteslist = sitedao.SitesList(CurrentUser);
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("traininglist",traininglist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("traininguserlist",traininguserlist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);		
			int form=Integer.parseInt(request.getParameter("train_user_form"));
			if(form == 1)
				modelMap.addAttribute("CurrentFormTrainingUser","View_Training_User_div");
			else
				modelMap.addAttribute("CurrentFormTrainingUser","Create_Training_User_div");

			return new ModelAndView("training_user",modelMap); 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}	
		return new ModelAndView("training_user",new ModelMap());    
	}



	//======================================================================================================================================//

	public ModelAndView UploadContract(HttpServletRequest request, HttpServletResponse response) throws Exception{

		if (!ServletFileUpload.isMultipartContent(request)) {

			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");

	
		List<FileItem> Contractitems;


		try {
			Contractitems = uploadHandler.parseRequest(request);
			for (FileItem item2 : Contractitems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						Contractitem=item2;
						System.out.println("Name ="+ item2.getName() +"  Size="+ item2.getSize() + " type ="+ item2.getContentType());
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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

		return new ModelAndView("contracts");
	}

	public ModelAndView UploadFinancialDisc(HttpServletRequest request, HttpServletResponse response) throws Exception{
		if (!ServletFileUpload.isMultipartContent(request)) {

			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}


		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");

		
		List<FileItem> Financialdiscitems;


		try {
			Financialdiscitems = uploadHandler.parseRequest(request);
			for (FileItem item2 : Financialdiscitems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						Financialdiscitem=item2;
						//	
						System.out.println("Name ="+ item2.getName() +"  Size="+ item2.getSize() + " type ="+ item2.getContentType());
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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

		return new ModelAndView("financial_disc");
	}

	@SuppressWarnings("unchecked")
	public ModelAndView UploadMedicalLicense(HttpServletRequest request, HttpServletResponse response) throws Exception{

		if (!ServletFileUpload.isMultipartContent(request)) {

			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		
		
		List<FileItem> medicallicenseitems;
		
		
		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			medicallicenseitems = uploadHandler.parseRequest(request);
			for (FileItem item2 : medicallicenseitems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						medicallicenseitem=item2;
						//	
						System.out.println("Name ="+ item2.getName() +"  Size="+ item2.getSize() + " type ="+ item2.getContentType());
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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
		return new ModelAndView("medical_license");
	}

	@SuppressWarnings("unchecked")
	public ModelAndView UploadTrainingUser(HttpServletRequest request, HttpServletResponse response) throws Exception{

		if (!ServletFileUpload.isMultipartContent(request)) {

			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		
		
		List<FileItem>  traininguseritems;
		
		

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			traininguseritems = uploadHandler.parseRequest(request);
			for (FileItem item2 : traininguseritems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						traininguseritem=item2;
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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

		return new ModelAndView("training_user");
	}

	public ModelAndView UploadSubmissions(HttpServletRequest request, HttpServletResponse response) throws Exception{


		//=================================================================================================================================================================//

		if (!ServletFileUpload.isMultipartContent(request)) {

			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		
		
		
		List<FileItem> submissionitems;
		
		

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			submissionitems = uploadHandler.parseRequest(request);
			for (FileItem item2 : submissionitems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						submissionitem=item2;
						//	
						System.out.println("Name ="+ item2.getName() +"  Size="+ item2.getSize() + " type ="+ item2.getContentType());
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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
		return new ModelAndView("submissions");
	}




	public ModelAndView DownloadDocumentUseCV(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		
		List<UserCV> usercvlist;
		
		List<Users> userslist;
		
		
		
		
		userslist = userdao.listusers(CurrentUser);
		
		
		UserCV doc=new UserCV();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= usercvdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		usercvlist = usercvdao.listusercv(currentstudy.getStudy_id());

		for(int i=0;i<usercvlist.size();i++)
			usercvlist.get(i).setData(null);

		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("CurrentFormUserCV","View_UserCV_div");
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("usercvlist",usercvlist);
		return new ModelAndView("usercv",modelMap);
	}


	public ModelAndView DownloadDocumentSubmission(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		List<ApprovalStatusType> approvalstatustypelist;
		List<SubmissionType> submissiontypelist;
		
		List<Sites> siteslist;
		List<Submission> submissionlist;
		
		List<ProtocolVersion> versionlist;
		List<Countries> countrieslist;
		
		
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		submissionlist = submissiondao.listsubmission(currentstudy.getStudy_id());
		countrieslist=countriesDAO.listCountry();


		Submission doc=new Submission();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= submissiondao.find(docid);
		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream()); 
		submissionlist=submissiondao.listsubmission(currentstudy.getStudy_id());
		for(int i=0;i<submissionlist.size();i++)
			submissionlist.get(i).setData(null);
		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("CurrentFormSubmission","View_Submission_div");
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("submissiontypelist",submissiontypelist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("submissionlist",submissionlist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("versionlist",versionlist);	
		return new ModelAndView("submissions",modelMap);
	}



	public ModelAndView DownloadDocumentFinancial(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<FinancialDisc> financialdisclist;
		
		List<ProtocolVersion> versionlist;
		
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		
		userslist = userdao.listusers(CurrentUser);
		
		FinancialDisc doc=new FinancialDisc();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= financialdiscdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		financialdisclist = financialdiscdao.listfinancialdisc(currentstudy.getStudy_id());
		for(int i=0;i<financialdisclist.size();i++)
			financialdisclist.get(i).setData(null);

		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("CurrentFormFinancial","View_Financial_Disclosure_div");
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("versionlist",versionlist);	
		return new ModelAndView("financial_disc",modelMap);
	}


	public ModelAndView DownloadDocumentContract(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		List<Contracts> contractslist;
		List<ProtocolVersion> versionlist;
		
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		userslist = userdao.listusers(CurrentUser);
		
		Contracts doc=new Contracts();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= contractsdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		contractslist=contractsdao.listcontracts(currentstudy.getStudy_id());
		for(int i=0;i<contractslist.size();i++)
			contractslist.get(i).setData(null);

		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("CurrentFormContract","View_Contract_div");
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("versionlist",versionlist);	
		modelMap.addAttribute("contractslist",contractslist);
		return new ModelAndView("contracts",modelMap);
	}

	public ModelAndView DownloadDocumentMedical(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<MedicalLicense> medicallist;
		
		

		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		siteslist = sitedao.SitesList(CurrentUser);
	

		MedicalLicense doc=new MedicalLicense();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= medicaldao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		medicallist=medicaldao.listmedical(currentstudy.getStudy_id());
		for(int i=0;i<medicallist.size();i++)
			medicallist.get(i).setData(null);
		response.flushBuffer();
		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("CurrentFormMedical","View_Medical_License_div");
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("siteslist",siteslist);
		modelMap.addAttribute("medicallist",medicallist);
		return new ModelAndView("medical_license",modelMap);
	}

	public ModelAndView DownloadDocumentTraining(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		
		List<ApprovalStatusType> approvalstatustypelist;
	
		List<Training> traininglist;
		
		List<TrainingUser> traininguserlist;
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		siteslist = sitedao.SitesList(CurrentUser);
		
		traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());
		
		
		TrainingUser doc=new TrainingUser();

		int docid=Integer.parseInt(request.getParameter("docid"));
		doc= traininguserdao.find(docid);

		response.setContentType(doc.getType());
		response.setContentLength(doc.getData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + doc.getFilename() +"\"");
		FileCopyUtils.copy(doc.getData(), response.getOutputStream());

		traininguserlist = traininguserdao.listtraininguser(currentstudy.getStudy_id());
		for(int i=0;i<traininguserlist.size();i++)
			traininguserlist.get(i).setData(null);

		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("currentstudy",currentstudy);
		modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
		modelMap.addAttribute("traininglist",traininglist);
		modelMap.addAttribute("traininguserlist",traininguserlist);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("siteslist",siteslist);
		return new ModelAndView("training_user",modelMap);
	}


	public ModelAndView SubmitUserCV(HttpServletRequest request, HttpServletResponse response) throws Exception{
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		
		
		List<FileItem> CVitems;
		

		
	
		
		
		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("text/plain");
		try {
			CVitems = uploadHandler.parseRequest(request);
			for (FileItem item2 : CVitems) {
				if (!item2.isFormField()) {
					if(item2.getSize()>9999000)
					{
						writer.write("{\"name\":\""+ "Sorry File Size is larger then 9 MB" + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
						break; // assume we only get one file at a time
					}
					else
					{
						CVitem=item2;
						//	
						System.out.println("Name ="+ item2.getName() +"  Size="+ item2.getSize() + " type ="+ item2.getContentType());
						writer.write("{\"name\":\""+ item2.getName() + "\",\"type\":\"" + item2.getContentType() + "\",\"size\":\"" + item2.getSize() + "\"}");
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
		return new ModelAndView("usercv");
	}
	public ModelAndView CreateUserCV(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		
		List<UserCV> usercvlist;
		
		List<Users> userslist;
		
		userslist = userdao.listusers(CurrentUser);
	
		
		
		
		UserCV usercv=new UserCV();
		String id = request.getParameter("usercv_edit_id");

		if(id != null){	
			int idnum = Integer.parseInt(id);

			if(idnum!=0)
			{
				//user is editing the approval status type
				if(Integer.parseInt(request.getParameter("upload_cv")) == 2){
					//editing user cv but not uploaded new cv
					System.out.println("editing..kk");
					CVitem = null;
					UserCV temp=new UserCV();
					temp = usercvdao.find(idnum);
					usercv.setData(temp.getData());
					usercv.setFilename(temp.getFilename());
					usercv.setType(temp.getType());	
				}
				usercv.setUser_cv_id(idnum);
				String str = request.getParameter("usercv_date_created");
				String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
				java.sql.Date datecreated = java.sql.Date.valueOf(str);
				usercv.setDate_created(datecreated);
				usercv.setCreated_by(Integer.parseInt(request.getParameter("usercv_created_by")));
				usercv.setModified_by((int) CurrentUser.getUser_id());

			}
			else{
				usercv.setModified_by((int) CurrentUser.getUser_id());
				usercv.setCreated_by((int) CurrentUser.getUser_id());
			}


			String str = request.getParameter("received_date");
			String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			java.sql.Date received_date = java.sql.Date.valueOf(str);
			usercv.setReceived_dt(received_date);
			usercv.setUser_id(Integer.parseInt(request.getParameter("user_id")));
			usercv.setStudy_id(currentstudy.getStudy_id());
			usercv.setFile_description(request.getParameter("cv_file_description"));
			
			usercvlist = usercvdao.listusercv(currentstudy.getStudy_id());
			
			int Message = usercvdao.UploadDocument(CVitem,usercv,idnum);

			CVitem=null;
			try
			{
				if(Message == 1){
					usercvlist = usercvdao.listusercv(currentstudy.getStudy_id());
				}
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);
				if(idnum == 0)
				{
					modelMap.addAttribute("CurrentFormUserCV","Create_UserCV_div");
				}
				else
				{
					if(Message==3)
					{
						modelMap.addAttribute("EEMessage","User CV cannot be updated at this time !");
					}
					else if(Message==4)
					{
						modelMap.addAttribute("ESMessage","User CV successfully updated...");
						usercvlist = usercvdao.listusercv(currentstudy.getStudy_id());
					}
					modelMap.addAttribute("CurrentFormUserCV","View_UserCV_div");
				}

				modelMap.addAttribute("usercvlist",usercvlist);
				modelMap.addAttribute("userslist",userslist);
				modelMap.addAttribute("MessageCode",Message);
				return new ModelAndView("usercv",modelMap);    

			}
			catch(Exception expObj)
			{
				return new ModelAndView("usercv");
			}

		}

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("CurrentFormUserCV","Create_UserCV_div");
		return new ModelAndView("usercv",modelMap);
	}



	public ModelAndView CreateTraining(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Training> traininglist;
		
	
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		

		
		Training training=new Training();
		String id = request.getParameter("training_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the approval status type
			training.setTraining_id(idnum);
			String str = request.getParameter("training_date_created");

			String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			training.setDate_created(datecreated);
			training.setCreated_by(Integer.parseInt(request.getParameter("training_created_by")));
			training.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			training.setModified_by((int) CurrentUser.getUser_id());
			training.setCreated_by((int) CurrentUser.getUser_id());
		}

		training.setCode(request.getParameter("training_code").trim());
		training.setName(request.getParameter("training_name").trim());
		training.setDescription(request.getParameter("training_description"));
		training.setStudy_id(currentstudy.getStudy_id());

		//=====================================================create approval status type========================================================//
		if(idnum == 0)
		{	
			int Message=trainingdao.saveTraining(training);	
			try
			{
				traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());
//				if(Message == 1){
//					traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());
//				}
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);	
				modelMap.addAttribute("CurrentFormTrainingType","Create_Training_div");
				modelMap.addAttribute("traininglist",traininglist);
				modelMap.addAttribute("MessageCode",Message);
				return new ModelAndView("training_type",modelMap);       

			}

			catch(Exception expObj)
			{
				return new ModelAndView("training_type");
			}

		}
		else
		{
			int Message=trainingdao.editTraining(training);	
			try
			{
				ModelMap modelMap = new ModelMap();
				if(Message==0)
				{
					modelMap.addAttribute("ETError","Training cannot be updated at this time !");
				}
				else if(Message==1)
				{
					modelMap.addAttribute("ETSuccess","Training updated successfully ...");
				}
				traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());

				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
				modelMap.addAttribute("CurrentFormTrainingType","View_Training_div");
				modelMap.addAttribute("traininglist",traininglist);
				return new ModelAndView("training_type",modelMap);          

			}

			catch(Exception expObj)
			{
				return new ModelAndView("training_type");   
			}

		}

	}


	public ModelAndView CreateSubmissionType(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		
		List<SubmissionType> submissiontypelist;
		
	
		
		submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
		
		
		
		SubmissionType submissiontype=new SubmissionType();
		submissiontype.setStudy_id(currentstudy.getStudy_id());
		String id = request.getParameter("edit_id_submission_type");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the approval status type
			submissiontype.setSubmission_type_id(idnum);
			String str = request.getParameter("date_created");
			String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			submissiontype.setDate_created(datecreated);
			submissiontype.setCreated_by(Integer.parseInt(request.getParameter("created_by")));
			submissiontype.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			submissiontype.setModified_by((int) CurrentUser.getUser_id());
			submissiontype.setCreated_by((int) CurrentUser.getUser_id());
		}

		submissiontype.setCode(request.getParameter("code").trim());
		submissiontype.setName(request.getParameter("name").trim());
		submissiontype.setDescription(request.getParameter("description"));


		//=====================================================create approval status type========================================================//

		if(idnum == 0){
			int Message=submissiontypedao.saveSubmissionType(submissiontype);	
			try
			{
				if(Message == 1){
					submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
				}

				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("CurrentFormSubmissionType","Create_Submission_Type_div");
				modelMap.addAttribute("submissiontypelist",submissiontypelist);
				modelMap.addAttribute("MessageCode",Message);
				return new ModelAndView("submission_type",modelMap);   

			}
			catch(Exception expObj)
			{
				return new ModelAndView("submission_type");
			}
		}
		else{
			int Message = submissiontypedao.editSubmissionType(submissiontype);	
			try
			{				
				submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
				ModelMap modelMap = new ModelMap();
				if(Message==0)
				{
					modelMap.addAttribute("ESEMessage","Submission type cannot be edited at this time !");
				}
				else if(Message==1)
				{
					modelMap.addAttribute("ESSMessage","Submission type successfully updated...");
				}
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("CurrentFormSubmissionType","View_Submission_Type_div");
				modelMap.addAttribute("submissiontypelist",submissiontypelist);
				return new ModelAndView("submission_type",modelMap);    

			}
			catch(Exception expObj)
			{
				return new ModelAndView("submission_type");
			}
		}

	}




	public ModelAndView CreateApprovalStatusType(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		
		
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
	
		
		
		
		ApprovalStatusType approvalstatustype=new ApprovalStatusType();
		String id = request.getParameter("edit_id_approval_status");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the approval status type
			approvalstatustype.setApproval_status_type_id(idnum);
			String str = request.getParameter("date_created");

			// this is not a right approach 
			/*	String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			approvalstatustype.setDate_created(datecreated);
			approvalstatustype.setCreated_by(Integer.parseInt(request.getParameter("created_by")));
			approvalstatustype.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			approvalstatustype.setModified_by((int) CurrentUser.getUser_id());
			approvalstatustype.setCreated_by((int) CurrentUser.getUser_id());
		}

		approvalstatustype.setCode(request.getParameter("code").trim());
		approvalstatustype.setName(request.getParameter("name").trim());
		approvalstatustype.setDescription(request.getParameter("description"));
		approvalstatustype.setStudy_id(currentstudy.getStudy_id());

		//=====================================================create approval status type========================================================//
		if(idnum == 0)
		{		
			int Message=approvalstatustypedao.saveApprovalStatusType(approvalstatustype);	
			try
			{
				approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentstudy",currentstudy);
				modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
				modelMap.addAttribute("CurrentFormApprovalType","Create_Approval_Status_Type_div");
				modelMap.addAttribute("MessageCode",Message);
				return new ModelAndView("trials",modelMap);    

			}
			catch(Exception expObj)
			{
				return new ModelAndView("trials");
			}
		}
		//=====================================================edit approval status type========================================================//
		else
		{

			int Message=approvalstatustypedao.editApprovalStatusType(approvalstatustype);
			approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();

			if(Message==0)
			{
				modelMap.addAttribute("EEMessage","Approval Status Type cannot be updated at this time !");
			}
			else
			{
				modelMap.addAttribute("ESMessage","Approval Status type successfully updated...");
			}
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("CurrentFormApprovalType","View_Approval_Status_Type_div");
			return new ModelAndView("trials",modelMap); 
		}
	}

	public ModelAndView TrainingUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Training> traininglist;
		
		List<TrainingUser> traininguserlist;
		List<Users> userslist;
	
		List<Sites> siteslist;
		
		List<ProtocolVersion> versionlist;
		List<Countries> countrieslist;
		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		
		countrieslist=countriesDAO.listCountry();
		
		TrainingUser traininguser=new TrainingUser();
		String id = request.getParameter("training_user_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the training user
			if(Integer.parseInt(request.getParameter("upload_training")) == 2){
				//editing user training but not uploaded new document
				System.out.println("editing..kk");
				traininguseritem = null;
				TrainingUser temp=new TrainingUser();
				temp = traininguserdao.find(idnum);
				traininguser.setData(temp.getData());
				traininguser.setFilename(temp.getFilename());
				traininguser.setType(temp.getType());	
			}
			traininguser.setTraining_user_id(idnum);
			String str = request.getParameter("training_user_date_created");
			// not good approch
			/* 
			 * String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			traininguser.setDate_created(datecreated);
			traininguser.setCreated_by(Integer.parseInt(request.getParameter("training_user_created_by")));
			traininguser.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			traininguser.setModified_by((int) CurrentUser.getUser_id());
			traininguser.setCreated_by((int) CurrentUser.getUser_id());
		}

		traininguser.setDescription(request.getParameter("training_user_description"));
		traininguser.setFile_description(request.getParameter("training_user_file_description"));
		traininguser.setSite_id(Integer.parseInt(request.getParameter("training_user_site")));
		traininguser.setApproval(request.getParameter("training_user_approval"));
		traininguser.setStudy_id(currentstudy.getStudy_id());
		String str = request.getParameter("training_user_date");
		/*String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		java.sql.Date training_user_date = java.sql.Date.valueOf(str);
		traininguser.setTraining_dt(training_user_date);
		traininguser.setTraining_type(Integer.parseInt(request.getParameter("training_type")));
		traininguser.setType_id(Integer.parseInt(request.getParameter("training_user_approval")));
		String st = request.getParameter("training_protocol");
		String tempvar[] = st.split("-");
		traininguser.setProtocol_id(tempvar[0]);
		traininguser.setProtocol_version(tempvar[1]);
		traininguser.setUser_id(Integer.parseInt(request.getParameter("training_user_user")));

		//=====================================================create training user========================================================//


		int Message=traininguserdao.UploadDocument(traininguseritem, traininguser, idnum,currentstudy.getStudy_id());	
		try
		{

			traininglist = trainingdao.listtrainings(currentstudy.getStudy_id());
			traininguserlist = traininguserdao.listtraininguser(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("traininglist",traininglist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("traininguserlist",traininguserlist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);	
			if(idnum == 0)
				modelMap.addAttribute("CurrentFormTrainingUser","Create_Training_User_div");
			else
			{
				if(Message==3){
					modelMap.addAttribute("SMessage","User Training successfully updated ...");
				}
				else if(Message==4){
					modelMap.addAttribute("EMEssage","User Training cannot be updated at this time !");
				}
				modelMap.addAttribute("CurrentFormTrainingUser","View_Training_User_div");
			}
			modelMap.addAttribute("MessageCode",Message);
			return new ModelAndView("training_user",modelMap);    

		}
		catch(Exception expObj)
		{
			return new ModelAndView("training_user");
		}

	}

	public ModelAndView CreateMedicalLicense(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<MedicalLicense> medicallist;
		
		List<ProtocolVersion> versionlist;
		
		
		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		
		
		MedicalLicense medicallicense=new MedicalLicense();
		String id = request.getParameter("medical_license_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the medical license
			if(Integer.parseInt(request.getParameter("upload_medical")) == 2){
				//editing medical license but not uploaded new document
				System.out.println("editing..kk");
				medicallicenseitem = null;
				MedicalLicense temp=new MedicalLicense();
				temp = medicaldao.find(idnum);
				medicallicense.setData(temp.getData());
				medicallicense.setFilename(temp.getFilename());
				medicallicense.setType(temp.getType());	
			}
			medicallicense.setMedical_lic_id(idnum);
			String str = request.getParameter("medical_license_date_created");
			/*	String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			medicallicense.setDate_created(datecreated);
			medicallicense.setCreated_by(Integer.parseInt(request.getParameter("medical_license_created_by")));
			medicallicense.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			medicallicense.setModified_by((int) CurrentUser.getUser_id());
			medicallicense.setCreated_by((int) CurrentUser.getUser_id());
		}
		String str = request.getParameter("medical_license_start_date");
		/*String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		java.sql.Date sub_date = java.sql.Date.valueOf(str);
		medicallicense.setStart_dt(sub_date);

		str = request.getParameter("medical_license_date");
		/*	delimeter = "-";
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		sub_date = java.sql.Date.valueOf(str);
		medicallicense.setBegin_dt(sub_date);

		str = request.getParameter("medical_license_expire_date");
		/*	delimeter = "-";
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		sub_date = java.sql.Date.valueOf(str);
		medicallicense.setExpire_dt(sub_date);


		medicallicense.setDescription(request.getParameter("medical_license_description"));
		medicallicense.setFile_description(request.getParameter("medical_license_file_description"));
		medicallicense.setSite_id(Integer.parseInt(request.getParameter("medical_license_site")));
		medicallicense.setStudy_id(currentstudy.getStudy_id());
		medicallicense.setUser_id(Integer.parseInt(request.getParameter("medical_license_user")));
		medicallicense.setType_id(Integer.parseInt(request.getParameter("medical_license_type_id")));

		String st = request.getParameter("medical_protocol");
		String tempvar[] = st.split("-");
		medicallicense.setProtocol_id(tempvar[0]);
		medicallicense.setProtocol_version(tempvar[1]);

		//=====================================================create Medical License========================================================//

		int Message=medicaldao.UploadMedicalLicense(medicallicenseitem, medicallicense, idnum);

		try
		{
			
			
			medicallist = medicaldao.listmedical(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);	
			modelMap.addAttribute("medicallist",medicallist);
			if(idnum == 0)
			{
				modelMap.addAttribute("CurrentFormMedical","Create_Medical_License_div");
			}
			else
			{
				modelMap.addAttribute("CurrentFormMedical","View_Medical_License_div");
				if(Message==0)
				{
					modelMap.addAttribute("EMLError","Medical License cannot be updated at this time !");
				}
				else if (Message==1)
				{
					modelMap.addAttribute("EMLSuccess","Medical License successfully updated...");
				}
			}

			modelMap.addAttribute("MessageCode",Message);
			return new ModelAndView("medical_license",modelMap);    

		}
		catch(Exception expObj)
		{
			return new ModelAndView("medical_license");
		}

	}


	public ModelAndView CreateSubmission(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		
		List<ApprovalStatusType> approvalstatustypelist;
		List<SubmissionType> submissiontypelist;
		
		List<Sites> siteslist;
		List<Submission> submissionlist;
		
		List<ProtocolVersion> versionlist;
		List<Countries> countrieslist;
		
		
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		submissiontypelist = submissiontypedao.listsubmissiontype(currentstudy.getStudy_id());
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		submissionlist = submissiondao.listsubmission(currentstudy.getStudy_id());
		countrieslist=countriesDAO.listCountry();

		
		Submission submission=new Submission();
		submission.setStudy_id(currentstudy.getStudy_id());
		String id = request.getParameter("submission_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the approval status type
			if(Integer.parseInt(request.getParameter("upload_submission")) == 2){
				//editing user training but not uploaded new document
				System.out.println("editing..kk");
				Submission temp=new Submission();
				temp = submissiondao.find(idnum);
				if(temp.getFilename()!=null){
					submissionitem = null;
					submission.setData(temp.getData());
					submission.setFilename(temp.getFilename());
					submission.setType(temp.getType());	
				}
			}

			submission.setSubmission_id(idnum);
			String str = request.getParameter("create_submission_date_created");

			/*String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			submission.setDate_created(datecreated);
			submission.setCreated_by(Integer.parseInt(request.getParameter("submission_created_by")));
			submission.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			submission.setModified_by((int) CurrentUser.getUser_id());
			submission.setCreated_by((int) CurrentUser.getUser_id());
		}
		submission.setApproval_status_type_id(Integer.parseInt(request.getParameter("submission_approval")));
		if(request.getParameter("actual_review_date") != "" && request.getParameter("actual_review_date") != null){
			String str = request.getParameter("actual_review_date");
			/*String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setActual_review_date(sub_date);
		}

		if(request.getParameter("approval_date") != "" && request.getParameter("approval_date") != null){
			String str = request.getParameter("approval_date");
			/*String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setApproval_date(sub_date);
		}
		if(request.getParameter("expiration_date") != "" && request.getParameter("expiration_date") != null){
			String str = request.getParameter("expiration_date");
			/*String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setExpiration_date(sub_date);
		}
		if(request.getParameter("material_sent_date") != "" && request.getParameter("material_sent_date") != null){
			String str = request.getParameter("material_sent_date");
			/*String delimeter = "-";
				String[] temp;
				temp = str.split(delimeter);
				str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setMaterial_sent_date(sub_date);
		}
		if(request.getParameter("schedule_review_date") != "" && request.getParameter("schedule_review_date") != null){
			String str = request.getParameter("schedule_review_date");
			/*String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];*/
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setSched_review_date(sub_date); 
		}

		if(request.getParameter("concent_date") != "" && request.getParameter("concent_date") != null){
			String str = request.getParameter("concent_date");
			/*String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];*/
			java.sql.Date sub_date = java.sql.Date.valueOf(str);
			submission.setConsent_date(sub_date);
		}
		submission.setSubmission_name(request.getParameter("create_submission_name").trim());
		submission.setSubmission_type_id(Integer.parseInt(request.getParameter("submission_type")));
		if(request.getParameter("submission_site") != "" && request.getParameter("submission_site") != null){
			submission.setSite_id(Integer.parseInt(request.getParameter("submission_site")));
		}
		submission.setDescription(request.getParameter("submission_description"));
		if(request.getParameter("submission_file_description") != ""){
			submission.setFile_description(request.getParameter("submission_file_description"));
		}
		String str = request.getParameter("submission_date");
		/*String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];*/
		java.sql.Date  sub_date = java.sql.Date.valueOf(str);
		submission.setSubmission_date(sub_date);


		String st = request.getParameter("submission_protocol");
		String tempvar[] = st.split("-");
		submission.setProtocol_id(tempvar[0]);
		submission.setProtocol_version(tempvar[1]);
		submission.setRegulatorybody_name(request.getParameter("submission_regulatory_body_name").trim());
		submission.setRegulatorybody_country(request.getParameter("submission_regulatory_body_country"));
		submission.setStudy_id(currentstudy.getStudy_id());

		//=====================================================create submission========================================================//



		int Message=submissiondao.UploadSubmission(submissionitem, submission, idnum);
		try
		{
			submissionlist = submissiondao.listsubmission(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("submissiontypelist",submissiontypelist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("submissionlist",submissionlist);
			modelMap.addAttribute("versionlist",versionlist);

			if(idnum == 0)
			{
				modelMap.addAttribute("CurrentFormSubmission","Create_Submission_div");
				modelMap.addAttribute("MessageCode",Message);
			}						
			else
			{
				modelMap.addAttribute("CurrentFormSubmission","View_Submission_div");
				if(Message==0)
				{
					modelMap.addAttribute("ESError","Submission cannot be updated at this time !");
				}
				else if (Message==1)
				{
					modelMap.addAttribute("ESSuccess","Submission successfully updated...");
				}
			}


			return new ModelAndView("submissions",modelMap);    



		}
		catch(Exception expObj)
		{
			return new ModelAndView("submissions");
		}
	}



	public ModelAndView CreateFinancialDisclosure(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		
		
		List<ApprovalStatusType> approvalstatustypelist;
		
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<FinancialDisc> financialdisclist;
		
		List<ProtocolVersion> versionlist;
		
		
		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
		
		
		
		
		
		
		FinancialDisc financialdisc=new FinancialDisc();
		String id = request.getParameter("Financial_Disclosure_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the Financial disclosure
			if(Integer.parseInt(request.getParameter("upload_financial_disc")) == 2){
				//editing financial disc but not uploaded new document
				//System.out.println("editing..kk");
				Financialdiscitem = null;
				FinancialDisc temp=new FinancialDisc();
				temp = financialdiscdao.find(idnum);
				financialdisc.setData(temp.getData());
				financialdisc.setFilename(temp.getFilename());
				financialdisc.setType(temp.getType());	
			}
			financialdisc.setFinancial_disc_id(idnum);
			String str = request.getParameter("Financial_Disclosure_date_created");
			/*String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			financialdisc.setDate_created(datecreated);
			financialdisc.setCreated_by(Integer.parseInt(request.getParameter("Financial_Disclosure_created_by")));
			financialdisc.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			financialdisc.setModified_by((int) CurrentUser.getUser_id());
			financialdisc.setCreated_by((int) CurrentUser.getUser_id());
		}

		String str = request.getParameter("financial_disclosure_received_date");
		/*String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		java.sql.Date sub_date = java.sql.Date.valueOf(str);
		financialdisc.setReceived_dt(sub_date);



		str = request.getParameter("financial_disclosure_signed_date");
		/*delimeter = "-";
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		sub_date = java.sql.Date.valueOf(str);
		financialdisc.setSigned_dt(sub_date);
		financialdisc.setDescription(request.getParameter("financial_disclosure_description"));
		financialdisc.setFile_description(request.getParameter("financial_disclosure_file_description"));
		financialdisc.setStudy_id(currentstudy.getStudy_id());

		financialdisc.setSite_id(Integer.parseInt(request.getParameter("financial_disclosure_site")));
		financialdisc.setType_id(Integer.parseInt(request.getParameter("financial_disclosure_type_id")));
		financialdisc.setUser_id(Integer.parseInt(request.getParameter("financial_disclosure_user")));
		String st = request.getParameter("financial_protocol");
		String tempvar[] = st.split("-");
		financialdisc.setProtocol_id(tempvar[0]);
		financialdisc.setProtocol_version(tempvar[1]);

		int Message=financialdiscdao.UploadFinancialDisc(Financialdiscitem, financialdisc, idnum);	
		try
		{
			financialdisclist = financialdiscdao.listfinancialdisc(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);	
			modelMap.addAttribute("financialdisclist",financialdisclist);
			if(idnum == 0) 
			{
				modelMap.addAttribute("CurrentFormFinancial","Create_Financial_Disclosure_div");
			}
			else
			{
				modelMap.addAttribute("CurrentFormFinancial","View_Financial_Disclosure_div");
				if(Message==0)
				{
					modelMap.addAttribute("EFDError","Financial Disclosure cannot be updated at this time !");
				}
				else if (Message==1)
				{
					modelMap.addAttribute("EFDSuccess","Financial Disclosure successfully updated...");
					financialdisclist = financialdiscdao.listfinancialdisc(currentstudy.getStudy_id());
				}
			}
			modelMap.addAttribute("MessageCode",Message);
			return new ModelAndView("financial_disc",modelMap);    

		}
		catch(Exception expObj)
		{
			return new ModelAndView("financial_disc");
		}

	}


	public ModelAndView CreateContract(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{


		
		List<ApprovalStatusType> approvalstatustypelist;
	
		List<Users> userslist;
		
		List<Sites> siteslist;
		
		List<Contracts> contractslist;
		
		List<ProtocolVersion> versionlist;
		
		
		
		userslist = userdao.listusers(CurrentUser);
		approvalstatustypelist = approvalstatustypedao.listapprovals(currentstudy.getStudy_id());
		
		versionlist = traininguserdao.listprotocolversions(currentstudy.getStudy_id());			
		siteslist = sitedao.SitesList(CurrentUser);
	
		
		
		
		
		Contracts contract=new Contracts();
		String id = request.getParameter("contract_edit_id");
		int idnum = Integer.parseInt(id);

		if(idnum!=0)
		{
			//user is editing the contract
			if(Integer.parseInt(request.getParameter("upload_contract")) == 2){
				//editing financial disc but not uploaded new document
				System.out.println("editing..kk");
				Contractitem = null;
				Contracts temp=new Contracts();
				temp = contractsdao.find(idnum);
				contract.setData(temp.getData());
				contract.setFilename(temp.getFilename());
				contract.setType(temp.getType());	
			}
			contract.setContract_id(idnum);
			String str = request.getParameter("contract_date_created");
			/*String delimeter = "-";
			String[] temp;
			temp = str.split(delimeter);
			str = temp[0]  + "-" + temp[1] + "-" + temp[2];\
			 */
			java.sql.Date datecreated = java.sql.Date.valueOf(str);
			contract.setDate_created(datecreated);
			contract.setCreated_by(Integer.parseInt(request.getParameter("contract_created_by")));
			contract.setModified_by((int) CurrentUser.getUser_id());

		}
		else{
			contract.setModified_by((int) CurrentUser.getUser_id());
			contract.setCreated_by((int) CurrentUser.getUser_id());
		}

		contract.setDescription(request.getParameter("contract_description"));

		contract.setSite_id(Integer.parseInt(request.getParameter("contract_site")));
		contract.setStudy_id(currentstudy.getStudy_id());
		contract.setType_id(Integer.parseInt(request.getParameter("contract_type_id")));
		contract.setUser_id(Integer.parseInt(request.getParameter("contract_user")));

		String str = request.getParameter("contract_signed_date");
		/*String delimeter = "-";
		String[] temp;
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		java.sql.Date sub_date = java.sql.Date.valueOf(str);
		contract.setSigned_dt(sub_date);

		str = request.getParameter("contract_returned_date");
		/*delimeter = "-";
		temp = str.split(delimeter);
		str = temp[0]  + "-" + temp[1] + "-" + temp[2];
		 */
		sub_date = java.sql.Date.valueOf(str);
		contract.setReturned_dt(sub_date);
		String st = request.getParameter("contract_protocol");
		String tempvar[] = st.split("-");
		contract.setProtocol_id(tempvar[0]);
		contract.setProtocol_version(tempvar[1]);
		contract.setFile_description(request.getParameter("contract_file_description"));	
		//=====================================================create Contracts========================================================//

		int Message = contractsdao.UpdateContracts(Contractitem, contract, idnum);
		try
		{
			contractslist = contractsdao.listcontracts(currentstudy.getStudy_id());
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("currentstudy",currentstudy);
			modelMap.addAttribute("approvalstatustypelist",approvalstatustypelist);
			modelMap.addAttribute("siteslist",siteslist);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("versionlist",versionlist);		
			modelMap.addAttribute("contractslist",contractslist);
			if(idnum == 0)
			{
				modelMap.addAttribute("CurrentFormContract","Create_Contract_div");
			}
			else
			{
				modelMap.addAttribute("CurrentFormContract","View_Contract_div");
				if(Message==0)
				{
					modelMap.addAttribute("ECError","Contract cannot be updated at this time !");
				}
				else if (Message==1)
				{
					modelMap.addAttribute("ECSuccess","Contract successfully updated...");
				}
			}

			modelMap.addAttribute("MessageCode",Message);
			return new ModelAndView("contracts",modelMap);    

		}
		catch(Exception expObj)
		{
			return new ModelAndView("contracts");
		}
	}


	//setters
	public void setApprovalStatusTypeDAO(ApprovalStatusTypeDAO approvalstatustypedao) {
		this.approvalstatustypedao = approvalstatustypedao;
	}
	public void setSubmissionTypeDAO(SubmissionTypeDAO submissiontypedao) {
		this.submissiontypedao = submissiontypedao;
	}
	public void setTrainingDAO(TrainingDAO trainingdao) {
		this.trainingdao = trainingdao;
	}
	public void setUserCVDAO(UserCVDAO usercvdao) {
		this.usercvdao = usercvdao;
	}
	public void setTrainingUserDAO(TrainingUserDAO traininguserdao) {
		this.traininguserdao = traininguserdao;
	}
	public void setUsersDAO(UsersDAO usersdao) {
		this.userdao = usersdao;
	}
	public void setStudiesDAO(StudiesDAO studiesdao) {
		this.studiesdao = studiesdao;
	}
	public void setSitesDAO(SitesDAO sitedao) {
		this.sitedao = sitedao;
	}
	public void setSubmissionDAO(SubmissionDAO submissiondao) {
		this.submissiondao = submissiondao;
	}
	public void setContractsDAO(ContractsDAO contractsdao) {
		this.contractsdao = contractsdao;
	}
	public void setMedicalLicenseDAO(MedicalLicenseDAO medicaldao) {
		this.medicaldao = medicaldao;
	}
	public void setFinancialDiscDAO(FinancialDiscDAO financialdiscdao) {
		this.financialdiscdao = financialdiscdao;
	}

	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}

}


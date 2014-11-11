package com.Voxce.Controllers;

import java.sql.Date;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CRFDAO;
import com.Voxce.DAO.DrugsDAO;
import com.Voxce.DAO.LaboratoryDAO;
import com.Voxce.DAO.LabsDAO;
import com.Voxce.DAO.UnitsOfMeasureDAO;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Drugs;
import com.Voxce.model.Laboratory;
import com.Voxce.model.Labs;
import com.Voxce.model.Question;
import com.Voxce.model.Section;
import com.Voxce.model.UnitsOfMeasure;
import com.Voxce.model.Users;

@Controller
public class crfController extends MultiActionController{

	private Users CurrentUser;
	private CRFDAO crfDao;
	private LaboratoryDAO laboratoryDAO;
	private LabsDAO labsDao;
	private DrugsDAO drugsDAO;
	private UnitsOfMeasureDAO unitsOfMeasureDAO;
	
	
	Map<String, Integer> jsone =new LinkedHashMap<String, Integer>();

	public ModelAndView ShowCRFIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Question>  Questionslist;
		List<Laboratory>  laboratorylist;
		
		List<Labs> labsList;
		List<Drugs> drugsList;
		List<UnitsOfMeasure> unitList;
		
		String CurrentForm=request.getParameter("CurrentForm");
		String message ;
		if(request.getParameter("message") != null){
			message = request.getParameter("message");
		}else{
			message = "";
		}
		String error_message;
		if(request.getParameter("error_message") != null){
			error_message = request.getParameter("error_message");
		}else{
			error_message = "";
		}
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		Questionslist=crfDao.questionsList(CurrentUser);
		laboratorylist = laboratoryDAO.getLaboratoryList(CurrentUser);
		labsList = labsDao.getLabsList(CurrentUser);
		drugsList = drugsDAO.getDrugsList(CurrentUser);
		unitList = unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser);
		ModelMap modelMap = new ModelMap();
		
		modelMap.addAttribute("CRF_Header", "current_btn");
		modelMap.addAttribute("questionsList",Questionslist);
		modelMap.addAttribute("LaboritoryName", laboratorylist);
		modelMap.addAttribute("LabsName", labsList);
		modelMap.addAttribute("DrugsName", drugsList);
		modelMap.addAttribute("UnitName", unitList);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("error_message",error_message);
		return new ModelAndView("question",modelMap);
	}
	public ModelAndView ShowCRFSection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		
		
		List<Question>  Questionslist;
		
		List<Section>  sectionList;
		
		
		
		
		String message ;
		if(request.getParameter("message") != null){
			message = request.getParameter("message");
		}else{
			message = "";
		}
		String error_message;
		if(request.getParameter("error_message") != null){
			error_message = request.getParameter("error_message");
		}else{
			error_message = "";
		}
		
		String CurrentForm=request.getParameter("CurrentForm");
		Questionslist=crfDao.questionsList(CurrentUser);
		sectionList = crfDao.sectionList(CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("sectionList",sectionList);
		modelMap.addAttribute("CRF_Header", "current_btn");
		modelMap.addAttribute("questionsList",Questionslist);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("error_message",error_message);
		return new ModelAndView("section",modelMap);
	}
	public ModelAndView ShowCRFPage(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		
		
		List<Section>  sectionList;
		List<CaseReportForms>  caseReportFormsList;
		
		
		
		String message ;
		if(request.getParameter("message") != null){
			message = request.getParameter("message");
		}else{
			message = "";
		}
		String error_message;
		if(request.getParameter("error_message") != null){
			error_message = request.getParameter("error_message");
		}else{
			error_message = "";
		}
		
		String CurrentForm=request.getParameter("CurrentForm");
		ModelMap modelMap = new ModelMap();
		caseReportFormsList=crfDao.cfrList(CurrentUser);
		sectionList = crfDao.sectionList(CurrentUser);
		modelMap.addAttribute("sectionList",sectionList);
		modelMap.addAttribute("CRF_Header", "current_btn");
		modelMap.addAttribute("caseReportFormsList",caseReportFormsList);
		modelMap.addAttribute("CurrentForm",CurrentForm);
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("error_message",error_message);
		return new ModelAndView("caseReportForms",modelMap);
	}


	public ModelAndView createQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date(cal.getTime().getTime());
			Question question = new Question();
			question.setQuestion_name(request.getParameter("questionName"));
			question.setQuestion_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
			question.setQuestion_edit_html(request.getParameter("editHtmlData"));
			question.setCreatedDate(date);
			question.setModifiedDate(date);
			question.setCreatedBy(CurrentUser.getUser_id());
			question.setModfiedBy(CurrentUser.getUser_id());
			question.setSubsciber_id(CurrentUser.getSubscription_id());
			int result  = crfDao.SaveQestion(question,CurrentUser);
			int result1 = crfDao.questionTrail(CurrentUser, date, request.getParameter("questionName"),"Question created","Create Question" , request.getParameter("questionName"));
				if(result== 1 && result1 == 1){
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=add_question_form&message=Qestion saved successfully");
				}else{
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=add_question_form&error_message=Qestion not saved");
				}
			}else{
				response.sendRedirect("login.htm");
			}
		return new ModelAndView("question",new ModelMap());
	}
	public ModelAndView createSection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
		
			
			
			
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date(cal.getTime().getTime());
		Section section = new Section();
		section.setSection_name(request.getParameter("sectionName"));
		section.setSection_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
		section.setSection_edit_html(request.getParameter("editHtmlData"));
		section.setSubscriber_id(CurrentUser.getSubscription_id());
		int result = crfDao.SaveSection(section,CurrentUser);
		crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, request.getParameter("sectionName"), "Create Section");
		
		
			if(result == 1){
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=add_sectiondiv&message=Section saved successfully");
			}else{
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=add_sectiondiv&error_message=Section not saved");
			}
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("question",new ModelMap());
		
	}
	public ModelAndView createCRF(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
			
		
			
			
			
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date(cal.getTime().getTime());
		CaseReportForms caseReportForms = new CaseReportForms();
		caseReportForms.setCreated_by(CurrentUser.getUser_id());
		caseReportForms.setModified_by(CurrentUser.getUser_id());
		caseReportForms.setCrf_name(request.getParameter("crfName"));
		caseReportForms.setCrf_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
		caseReportForms.setCrf_edit_html(request.getParameter("editHtmlData"));
		
		int result = crfDao.SaveCRF(caseReportForms, CurrentUser);
		crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, request.getParameter("crfName"), "Create CRF");
			if(result == 1){
				response.sendRedirect("ShowCRFPage.crf?CurrentForm=addcrfdiv&message=CRF saved successfully");
			}else{
				response.sendRedirect("ShowCRFPage.crf?CurrentForm=addcrfdiv&error_message=CRF not saved");
			}
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("question",new ModelMap());
	}
	
	
	public ModelAndView deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {				
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
		
			
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date(cal.getTime().getTime());
		
		String questionName = crfDao.getQuestionName(Integer.parseInt(request.getParameter("question_id").trim()));
		if(!questionName.equals("`-`-`false`-`-`")){
		int ret = crfDao.questionTrail(CurrentUser, date, questionName, "Question deleted","Delete Question", questionName);
		
			if(ret == 1){
				ret = crfDao.delete(Integer.parseInt(request.getParameter("question_id").trim()));
				if(ret == 1){
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=list_question_form&message=Question successfully deleted");
				}else{
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=list_question_form&error_message=Question successfully deleted");
				}
			}
		}
		
		
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("question",new ModelMap());
	}
	
	public ModelAndView deleteSection(HttpServletRequest request, HttpServletResponse response) throws Exception {			
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
	
			
			
		Calendar cal = Calendar.getInstance();
		Date date =new java.sql.Date(cal.getTime().getTime());
		String sectionName = crfDao.getSectionName(Integer.parseInt(request.getParameter("section_id").trim()));
		if(!sectionName.equals("`-`-`false`-`-`")){
			int result ;
			crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, sectionName, "Delete Section");
			result = crfDao.deleteSection(Integer.parseInt(request.getParameter("section_id").trim()));
			if(result == 1){
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=view_sectiondiv&message=Section successfully deleted");
			}else{
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=view_sectiondiv&error_message=Section can not be deleted");
			}
		}
		
		
		
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("section",new ModelMap());
	}
	public ModelAndView deleteCrf(HttpServletRequest request, HttpServletResponse response) throws Exception {				
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
		
			
			
			
			Calendar cal = Calendar.getInstance();
			Date date =new java.sql.Date(cal.getTime().getTime());
			String crfName = crfDao.getCRFName(Integer.parseInt(request.getParameter("crf_id").trim()));
			if(!crfName.equals("`-`-`false`-`-`")){
				int result ;
				crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, crfName, "Delete CRF");
				result = crfDao.deleteCRF(Integer.parseInt(request.getParameter("crf_id").trim()));
				if(result == 1){
					response.sendRedirect("ShowCRFPage.crf?CurrentForm=viewcrfdiv&message=CRF Successfully Deleted");
				}else if(result == -1){
					response.sendRedirect("ShowCRFPage.crf?CurrentForm=viewcrfdiv&error_message=CRF can not be deleted because It is assosiated to visit");
				}else{
					response.sendRedirect("ShowCRFPage.crf?CurrentForm=viewcrfdiv&error_message=CRF can not be deleted");
				}
				
			}
		
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("caseReportForms",new ModelMap());
	}
	public ModelAndView ShowEditQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		ModelMap modelMap = new ModelMap();
		
		List<Question>  Questionslist;
		
		
		
		Question question = crfDao.findQuestionById(Integer.parseInt(request.getParameter("question_id").trim()));
		if(question == null){
			response.sendRedirect("ShowCRFIndex.crf?CurrentForm=add_question_form");
		}
		Questionslist=crfDao.questionsList(CurrentUser);
		modelMap.addAttribute("questionsList",Questionslist);
		modelMap.addAttribute("questionHtml",question);
		return new ModelAndView("editQuestion",modelMap);
	}
	public ModelAndView ShowEditSection(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		ModelMap modelMap = new ModelMap();
		
		
		List<Question>  Questionslist;
		
		List<Section>  sectionList;
		
		
		
		Section section = crfDao.findSectionById(Integer.parseInt(request.getParameter("section").trim()));
		if(section == null){
			response.sendRedirect("ShowCRFSection.crf?CurrentForm=add_sectiondiv");
		}
		Questionslist=crfDao.questionsList(CurrentUser);
		sectionList = crfDao.sectionList(CurrentUser);
		modelMap.addAttribute("sectionList",sectionList);
		modelMap.addAttribute("questionsList",Questionslist);
		modelMap.addAttribute("CRF_Header", "current_btn");
		modelMap.addAttribute("sectionHtml",section);
		return new ModelAndView("editSection",modelMap);
	}
	public ModelAndView ShowEditCrf(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		ModelMap modelMap = new ModelMap();
		CaseReportForms caseReportForms = crfDao.findCRFById(Integer.parseInt(request.getParameter("crf_id").trim()));
		if(caseReportForms == null){
			response.sendRedirect("ShowCRFPage.crf?CurrentForm=add_sectiondiv");
		}
		
	
		List<Section>  sectionList;
		List<CaseReportForms>  caseReportFormsList;
		
		
		
		
		caseReportFormsList = crfDao.cfrList(CurrentUser);
		sectionList = crfDao.sectionList(CurrentUser);
		modelMap.addAttribute("sectionList",sectionList);
		modelMap.addAttribute("caseReportFormsList",caseReportFormsList);
		modelMap.addAttribute("CRF_Header", "current_btn");
		modelMap.addAttribute("caseReportFormHtml",caseReportForms);
		return new ModelAndView("editCaseReportForms",modelMap);
	}
	
	public ModelAndView editQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
			Calendar cal = Calendar.getInstance(); 
			Date date =new java.sql.Date(cal.getTime().getTime());
			Question question = new Question();
			question.setQuestion_id(Integer.parseInt(request.getParameter("questionId").trim()));
			question.setQuestion_name(request.getParameter("questionName"));
			question.setQuestion_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
			question.setQuestion_edit_html(request.getParameter("editHtmlData"));
			question.setModfiedBy(CurrentUser.getUser_id());
			question.setModifiedDate(date);
			int ret = crfDao.questionTrail(CurrentUser, date, request.getParameter("questionName"), request.getParameter("change"), "Edit Question", request.getParameter("oldQuestionName"));
			if(ret == 1){
				ret = crfDao.SaveQestion(question,CurrentUser);
				if(ret == 1){
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=list_question_form&message=Question successfully edited");
				}else{
					response.sendRedirect("ShowCRFIndex.crf?CurrentForm=list_question_form&error_message=Question can not be edit");
				}
			}

			
			}else{
				response.sendRedirect("login.htm");
			}
		return new ModelAndView("question",new ModelMap());
	}

	public ModelAndView editSection(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date(cal.getTime().getTime());
			Section section = new Section();
			section.setSection_id(Integer.parseInt(request.getParameter("sectionId").trim()));
			section.setSection_name(request.getParameter("sectionName"));
			section.setSection_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
			section.setSection_edit_html(request.getParameter("editHtmlData"));
			int result;
			result = crfDao.SaveSection(section,CurrentUser);
			crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, request.getParameter("sectionName"), "Create Section");
			if(result == 1){
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=view_sectiondiv&message=Section successfully edited");
			}else{
				response.sendRedirect("ShowCRFSection.crf?CurrentForm=view_sectiondiv&error_message=Section can not be edit");
			}
		}else{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("question",new ModelMap());
	}
	
	public ModelAndView editCRF(HttpServletRequest request, HttpServletResponse response) throws Exception{	
		CurrentUser = (Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser != null &&  !CurrentUser.equals("")){
			
			
		
			Calendar cal = Calendar.getInstance();		 
			Date date =new java.sql.Date(cal.getTime().getTime());
			 
			CaseReportForms caseReportForms = new CaseReportForms();
			caseReportForms.setCrf_id(Integer.parseInt(request.getParameter("crfId").trim()));
			caseReportForms.setCrf_name(request.getParameter("crfName"));
			caseReportForms.setCrf_html(request.getParameter("htmlData").replace("'", "&lsquo;"));
			caseReportForms.setCrf_edit_html(request.getParameter("editHtmlData"));
			int result;
			result = crfDao.SaveCRF(caseReportForms, CurrentUser);
			crfDao.sectionTrail(CurrentUser.getFirst_name()+" "+CurrentUser.getLast_name(), date, request.getParameter("crfName"), "Create CRF");
			 ;
			if(result == 1 ){
				response.sendRedirect("ShowCRFPage.crf?CurrentForm=addcrfdiv&message=CRF successfully edited");
			}else{
				response.sendRedirect("ShowCRFPage.crf?CurrentForm=addcrfdiv&error_message=CRF can not be edit");
			}
		}else{
			response.sendRedirect("login.htm");
		}
		
		return new ModelAndView("editCaseReportForms",new ModelMap());
	}

	public void setCurrentUser(Users currentUser) {
		CurrentUser = currentUser;
	}

	public Users getCurrentUser() {
		return CurrentUser;
	}

	public CRFDAO getCrfDao() {
		return crfDao;
	}

	public void setCrfDao(CRFDAO crfDao) {
		this.crfDao = crfDao;
	}
	public LaboratoryDAO getLaboratoryDAO() {
		return laboratoryDAO;
	}
	public void setLaboratoryDAO(LaboratoryDAO laboratoryDAO) {
		this.laboratoryDAO = laboratoryDAO;
	}
	public LabsDAO getLabsDao() {
		return labsDao;
	}
	public void setLabsDao(LabsDAO labsDao) {
		this.labsDao = labsDao;
	}
	public DrugsDAO getDrugsDAO() {
		return drugsDAO;
	}
	public void setDrugsDAO(DrugsDAO drugsDAO) {
		this.drugsDAO = drugsDAO;
	}
	public UnitsOfMeasureDAO getUnitsOfMeasureDAO() {
		return unitsOfMeasureDAO;
	}
	public void setUnitsOfMeasureDAO(UnitsOfMeasureDAO unitsOfMeasureDAO) {
		this.unitsOfMeasureDAO = unitsOfMeasureDAO;
	}



}

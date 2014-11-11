package com.Voxce.Controllers;

import java.sql.Date;
import java.util.ArrayList;
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
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.VisitsDAO;
import com.Voxce.model.CaseReportForms;
import com.Voxce.model.Users;
import com.Voxce.model.VisitCrfs;
import com.Voxce.model.VisitNameTexts;
import com.Voxce.model.Visits;
import com.Voxce.model.studies;


@Controller
public class VisitsController extends MultiActionController{

	private Users CurrentUser;
	private VisitsDAO visitDao;
	private String visitDescription;
	private CRFDAO crfDao;
	private StudiesDAO stDao;
	
	Map<String, Integer> jsone =new LinkedHashMap<String, Integer>();

	
	
	public ModelAndView ShowVisitsIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		
		
	
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
		ModelMap modelMap = new ModelMap();
		if(request.getParameter("CurrentForm") != null && !request.getParameter("CurrentForm").equals("")){
			modelMap.addAttribute("CurrentForm",request.getParameter("CurrentForm"));
		}
		
		
		List<VisitNameTexts>  VisitNameTextslist;
		List<Visits>  visitsList;
		List<CaseReportForms> crfList;
		List<VisitCrfs> visitCrfList;
		List<studies> studiesList;
		
		
		VisitNameTextslist=visitDao.VisitNameTextsList(CurrentUser);
		visitsList=visitDao.findAll(CurrentUser);
		visitCrfList = visitDao.findVisitCrfs(CurrentUser);
		crfList = crfDao.cfrList(CurrentUser);
		studiesList = stDao.StudiesList(CurrentUser);
		
		modelMap.addAttribute("Visit_Head", "current_btn");
		modelMap.addAttribute("VisitNameTextslist",VisitNameTextslist);
		modelMap.addAttribute("visitCrf",visitCrfList);
		
		modelMap.addAttribute("Visitslist",visitsList);
		modelMap.addAttribute("crf",crfList);
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("error_message",error_message);
		modelMap.addAttribute("studyList",studiesList);
		return new ModelAndView("visitsindex",modelMap);
	}
	
	public ModelAndView checkVisitName(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String visitnameTest=request.getParameter("vn");
		String studyid=request.getParameter("sid");
		int result=visitDao.checkVisitNameText(visitnameTest,Integer.parseInt(studyid));
		if(result==0)
			return new ModelAndView("success",new ModelMap());
		else
			return new ModelAndView("error",new ModelMap());
	}
	
	
	public ModelAndView ShowEditVisit(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null || CurrentUser.equals("")){
			response.sendRedirect("login.htm");
		}
		
		List<VisitNameTexts>  VisitNameTextslist;
		List<Visits>  visitsList;
		
		List<studies> studiesList;
		
		
		
		VisitNameTextslist=visitDao.VisitNameTextsList(CurrentUser);
		visitsList=visitDao.findAll(CurrentUser);
		
	
		studiesList = stDao.StudiesList(CurrentUser);
		
		
		Visits vis =visitDao.findVisitById(Integer.parseInt(request.getParameter("visits_id")));
		if(vis == null){
			response.sendRedirect("ShowVisitsIndex.visits");
		}

		VisitNameTextslist=visitDao.VisitNameTextsList(CurrentUser);
		VisitNameTexts vnt= visitDao.VisitNameTextsList(CurrentUser,vis.getVisit_name_text_id()).get(0);
		
		visitsList=visitDao.findAll(CurrentUser);
		studiesList = stDao.StudiesList(CurrentUser);
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("visit",vis);
		modelMap.addAttribute("Visit_Head", "current_btn");
		modelMap.addAttribute("studyList",studiesList);
		modelMap.addAttribute("VisitNameTextslist",VisitNameTextslist);
		modelMap.addAttribute("visitname",vnt.getVisit_name());
		modelMap.addAttribute("visitnametextid",vnt.getVisit_name_text_id());
		modelMap.addAttribute("Visitslist",visitsList);
		modelMap.addAttribute("study",request.getParameter("study"));
		return new ModelAndView("editVisitsindex",modelMap);
	}

	
	
	
	public ModelAndView createVisit(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null || CurrentUser.equals("")){
			response.sendRedirect("login.htm");
		}
		
		List<VisitNameTexts>  VisitNameTextslist;
		List<Visits>  visitsList;
		List<CaseReportForms> crfList;
		List<VisitCrfs> visitCrfList;
		List<studies> studiesList;
		
		
		
		VisitNameTextslist=visitDao.VisitNameTextsList(CurrentUser);
		visitsList=visitDao.findAll(CurrentUser);
		visitCrfList = visitDao.findVisitCrfs(CurrentUser);
		crfList = crfDao.cfrList(CurrentUser);
	
		studiesList = stDao.StudiesList(CurrentUser);
		
		
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date( cal.getTime().getTime() );
		Visits obj=new Visits();
		obj.setStudy_id(Integer.parseInt(request.getParameter("study").trim()));
		obj.setDescription(request.getParameter("visitDescription"));
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		//int val = Integer.parseInt(request.getParameter("visitName"));
	//	if(val == 0){
			String name = request.getParameter("visit_name");
			VisitNameTexts visitnameText = new VisitNameTexts();
			visitnameText.setCode(name);
			visitnameText.setVisit_name(name);
			visitnameText.setDate_created(date);
			visitnameText.setDate_modified(date);
			visitnameText.setCreated_by(CurrentUser.getUser_id());
			visitnameText.setModified_by(CurrentUser.getUser_id());
			visitnameText.setVisit_text(name);
			visitnameText.setSubscriber_id(CurrentUser.getSubscription_id());
		
			Integer valr = visitDao.saveVisitText(visitnameText);
			if(valr != -1){
				obj.setVisit_name_text_id(valr);
			}
	//	}else{
	//		obj.setVisit_name_text_id(val);
	//	}
		try{
		if(!request.getParameter("relatedVisit").equals("0") && request.getParameter("relatedVisit") != null){
			//System.out.print("\n\n\n  ok in related visit \n\n\n");
			obj.setRelated_visit_id(Integer.parseInt(request.getParameter("relatedVisit")));
			
		}else{
			obj.setRelated_visit_id(0);
		}
		}catch (Exception e) {
			// TODO: handle exception
			obj.setRelated_visit_id(0);
		}
		if(request.getParameter("mandatory")!= null && request.getParameter("mandatory").equals("on")){
			obj.setIs_mandatory(true);
		}else{
			obj.setIs_mandatory(false);
		}
		if(request.getParameter("scheduled") != null && request.getParameter("scheduled").equals("on")){
			obj.setIs_scheduled(true);
		}else{
			obj.setIs_scheduled(false);
		}
		if(request.getParameter("adverse") != null && request.getParameter("adverse").equals("on")){
			obj.setIs_adverse(true);
		}else{
			obj.setIs_adverse(false);
		}
		if(request.getParameter("monitor") != null && request.getParameter("monitor").equals("on")){
			obj.setIs_monitor(true);
		}else{
			obj.setIs_monitor(false);
		}
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setModified_by(CurrentUser.getUser_id());
		obj.setDate_created(date);
		obj.setDate_modified(date);
		if(!request.getParameter("dateOfVisit").equals("")){
			obj.setVisit_optimum(Integer.parseInt(request.getParameter("dateOfVisit")));
		}else{
			obj.setVisit_optimum(0);
		}
		if(!request.getParameter("openWindow").equals("")){
			obj.setWindow_open(Integer.parseInt(request.getParameter("openWindow")));
		}else{
			obj.setWindow_open(0);
		}
		if(!request.getParameter("closeWindow").equals("")){
			obj.setWindow_close(Integer.parseInt(request.getParameter("closeWindow")));
		}else{
			obj.setWindow_close(0);
		}
		if(request.getParameter("primaryVisit")!=null && request.getParameter("primaryVisit").equals("on")){
			if(obj.getRelated_visit_id()==0){
				
				if(visitDao.getPrimaryVisit(obj).size()>0){
					obj.setIs_primary(0);					
				}else{
					obj.setIs_primary(1);
				}
				
			
				
			}
			else if(visitDao.getPrimaryVisitId(obj.getStudy_id(), 1)==obj.getRelated_visit_id()){
				obj.setIs_primary(2);
			}else if(visitDao.getPrimaryVisitId(obj.getStudy_id(), 2)==obj.getRelated_visit_id()){
				obj.setIs_primary(2);
			}else{
				obj.setIs_primary(0);
			}			
		}else{
			
			obj.setIs_primary(0);
			//visitDao.updatePrimaryVisit(obj, 1);
		}
		int result = visitDao.SaveVisit(obj,CurrentUser);
		
		if(result == 1){
			result = visitDao.assignToPAtients(Integer.parseInt(request.getParameter("study").trim()),CurrentUser.getUser_id());
		}
		
		VisitNameTextslist = visitDao.VisitNameTextsList(CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Visit_Head", "current_btn");
		if(request.getParameter("primaryVisit")!=null && obj.getIs_primary()== 0 && request.getParameter("primaryVisit").equals("on")){
			response.sendRedirect("ShowVisitsIndex.visits?message=Primary Visit is already defined in this study");
		}
		else if(request.getParameter("primaryVisit")!=null && obj.getIs_primary()== 1 && request.getParameter("primaryVisit").equals("on")){
			response.sendRedirect("ShowVisitsIndex.visits?message=Primary Visit Created Successfuly");
		}
		else if(result == 1){
			response.sendRedirect("ShowVisitsIndex.visits?message=Visit Successfully Created");
		}else{
			response.sendRedirect("ShowVisitsIndex.visits?error_message=Unable To Create Visit");
		}
		return new ModelAndView("visitsindex",modelMap);
	}
	
	public ModelAndView editVisit(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		
		
		List<VisitNameTexts>  VisitNameTextslist;
		
		
		
		VisitNameTextslist=visitDao.VisitNameTextsList(CurrentUser);
		
		
		if(CurrentUser == null || CurrentUser.equals("")){
			response.sendRedirect("login.htm");
			return new ModelAndView("login",new ModelMap());
		}else{
		Calendar cal = Calendar.getInstance();		 
		Date date =new java.sql.Date(cal.getTime().getTime());
		Visits obj=new Visits();
		obj.setStudy_id(Integer.parseInt(request.getParameter("study").trim()));
		obj.setDescription(request.getParameter("visitDescription"));
		obj.setVisit_name_text_id(Integer.parseInt(request.getParameter("vnt")));
		
		String name = request.getParameter("visit_name");
		VisitNameTexts visitnameText = new VisitNameTexts();
		visitnameText.setCode(name);
		visitnameText.setVisit_name_text_id(obj.getVisit_name_text_id());
		visitnameText.setVisit_name(name);
		visitnameText.setDate_created(date);
		visitnameText.setDate_modified(date);
		visitnameText.setCreated_by(CurrentUser.getUser_id());
		visitnameText.setModified_by(CurrentUser.getUser_id());
		visitnameText.setVisit_text(name);
		visitnameText.setSubscriber_id(CurrentUser.getSubscription_id());
		Integer valr = visitDao.saveVisitText(visitnameText);
		try
		{
			if(request.getParameter("relatedVisit").equals("0")==false && request.getParameter("relatedVisit") != null){
				obj.setRelated_visit_id(Integer.parseInt(request.getParameter("relatedVisit")));
			}else{
				obj.setRelated_visit_id(0);
			}
		}catch(Exception e ){
			e.printStackTrace();
			
			obj.setRelated_visit_id(0);
		}
		obj.setVisit_id(Integer.parseInt(request.getParameter("visitId").trim()));
		if(request.getParameter("mandatory")!= null && request.getParameter("mandatory").equals("on")){
			obj.setIs_mandatory(true);
		}else{
			obj.setIs_mandatory(false);
		}
		if(request.getParameter("scheduled") != null && request.getParameter("scheduled").equals("on")){
			obj.setIs_scheduled(true);
		}else{
			obj.setIs_scheduled(false);
		}
		if(request.getParameter("adverse") != null && request.getParameter("adverse").equals("on")){
			obj.setIs_adverse(true);
		}else{
			obj.setIs_adverse(false);
		}
		if(request.getParameter("monitor") != null && request.getParameter("monitor").equals("on")){
			obj.setIs_monitor(true);
		}else{
			obj.setIs_monitor(false);
		}
		if(!request.getParameter("dateOfVisit").equals("")){
			obj.setVisit_optimum(Integer.parseInt(request.getParameter("dateOfVisit")));
		}else{
			obj.setVisit_optimum(0);
		}
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setModified_by(CurrentUser.getUser_id());
		obj.setDate_created(date);
		obj.setDate_modified(date);
		if(!request.getParameter("openWindow").equals("")){
			obj.setWindow_open(Integer.parseInt(request.getParameter("openWindow")));
		}else{
			obj.setWindow_open(0);
		}
		if(!request.getParameter("closeWindow").equals("")){
			obj.setWindow_close(Integer.parseInt(request.getParameter("closeWindow")));
		}else{
			obj.setWindow_close(0);
		}
		obj.setStudy_id(Integer.parseInt(request.getParameter("study")));
		if(request.getParameter("primaryVisit")!=null && request.getParameter("primaryVisit").equals("on")){
			if(obj.getRelated_visit_id()==0){
				//obj.setIs_primary(visitDao.getPrimaryVisit(obj));
				if(visitDao.getPrimaryVisit(obj).size()>0){
					obj.setIs_primary(0);					
				}else{
					obj.setIs_primary(1);
				}
				
			}
			else if(visitDao.getPrimaryVisitId(obj.getStudy_id(), 1)==obj.getRelated_visit_id()){
				obj.setIs_primary(2);
			}else if(visitDao.getPrimaryVisitId(obj.getStudy_id(), 2)==obj.getRelated_visit_id()){
				obj.setIs_primary(2);
			}else{
				obj.setIs_primary(0);
			}
			
		}else{
				obj.setIs_primary(0);
				visitDao.updatePrimaryVisit(obj, 0);
		}
		int result = visitDao.SaveVisit(obj,CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("VisitNameTextslist",VisitNameTextslist);
		modelMap.addAttribute("Visitslist", visitDao.findAll(CurrentUser));
		if(obj.getIs_primary()==0 && result==1 && request.getParameter("primaryVisit")!=null && request.getParameter("primaryVisit").equals("on")){
			response.sendRedirect("ShowVisitsIndex.visits?message=Primary Visit is already defined in this study");
		}
		else if(obj.getIs_primary()==1 && result==1 && request.getParameter("primaryVisit")!=null && request.getParameter("primaryVisit").equals("on")){
			response.sendRedirect("ShowVisitsIndex.visits?message=Visit edited successfuly! ");
		}
		else if(result == 1){
			response.sendRedirect("ShowVisitsIndex.visits?message=Visit Successfully Edited");
		
		}else{
			response.sendRedirect("ShowVisitsIndex.visits?CurrentForm=View_Visitlist_Div&error_message=Unable To Edit Visit");
		}
		return new ModelAndView("visitsindex",modelMap);
		}
	}
	public ModelAndView deleteVisits(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{			
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		int result = visitDao.delete(Integer.parseInt(request.getParameter("visits_id")));
		ModelMap modelMap = new ModelMap();	
		if(result == 1){
			response.sendRedirect("ShowVisitsIndex.visits?CurrentForm=View_Visitlist_Div&message=Visit Successfully Deleted");
		}else{
			response.sendRedirect("ShowVisitsIndex.visits?CurrentForm=View_Visitlist_Div&error_message=Unable To Delete Visit, It is assosiated to Patients");
		}
		return new ModelAndView("visitsindex",modelMap);
	}
	
	public ModelAndView ShowAssignVisit(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{			
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		
		
		List<CaseReportForms> crfList;
		List<VisitCrfs> visitCrfList;
		
		
		
		
		visitCrfList = visitDao.findVisitCrfs(CurrentUser);
		crfList = crfDao.cfrList(CurrentUser);
	
		
		
		
		visitCrfList = visitDao.assignCrfs(Integer.parseInt(request.getParameter("visits_id")));
		crfList = crfDao.cfrList(CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("visitCRFs",visitCrfList);
		modelMap.addAttribute("Visit_Head", "current_btn");
		modelMap.addAttribute("crf",crfList);
		modelMap.addAttribute("visitId",Integer.parseInt(request.getParameter("visits_id")));
		return new ModelAndView("assignCrfToVisits",modelMap);
	}
	
	public ModelAndView SaveAssignVisit(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{			
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null || CurrentUser.equals("")){
			response.sendRedirect("login.htm");
		}
		String[] visitCrfs = request.getParameterValues("crf_to_visit");
		Integer visitId =Integer.parseInt(request.getParameter("visitId"));
		if(visitCrfs != null){
			 List<Integer> us=new ArrayList<Integer>();
			  for(int i=0;i<visitCrfs.length;i++){
			   us.add(Integer.parseInt(visitCrfs[i]));
			  }
			  visitDao.SaveCrfVisits(visitId, CurrentUser, us);
		}
		else{
		  visitDao.SaveCrfVisits(visitId, CurrentUser, new ArrayList<Integer>());
		}
		ModelMap modelMap = new ModelMap();
	
		response.sendRedirect("ShowVisitsIndex.visits?CurrentForm=View_Visitlist_Div&message=CRF successfully assigned to the visit!");
		return new ModelAndView("visitsindex",modelMap);
	}
	
	/*@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/getSectionsJson.visits")
	public String getSectionsJson(@RequestParam("q") String keyword, @RequestParam(required=false, value="limit",defaultValue="100") Integer limit,
			HttpServletRequest request)throws Exception {
		keyword = "%"+keyword+"%";
		
		JSONObject jsonArray = new JSONObject();
		if(candidates != null){
			for (LabelValueBean labelValueBean : candidates) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put( , );
				jsonObject.put(,);
				jsonArray.add(jsonObject);
			}
		}
		return jsonArray.toString();
	}*/
	

	
	public Object listOfAnsType(HttpServletRequest request, HttpServletResponse response) throws Exception{
		jsone.put("int", 1);
		return jsone;
	}

	public VisitsDAO getVisitDao() {
		return visitDao;
	}

	public void setVisitDao(VisitsDAO visitDao) {
		this.visitDao = visitDao;
	}

	public Users getCurrentUser() {
		return CurrentUser;
	}

	public void setCurrentUser(Users currentUser) {
		CurrentUser = currentUser;
	}

	public String getVisitDescription() {
		return visitDescription;
	}

	public void setVisitDescription(String visitDescription) {
		this.visitDescription = visitDescription;
	}

	public CRFDAO getCrfDao() {
		return crfDao;
	}

	public void setCrfDao(CRFDAO crfDao) {
		this.crfDao = crfDao;
	}

	public StudiesDAO getStDao() {
		return stDao;
	}

	public void setStDao(StudiesDAO stDao) {
		this.stDao = stDao;
	}

	
}

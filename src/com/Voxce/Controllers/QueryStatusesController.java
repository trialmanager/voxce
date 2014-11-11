package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.QueryStatusesDAO;
import com.Voxce.model.QueryStatuses;
import com.Voxce.model.Users;

@Controller
public class QueryStatusesController extends MultiActionController {

	private QueryStatusesDAO queryStatusesDAO;
	private Users CurrentUser;
	
	public QueryStatusesController(){
		System.out.println("In QueryStatuses Controller");
	}
	
	public QueryStatusesDAO getQueryStatusesDAO() {
		return queryStatusesDAO;
	}

	public void setQueryStatusesDAO(QueryStatusesDAO queryStatusesDAO) {
		this.queryStatusesDAO = queryStatusesDAO;
	}
	
//****SHOW FORM
		public ModelAndView showQueryStatusesIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			String formCalled = request.getParameter("FormCalled");
			
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser));
			modelMap.addAttribute("editCommand", new QueryStatuses());
			modelMap.addAttribute("CurrentForm", formCalled);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("query_statuses_index",modelMap);
		}

//********** ADD QUERY STATUS
	public ModelAndView addQueryStatusHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			
			QueryStatuses qStatus = new QueryStatuses();
			qStatus.setCode(request.getParameter("addqscode"));
			qStatus.setName(request.getParameter("addqsname"));
			qStatus.setDescription(request.getParameter("addqsdescription"));
			qStatus.setCreated_by(CurrentUser.getUser_id());
			qStatus.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
			
			try{
				messageCode = queryStatusesDAO.saveQueryStatus(qStatus);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			
			if(messageCode != 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_querystatus_form");
				modelMap.addAttribute("qsAdd",qStatus);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("query_statuses_index",modelMap);
			}
			else {

				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_querystatus_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("query_statuses_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("query_statuses_index",modelMap);
		}
	}


	
//****** GET ALL QUERY STATUSES LIST
	public ModelAndView listQueryStatusesHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser)); //for list
		modelMap.addAttribute("CurrentForm", "list_querystatuses_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("query_statuses_index",modelMap);
	}
	
//***** EDIT QUERY STATUS
	public ModelAndView editQueryStatusHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			QueryStatuses qsUpdate = new QueryStatuses();
			qsUpdate.setQuery_status_id(Integer.parseInt(request.getParameter("editqsid")));
			qsUpdate.setCode(request.getParameter("editqscode"));
			qsUpdate.setName(request.getParameter("editqsname"));
			qsUpdate.setDescription(request.getParameter("editqsdescription"));
			qsUpdate.setModified_by(CurrentUser.getUser_id());
			
//send update			
			int messageCode = queryStatusesDAO.updateQueryStatuses(qsUpdate,CurrentUser);
			
			if(messageCode == 3){
				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("EditMessageCode" ,messageCode);
				modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_querystatuses_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("query_statuses_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("EditMessageCode" ,messageCode);
				modelMap.addAttribute("queryStatusesList", queryStatusesDAO.getQueryStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","edit_querystatus_form");
				modelMap.addAttribute("qsEdit",qsUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("query_statuses_index",modelMap);
			}
		}
		catch (Exception exp){
			exp.printStackTrace();
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("query_statuses_index",modelMap);
		}
	}
}

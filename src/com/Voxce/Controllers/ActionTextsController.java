package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.ActionTextsDAO;
import com.Voxce.model.ActionTexts;
import com.Voxce.model.Users;

@Controller
public class ActionTextsController extends MultiActionController{

	private ActionTextsDAO actionTextsDAO;
	private Users CurrentUser;

	public ActionTextsController(){

	}

	public ActionTextsDAO getActionTextsDAO() {
		return actionTextsDAO; 
	}

	public void setActionTextsDAO(ActionTextsDAO actionTextsDAO) {
		this.actionTextsDAO = actionTextsDAO;
	}

	//****SHOW FORM
	public ModelAndView showActionTextsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String formCalled = request.getParameter("FormCalled");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("action_texts_index",modelMap);
	}

	//********** ADD ACTIONTEXT	
	public ModelAndView addActionTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {

			ActionTexts aText = new ActionTexts();
			aText.setCODE(request.getParameter("addatcode"));
			aText.setNAME(request.getParameter("addatname"));
			aText.setTEXT(request.getParameter("addattext"));
			aText.setCREATED_BY(CurrentUser.getUser_id());
			aText.setSubscriber_id(CurrentUser.getSubscription_id());

			int messageCode = -1;

			try{
				messageCode = actionTextsDAO.saveActionText(aText,CurrentUser);
			}
			catch(Exception exp){
				//	System.out.println("Exception Encountered: "+exp);
			}
			if(messageCode != 3){
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_actiontext_form");
				modelMap.addAttribute("atAdd", aText);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("action_texts_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_actiontext_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("action_texts_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("action_texts_index",modelMap);
		}
	}



	//****** GET ALL ACTIONTEXTS LIST
	public ModelAndView listActionTextsHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser)); //for list
		modelMap.addAttribute("CurrentForm", "list_actiontexts_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("action_texts_index",modelMap);
	}

	//***** EDIT ACTIONTEXT
	public ModelAndView editActionTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			ActionTexts atUpdate = new ActionTexts();

			atUpdate.setACTION_TEXT_ID(Integer.parseInt(request.getParameter("editatid")));
			atUpdate.setCODE(request.getParameter("editatcode"));
			atUpdate.setNAME(request.getParameter("editatname"));
			atUpdate.setTEXT(request.getParameter("editattext"));
			atUpdate.setMODIFIED_BY(CurrentUser.getUser_id());

			//send update				
			int messageCode = actionTextsDAO.updateActionTexts(atUpdate,CurrentUser);

			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_actiontexts_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("action_texts_index",modelMap);
			}
			else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("actionTextsList", actionTextsDAO.getActionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_actiontexts_form");
				modelMap.addAttribute("atEdit", atUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("action_texts_index",modelMap);
			}
		}
		catch (Exception exp){
			exp.printStackTrace();
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("action_texts_index",modelMap);
		}
	}
}

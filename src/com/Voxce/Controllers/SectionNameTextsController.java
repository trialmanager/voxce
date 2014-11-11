package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.SectionNameTextsDAO;
import com.Voxce.model.SectionNameTexts;
import com.Voxce.model.Users;



@Controller
public class SectionNameTextsController extends MultiActionController {

	private SectionNameTextsDAO sectionNameTextsDAO;
	private Users CurrentUser;
	public SectionNameTextsDAO getSectionNameTextsDAO() {
		return sectionNameTextsDAO;
	}

	public void setSectionNameTextsDAO(SectionNameTextsDAO sectionNameTextsDAO) {
		this.sectionNameTextsDAO = sectionNameTextsDAO;
	}
	
	
//****SHOW FORM
	public ModelAndView showSectionNameTextsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String formCalled = request.getParameter("FormCalled");
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}	
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		return new ModelAndView("sectionnametexts_index",modelMap);
	}

//********** ADD SECTION_NAME_TEXT	
	public ModelAndView addSectionNameTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
				
			SectionNameTexts aText = new SectionNameTexts();
			aText.setSnt_code(request.getParameter("addsntcode"));
			aText.setSnt_name(request.getParameter("addsntname"));
			aText.setSnt_text(request.getParameter("addsnttext"));
			aText.setCreated_by(CurrentUser.getUser_id());
			aText.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
				
			try{
				messageCode = sectionNameTextsDAO.saveSectionNameText(aText);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			if(messageCode != 3){
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_sectionnametext_form");
				modelMap.addAttribute("sntAdd", aText);
				return new ModelAndView("sectionnametexts_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_sectionnametext_form");
				return new ModelAndView("sectionnametexts_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			return new ModelAndView("sectionnametexts_index",modelMap);
		}
	}


		
//****** GET ALL SECTION_NAME_TEXTS LIST
	public ModelAndView listSectionNameTextsHandler(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser)); //for list
		modelMap.addAttribute("CurrentForm", "list_sectionnametexts_form");
			
		return new ModelAndView("sectionnametexts_index",modelMap);
	}
		
//***** EDIT SECTION_NAME_TEXT
	public ModelAndView editSectionNameTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			SectionNameTexts sntUpdate = new SectionNameTexts();
				
			sntUpdate.setSection_name_text_id(Integer.parseInt(request.getParameter("editsntid")));
			sntUpdate.setSnt_code(request.getParameter("editsntcode"));
			sntUpdate.setSnt_name(request.getParameter("editsntname"));
			sntUpdate.setSnt_text(request.getParameter("editsnttext"));
			sntUpdate.setModified_by(CurrentUser.getUser_id());
				
	//send update				
			int messageCode = sectionNameTextsDAO.updateSectionNameTexts(sntUpdate);
					
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_sectionnametexts_form");
				return new ModelAndView("sectionnametexts_index",modelMap);
			}
			else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("sectionNameTextsList", sectionNameTextsDAO.getSectionNameTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_sectionnametexts_form");
				modelMap.addAttribute("atEdit", sntUpdate);
				return new ModelAndView("sectionnametexts_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			return new ModelAndView("sectionnametexts_index",modelMap);
		}
	}
	
}//END CONTROLLER CLASS

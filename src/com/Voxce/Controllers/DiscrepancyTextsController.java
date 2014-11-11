package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.DiscrepancyTextsDAO;
import com.Voxce.model.DiscrepancyTexts;
import com.Voxce.model.Users;

@Controller
public class DiscrepancyTextsController extends MultiActionController{

	private DiscrepancyTextsDAO discrepancyTextsDAO;
	private Users CurrentUser;
	public DiscrepancyTextsDAO getDiscrepancyTextsDAO() {
		return discrepancyTextsDAO;
	}    

	public void setDiscrepancyTextsDAO(DiscrepancyTextsDAO discrepancyTextsDAO) {
		this.discrepancyTextsDAO = discrepancyTextsDAO;
	}

//****SHOW FORM
		public ModelAndView showDiscrepancyTextsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			String formCalled = request.getParameter("FormCalled");
				
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("discrepancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser));
			modelMap.addAttribute("CurrentForm", formCalled);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("discrepancytexts_index",modelMap);
		}
		
//********** ADD DISCREPANCYTEXT 	
		public ModelAndView addDiscrepancyTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			try {
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				System.out.println("In add DT");
				
				DiscrepancyTexts aText = new DiscrepancyTexts();
				aText.setCODE(request.getParameter("adddtcode"));
				aText.setNAME(request.getParameter("adddtname"));
				aText.setTEXT(request.getParameter("adddttext"));
				aText.setCREATED_BY(CurrentUser.getUser_id());
				aText.setSubscriber_id(CurrentUser.getSubscription_id());
				int messageCode = -1;
				
				try{
					messageCode = discrepancyTextsDAO.saveDiscrepancyText(aText);
				}
				catch(Exception exp){
					exp.printStackTrace();
				}
				if(messageCode != 3){
					ModelMap modelMap = new ModelMap();		
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("discerpancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_discrepancytext_form");
					modelMap.addAttribute("dtAdd", aText);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("discrepancytexts_index",modelMap);
				}
				else{
					ModelMap modelMap = new ModelMap();		
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("discerpancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_discrepancytext_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("discrepancytexts_index",modelMap);
				}
			}
			catch (Exception exp){
				exp.printStackTrace();
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("exception",exp);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("discrepancytexts_index",modelMap);
			}
		}


		
//****** GET ALL DISCREPANCYTEXTS LIST
		public ModelAndView listDiscrepancyTextsHandler(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("discrepancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser)); //for list
			modelMap.addAttribute("CurrentForm", "list_discrepancytexts_form");
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("discrepancytexts_index",modelMap);
		}
		
//***** EDIT DISCREPANCYTEXT
		public ModelAndView editDiscrepancyTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			try {
				DiscrepancyTexts dtUpdate = new DiscrepancyTexts();
				
				dtUpdate.setDISCREPANCY_TEXT_ID(Integer.parseInt(request.getParameter("editdtid")));
				dtUpdate.setCODE(request.getParameter("editdtcode"));
				dtUpdate.setNAME(request.getParameter("editdtname"));
				dtUpdate.setTEXT(request.getParameter("editdttext"));
				dtUpdate.setMODIFIED_BY(CurrentUser.getUser_id());
				
	//send update				
					int messageCode = discrepancyTextsDAO.updateDiscrepancyTexts(dtUpdate,CurrentUser);
					
					if(messageCode == 3){
						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("MessageCode" ,messageCode);
						modelMap.addAttribute("discrepancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","list_discrepancytexts_form");
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("discrepancytexts_index",modelMap);
					}
					else {
						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("MessageCode" ,messageCode);
						modelMap.addAttribute("discrepancyTextsList", discrepancyTextsDAO.getDiscrepancyTextsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","list_discrepancytexts_form");
						modelMap.addAttribute("dtEdit", dtUpdate);
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("discrepancytexts_index",modelMap);
					}
			}
			catch (Exception exp){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("exception",exp);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("discrepancytexts_index",modelMap);
			}
		}
}

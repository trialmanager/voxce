package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.LabsDAO;
import com.Voxce.model.Labs;
import com.Voxce.model.Users;



@Controller
public class LabsController extends MultiActionController {
	
	private LabsDAO labsDAO;
	private Users CurrentUser;
	public LabsDAO getLabsDAO() {
		return labsDAO;
	}
	public void setLabsDAO(LabsDAO labsDAO) {
		this.labsDAO = labsDAO;
	}

//****SHOW FORM
		public ModelAndView showLabIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			String formCalled = request.getParameter("FormCalled");
			
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("labsList", labsDAO.getLabsList((Users)request.getSession().getAttribute("CurrentUser")));
			modelMap.addAttribute("CurrentForm", formCalled);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("labs_index",modelMap);
		}

//********** ADD LABS	
	public ModelAndView addLabHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			
				Labs addLab = new Labs();
				addLab.setCode(request.getParameter("addlabcode"));
				addLab.setName(request.getParameter("addlabname"));
				addLab.setDescription(request.getParameter("addlabdescription"));
				addLab.setCreated_by(((Users) request.getSession().getAttribute("CurrentUser")).getUser_id());
				addLab.setSubscriber_id(CurrentUser.getSubscription_id());
				int messageCode = -1;
				
				try{
					messageCode = labsDAO.saveLab(addLab);
				}
				catch(Exception exp){
					System.out.println("Exception Encountered: "+exp);
				}
			
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_lab_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("labs_index",modelMap);
				}
				else{
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_lab_form");
					modelMap.addAttribute("labAdd", addLab);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("labs_index",modelMap);
				}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("labs_index",modelMap);
		}
	}
	
//****** GET ALL LABS LIST
	public ModelAndView listLabsHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
		modelMap.addAttribute("lab", new Labs());
		modelMap.addAttribute("CurrentForm", "list_labs_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("labs_index",modelMap);
	}
	
//***** EDIT LAB
	public ModelAndView editLabHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			Labs labUpdate = new Labs();
			
			labUpdate.setLab_id(Integer.parseInt(request.getParameter("editlabid")));
			labUpdate.setCode(request.getParameter("editlabcode"));
			labUpdate.setName(request.getParameter("editlabname"));
			labUpdate.setDescription(request.getParameter("editlabdescription"));
			labUpdate.setModified_by(CurrentUser.getUser_id());
			labUpdate.setSubscriber_id(CurrentUser.getSubscription_id());	
			int messageCode = labsDAO.updateLab(labUpdate);
			
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_labs_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("labs_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_labs_form");
				modelMap.addAttribute("labEdit",labUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("labs_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("labs_index",modelMap);
		}
	}
}

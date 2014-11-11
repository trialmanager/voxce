package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.ResolutionsDAO;
import com.Voxce.model.Resolutions;
import com.Voxce.model.Users;

public class ResolutionsController extends MultiActionController{

	private ResolutionsDAO resolutionsDAO;
	private Users CurrentUser;
	public ResolutionsController(){
		
	}

	public ResolutionsDAO getResolutionsDAO() {
		return resolutionsDAO;
	}

	public void setResolutionsDAO(ResolutionsDAO resolutionsDAO) {
		this.resolutionsDAO = resolutionsDAO;
	}
	
	//****SHOW FORM
			public ModelAndView showResolutionsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
				CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				String formCalled = request.getParameter("FormCalled");
				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser));
				modelMap.addAttribute("CurrentForm", formCalled);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("resolutions_index",modelMap);
			}
			
//********** ADD RESOLUTIONS
			public ModelAndView addResolutionHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
				CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				try {
					
					Resolutions aResolution = new Resolutions();
					aResolution.setCode(request.getParameter("addrescode"));
					aResolution.setName(request.getParameter("addresname"));
					aResolution.setDescription(request.getParameter("addresdescription"));
					aResolution.setCreated_by(CurrentUser.getUser_id());
					aResolution.setSubscriber_id(CurrentUser.getSubscription_id());
					
					int messageCode = -1;
					
					try{
						messageCode = resolutionsDAO.saveResolutions(aResolution);
					}
					catch(Exception exp){
						System.out.println("Exception Encountered: "+exp);
					}
					
					if(messageCode != 3){
						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("MessageCode" ,messageCode);
						modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","add_resolution_form");
						modelMap.addAttribute("resAdd",aResolution);
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("resolutions_index",modelMap);
					}
					else {

						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("MessageCode" ,messageCode);
						modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","add_resolutions_form");
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("resolutions_index",modelMap);
					}
				}
				catch (Exception exp){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("exception",exp);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("resolutions_index",modelMap);
				}
			}
			
//****** GET ALL RESOLUTIONS LIST
			public ModelAndView listQueryStatusesHandler(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser)); //for list
				modelMap.addAttribute("CurrentForm", "list_resolutions_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("resolutions_index",modelMap);
			}
			
//***** EDIT RESOLUTION
			public ModelAndView editResolutionHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
				CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
				{
					response.sendRedirect("login.htm");
				}
				try {
					Resolutions resUpdate = new Resolutions();
					
					resUpdate.setResolution_id(Integer.parseInt(request.getParameter("editresid")));
					resUpdate.setCode(request.getParameter("editrescode"));
					resUpdate.setName(request.getParameter("editresname"));
					resUpdate.setDescription(request.getParameter("editresdescription"));
					resUpdate.setModified_by(CurrentUser.getUser_id());
					
		//send update			
					int messageCode = resolutionsDAO.updateResolution(resUpdate,CurrentUser);
					
					if(messageCode == 3){
						
						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("EditMessageCode" ,messageCode);
						modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","list_resolutions_form");
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("resolutions_index",modelMap);
					}
					else{
						ModelMap modelMap = new ModelMap();
						modelMap.addAttribute("EditMessageCode" ,messageCode);
						modelMap.addAttribute("resolutionsList", resolutionsDAO.getResolutionsList(CurrentUser));
						modelMap.addAttribute("CurrentForm","edit_resolutions_form");
						modelMap.addAttribute("resEdit",resUpdate);
						modelMap.addAttribute("Library","current_btn");
						return new ModelAndView("resolutions_index",modelMap);
					}
				}
				catch (Exception exp){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("exception",exp);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("resolutions_index",modelMap);
				}
			}

}

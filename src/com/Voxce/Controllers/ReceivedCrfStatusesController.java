package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.ReceivedCrfStatusesDAO;
import com.Voxce.model.ReceivedCrfStatuses;
import com.Voxce.model.Users;

@Controller
public class ReceivedCrfStatusesController extends MultiActionController{

	private ReceivedCrfStatusesDAO receivedCrfStatusesDAO;
	private Users CurrentUser;
	public ReceivedCrfStatusesDAO getReceivedCrfStatusesDAO() {
		return receivedCrfStatusesDAO;
	}

	public void setReceivedCrfStatusesDAO(
			ReceivedCrfStatusesDAO receivedCrfStatusesDAO) {
		this.receivedCrfStatusesDAO = receivedCrfStatusesDAO;
	}
	
// ****SHOW FORM
	public ModelAndView showReceivedCrfStatusesIndexHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String formCalled = request.getParameter("FormCalled");
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("rcsList",receivedCrfStatusesDAO.getReceivedCrfStatusesList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("receivedcrfstatuses_index", modelMap);
	}

	// ********** ADD ReceivedCrfStatuses
	public ModelAndView addReceivedCrfStatusHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			ReceivedCrfStatuses addRCS = new ReceivedCrfStatuses();
			addRCS.setCode(request.getParameter("addrcscode"));
			addRCS.setName(request.getParameter("addrcsname"));
			addRCS.setDescription(request.getParameter("addrcsdescription"));
			addRCS.setCreated_by(CurrentUser.getUser_id());
			addRCS.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;

			try {
				messageCode = receivedCrfStatusesDAO.saveReceivedCrfStatuses(addRCS);
			} catch (Exception exp) {
				System.out.println("Exception Encountered: " + exp);
			}

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("rcsList",receivedCrfStatusesDAO.getReceivedCrfStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_rcs_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("receivedcrfstatuses_index", modelMap);
				
			} else {

				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("rcsList",receivedCrfStatusesDAO.getReceivedCrfStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_rcs_form");
				modelMap.addAttribute("rcsAdd", addRCS);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("receivedcrfstatuses_index", modelMap);
			}

		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("receivedcrfstatuses_index", modelMap);
		}
	}

// ***** EDIT CATEGORY
	public ModelAndView editReceivedCrfStatusHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			ReceivedCrfStatuses rcsUpdate = new ReceivedCrfStatuses();

			rcsUpdate.setReceived_crf_status_id(Integer.parseInt(request.getParameter("editrcsid")));
			rcsUpdate.setCode(request.getParameter("editrcscode"));
			rcsUpdate.setName(request.getParameter("editrcsname"));
			rcsUpdate.setDescription(request.getParameter("editrcsdescription"));
			rcsUpdate.setModified_by(CurrentUser.getUser_id());
			
		
			// send update
			int messageCode = receivedCrfStatusesDAO.updateReceivedCrfStatuses(rcsUpdate,CurrentUser);

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("rcsList",receivedCrfStatusesDAO.getReceivedCrfStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_rcs_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("receivedcrfstatuses_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("rcsList",receivedCrfStatusesDAO.getReceivedCrfStatusesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_rcs_form");
				modelMap.addAttribute("rcsEdit", rcsUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("receivedcrfstatuses_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("receivedcrfstatuses_index", modelMap);
		}
	}
	
}

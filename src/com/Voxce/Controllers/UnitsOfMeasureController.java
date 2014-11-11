package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.UnitsOfMeasureDAO;
import com.Voxce.model.UnitsOfMeasure;
import com.Voxce.model.Users;

@Controller
public class UnitsOfMeasureController extends MultiActionController {
	
	private UnitsOfMeasureDAO unitsOfMeasureDAO;
	private Users CurrentUser;

	public UnitsOfMeasureDAO getUnitsOfMeasureDAO() {
		return unitsOfMeasureDAO;
	}

	public void setUnitsOfMeasureDAO(UnitsOfMeasureDAO unitsOfMeasureDAO) {
		this.unitsOfMeasureDAO = unitsOfMeasureDAO;
	}

// ****SHOW FORM
	public ModelAndView showUnitsOfMeasureIndexHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		String formCalled = request.getParameter("FormCalled");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("unitsofmeasure_index", modelMap);
	}

// ********** ADD UOM
	public ModelAndView addUnitsOfMeasureHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {

			UnitsOfMeasure addUOM = new UnitsOfMeasure();
			addUOM.setCode(request.getParameter("adduomcode"));
			addUOM.setName(request.getParameter("adduomname"));
			addUOM.setDescription(request.getParameter("adduomdescription"));
			addUOM.setSubscriber_id(CurrentUser.getSubscription_id());
			addUOM.setCreated_by(((Users) request.getSession().getAttribute("CurrentUser")).getUser_id());
			int messageCode = -1;

			try {
				messageCode = unitsOfMeasureDAO.saveUnitsOfMeasure(addUOM,CurrentUser);
			} catch (Exception exp) {
				System.out.println("Exception Encountered: " + exp);
			}

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_unitsofmeasure_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("unitsofmeasure_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_unitsofmeasure_form");
				modelMap.addAttribute("uomAdd", addUOM);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("unitsofmeasure_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("unitsofmeasure_index", modelMap);
		}
	}


// ***** EDIT UnitsOfMeasure
	public ModelAndView editUnitsOfMeasureHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			UnitsOfMeasure uomUpdate = new UnitsOfMeasure();

			uomUpdate.setUnit_of_measure_id(Integer.parseInt(request.getParameter("edituomid")));
			uomUpdate.setCode(request.getParameter("edituomcode"));
			uomUpdate.setName(request.getParameter("edituomname"));
			uomUpdate.setDescription(request.getParameter("edituomdescription"));
			uomUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
			uomUpdate.setModified_by(((Users) request.getSession()
					.getAttribute("CurrentUser")).getUser_id());

			int messageCode = unitsOfMeasureDAO.updateUnitsOfMeasure(uomUpdate,CurrentUser);

			if (messageCode == 3) {
				System.out.println("message code = 3");
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_unitsofmeasure_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("unitsofmeasure_index", modelMap);
			} else {
				System.out.println("message code != 3");
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_unitsofmeasure_form");
				modelMap.addAttribute("uomEdit", uomUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("unitsofmeasure_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("unitsofmeasure_index", modelMap);
		}
	}
}

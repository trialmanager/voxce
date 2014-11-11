package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.ValidationRulesDAO;
import com.Voxce.model.Users;
import com.Voxce.model.ValidationRules;


@Controller
public class ValidationRulesController extends MultiActionController{

	private ValidationRulesDAO validationRulesDAO;
	private Users CurrentUser;
	public ValidationRulesDAO getValidationRulesDAO() {
		return validationRulesDAO;
	}

	public void setValidationRulesDAO(ValidationRulesDAO validationRulesDAO) {
		this.validationRulesDAO = validationRulesDAO;
	}

// ****SHOW FORM
	public ModelAndView showValidationRulesIndexHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		String formCalled = request.getParameter("FormCalled");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("vrulesList", validationRulesDAO.getValidationRulesList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		return new ModelAndView("validationrules_index", modelMap);
	}

//********** ADD VALIDATION RULE	
	public ModelAndView addValidationRuleHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			
			ValidationRules addRule = new ValidationRules();
			addRule.setName(request.getParameter("addvrulename"));
			addRule.setText(request.getParameter("addvruletext"));
			addRule.setType(request.getParameter("addvruletype"));
			addRule.setArgument(request.getParameter("addvruleargument"));
			addRule.setCreated_by(((Users) request.getSession().getAttribute("CurrentUser")).getUser_id());
			addRule.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;

			messageCode = validationRulesDAO.saveValidationRule(addRule,CurrentUser);
			
			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("vrulesList", validationRulesDAO.getValidationRulesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_vrule_form");
				return new ModelAndView("validationrules_index", modelMap);
				
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("vrulesList", validationRulesDAO.getValidationRulesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_vrule_form");
				modelMap.addAttribute("vruleAdd", addRule);
				return new ModelAndView("validationrules_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			return new ModelAndView("validationrules_index", modelMap);
		}
	}

	
// ***** EDIT VALIDATION RULE
	
	public ModelAndView editValidationRuleHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			ValidationRules vruleUpdate = new ValidationRules();

			vruleUpdate.setValidation_rule_id(Integer.parseInt(request.getParameter("editvruleid")));
			vruleUpdate.setName(request.getParameter("editvrulename"));
			vruleUpdate.setText(request.getParameter("editvruletext"));
			vruleUpdate.setType(request.getParameter("editvruletype"));
			vruleUpdate.setArgument(request.getParameter("editvruleargument"));
			vruleUpdate.setModified_by(((Users) request.getSession().getAttribute("CurrentUser")).getUser_id());
			vruleUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = validationRulesDAO.updateValidationRule(vruleUpdate,CurrentUser);

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("vrulesList", validationRulesDAO.getValidationRulesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_vrules_form");
				return new ModelAndView("validationrules_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("vrulesList", validationRulesDAO.getValidationRulesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_vrules_form");
				modelMap.addAttribute("vruleEdit", vruleUpdate);
				return new ModelAndView("validationrules_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			return new ModelAndView("validationrules_index", modelMap);
		}
	}

}

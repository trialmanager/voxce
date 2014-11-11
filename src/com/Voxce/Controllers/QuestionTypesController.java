package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.QuestionTypesDAO;
import com.Voxce.model.QuestionTypes;
import com.Voxce.model.Users;


@Controller
public class QuestionTypesController extends MultiActionController{

	private QuestionTypesDAO questionTypesDAO;
	private Users CurrentUser;
	public QuestionTypesDAO getQuestionTypesDAO() {
		return questionTypesDAO;
	}

	public void setQuestionTypesDAO(QuestionTypesDAO questionTypesDAO) {
		this.questionTypesDAO = questionTypesDAO;
	}

// ****SHOW FORM
	public ModelAndView showQuestionTypesIndexHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		String formCalled = request.getParameter("FormCalled");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("questiontypesList", questionTypesDAO.getQuestionTypesList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		return new ModelAndView("questiontypes_index", modelMap);
	}

// ********** ADD QUESTION TYPE
	public ModelAndView addQuestionTypeHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {

			QuestionTypes addQT= new QuestionTypes();
			addQT.setCode(request.getParameter("addquestiontypecode"));
			addQT.setName(request.getParameter("addquestiontypename"));
			addQT.setDescription(request.getParameter("addquestiontypedescription"));
			addQT.setCreated_by(CurrentUser.getUser_id());
			addQT.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;

			try {
				messageCode = questionTypesDAO.saveQuestionTypes(addQT);
				
			} catch (Exception exp) {
				System.out.println("Exception Encountered: " + exp);
			}

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("questiontypesList", questionTypesDAO.getQuestionTypesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_questiontype_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontypes_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("questiontypesList", questionTypesDAO.getQuestionTypesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_questiontype_form");
				modelMap.addAttribute("qtAdd", addQT);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontypes_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("questiontypes_index", modelMap);
		}
	}

// ***** EDIT QUESTION TYPE
	public ModelAndView editQuestionTypeHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			QuestionTypes qtUpdate = new QuestionTypes();

			qtUpdate.setQuestion_type_id(Integer.parseInt(request
					.getParameter("editquestiontypeid")));
			qtUpdate.setCode(request.getParameter("editquestiontypecode"));
			qtUpdate.setName(request.getParameter("editquestiontypename"));
			qtUpdate
					.setDescription(request.getParameter("editquestiontypedescription"));
			qtUpdate.setModified_by(((Users) request.getSession()
					.getAttribute("CurrentUser")).getUser_id());

			int messageCode = questionTypesDAO.updateQuestionTypes(qtUpdate);

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("questiontypesList", questionTypesDAO.getQuestionTypesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_questiontypes_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontypes_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("questiontypesList", questionTypesDAO.getQuestionTypesList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_questiontypes_form");
				modelMap.addAttribute("qtEdit", qtUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontypes_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("questiontypes_index", modelMap);
		}
	}
}

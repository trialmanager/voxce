package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.AnswerTextsDAO;
import com.Voxce.model.AnswerTexts;
import com.Voxce.model.Users;

public class AnswerTextsController extends MultiActionController{
	
	private AnswerTextsDAO answerTextsDAO;

	public AnswerTextsDAO getAnswerTextsDAO() {
		return answerTextsDAO;
	}

	public void setAnswerTextsDAO(AnswerTextsDAO answerTextsDAO) {
		this.answerTextsDAO = answerTextsDAO;
	}
	
// ****SHOW FORM
	public ModelAndView showAnswerTextsIndexHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String formCalled = request.getParameter("FormCalled");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("answertexts_index", modelMap);
	}

// ********** ADD ANSWERTEXT
	public ModelAndView addAnswerTextHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {

			AnswerTexts aText = new AnswerTexts();
			aText.setCode(request.getParameter("addatcode"));
			aText.setName(request.getParameter("addatname"));
			aText.setText(request.getParameter("addattext"));
			aText.setSubscriber_id(CurrentUser.getSubscription_id());
			aText.setCreated_by(((Users) request.getSession().getAttribute(
					"CurrentUser")).getUser_id());

			int messageCode = -1;

			try {
				messageCode = answerTextsDAO.saveAnswerText(aText,CurrentUser);
			} catch (Exception exp) {
				//System.out.println("Exception Encountered: " + exp);
			}
			if (messageCode != 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("CurrentForm", "add_answertext_form");
				modelMap.addAttribute("atAdd", aText);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("answertexts_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("CurrentForm", "add_answertext_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("answertexts_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("answertexts_index", modelMap);
		}
	}

// ****** GET ALL ACTIONTEXTS LIST
	public ModelAndView listAnswerTextsHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id())); // for list
		modelMap.addAttribute("CurrentForm", "list_answertexts_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("answer_texts_index", modelMap);
	}

// ***** EDIT ANSWER TEXT
	public ModelAndView editAnswerTextHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			AnswerTexts atUpdate = new AnswerTexts();

			atUpdate.setAnswer_text_id(Integer.parseInt(request
					.getParameter("editatid")));
			atUpdate.setCode(request.getParameter("editatcode"));
			atUpdate.setName(request.getParameter("editatname"));
			atUpdate.setText(request.getParameter("editattext"));
			atUpdate.setModified_by(((Users) request.getSession().getAttribute(
					"CurrentUser")).getUser_id());
			atUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
			// send update
			int messageCode = answerTextsDAO.updateAnswerTexts(atUpdate);

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("CurrentForm", "list_answertexts_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("answertexts_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("answerTextsList",answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("CurrentForm", "list_answertexts_form");
				modelMap.addAttribute("atEdit", atUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("answertexts_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("answertexts_index", modelMap);
		}
	}
}

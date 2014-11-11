package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.AnswerTextsDAO;
import com.Voxce.DAO.DefaultAnswerTextsDAO;
import com.Voxce.DAO.QuestionTextsDAO;
import com.Voxce.model.DefaultAnswerTexts;
import com.Voxce.model.Users;

@Controller
public class DefaultAnswerTextsController extends MultiActionController{
	
	DefaultAnswerTextsDAO defaultAnswerTextsDAO;
	QuestionTextsDAO questionTextsDAO;
	AnswerTextsDAO answerTextsDAO;
	
	public DefaultAnswerTextsDAO getDefaultAnswerTextsDAO() {
		return defaultAnswerTextsDAO;
	}
	public void setDefaultAnswerTextsDAO(DefaultAnswerTextsDAO defaultAnswerTextsDAO) {
		this.defaultAnswerTextsDAO = defaultAnswerTextsDAO;
	}
	public QuestionTextsDAO getQuestionTextsDAO() {
		return questionTextsDAO;
	}
	public void setQuestionTextsDAO(QuestionTextsDAO questionTextsDAO) {
		this.questionTextsDAO = questionTextsDAO;
	}
	public AnswerTextsDAO getAnswerTextsDAO() {
		return answerTextsDAO;
	}
	public void setAnswerTextsDAO(AnswerTextsDAO answerTextsDAO) {
		this.answerTextsDAO = answerTextsDAO;
	}
// ****SHOW FORM	
	public ModelAndView showDefaultAnswerTextsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");
		
		String formCalled = request.getParameter("FormCalled");
				
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("dansList", defaultAnswerTextsDAO.getDefaultAnswerTextsList(CurrentUser));
		modelMap.addAttribute("ansList", answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
		modelMap.addAttribute("questList", questionTextsDAO.getQuestionTextsList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current");
		return new ModelAndView("defaultanswertexts_index",modelMap);
	}

// ********** ADD DEFAULT ANSWER TEXT
	public ModelAndView addDefaultAnswerTextHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");
		
		try {

			DefaultAnswerTexts aText = new DefaultAnswerTexts();
			aText.setQuestion_text_id(Integer.parseInt(request.getParameter("addatquestiontextid")));
			aText.setDisplay_order(Integer.parseInt(request.getParameter("addatdisplayorder")));
			aText.setAnswer_text_id(Integer.parseInt(request.getParameter("addatanswertextid")));
			aText.setCreated_by(CurrentUser.getUser_id());
			aText.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;

			try {
				messageCode = defaultAnswerTextsDAO.saveDefaultAnswerTexts(aText);
			} catch (Exception exp) {
			//	System.out.println("Exception Encountered: " + exp);
			}
			if (messageCode != 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("dansList", defaultAnswerTextsDAO.getDefaultAnswerTextsList(CurrentUser));
				modelMap.addAttribute("ansList", answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("questList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_defaultanswertext_form");
				modelMap.addAttribute("datAdd", aText);
				modelMap.addAttribute("Library","current");
				return new ModelAndView("defaultanswertexts_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("dansList", defaultAnswerTextsDAO.getDefaultAnswerTextsList(CurrentUser));
				modelMap.addAttribute("ansList", answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("questList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "add_defaultanswertext_form");
				modelMap.addAttribute("Library","current");
				return new ModelAndView("defaultanswertexts_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current");
			return new ModelAndView("defaultanswertexts_index", modelMap);
		}
	}
	
// ***** EDIT ANSWER TEXT
	public ModelAndView editDefaultAnswerTextHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Users CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");
		try {
			DefaultAnswerTexts datUpdate = new DefaultAnswerTexts();

			datUpdate.setDefault_answer_text_id(Integer.parseInt(request.getParameter("editdatid")));
			datUpdate.setQuestion_text_id(Integer.parseInt(request.getParameter("editdatquestiontextid")));
			datUpdate.setDisplay_order(Integer.parseInt(request.getParameter("editdatdisplayorder")));
			datUpdate.setAnswer_text_id(Integer.parseInt(request.getParameter("editdatanswertextid")));
			datUpdate.setModified_by(CurrentUser.getUser_id());

			// send update
			int messageCode = defaultAnswerTextsDAO.updateDefaultAnswerTexts(datUpdate);

			if (messageCode == 3) {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("dansList", defaultAnswerTextsDAO.getDefaultAnswerTextsList(CurrentUser));
				modelMap.addAttribute("ansList", answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("questList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("CurrentForm", "list_defaultanswertexts_form");
				modelMap.addAttribute("Library","current");
				return new ModelAndView("defaultanswertexts_index", modelMap);
			} else {
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode", messageCode);
				modelMap.addAttribute("dansList", defaultAnswerTextsDAO.getDefaultAnswerTextsList(CurrentUser));
				modelMap.addAttribute("ansList", answerTextsDAO.getAnswerTextsList(CurrentUser.getSubscription_id()));
				modelMap.addAttribute("questList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("datEdit", datUpdate);
				modelMap.addAttribute("CurrentForm", "list_defaultanswertexts_form");
				modelMap.addAttribute("Library","current");
				return new ModelAndView("defaultanswertexts_index", modelMap);
			}
		} catch (Exception exp) {
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", exp);
			modelMap.addAttribute("Library","current");
			return new ModelAndView("defaultanswertexts_index", modelMap);
		}
	}
}

package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CategoriesDAO;
import com.Voxce.DAO.QuestionTextsDAO;
import com.Voxce.model.QuestionTexts;
import com.Voxce.model.Users;

@Controller
public class QuestionTextsController extends MultiActionController {

	private QuestionTextsDAO questionTextsDAO;
	private CategoriesDAO categoriesDAO;
	private Users CurrentUser;
	public QuestionTextsDAO getQuestionTextsDAO() {
		return questionTextsDAO;
	}

	public void setQuestionTextsDAO(QuestionTextsDAO questionTextsDAO) {
		this.questionTextsDAO = questionTextsDAO;
	}

	public CategoriesDAO getCategoriesDAO() {
		return categoriesDAO;
	}

	public void setCategoriesDAO(CategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}

	//****SHOW QUESTION TEXT FORM
	public ModelAndView showQuestionTextsIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");		
		String formCalled = request.getParameter("FormCalled");
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("questionTextsList", questionTextsDAO.getQuestionTextsList(CurrentUser));
		modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("questiontexts_index",modelMap);
	}
		
//********** ADD QUESTIONTEXT	
	public ModelAndView addQuestionTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
				
			QuestionTexts addText = new QuestionTexts();
			addText.setCode(request.getParameter("addqtcode"));
			addText.setName(request.getParameter("addqtname"));
			//decide whether to get id or name, or access dao here or in qt dao
			addText.setCategory_id(Integer.parseInt(request.getParameter("addqtcategory")));
			
			addText.setText(request.getParameter("addqttext"));
			addText.setCreated_by(CurrentUser.getUser_id());	
			addText.setSubsriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
				
			try{
				messageCode = questionTextsDAO.saveQuestionText(addText);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("questionTextsList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_questiontext_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontexts_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();		
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("questionTextsList", questionTextsDAO.getQuestionTextsList(CurrentUser));
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_questiontext_form");
				modelMap.addAttribute("qtAdd", addText);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("questiontexts_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("questiontexts_index",modelMap);
		}
	}	//end Add Question Text
	
//***** EDIT QUESTIONTEXT
	public ModelAndView editQuestionTextHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			QuestionTexts qtUpdate = new QuestionTexts();
				
			qtUpdate.setQuestion_text_id(Integer.parseInt(request.getParameter("editqtid")));
			qtUpdate.setCode(request.getParameter("editqtcode"));
			qtUpdate.setName(request.getParameter("editqtname"));
			qtUpdate.setCategory_id(Integer.parseInt(request.getParameter("editqtcategory")));
			qtUpdate.setText(request.getParameter("editqttext"));
			qtUpdate.setModified_by(CurrentUser.getUser_id());
				
//send update				
				int messageCode = questionTextsDAO.updateQuestionText(qtUpdate);
					
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("questionTextsList", questionTextsDAO.getQuestionTextsList(CurrentUser));
					modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
					modelMap.addAttribute("CurrentForm","list_questiontexts_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("questiontexts_index",modelMap);
				}
				else {
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("questionTextsList", questionTextsDAO.getQuestionTextsList(CurrentUser));
					modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
					modelMap.addAttribute("CurrentForm","list_questiontexts_form");
					modelMap.addAttribute("qtEdit", qtUpdate);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("questiontexts_index",modelMap);
				}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("questiontexts_index",modelMap);
		}
	}//end Edit Question Text
		
		
} // END QUESTIONTEXTS CONTROLLER

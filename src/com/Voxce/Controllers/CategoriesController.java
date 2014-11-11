package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CategoriesDAO;
import com.Voxce.model.Categories;
import com.Voxce.model.Users;

@Controller
public class CategoriesController extends MultiActionController {

	private CategoriesDAO categoriesDAO;
	private Users CurrentUser;
	public CategoriesController(){
		
		
	}
	
	public CategoriesDAO getCategoriesDAO() {
		return categoriesDAO;
	}

	public void setCategoriesDAO(CategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}

//****SHOW FORM
		public ModelAndView showCategoriesIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			String formCalled = request.getParameter("FormCalled");
			
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
			modelMap.addAttribute("CurrentForm", formCalled);	
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("categories_index",modelMap);
		}

//********** ADD CATEGORY
		
	public ModelAndView addCategoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			Categories addCategory = new Categories();
			addCategory.setCategory_code(request.getParameter("addcategorycode"));
			addCategory.setCategory_name(request.getParameter("addcategoryname"));
			addCategory.setCategory_description(request.getParameter("addcategorydescription"));
			addCategory.setCreated_by(CurrentUser.getUser_id());
			addCategory.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
			
			try{
				messageCode = categoriesDAO.saveCategory(addCategory, CurrentUser);
			}
			catch(Exception exp){
				//System.out.println("Exception Encountered: "+exp);
			}
			
			
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_category_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("categories_index",modelMap);
			}
			else{
				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_category_form");
				modelMap.addAttribute("categoryAdd", addCategory);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("categories_index",modelMap);
			}
				
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("categories_index",modelMap);
		}
	}
	
	
//****** GET ALL CATEGORIES LIST
	public ModelAndView listCategoriesHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser)); //for list
		modelMap.addAttribute("CurrentForm", "list_categories_form");	
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("categories_index",modelMap);
	}
	
//***** EDIT CATEGORY
	public ModelAndView editCategoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			Categories catUpdate = new Categories();
			
			catUpdate.setCategory_id(Integer.parseInt(request.getParameter("editcategoryid")));
			catUpdate.setCategory_code(request.getParameter("editcategorycode"));
			catUpdate.setCategory_name(request.getParameter("editcategoryname"));
			catUpdate.setCategory_description(request.getParameter("editcategorydescription"));
			catUpdate.setModified_by(CurrentUser.getUser_id());
			catUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
//send update				
			int messageCode = categoriesDAO.updateCategories(catUpdate);
			
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_categories_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("categories_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("categoriesList", categoriesDAO.getCategoriesList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_categories_form");
				modelMap.addAttribute("categoryEdit",catUpdate);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("categories_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("categories_index",modelMap);
		}
	}
	
}

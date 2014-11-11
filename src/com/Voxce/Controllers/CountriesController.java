package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.model.Countries;
import com.Voxce.model.Users;

@Controller
public class CountriesController extends MultiActionController {

	private CountriesDAO countriesDAO;
	private Users CurrentUser;

	public CountriesController(){
		
	}
	
	public CountriesDAO getCountriesDAO() {
		return this.countriesDAO;
	}
	
	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}
	
//****SHOW FORM
	public ModelAndView showCountriesIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String formCalled = request.getParameter("FormCalled");
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countriesList", countriesDAO.listCountry());
		modelMap.addAttribute("CurrentForm",formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("countries_index",modelMap);
	}
	
//**** ADD COUNTRY
	public ModelAndView addCountryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try{
				CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
				if(CurrentUser==null)
					response.sendRedirect("login.htm");	
				Countries addCountry = new Countries();
				addCountry.setCOUNTRY_CODE(request.getParameter("addcountrycode"));
				addCountry.setCOUNTRY_NAME(request.getParameter("addcountryname"));
				addCountry.setDESCRIPTION(request.getParameter("addcountrydescription"));
				addCountry.setCREATED_BY(CurrentUser.getUser_id());
				addCountry.setSubscriber_id(CurrentUser.getSubscription_id());
				
				int messageCode = -1;
				
				try{
					messageCode = countriesDAO.saveCountry(addCountry);
				}
				catch(Exception exp){
					//System.out.println("Exception Encountered: "+exp);
				}
			
				if(messageCode != 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("countryAdd", addCountry);
					modelMap.addAttribute("CurrentForm","add_country_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("countries_index",modelMap);
				}
				else{
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("CurrentForm","add_country_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("countries_index",modelMap);
				}
		}
		catch(Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("countries_index",modelMap);
		}
	}
	
// GET ALL COUNTRIES LIST
	public ModelAndView listCountriesHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countriesList", countriesDAO.listCountry());
		modelMap.addAttribute("CurrentForm", "list_countries_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("countries_index",modelMap);
	}
	
	//***** EDIT COUNTRY
		public ModelAndView editCountryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
				response.sendRedirect("login.htm");	
			try {
				Countries cUpdate = new Countries();
				
				cUpdate.setCOUNTRY_ID(Integer.parseInt(request.getParameter("editcountryid")));
				cUpdate.setCOUNTRY_CODE(request.getParameter("editcountrycode"));
				cUpdate.setCOUNTRY_NAME(request.getParameter("editcountryname"));
				cUpdate.setDESCRIPTION(request.getParameter("editcountrydescription"));
				cUpdate.setMODIFIED_BY(CurrentUser.getUser_id());
				
	//send update				
				int messageCode = countriesDAO.updateCountry(cUpdate);
					
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("CurrentForm","list_countries_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("countries_index",modelMap);
				}
				else{
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("CurrentForm","list_countries_form");
					modelMap.addAttribute("countryEdit",cUpdate);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("countries_index",modelMap);
				}
			}
			catch (Exception exp){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("exception",exp);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("countries_index",modelMap);
			}
		}

}

package com.Voxce.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.DrugsDAO;
import com.Voxce.model.Drugs;
import com.Voxce.model.Users;

@Controller
public class DrugsController extends MultiActionController {

	private DrugsDAO drugsDAO;
	private Users CurrentUser;

	public DrugsController(){		
	}
	public DrugsDAO getDrugsDAO() {
		return drugsDAO;
	}
	public void setDrugsDAO(DrugsDAO drugsDAO) {
		this.drugsDAO = drugsDAO;
	}
// ****SHOW FORM
	public ModelAndView showDrugsIndexHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String formCalled = request.getParameter("FormCalled");	
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("drugsList", drugsDAO.getDrugsList((Users)request.getSession().getAttribute("CurrentUser")));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		new RedirectController().RedirectLibrary(request, response,(List<String>) request.getSession().getAttribute("resourceList"));
		return new ModelAndView("drugs_index", modelMap);
	}
		
//**** ADD DRUG		
	public ModelAndView addDrugHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			Drugs addDrug = new Drugs();
			addDrug.setCode(request.getParameter("adddrugcode"));
			addDrug.setName(request.getParameter("adddrugname"));
			addDrug.setType(request.getParameter("adddrugtype"));
			addDrug.setDose(request.getParameter("adddrugdose"));
			addDrug.setNormal_value(Integer.parseInt(request.getParameter("adddrugnormalvalue")));
			addDrug.setPer_normal_value(Integer.parseInt(request.getParameter("adddrugpernormalvalue")));
			System.out.println("Refillable = "+ request.getParameter("adddrugrefillable"));
			addDrug.setRefillable(Boolean.parseBoolean(request.getParameter("adddrugrefillable")));
			System.out.println("Refillable boolean= "+ addDrug.isRefillable());
			addDrug.setDescription(request.getParameter("adddrugdescription"));
			addDrug.setInstructions(request.getParameter("adddruginstructions"));
			addDrug.setCreated_by(CurrentUser.getUser_id());
			addDrug.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
			
			try{
				messageCode = drugsDAO.saveDrugs(addDrug,CurrentUser);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			
			if(messageCode != 3){	
	
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("drugsList", drugsDAO.getDrugsList((Users)request.getSession().getAttribute("CurrentUser")));
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("drugAdd", addDrug);
				modelMap.addAttribute("CurrentForm","add_drug_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("drugs_index",modelMap);
			}
			else{
				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("drugsList", drugsDAO.getDrugsList((Users)request.getSession().getAttribute("CurrentUser")));
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("CurrentForm","add_drug_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("drugs_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("drugs_index",modelMap);
		}
		
	}


//***** GET DRUG LIST 
	public ModelAndView listDrugsHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("drugsList", drugsDAO.getDrugsList(CurrentUser));
		modelMap.addAttribute("CurrentForm", "list_drugs_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("drugs_index",modelMap);
	}
	
	//***** EDIT LAB
		public ModelAndView editDrugHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
				response.sendRedirect("login.htm");
			try {
				Drugs drugUpdate = new Drugs();
				
				drugUpdate.setDrug_id(Integer.parseInt(request.getParameter("editdrugid")));
				drugUpdate.setCode(request.getParameter("editdrugcode"));
				drugUpdate.setName(request.getParameter("editdrugname"));
				drugUpdate.setType(request.getParameter("editdrugtype"));
				drugUpdate.setDose(request.getParameter("editdrugdose"));
				drugUpdate.setNormal_value(Integer.parseInt(request.getParameter("editdrugnormalvalue")));
				drugUpdate.setPer_normal_value(Integer.parseInt(request.getParameter("editdrugpernormalvalue")));
				drugUpdate.setRefillable(Boolean.valueOf(request.getParameter("editdrugrefillable")).booleanValue());
				drugUpdate.setDescription(request.getParameter("editdrugdescription"));
				drugUpdate.setInstructions(request.getParameter("editdruginstructions"));
				drugUpdate.setModified_by(CurrentUser.getUser_id());
				drugUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
				int messageCode = -1;
				
				try{
					messageCode = drugsDAO.updateDrug(drugUpdate);
				}
				catch(Exception exp){
					System.out.println("Exception Encountered: "+exp);
				}
			
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("drugsList", drugsDAO.getDrugsList((Users)request.getSession().getAttribute("CurrentUser")));
					modelMap.addAttribute("CurrentForm","list_drugs_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("drugs_index",modelMap);
				}
				else {
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("drugsList", drugsDAO.getDrugsList((Users)request.getSession().getAttribute("CurrentUser")));
					modelMap.addAttribute("CurrentForm","list_drugs_form");
					modelMap.addAttribute("drugEdit",drugUpdate);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("drugs_index",modelMap);
				}
			}
			catch (Exception exp){
				exp.printStackTrace();
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("exception",exp);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("drugs_index",modelMap);
			}
		}
}

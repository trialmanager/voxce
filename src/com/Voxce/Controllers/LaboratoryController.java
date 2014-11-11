package com.Voxce.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.LabNormalsDAO;
import com.Voxce.DAO.LaboratoryDAO;
import com.Voxce.DAO.LabsDAO;
import com.Voxce.DAO.UnitsOfMeasureDAO;
import com.Voxce.model.LabNormals;
import com.Voxce.model.Laboratory;
import com.Voxce.model.Users;

public class LaboratoryController extends MultiActionController{
	
	LaboratoryDAO laboratoryDAO;
	LabNormalsDAO labNormalsDAO;
	UnitsOfMeasureDAO unitsOfMeasureDAO;
	CountriesDAO countriesDAO;
	LabsDAO labsDAO;
	private Users CurrentUser;
	
	public LaboratoryDAO getLaboratoryDAO() {
		return laboratoryDAO;
	}
	
	public void setLaboratoryDAO(LaboratoryDAO laboratoryDAO) {
		this.laboratoryDAO = laboratoryDAO;
	}

	public LabNormalsDAO getLabNormalsDAO() {
		return labNormalsDAO;
	}

	public void setLabNormalsDAO(LabNormalsDAO labNormalsDAO) {
		this.labNormalsDAO = labNormalsDAO;
	}

	public UnitsOfMeasureDAO getUnitsOfMeasureDAO() {
		return unitsOfMeasureDAO;
	}

	public void setUnitsOfMeasureDAO(UnitsOfMeasureDAO unitsOfMeasureDAO) {
		this.unitsOfMeasureDAO = unitsOfMeasureDAO;
	}
	
	public CountriesDAO getCountriesDAO() {
		return countriesDAO;
	}

	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}

	
	public LabsDAO getLabsDAO() {
		return labsDAO;
	}

	public void setLabsDAO(LabsDAO labsDAO) {
		this.labsDAO = labsDAO;
	}

	//****SHOW FORM
	public ModelAndView showLaboratoryIndexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		String formCalled = request.getParameter("FormCalled");
				
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
		modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
		modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
		modelMap.addAttribute("countriesList", countriesDAO.listCountry());
		modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("laboratory_index",modelMap);
	}
	
	
//********** ADD LABORATORY	
	public ModelAndView addLaboratoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
				
				Laboratory addLab = new Laboratory();
				addLab.setLab_name(request.getParameter("addlaboratoryname"));
				addLab.setEmail(request.getParameter("addlaboratoryemail"));
				addLab.setAddress1(request.getParameter("addlaboratoryaddress1"));
				addLab.setAddress2(request.getParameter("addlaboratoryaddress2"));
				addLab.setAddress3(request.getParameter("addlaboratoryaddress3"));
				addLab.setCity(request.getParameter("addlaboratorycity"));
				addLab.setState(request.getParameter("addlaboratorystate"));
				addLab.setCountry_id(Integer.parseInt(request.getParameter("addlaboratorycountry")));
				addLab.setPostal_code(Integer.parseInt(request.getParameter("addlaboratorypostalcode")));
				addLab.setPhone(request.getParameter("addlaboratoryphone"));
				addLab.setCell(request.getParameter("addlaboratorycell"));
				addLab.setFax(request.getParameter("addlaboratoryfax"));
				addLab.setCreated_by(((Users) request.getSession().getAttribute("CurrentUser")).getUser_id());					
				addLab.setSubscriber_id(CurrentUser.getSubscription_id());
				int messageCode = -1;
					
				try{
					messageCode = laboratoryDAO.saveLaboratory(addLab);
				}
				catch(Exception exp){
					System.out.println("Exception Encountered: "+exp);
				}
				
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
					modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
					modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_laboratory_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("laboratory_index",modelMap);
				}
				else{
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
					modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
					modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
					modelMap.addAttribute("countriesList", countriesDAO.listCountry());
					modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
					modelMap.addAttribute("CurrentForm","add_laboratory_form");
					modelMap.addAttribute("laboratoryAdd", addLab);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("laboratory_index",modelMap);
				}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("laboratory_index",modelMap);
		}
	}	
	
//***** EDIT LABORATORY
	public ModelAndView editLaboratoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			
			Laboratory labUpdate = new Laboratory();
			
			labUpdate.setLabratory_id(Integer.parseInt(request.getParameter("editlaboratoryid")));
			labUpdate.setLab_name(request.getParameter("editlaboratoryname"));
			labUpdate.setEmail(request.getParameter("editlaboratoryemail"));
			labUpdate.setAddress1(request.getParameter("editlaboratoryaddress1"));
			labUpdate.setAddress2(request.getParameter("editlaboratoryaddress2"));
			labUpdate.setAddress3(request.getParameter("editlaboratoryaddress3"));
			labUpdate.setCity(request.getParameter("editlaboratorycity"));
			labUpdate.setState(request.getParameter("editlaboratorystate"));
			labUpdate.setCountry_id(Integer.parseInt(request.getParameter("editlaboratorycountry")));
			labUpdate.setPostal_code(Integer.parseInt(request.getParameter("editlaboratorypostalcode")));
			labUpdate.setPhone(request.getParameter("editlaboratoryphone"));
			labUpdate.setCell(request.getParameter("editlaboratorycell"));
			labUpdate.setFax(request.getParameter("editlaboratoryfax"));
			labUpdate.setModified_by(CurrentUser.getUser_id());	
			labUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
			
			
			int messageCode = laboratoryDAO.updateLaboratory(labUpdate);
				
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
				modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("countriesList", countriesDAO.listCountry());
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_laboratories_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("laboratory_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
				modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("countriesList", countriesDAO.listCountry());
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("laboratoryEdit",labUpdate);
				modelMap.addAttribute("CurrentForm","list_laboratories_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("laboratory_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("laboratory_index",modelMap);
		}
	}
	
//ADD LAB DATA	
	public ModelAndView addLabDataHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		try {
			
			LabNormals addLabNorm = new LabNormals();
			addLabNorm.setLabratory_id(Integer.parseInt(request.getParameter("addlabdatacurrentlaboratory")));
			addLabNorm.setLab_id(Integer.parseInt(request.getParameter("addlabdatalabname")));
			addLabNorm.setUnit_id(Integer.parseInt(request.getParameter("addlabdatadefaultunit")));
			addLabNorm.setNormal_low(Integer.parseInt(request.getParameter("addlabdatanormallow")));
			addLabNorm.setNormal_low_unit(Integer.parseInt(request.getParameter("addlabdatalowunit")));
			addLabNorm.setNormal_high(Integer.parseInt(request.getParameter("addlabdatanormalhigh")));
			addLabNorm.setNormal_high_unit(Integer.parseInt(request.getParameter("addlabdatahighunit")));
			addLabNorm.setCreated_by(CurrentUser.getUser_id());					
			addLabNorm.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
				
			try{
				messageCode = labNormalsDAO.saveLabNormals(addLabNorm);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
				modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("countriesList", countriesDAO.listCountry());
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_laboratory_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("laboratory_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("laboratoriesList", laboratoryDAO.getLaboratoryList(CurrentUser));
				modelMap.addAttribute("labNormalsList", labNormalsDAO.getLabNormalsList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("countriesList", countriesDAO.listCountry());
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("CurrentForm","add_laboratory_form");
				modelMap.addAttribute("labDataAdd", addLabNorm);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("laboratory_index",modelMap);
			}
		} 
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("laboratory_index",modelMap);
		}
		
	} //end add lab data
	
//SHOW LAB DATA LIST OF A LABORATORY	
	public ModelAndView showLabDataHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		int labr_id = Integer.parseInt(request.getParameter("labr"));
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("currentlaboratory", laboratoryDAO.findLaboratory(labr_id));
		modelMap.addAttribute("labdataList", labNormalsDAO.getALabNormals(labr_id));
		modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
		modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
		modelMap.addAttribute("CurrentForm","list_labdata_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("labdata_index",modelMap);
	}
	
//***** EDIT LAB NORMALS
	public ModelAndView editLabDataHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");	
		System.out.println("Editing LAB NORM");
		try {
			
			LabNormals editLabNorm = new LabNormals();
			editLabNorm.setLab_normal_id(Integer.parseInt(request.getParameter("editlabdataid")));
			editLabNorm.setLabratory_id(Integer.parseInt(request.getParameter("editlabdatacurrentlaboratoryid")));
			editLabNorm.setLab_id(Integer.parseInt(request.getParameter("editlabdatalabname")));
			editLabNorm.setUnit_id(Integer.parseInt(request.getParameter("editlabdatadefaultunit")));
			editLabNorm.setNormal_low(Integer.parseInt(request.getParameter("editlabdatanormallow")));
			editLabNorm.setNormal_low_unit(Integer.parseInt(request.getParameter("editlabdatalowunit")));
			editLabNorm.setNormal_high(Integer.parseInt(request.getParameter("editlabdatanormalhigh")));
			editLabNorm.setNormal_high_unit(Integer.parseInt(request.getParameter("editlabdatahighunit")));
			editLabNorm.setModified_by(CurrentUser.getUser_id());							
			editLabNorm.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = labNormalsDAO.updateLabNormals(editLabNorm);
				
			if(messageCode == 3){
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentlaboratory", laboratoryDAO.findLaboratory(editLabNorm.getLabratory_id()));
				modelMap.addAttribute("labdataList", labNormalsDAO.getALabNormals(editLabNorm.getLabratory_id()));
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("CurrentForm","list_labdata_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("labdata_index",modelMap);
			}
			else{
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("currentlaboratory", laboratoryDAO.findLaboratory(editLabNorm.getLabratory_id()));
				modelMap.addAttribute("labdataList", labNormalsDAO.getALabNormals(editLabNorm.getLabratory_id()));
				modelMap.addAttribute("UoMList", unitsOfMeasureDAO.getUnitsOfMeasureList(CurrentUser));
				modelMap.addAttribute("labsList", labsDAO.getLabsList(CurrentUser));
				modelMap.addAttribute("labDataEdit",editLabNorm);
				modelMap.addAttribute("CurrentForm","list_labdata_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("labdata_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("login.htm",modelMap);
		}
	}
		
} //END CONTROLLER

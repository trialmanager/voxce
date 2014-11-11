package com.Voxce.Controllers;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.InventoryDAO;
import com.Voxce.model.Inventory;
import com.Voxce.model.Users;

@Controller
public class InventoryController extends MultiActionController {

	private InventoryDAO inventoryDAO;
	private Users CurrentUser;

	public InventoryController(){		
	}
	public InventoryDAO getInventoryDAO() {
		return inventoryDAO;
	}
	public void setInventoryDAO(InventoryDAO inventoryDAO) {
		this.inventoryDAO = inventoryDAO;
	}
// ****SHOW FORM
	public ModelAndView showInventoryIndexHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String formCalled = request.getParameter("FormCalled");	
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList((Users)request.getSession().getAttribute("CurrentUser")));
		modelMap.addAttribute("CurrentForm", formCalled);
		modelMap.addAttribute("Library","current_btn");
		new RedirectController().RedirectLibrary(request, response,(List<String>) request.getSession().getAttribute("resourceList"));
		return new ModelAndView("inventory_index", modelMap);
	}
		
//**** ADD Inventory		
	public ModelAndView addInventoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		try {
			Inventory addInventory = new Inventory();
			addInventory.setBatchNumber(request.getParameter("batchnumber"));
			addInventory.setCategory(request.getParameter("category"));
			addInventory.setCatNbr(request.getParameter("cat_nbr"));
			addInventory.setConcentration(Integer.parseInt(request.getParameter("concentration")));
			addInventory.setConcentrationUnit(request.getParameter("concentration_unit"));
			addInventory.setHazard(request.getParameter("hazard"));
			addInventory.setInvCondition(request.getParameter("inv_condition"));
			addInventory.setInventory_id(Integer.parseInt(request.getParameter("inventory_id")));
			addInventory.setIssueDate(Date.valueOf(request.getParameter("issuedate")));
			addInventory.setExpiryDate(Date.valueOf(request.getParameter("expirydate")));
			addInventory.setGoodUntilDate(Date.valueOf(request.getParameter("gooduntildate")));
			addInventory.setLotNbr(request.getParameter("lot_nbr"));
			addInventory.setMass(request.getParameter("mass"));
			addInventory.setMassUnit(request.getParameter("mass_unit"));
			addInventory.setName(request.getParameter("name"));
			addInventory.setObjectType(request.getParameter("objectType"));
			addInventory.setOrigin(request.getParameter("origin"));
			addInventory.setPartNo(request.getParameter("part_no"));
			addInventory.setSerialNbr(request.getParameter("serial_nbr"));
			addInventory.setStatus(request.getParameter("status"));
			addInventory.setStorageTemp(Integer.parseInt(request.getParameter("storage_temp")));	
			addInventory.setCreated_by(CurrentUser.getUser_id());
			addInventory.setSubscriber_id(CurrentUser.getSubscription_id());
			int messageCode = -1;
			
			try{
				messageCode = inventoryDAO.saveInventory(addInventory,CurrentUser);
			}
			catch(Exception exp){
				System.out.println("Exception Encountered: "+exp);
			}
			
			if(messageCode != 3){	
	
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList((Users)request.getSession().getAttribute("CurrentUser")));
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("inventoryAdd", addInventory);
				modelMap.addAttribute("CurrentForm","add_inventory_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("inventory_index",modelMap);
			}
			else{
				
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList((Users)request.getSession().getAttribute("CurrentUser")));
				modelMap.addAttribute("MessageCode" ,messageCode);
				modelMap.addAttribute("CurrentForm","add_inventory_form");
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("inventory_index",modelMap);
			}
		}
		catch (Exception exp){
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception",exp);
			modelMap.addAttribute("Library","current_btn");
			return new ModelAndView("inventory_index",modelMap);
		}
		
	}


//***** GET Inventory LIST 
	public ModelAndView listInventoryHandler(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
			response.sendRedirect("login.htm");
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList(CurrentUser));
		modelMap.addAttribute("CurrentForm", "list_inventory_form");
		modelMap.addAttribute("Library","current_btn");
		return new ModelAndView("inventory_index",modelMap);
	}
	
	//***** EDIT Inventory
		public ModelAndView editInventoryHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
			CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
			if(CurrentUser==null)
				response.sendRedirect("login.htm");
			try {
				Inventory inventoryUpdate = new Inventory();
				
				inventoryUpdate.setBatchNumber(request.getParameter("editbatch_number"));
				inventoryUpdate.setCategory(request.getParameter("editcategory"));
				inventoryUpdate.setCatNbr(request.getParameter("editcat_nbr"));
				inventoryUpdate.setConcentration(Integer.parseInt(request.getParameter("editconcentration")));
				inventoryUpdate.setConcentrationUnit(request.getParameter("editconcentration_unit"));
				inventoryUpdate.setHazard(request.getParameter("edithazard"));
				inventoryUpdate.setInvCondition(request.getParameter("editinv_condition"));
				inventoryUpdate.setInventory_id(Integer.parseInt(request.getParameter("editinventory_id")));
				inventoryUpdate.setIssueDate(Date.valueOf(request.getParameter("editissuedate")));
				inventoryUpdate.setExpiryDate(Date.valueOf(request.getParameter("editexpirydate")));
				inventoryUpdate.setGoodUntilDate(Date.valueOf(request.getParameter("editgooduntildate")));
				inventoryUpdate.setLotNbr(request.getParameter("editlot_nbr"));
				inventoryUpdate.setMass(request.getParameter("editmass"));
				inventoryUpdate.setMassUnit(request.getParameter("editmass_unit"));
				inventoryUpdate.setName(request.getParameter("editname"));
				inventoryUpdate.setObjectType(request.getParameter("editobjectType"));
				inventoryUpdate.setOrigin(request.getParameter("editorigin"));
				inventoryUpdate.setPartNo(request.getParameter("editpart_no"));
				inventoryUpdate.setSerialNbr(request.getParameter("editserial_nbr"));
				inventoryUpdate.setStatus(request.getParameter("editstatus"));
				inventoryUpdate.setStorageTemp(Integer.parseInt(request.getParameter("editstorage_temp")));	
				inventoryUpdate.setCreated_by(CurrentUser.getUser_id());
				
				inventoryUpdate.setModified_by(CurrentUser.getUser_id());
				inventoryUpdate.setSubscriber_id(CurrentUser.getSubscription_id());
				int messageCode = -1;
				
				try{
					messageCode = inventoryDAO.updateInventory(inventoryUpdate);
				}
				catch(Exception exp){
					System.out.println("Exception Encountered: "+exp);
				}
			
				if(messageCode == 3){
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList((Users)request.getSession().getAttribute("CurrentUser")));
					modelMap.addAttribute("CurrentForm","list_drugs_form");
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("inventory_index",modelMap);
				}
				else {
					ModelMap modelMap = new ModelMap();
					modelMap.addAttribute("MessageCode" ,messageCode);
					modelMap.addAttribute("inventoryList", inventoryDAO.getInventoryList((Users)request.getSession().getAttribute("CurrentUser")));
					modelMap.addAttribute("CurrentForm","list_inventory_form");
					modelMap.addAttribute("inventoryEdit",inventoryUpdate);
					modelMap.addAttribute("Library","current_btn");
					return new ModelAndView("inventory_index",modelMap);
				}
			}
			catch (Exception exp){
				exp.printStackTrace();
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("exception",exp);
				modelMap.addAttribute("Library","current_btn");
				return new ModelAndView("inventory_index",modelMap);
			}
		}
}

package com.Voxce.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.SponsorDAO;
import com.Voxce.DAO.SponsorDevisionDAO;
import com.Voxce.DAO.SponsorDivisionUserDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.Countries;
import com.Voxce.model.Sponsor;
import com.Voxce.model.SponsorDevision;
import com.Voxce.model.SponsorDevisionUser;
import com.Voxce.model.Users;

@Controller
public class SponsorDivisionController extends MultiActionController {

	Users CurrentUser;
	private SponsorDAO sponsorDAO;
	private SponsorDevisionDAO sponsordivisionDAO;
	private SponsorDivisionUserDAO sponsordevisionuserDAO;
	private CountriesDAO countriesdao;	
	private UsersDAO usersdao;


	public ModelAndView ShowSponsorDivIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);


		List<SponsorDevision> SelectedSponsorDivisions=new ArrayList<SponsorDevision>();
		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(Sponsorslist.size()!=0)
		{
			SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(Sponsorslist.get(0).getSponsor_id());
			if(SelectedSponsorDivisions.size()!=0)
			{
				selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
			}
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("countrieslist",Countrieslist);	
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
		modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		return new ModelAndView("sponsorindex",modelMap);
	}

	public ModelAndView DeleteSponsorDivisionUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{

		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);


		int id=Integer.parseInt(request.getParameter("id"));
		List<SponsorDevision> SelectedSponsorDivisions=new ArrayList<SponsorDevision>();
		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(Sponsorslist.size()!=0)
		{
			SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(Sponsorslist.get(0).getSponsor_id());
			if(SelectedSponsorDivisions.size()!=0)
			{
				selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
			}
		}


		int MessageCode=sponsordevisionuserDAO.DeleteSponsorDivisionUser(id);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("countrieslist",Countrieslist);		
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("CurrentForm","View_User_SponsorDivisionDiv");
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);


		if(MessageCode==0)
		{
			modelMap.addAttribute("ViewSponDivUsMessage",MessageCode);
			modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
			return new ModelAndView("sponsorindex",modelMap);
		}
		else if(MessageCode==1)
		{
			SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
			modelMap.addAttribute("ViewSponDivUsMessage",MessageCode);
			modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
			return new ModelAndView("sponsorindex",modelMap);
		}
		return null;	
	}
	public ModelAndView SaveSponsorDivisionUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{			

		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);



		int sponid=Integer.parseInt(request.getParameter("Add_Sponsor_User_Sponsorslist").trim());
		int divid=Integer.parseInt(request.getParameter("Add_Sponsor_User_Divisionlist").trim());	
		int created_by=CurrentUser.getUser_id();
		int modby=CurrentUser.getUser_id();
		String values[] = request.getParameterValues("Add_Sponsor_User_select_user");
		System.out.println("\n\n\n\n\n "+values.length);

		List<Integer> us=new ArrayList<Integer>();
		for(int i=0;i<values.length;i++)
			us.add(Integer.parseInt(values[i]));


		int MessageCode=sponsordevisionuserDAO.SaveSponsorDivisionUser(sponid,divid,created_by,modby,us,CurrentUser);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("countrieslist",Countrieslist);
		modelMap.addAttribute("sponsorslist",Sponsorslist);		
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);

		modelMap.addAttribute("CurrentForm","Add_User_SponsorDivisionDiv");

		if(MessageCode==0)
		{
			modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
			modelMap.addAttribute("AddSponDivUsMessage",MessageCode);				
		}
		else if(MessageCode==1)
		{
			SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
			modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
			modelMap.addAttribute("AddSponDivUsMessage",MessageCode);			
		}


		List<SponsorDevision> SelectedSponsorDivisions=new ArrayList<SponsorDevision>();
		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(Sponsorslist.size()!=0)
		{
			SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(Sponsorslist.get(0).getSponsor_id());
			if(SelectedSponsorDivisions.size()!=0)
			{
				selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
			}
		}
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		return new ModelAndView("sponsorindex",modelMap);
	}


	public ModelAndView SaveSponsorDivision(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}


		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);




		SponsorDevision obj=new SponsorDevision();		

		obj.setSponsor_id(Integer.parseInt(request.getParameter("Add_SponsorDivision_Select_Sponsor").trim()));
		obj.setName(request.getParameter("Add_SponsorDivision_divisionname").trim());
		obj.setAddress1(request.getParameter("Add_SponsorDivision_address1").trim());
		obj.setAddress2(request.getParameter("Add_SponsorDivision_address2").trim());
		obj.setAddress3(request.getParameter("Add_SponsorDivision_address3").trim());
		obj.setCity(request.getParameter("Add_SponsorDivision_City").trim());
		obj.setState(request.getParameter("Add_SponsorDivision_State").trim());
		obj.setCountry_id(Integer.parseInt(request.getParameter("Add_SponsorDivision_country").trim()));
		obj.setZip(request.getParameter("Add_SponsorDivision_Zipcode").trim());		
		obj.setPhone(request.getParameter("Add_SponsorDivision_phone").trim());
		obj.setFax(request.getParameter("Add_SponsorDivision_fax").trim());
		obj.setEmail(request.getParameter("Add_SponsorDivision_email").trim());
		obj.setCreated_by(CurrentUser.getUser_id());
		obj.setModified_by(CurrentUser.getUser_id());		
		obj.setSubscriber_id(CurrentUser.getSubscription_id());
		String sponsid=request.getParameter("Add_SponsorDivision_divisionid").trim();
		if(!sponsid.trim().toString().equals(""))
		{
			obj.setDevision_id(Integer.parseInt(request.getParameter("Add_SponsorDivision_divisionid")));
		}

		int MessageCode=sponsordivisionDAO.SaveSponsorDevision(obj);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("countrieslist",Countrieslist);
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
		modelMap.addAttribute("users",users);		

		if(MessageCode==0)
		{
			modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
			modelMap.addAttribute("CurrentForm","Add_SponsorDivisionDiv");
			modelMap.addAttribute("AddSponsorDevisionMessageCode",MessageCode);
		}
		else if(MessageCode==1 && sponsid.trim().toString().equals(""))
		{
			SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
			modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
			modelMap.addAttribute("CurrentForm","Add_SponsorDivisionDiv");
			modelMap.addAttribute("AddSponsorDevisionMessageCode",MessageCode);
		}
		else if(MessageCode==1 && !sponsid.trim().toString().equals(""))
		{
			MessageCode=2;
			SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
			modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
			modelMap.addAttribute("CurrentForm","View_SponsorDivisionDiv");
			modelMap.addAttribute("AddSponsorDevisionMessageCode",MessageCode);
		}// For differentiating in edit return value

		List<SponsorDevision> SelectedSponsorDivisions=new ArrayList<SponsorDevision>();
		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(Sponsorslist.size()!=0)
		{
			SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(Sponsorslist.get(0).getSponsor_id());
			if(SelectedSponsorDivisions.size()!=0)
			{
				selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
			}
		}
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		return new ModelAndView("sponsorindex",modelMap);
	}


	public ModelAndView SaveSponsor(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);




		Sponsor sponsorobj=new Sponsor();
		sponsorobj.setName(request.getParameter("Add_Sponsor_Name").trim());
		sponsorobj.setAddress1(request.getParameter("Add_Sponsor_Address_1").trim());
		sponsorobj.setAddress2(request.getParameter("Add_Sponsor_Address_2").trim());
		sponsorobj.setAddress3(request.getParameter("Add_Sponsor_Address_3").trim());
		sponsorobj.setCity(request.getParameter("Add_Sponsor_City").trim());
		sponsorobj.setState(request.getParameter("Add_Sponsor_State").trim());
		sponsorobj.setZip(request.getParameter("Add_Sponsor_ZipCode").trim());
		sponsorobj.setCountry_id(Integer.parseInt(request.getParameter("Add_Sponsor_Country").trim()));
		sponsorobj.setPhone(request.getParameter("Add_Sponsor_Phone").trim());
		sponsorobj.setFax(request.getParameter("Add_Sponsor_Fax").trim());
		sponsorobj.setEmail(request.getParameter("Add_Sponsor_Email").trim());
		sponsorobj.setCreated_by(CurrentUser.getUser_id());
		sponsorobj.setModified_by(CurrentUser.getUser_id());
		sponsorobj.setSubscriber_id(CurrentUser.getSubscription_id());
		String sponsid=request.getParameter("Add_Sponsor_sponsorid").trim();

		int MessageCode=0;
		if(!sponsid.trim().toString().equals(""))
		{
			System.out.println(1);
			sponsorobj.setSponsor_id(Integer.parseInt(request.getParameter("Add_Sponsor_sponsorid").trim()));
			MessageCode=sponsorDAO.EditSponsor(sponsorobj);
		}
		else
		{
			System.out.println(2);
			MessageCode=sponsorDAO.SaveSponsor(sponsorobj);
		}



		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countrieslist",Countrieslist);
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);

		if(MessageCode==0)
		{
			modelMap.addAttribute("CurrentForm","Add_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}
		else if((MessageCode==1) && (sponsid.trim().equals("")))
		{
			modelMap.addAttribute("CurrentForm","Add_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}
		else if((MessageCode == 1) && (!sponsid.trim().equals("")))
		{
			MessageCode=2;
			modelMap.addAttribute("CurrentForm","View_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}
		else if(MessageCode==0 && !sponsid.trim().equals(""))
		{
			MessageCode=3;
			modelMap.addAttribute("CurrentForm","View_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}
		else if(MessageCode==4)
		{
			modelMap.addAttribute("CurrentSponsor",sponsorobj);
			modelMap.addAttribute("CurrentForm","Add_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}
		else if(MessageCode==5)
		{
			modelMap.addAttribute("CurrentSponsor",sponsorobj);
			modelMap.addAttribute("CurrentForm","Add_SponsorDiv");
			modelMap.addAttribute("AddSponsorMessageCode",MessageCode);
		}



		List<SponsorDevision> SelectedSponsorDivisions=new ArrayList<SponsorDevision>();
		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(Sponsorslist.size()!=0)
		{
			SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(Sponsorslist.get(0).getSponsor_id());
			if(SelectedSponsorDivisions.size()!=0)
			{
				selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
			}
		}

		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		return new ModelAndView("sponsorindex",modelMap);
	}

	public ModelAndView getDivisionOnSponsorChange(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		

		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);




		int ID=Integer.parseInt(request.getParameter("Field1"));
		List<SponsorDevision> SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(ID);

		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(SelectedSponsorDivisions.size()!=0)
		{
			selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(Sponsorslist.get(0).getSponsor_id(),SelectedSponsorDivisions.get(0).getDevision_id());
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("countrieslist",Countrieslist);		
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
		modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		modelMap.addAttribute("PreSelectedSponsor",ID);
		modelMap.addAttribute("CurrentForm","Add_User_SponsorDivisionDiv");

		return new ModelAndView("sponsorindex",modelMap);
	}
	public ModelAndView getUserOnDivisionChange(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		List<Countries> Countrieslist;
		List<Sponsor> Sponsorslist;
		List<SponsorDevision> SponsorDevisionlist;
		List<SponsorDevisionUser> SponsorDevisionUserlist;
		List<Users> users;


		Countrieslist=countriesdao.listCountry();
		Sponsorslist=sponsorDAO.SponsorList(CurrentUser);
		SponsorDevisionlist=sponsordivisionDAO.SponsorDevisionList(CurrentUser);
		SponsorDevisionUserlist=sponsordevisionuserDAO.SponsorDevisionUserList(CurrentUser);
		users=usersdao.listusers(CurrentUser);



		int ID=Integer.parseInt(request.getParameter("Field12"));
		List<SponsorDevision> SelectedSponsorDivisions=sponsordivisionDAO.getSelectedSponsorDivsions(ID);

		List<SponsorDevisionUser> selectedSponsorDivisionUser=new ArrayList<SponsorDevisionUser>();
		if(SelectedSponsorDivisions.size()!=0)
		{

		}
		selectedSponsorDivisionUser=sponsordivisionDAO.getSelectedSponsorDivsionsUser(ID,Integer.parseInt(request.getParameter("Field22")));
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("SponsorDivision", "current_btn");
		modelMap.addAttribute("users",users);
		modelMap.addAttribute("countrieslist",Countrieslist);		
		modelMap.addAttribute("sponsorslist",Sponsorslist);
		modelMap.addAttribute("SelectedSponsorDivisions",SelectedSponsorDivisions);
		modelMap.addAttribute("SponsorDevisionlist",SponsorDevisionlist);
		modelMap.addAttribute("SponsorDevisionUserlist",SponsorDevisionUserlist);
		modelMap.addAttribute("selectedSponsorDivisionUser",selectedSponsorDivisionUser);
		modelMap.addAttribute("PreSelectedSponsor",ID);
		modelMap.addAttribute("PreSelectedDivision",Integer.parseInt(request.getParameter("Field22")));
		modelMap.addAttribute("CurrentForm","Add_User_SponsorDivisionDiv");

		return new ModelAndView("sponsorindex",modelMap);
	}


	public void setSponsorDAO(SponsorDAO sponsorDAO) {
		this.sponsorDAO = sponsorDAO;
	}

	public void setSponsordivisionDAO(SponsorDevisionDAO sponsordivisionDAO) {
		this.sponsordivisionDAO = sponsordivisionDAO;
	}

	public void setSponsordevisionuserDAO(SponsorDivisionUserDAO sponsordevisionuserDAO) {
		this.sponsordevisionuserDAO = sponsordevisionuserDAO;
	}


	public CountriesDAO getCountriesdao() {
		return countriesdao;
	}


	public void setCountriesdao(CountriesDAO countriesdao) {
		this.countriesdao = countriesdao;
	}


	public UsersDAO getUsersdao() {
		return usersdao;
	}


	public void setUsersdao(UsersDAO usersdao) {
		this.usersdao = usersdao;
	}

}

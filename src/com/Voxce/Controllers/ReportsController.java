package com.Voxce.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.SponsorDAO;
import com.Voxce.DAO.StudiesDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.Sponsor;
import com.Voxce.model.Users;
import com.Voxce.model.studies;

@Controller
public class ReportsController extends MultiActionController{

	Users CurrentUser;	
	
	private StudiesDAO studiesdao;
	private SponsorDAO sponsorDAO;
	private UsersDAO usersdao;
	
	
	
	
	public ModelAndView ShowReportsIndex(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		List<studies> studieslist;	 
		List<Sponsor> sponsorlist;
		List<Users> userslist;	
		ModelMap map=new ModelMap();
			try{
				Users CurrentUser = (Users)request.getSession().getAttribute("CurrentUser");
				if(CurrentUser == null){
					response.sendRedirect("login.htm");
				}				
				studieslist=studiesdao.StudiesList(CurrentUser);				
				
				if(studieslist == null){
					studieslist= new ArrayList<studies>();
					map.addAttribute("studieslist",studieslist);
					return new ModelAndView("Reports",map);
				}
				map.addAttribute("studieslist",studieslist);
				map.addAttribute("Report_Header", "current_btn");
				return new ModelAndView("Reports",map);
				
		}catch(Exception e){
			e.printStackTrace();
			studieslist= new ArrayList<studies>();
			map.addAttribute("studieslist",studieslist);
			return new ModelAndView("Reports",map);
		}
	}
	
	

	

	public Users getCurrentUser() {
		return CurrentUser;
	}

	public void setCurrentUser(Users currentUser) {
		this.CurrentUser = currentUser;
	}

	public StudiesDAO getStudiesdao() {
		return studiesdao;
	}

	public void setStudiesdao(StudiesDAO studiesdao) {
		this.studiesdao = studiesdao;
	}

	public UsersDAO getUsersdao() {
		return usersdao;
	}

	public void setUsersdao(UsersDAO usersdao) {
		this.usersdao = usersdao;
	}
	
	public SponsorDAO getSponsorDAO() {
		return sponsorDAO;
	}

	public void setSponsorDAO(SponsorDAO sponsorDAO) {
		this.sponsorDAO = sponsorDAO;
	}
}// End of Controller

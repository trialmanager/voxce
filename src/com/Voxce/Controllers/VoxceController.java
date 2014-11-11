package com.Voxce.Controllers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.AdminDAO;
import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.GroupsDAO;
import com.Voxce.DAO.LanguageDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.DAO.VoxceDAO;
import com.Voxce.model.Countries;
import com.Voxce.model.GroupRights;
import com.Voxce.model.Languages;
import com.Voxce.model.Resources;
import com.Voxce.model.Subscriber;
import com.Voxce.model.UserGroups;
import com.Voxce.model.Users;


 

public class VoxceController extends MultiActionController{

	private VoxceDAO ctmsdao;
	private UsersDAO usersDAO;
	private GroupsDAO groupsDAO;
	BindingResult errors;
	private CountriesDAO countriesDAO;
	private LanguageDAO languageDAO;
	private AdminDAO adminDAO;
	
	
	@RequestMapping(value = "/loginHandler", method = RequestMethod.POST)
	public ModelAndView loginHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		return new ModelAndView("login");				
	}
	
	@RequestMapping(value = "/singUpHandler", method = RequestMethod.POST)
	public ModelAndView singUpHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		ModelMap modelMap = new ModelMap();
		List<Users> userslist = null;
		List<Users> inActiveList = null;
	
		
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();
		
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("inActiveList",inActiveList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("CurrentForm","Create_User_Div");
		return new ModelAndView("signUp",modelMap);				
	}
	
	@RequestMapping(value = "/LogoutHandler", method = RequestMethod.POST)
	public void LogoutHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Users CurrentUser = (Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		Users user = usersDAO.getUserByID(CurrentUser.getUser_id());
		if(user == null || (user.getSubscription_id() == CurrentUser.getSubscription_id())){
			request.getSession().invalidate();
			response.sendRedirect("login.htm");
		}else if(user.getSubscription_id() != CurrentUser.getSubscription_id()){
			request.getSession().setAttribute("CurrentUser", user);
			response.sendRedirect("ShowControlPanle.adm");
		}			
	}
	
	@RequestMapping(value = "/LoginUserHandler", method = RequestMethod.POST)
	public ModelAndView LoginUserHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String Username=request.getParameter("Login_User_Form_username");
		String password=request.getParameter("Login_User_Form_password");
		
		Users user = ctmsdao.AuthenticateUser(Username, password);
		List<Resources> resources=groupsDAO.getResources();
		List<String> resourceList=new ArrayList<String>();
		String MessageCode="";
		if(user == null){
			MessageCode="Username or Password is not Correct";
			ModelMap modelMap = new ModelMap();
			request.removeAttribute("Login_User_Form_username");
			request.removeAttribute("Login_User_Form_password");
			modelMap.addAttribute("MessageCode" ,MessageCode);
			return new ModelAndView("login",modelMap);		
		}
		else{
			request.getSession().setAttribute("password", password);
			if(user.getUser_type().equals("subscriber")||user.getUser_type().equals("super admin")){
				
				for(int i=0;i<resources.size();i++)
				{
					
					resourceList.add(resources.get(i).getCode().toLowerCase());
					resourceList.add("1");
					/*for(int j=0;j<4;j++){
						resourceList.add(Integer.toString(user.getUser_id()));
						resourceList.add(resources.get(i).getCode().toLowerCase());
						resourceList.add("1");
						//resourceList.add(Integer.toString(list.get(i).getGroup_id()));
					}*/
				}
				request.getSession().setAttribute("resourceList", resourceList);
				
			}
			if(user.getUser_type().equals("super admin")){
				MessageCode="Welcome to VOXCE";
				request.getSession().setAttribute("CurrentUser", user);
				
				
				request.removeAttribute("Login_User_Form_username");
				request.removeAttribute("Login_User_Form_password");
				response.sendRedirect("ShowControlPanle.adm");
			}else
			{
				MessageCode="Welcome to VOXCE";
				request.getSession().setAttribute("CurrentUser", user);
				List<UserGroups> list=usersDAO.getUserGroups(user.getUser_id()); 
				Map<String,Integer> map=new HashMap<String,Integer>();
				List<GroupRights> groupRights=null;
				
				List<Resources> tempList=null;
				for(int i=0;i<list.size();i++){
					groupRights=groupsDAO.listGroupRights((long)list.get(i).getGroup_id());
 					for(int j=0;j<groupRights.size();j++)
					{
						tempList=usersDAO.getUserResources(groupRights.get(j).getRESOURCE_ID());
						for(int k=0;k<tempList.size();k++){
							if(groupRights.get(j).getRIGHT_TYPE_ID()==1)
							{
								map.put(tempList.get(k).getCode().toLowerCase()+""+k, groupRights.get(j).getRIGHT_TYPE_ID());
							}
							
						}
						tempList.clear();
					}
					groupRights.clear();
				}
				String key="";
				
					Iterator itratr=map.entrySet().iterator();
					while(itratr.hasNext())
					{
						Map.Entry me=(Map.Entry)itratr.next();
						key=me.getKey().toString();
						resourceList.add(key.substring(0,key.length()-1).toLowerCase());
						resourceList.add(me.getValue().toString());
						
					}
			
		
				if(user.getUser_type().equals("subscriber")){
					//System.out.println("*************login as subscriber*************");
				     Subscriber sub = ctmsdao.getSubscriber(user.getSubscription_id());
				     if(sub.getFirst_visit() == 1){
				      sub.setFirst_visit(0);
				      if(ctmsdao.saveSub(sub).equals("success")){
				      response.sendRedirect("viewPasswordReset.users");
				      
				      return new ModelAndView("login",new ModelMap());
				      	}
				      }
				    }else{
				     request.getSession().setAttribute("resourceList", resourceList);
				     
				    }
				request.removeAttribute("Login_User_Form_username");
				request.removeAttribute("Login_User_Form_password");
				
				new RedirectController().RedirectHome(request, response, resourceList);
			}
		}
		MessageCode="Username or Password is not Correct";
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("MessageCode" ,MessageCode);
		return new ModelAndView("login",modelMap);	
	}
	
	@RequestMapping(value = "/AdminLogInASsubcriberHandler", method = RequestMethod.POST)
	public ModelAndView AdminLogInASsubcriberHandler(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Users CurrentUser = (Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser == null){
			response.sendRedirect("login.htm");
		}
		String Message="Login Password is not Correct";
		try{
			String password=request.getParameter("Login_User_Form_password");
			int subscription_id = Integer.parseInt(request.getParameter("subscription_id"));
			Users user = ctmsdao.AuthenticateUser(CurrentUser.getLogin(), password);
			
			
			if(user == null){
				Message="Login Password is not Correct";
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("MessageCode" ,Message);
				List<Subscriber> subList = adminDAO.getSubsriptionsList();
				modelMap.addAttribute("subList", subList);
				return new ModelAndView("admin/loginAsSubcriber",modelMap);
			}
			
			else{
					if(user.getUser_type().equals("super admin")){
				
					Message="Login Successful";
					user.setSubscription_id(subscription_id);
				
					request.getSession().setAttribute("CurrentUser", user);
					request.setAttribute("subscription_id", "");
					request.setAttribute("Login_User_Form_password", "");
					request.removeAttribute("Login_User_Form_username");
					request.removeAttribute("Login_User_Form_password");
					response.sendRedirect("ShowHomeIndex.home");
					
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		Message="Login Password is not Correct";
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("MessageCode" ,Message);
		return new ModelAndView("login",modelMap);
		
	}
	
	
	@Override
	protected void bind(HttpServletRequest request, Object command)	throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("here in Binding...");		
	}

	public VoxceDAO getCtmsdao() {
		return ctmsdao;
	}

	public void setCtmsdao(VoxceDAO ctmsdao) {
		this.ctmsdao = ctmsdao;
	}

	public BindingResult getErrors(){
		return errors;
	}
	
	public void setErrors(BindingResult errors) {
		this.errors = errors;
	}

	public UsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	public GroupsDAO getGroupsDAO() {
		return groupsDAO;
	}

	public void setGroupsDAO(GroupsDAO groupsDAO) {
		this.groupsDAO = groupsDAO;
	}

	public CountriesDAO getCountriesDAO() {
		return countriesDAO;
	}

	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}

	public LanguageDAO getLanguageDAO() {
		return languageDAO;
	}

	public void setLanguageDAO(LanguageDAO languageDAO) {
		this.languageDAO = languageDAO;
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
}
package com.Voxce.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.GroupsDAO;
import com.Voxce.DAO.LanguageDAO;
import com.Voxce.DAO.SponsorDevisionDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.Countries;
import com.Voxce.model.Groups;
import com.Voxce.model.Languages;
import com.Voxce.model.SponsorDevision;
import com.Voxce.model.UserGroups;
import com.Voxce.model.Users;

@Controller
public class UsersController extends MultiActionController{

	private UsersDAO usersdao;
	private CountriesDAO countriesDAO;
	private LanguageDAO languageDAO;
	private SponsorDevisionDAO sponsordevisionDAO;
	private GroupsDAO groupdao;



	Users CurrentUser;

	public ModelAndView showUsersindex(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		List<Groups> GroupList;
		List<UserGroups> userGroupList;





		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);
		userGroupList=new ArrayList<UserGroups>();


		List<Users> inActiveList = usersdao.listusersInactive(CurrentUser);

		if(userslist.size()!=0 )
			userGroupList=usersdao.getUserGroups(CurrentUser);

		CurrentUser=(Users) request.getSession().getAttribute("CurrentUser");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("userGroupList",userGroupList);
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
		modelMap.addAttribute("CurrentForm","Create_User_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		return new ModelAndView("users",modelMap);
	}

	public ModelAndView SaveUserGroups(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		List<Groups> GroupList;
		List<UserGroups> userGroupList;





		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);
		userGroupList=new ArrayList<UserGroups>();


		int UserID=Integer.parseInt(request.getParameter("UserGroup_User_Name"));
		String values[] = request.getParameterValues("UserGroup_Group_Name");
		List<Integer> ug=null;
		if(values!=null)
		{
			ug=new ArrayList<Integer>();
			for(int i=0;i<values.length;i++)
				ug.add(Integer.parseInt(values[i]));
		}
		int MessageCode=usersdao.SaveUserGroups(CurrentUser, UserID, ug);


		ModelMap modelMap = new ModelMap();
		if(MessageCode==0)
		{
			modelMap.addAttribute("UGError","User Group information cannot be updated at this time !");
			userGroupList=usersdao.getUserGroups(UserID);
			modelMap.addAttribute("LastUserID",userslist.get(0).getUser_id());
		}
		else if(MessageCode==1)
		{
			modelMap.addAttribute("UGSuccess","User Group information updated successfully ...");
			userGroupList=usersdao.getUserGroups(UserID);
			modelMap.addAttribute("LastUserID",UserID);
		}
		List<Users> inActiveList = usersdao.listusersInactive(CurrentUser);
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userGroupList",userGroupList);
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
		modelMap.addAttribute("CurrentForm","Add_UserGroup_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		return new ModelAndView("users",modelMap);
	}

	public ModelAndView resetPasswordUser(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");








		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}else{
			String oldpassword = request.getParameter("oldPassword");
			String newpassword = request.getParameter("newPassword");
			String userName = request.getParameter("userName");
			String result = usersdao.passwordReset(CurrentUser.getUser_id(), oldpassword, newpassword,userName);
			ModelMap modelMap = new ModelMap();
			if(result.equals("success")){
				modelMap.addAttribute("errorMessage", "");
				modelMap.addAttribute("successMessage", "Password Successfully Changed");
				CurrentUser.setPassword(newpassword);
				CurrentUser.setLogin(userName);
				request.getSession().setAttribute("CurrentUser", CurrentUser);
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}else if(result.equals("fail old")){
				modelMap.addAttribute("errorMessage", "Old Password is not Correct");
				modelMap.addAttribute("successMessage","");
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}else{
				modelMap.addAttribute("successMessage","");
				modelMap.addAttribute("errorMessage", "Unable to Reset Password");
				modelMap.addAttribute("UserMenagment","current_btn");
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}
		}
		return new ModelAndView("resetPasswordUserPanle",new ModelMap());

	}

	public ModelAndView showresetPasswordUser(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("resetPasswordUser",new ModelMap());

	}


	public ModelAndView DeleteUser(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="id", required=true) String id) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int id1=Integer.parseInt(request.getParameter("userid"));
		System.out.println("id->"+id1);
		int MessageCode= usersdao.DeleteUser(id1);


		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;





		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
		modelMap.addAttribute("CurrentForm","View_User_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		List<Users> inActiveList = usersdao.listusersInactive(CurrentUser);
		userslist=usersdao.listusers(CurrentUser);		   

		if(MessageCode == 0)
		{			
			modelMap.addAttribute("EMessage","Sorry User cannot be In-Activated at this time !");
		}
		else
		{
			userslist=usersdao.listusers(CurrentUser);			
			modelMap.addAttribute("SMessage","User In-Activated successfully...");
		}
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		return new ModelAndView("users",modelMap);
	}

	public ModelAndView ActiveUser(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="id", required=true) String id) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int id1=Integer.parseInt(request.getParameter("userid"));

		int MessageCode= usersdao.ActiveUser(id1);


		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		




		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
		modelMap.addAttribute("CurrentForm","View_User_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		List<Users> inActiveList = usersdao.listusersInactive(CurrentUser);
		userslist=usersdao.listusers(CurrentUser);		   

		if(MessageCode == 0)
		{			
			modelMap.addAttribute("EMessage","Sorry User cannot be Activated at this time !");
		}
		else
		{
			userslist=usersdao.listusers(CurrentUser);			
			modelMap.addAttribute("SMessage","User Activated successfully...");
		}
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		return new ModelAndView("users",modelMap);
	}

	public ModelAndView forgetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		String email = request.getParameter("email");
		String result = usersdao.forgetPassword(email);
		if(result.equals("success")){
			return new ModelAndView("success",new ModelMap());
		}else{
			return new ModelAndView("error",new ModelMap());
		}
	}
	public ModelAndView uniqueEmail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		String email = request.getParameter("email");
		String result = usersdao.emailExists(email);
		if(result.equals("success")){
			return new ModelAndView("success",new ModelMap());
		}else{
			return new ModelAndView("error",new ModelMap());
		}
	}
	public ModelAndView uniqueEmailSub(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		String email = request.getParameter("email");
		String result = usersdao.subReqEmailExists(email);
		if(result.equals("success")){
			return new ModelAndView("success",new ModelMap());
		}else{
			return new ModelAndView("error",new ModelMap());
		}
	}

	public ModelAndView uniqueUsername(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		String userName = request.getParameter("username");
		String result = usersdao.userNameExists(userName);
		if(result.equals("success")){
			return new ModelAndView("success",new ModelMap());
		}else{
			return new ModelAndView("error",new ModelMap());
		}
	}


	public ModelAndView ShowAccountSetting(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		

		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


		List<Countries> countrieslist = countriesDAO.listCountry();
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("us", CurrentUser);
		modelMap.addAttribute("UserMenagment","current_btn");
		return new ModelAndView("resetPasswordUser",modelMap);
	}

	public ModelAndView editAccountSetting(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		String message = "";
		String Errormessage = "";
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}else{

			//if(CurrentUser.getPassword().equals(request.getParameter("Edit_User_old_user_password"))){


			//CurrentUser.setPassword(request.getParameter("Edit_User_user_password"));
			CurrentUser.setCity(request.getParameter("Edit_user_City"));
			CurrentUser.setCountry_id(Integer.parseInt(request.getParameter("Edit_User_Countries_Selection")));
			CurrentUser.setPhone(request.getParameter("Edit_user_phone"));
			CurrentUser.setPostal_code(request.getParameter("Edit_user_postal_Code"));
			CurrentUser.setEmail(request.getParameter("Edit_user_Email_Address"));
			CurrentUser.setAddress1(request.getParameter("Edit_user_Address_1"));
			CurrentUser.setAddress2(request.getParameter("Edit_user_Address_2"));
			CurrentUser.setAddress3(request.getParameter("Edit_user_Address_3"));
			CurrentUser.setCell(request.getParameter("Edit_user_cell"));
			CurrentUser.setFax(request.getParameter("Edit_user_fax"));
			int result = usersdao.editUser(CurrentUser);
			if(result == 1){
				message = "Your information is updated";
			}else{
				Errormessage = "Data Can't be saved Due to Connection Error";
			}
			//	}else{
			//	Errormessage = "Password did not match to the account password!";
			//	}
		}
		List<Countries> countrieslist = countriesDAO.listCountry();
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("Errormessage", Errormessage);
		modelMap.addAttribute("message", message);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("us", CurrentUser);
		modelMap.addAttribute("UserMenagment","current_btn");
		return new ModelAndView("resetPasswordUser",modelMap);
	}

	public ModelAndView resetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}else{
			List<Countries> countrieslist = countriesDAO.listCountry();
			String oldpassword = request.getParameter("oldPassword");
			String newpassword = request.getParameter("newPassword");
			String result = usersdao.passwordReset(CurrentUser.getUser_id(), oldpassword, newpassword);
			ModelMap modelMap = new ModelMap();
			if(result.equals("success")){
				modelMap.addAttribute("errorMessage", "");
				modelMap.addAttribute("successMessage", "Password Successfully Changed");
				modelMap.addAttribute("us", CurrentUser);
				modelMap.addAttribute("countrieslist",countrieslist);
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}else if(result.equals("fail old")){
				modelMap.addAttribute("errorMessage", "Old Password is not Correct");
				modelMap.addAttribute("successMessage","");
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("us", CurrentUser);
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}else{
				modelMap.addAttribute("successMessage","");
				modelMap.addAttribute("us", CurrentUser);
				modelMap.addAttribute("countrieslist",countrieslist);
				modelMap.addAttribute("errorMessage", "Unable to Reset Password");
				return new ModelAndView("resetPasswordUserPanle",modelMap);
			}
		}
		return new ModelAndView("resetPasswordUserPanle",new ModelMap());

	}

	public ModelAndView viewPasswordReset(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}

		return new ModelAndView("resetPasswordUserPanle",new ModelMap());

	}

	public ModelAndView SaveUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
	



		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		



		Users user=new Users();
		user.setDevision_id(Integer.parseInt(request.getParameter("Create_user_Division_Selection")));
		user.setPreferred_language_id(Integer.parseInt(request.getParameter("Create_User_Language_Selection")));
		user.setLogin(request.getParameter("Create_User_user_name"));
		user.setPassword(request.getParameter("Create_User_user_password"));
		user.setTitle(request.getParameter("Create_user_Title"));
		user.setFirst_name(request.getParameter("Create_user_First_Name"));
		user.setMiddle_name(request.getParameter("Create_user_Middle_Name"));
		user.setLast_name(request.getParameter("Create_user_Last_Name"));
		user.setSuffix(request.getParameter("Create_user_Suffix"));
		user.setEmail(request.getParameter("Create_user_Email_Address"));
		user.setAddress1(request.getParameter("Create_user_Address_1"));
		user.setAddress2(request.getParameter("Create_user_Address_2"));
		user.setAddress3(request.getParameter("Create_user_Address_3"));
		user.setCountry_id(Integer.parseInt(request.getParameter("Create_User_Countries_Selection")));
		user.setState(request.getParameter("Create_user_State"));
		user.setPostal_code(request.getParameter("Create_user_postal_Code"));
		user.setPhone(request.getParameter("Create_user_phone"));
		user.setCell(request.getParameter("Create_user_cell"));
		user.setCompany(request.getParameter("Create_user_company"));
		user.setFax(request.getParameter("Create_user_fax"));
		user.setCity(request.getParameter("Create_user_City"));
		user.setCreated_by(CurrentUser.getUser_id());
		user.setModified_by(CurrentUser.getUser_id());
		user.setSubscription_id(CurrentUser.getSubscription_id());
		user.setUser_type("normal user");
		int MessageCode=usersdao.saveUser(user);

		if(MessageCode == 0)
		{
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
			modelMap.addAttribute("CurrentForm","Create_User_Div");
			modelMap.addAttribute("MessageCode",MessageCode);
			modelMap.addAttribute("us",user);	
			modelMap.addAttribute("UserMenagment","current_btn");
			return new ModelAndView("users",modelMap);
		}
		else
		{
			userslist=usersdao.listusers(CurrentUser);
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
			modelMap.addAttribute("CurrentForm","Create_User_Div");
			modelMap.addAttribute("MessageCode",MessageCode);
			modelMap.addAttribute("UserMenagment","current_btn");
			return new ModelAndView("users",modelMap);
		}

	}


	public ModelAndView EditUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}

		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		



		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		



		Users user=new Users();
		user.setUser_id(Integer.parseInt(request.getParameter("Edit_User_user_id")));
		user.setDevision_id(Integer.parseInt(request.getParameter("Edit_user_Division_Selection")));
		user.setPreferred_language_id(Integer.parseInt(request.getParameter("Edit_User_Language_Selection")));
		user.setLogin(request.getParameter("Edit_User_user_name"));
		user.setPassword(request.getParameter("Edit_User_user_password"));
		user.setTitle(request.getParameter("Edit_user_Title"));
		user.setFirst_name(request.getParameter("Edit_user_First_Name"));
		user.setMiddle_name(request.getParameter("Edit_user_Middle_Name"));
		user.setLast_name(request.getParameter("Edit_user_Last_Name"));
		user.setSuffix(request.getParameter("Edit_user_Suffix"));
		user.setEmail(request.getParameter("Edit_user_Email_Address"));
		user.setAddress1(request.getParameter("Edit_user_Address_1"));
		user.setAddress2(request.getParameter("Edit_user_Address_2"));
		user.setAddress3(request.getParameter("Edit_user_Address_3"));
		user.setCountry_id(Integer.parseInt(request.getParameter("Edit_User_Countries_Selection")));
		user.setState(request.getParameter("Edit_user_State"));
		user.setPostal_code(request.getParameter("Edit_user_postal_Code"));
		user.setPhone(request.getParameter("Edit_user_phone"));
		user.setCell(request.getParameter("Edit_user_cell"));
		user.setCompany(request.getParameter("Edit_user_company"));
		user.setFax(request.getParameter("Edit_user_fax"));
		user.setCity(request.getParameter("Edit_user_City"));	
		user.setIs_active(Integer.parseInt(request.getParameter("Edit_User_user_active")));
		user.setSubscription_id(CurrentUser.getSubscription_id());
		user.setUser_type(request.getParameter("Edit_user_usertype"));
		int MessageCode=usersdao.editUser(user);
		userslist=usersdao.listusers(CurrentUser);
		List<Users> inActiveList = usersdao.listusersInactive(CurrentUser);

		if(MessageCode == 0)
		{			
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("inActiveList", inActiveList);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
			modelMap.addAttribute("CurrentForm","View_User_Div");
			modelMap.addAttribute("UserMenagment","current_btn");
			modelMap.addAttribute("EditUserMessageCode",MessageCode);	


			//----------------------------------



			return new ModelAndView("users",modelMap);
		}
		else if(MessageCode == 1)
		{

			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);
			modelMap.addAttribute("CurrentForm","View_User_Div");
			modelMap.addAttribute("UserMenagment","current_btn");
			modelMap.addAttribute("EditUserMessageCode",MessageCode);		
			return new ModelAndView("users",modelMap);
		}
		return null;		
	}

	//**************************************************************************************
	//*************************************Start Exception Handling*************************
	/**
	 * Handling of client errors.
	 * 
	 * Returns HTTP status code 400 (bad request).
	 * 
	 * @param ex The client error.
	 * @return The error message.
	 */
	// These exceptions denote client errors.
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)    
	public ModelAndView handleClientErrors(Exception ex) {


		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		List<Groups> GroupList;
		





		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);
	



		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
		modelMap.addAttribute("CurrentForm","Create_User_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		ex.printStackTrace();
		return new ModelAndView("users",modelMap);   
	}

	/**
	 * Handling of server errors.
	 * 
	 * Returns HTTP status code 500 (internal server error).
	 * 
	 * @param ex The server error.
	 * @return The error message.
	 */
	// All other exceptions are server errors.
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView handleServerErrors(Exception ex) {


		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		List<Groups> GroupList;
		




		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);
	



		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
		modelMap.addAttribute("CurrentForm","Create_User_Div");
		modelMap.addAttribute("UserMenagment","current_btn");
		ex.printStackTrace();
		return new ModelAndView("users",modelMap);         
	}

	//*************************************End Exception Handling**********************************
	//**********************************************************************************************


	protected void bind(HttpServletRequest request, Object command) throws Exception
	{
		System.out.println("In bind...");
		ServletRequestDataBinder binder = createBinder(request, command);
		binder.bind(request);
	}

	public void setSponsordevisionDAO(SponsorDevisionDAO sponsordevisionDAO) {
		this.sponsordevisionDAO = sponsordevisionDAO;
	}

	public void setUsersdao(UsersDAO usersdao) {
		this.usersdao = usersdao;
	}
	public void setCountriesDAO(CountriesDAO countriesDAO) {
		this.countriesDAO = countriesDAO;
	}

	public void setLanguageDAO(LanguageDAO languageDAO) {
		this.languageDAO = languageDAO;
	}

	public GroupsDAO getGroupDAO() {
		return groupdao;
	}

	public void setGroupDAO(GroupsDAO groupdao) {
		this.groupdao = groupdao;
	}


	public ModelAndView HiddenActions(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}


		List<Users> userslist;
		List<Countries> countrieslist;
		List<Languages> Languageslist;
		List<SponsorDevision> sponsordivisionlist;
		List<Groups> GroupList;
		List<UserGroups> userGroupList;





		userslist=usersdao.listusers(CurrentUser);
		countrieslist=countriesDAO.listCountry();
		Languageslist=languageDAO.listLanguages();
		sponsordivisionlist=sponsordevisionDAO.SponsorDevisionList(CurrentUser);
		GroupList=groupdao.listGroup(CurrentUser);
		userGroupList=new ArrayList<UserGroups>();



		String type=request.getParameter("typeofaction").trim();

		if(type.equals("ChangeUserGoup"))
		{
			int UserID=Integer.parseInt(request.getParameter("HiddenValue1"));
			if(UserID != 0)
				userGroupList=usersdao.getUserGroups(UserID);

			ModelMap modelMap = new ModelMap();			
			userGroupList=usersdao.getUserGroups(UserID);			

			modelMap.addAttribute("LastUserID",UserID);
			modelMap.addAttribute("userGroupList",userGroupList);
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("GroupList",GroupList);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
			modelMap.addAttribute("CurrentForm","Add_UserGroup_Div");
			return new ModelAndView("users",modelMap);
		}
		else{

			if(userslist.size()!=0 )
				userGroupList=usersdao.getUserGroups(CurrentUser);
			ModelMap modelMap = new ModelMap();	
			modelMap.addAttribute("userslist",userslist);
			modelMap.addAttribute("GroupList",GroupList);
			modelMap.addAttribute("Languageslist",Languageslist);
			modelMap.addAttribute("countrieslist",countrieslist);
			modelMap.addAttribute("sponsordivisionlist",sponsordivisionlist);	
			modelMap.addAttribute("CurrentForm","Create_User_Div");
			return new ModelAndView("users",modelMap);
		}		
	}
}// End Class

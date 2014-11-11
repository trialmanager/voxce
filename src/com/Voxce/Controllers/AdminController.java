package com.Voxce.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.AdminDAO;
import com.Voxce.DAO.ContactRequestDAO;
import com.Voxce.DAO.CountriesDAO;
import com.Voxce.DAO.LanguageDAO;
import com.Voxce.DAO.UsersDAO;
import com.Voxce.model.ContactRequest;
import com.Voxce.model.Countries;
import com.Voxce.model.GroupRights;
import com.Voxce.model.Languages;
import com.Voxce.model.Subscriber;
import com.Voxce.model.SubscriptionRquest;
import com.Voxce.model.UserGroups;
import com.Voxce.model.Users;

@Controller
public class AdminController extends MultiActionController{



	private AdminDAO adminDAO;
	private CountriesDAO countriesDAO;
	private LanguageDAO languageDAO;
	private UsersDAO usersdao;
	private ContactRequestDAO contactdao;


	private Users CurrentUser;


	public ModelAndView ShowAdminIndex( HttpServletRequest request, HttpServletResponse response) throws Exception{
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap map=new ModelMap();
		map.addAttribute("admin_header","current_btn");
		
		return new ModelAndView("dataMapping",map);
		
		
	}
	public ModelAndView ShowControlPanle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("admin/conttrolPanle");
	}
	public ModelAndView ShowLoginAsSubscriber(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		List<Subscriber> subList = adminDAO.getSubsriptionsList();
		modelMap.addAttribute("subList", subList);
		return new ModelAndView("admin/loginAsSubcriber",modelMap);
	}


	public ModelAndView showSuperAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		List<Users> userslist = null;
		List<Users> inActiveList = null;
		List<SubscriptionRquest> subReqList = null;

		if(request.getParameter("control").equals("admin")){
			userslist=adminDAO.listSuperAdminActive(CurrentUser);
			inActiveList = adminDAO.listSuperAdminInactive(CurrentUser);
			subReqList = new ArrayList<SubscriptionRquest>();
			modelMap.addAttribute("user","admin");
		}else{
			userslist=adminDAO.listSubscriberActive();
			inActiveList = adminDAO.listSubscriberInactive();
			subReqList = adminDAO.getSubscrptionRequestList();
			modelMap.addAttribute("user","subscriber");
		}

		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();

		modelMap.addAttribute("subReqList", subReqList);
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("inActiveList",inActiveList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		String currentForm = request.getParameter("CurrentForm");
		if(currentForm != null && !currentForm.equals("")){
			modelMap.addAttribute("CurrentForm",currentForm);
			modelMap.addAttribute("EditUserMessageCode",request.getParameter("EditUserMessageCode"));
		}else{
			modelMap.addAttribute("CurrentForm","Create_User_Div");
		}

		return new ModelAndView("admin/addUserSuperAdmin",modelMap);
	}


	public ModelAndView SaveADMUser(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		String userType = request.getParameter("user");

		Users user=new Users();
		user.setDevision_id(Integer.parseInt(request.getParameter("Create_user_Division_Selection")));
		user.setPreferred_language_id(Integer.parseInt(request.getParameter("Create_User_Language_Selection")));
		user.setLogin(request.getParameter("Create_User_user_name"));
		int sub_id = 0;

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
		List<UserGroups> list=usersdao.getUserGroups(user.getUser_id()); 
		List<GroupRights> groupRights=null;
		int MessageCode=0;


		if(userType.equals("admin")){
			user.setUser_type("super admin");
			user.setSubscription_id(sub_id);
			MessageCode=usersdao.saveUser(user);
		}else{
			user.setUser_type("subscriber");
			Subscriber sub = adminDAO.addSubscription(request.getParameter("Create_User_user_name"), CurrentUser.getUser_id());
			if(sub != null){
				sub_id = sub.getSubscriber_id();
				user.setSubscription_id(sub_id);
				MessageCode=usersdao.saveUser(user);
			}

		}



		ModelMap modelMap = new ModelMap();
		List<Users> userslist = null;
		List<Users> inActiveList = null;
		if(userType.equals("admin")){
			userslist=adminDAO.listSuperAdminActive(CurrentUser);
			inActiveList  = adminDAO.listSuperAdminInactive(CurrentUser);
			modelMap.addAttribute("user","admin");
		}else{
			userslist=adminDAO.listSubscriberActive();
			inActiveList = adminDAO.listSubscriberInactive();
			modelMap.addAttribute("user","subscriber");
		}
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();

		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("CurrentForm","Create_User_Div");

		if(MessageCode == 0){
			modelMap.addAttribute("MessageCode",MessageCode);
			modelMap.addAttribute("us",user);			

		}
		else{
			modelMap.addAttribute("MessageCode",MessageCode);		

		}
		return new ModelAndView("admin/addUserSuperAdmin",modelMap);
	}

	@RequestMapping(value = "/applySubscription", method = RequestMethod.POST)
	public ModelAndView applySubscription(HttpServletRequest request,HttpServletResponse response) throws Exception {
		SubscriptionRquest user=new SubscriptionRquest();
		user.setDevision_id(0);
		user.setPreferred_language_id(Integer.parseInt(request.getParameter("language_signup")));
		user.setLogin(request.getParameter("email_signup"));

		int sub_id = 0;

		user.setPassword(usersdao.genrateRendomPassword());

		user.setUser_type("subscriber");
		Subscriber sub = adminDAO.addSubscription(request.getParameter("email_signup"), 0);

		if(sub != null){
			sub_id = sub.getSubscriber_id();
			user.setSubscription_id(sub_id);
		}
		user.setTitle(request.getParameter("title_signup"));
		user.setFirst_name(request.getParameter("first_name_signup"));
		user.setMiddle_name(request.getParameter("midel_name_signup"));

		//	System.out.println("\n******** "+user.getMiddle_name()+"************\n");

		user.setLast_name(request.getParameter("last_name_signup"));
		user.setSuffix(request.getParameter(request.getParameter("first_name_signup")+" "+request.getParameter("last_name_signup")));
		user.setEmail(request.getParameter("email_signup"));
		user.setAddress1(request.getParameter("address1_signup"));
		user.setAddress2(request.getParameter("address2_signup"));
		user.setAddress3(request.getParameter("address3_signup"));
		user.setCountry_id(Integer.parseInt(request.getParameter("country_signup")));
		user.setState(request.getParameter("state_signup"));
		user.setPostal_code(request.getParameter("posla_code_signup"));
		user.setPhone(request.getParameter("phone_signup"));
		user.setCell(request.getParameter("cell_signup"));
		user.setCompany(request.getParameter("company_signup"));
		user.setFax(request.getParameter("fax_signup"));
		user.setCity(request.getParameter("city_signup"));
		user.setCreated_by(0);
		user.setModified_by(0);

		if(usersdao.saveSubscriber(user) == 1){
			//adminDAO.email_Welcome_message(user);
			return new ModelAndView("successSubscription");
		}else{
			return new ModelAndView("errorSubscription");
		}



	}


	public ModelAndView InactiveUserSuperAdminUser(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="id", required=true) String id) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int id1=Integer.parseInt(request.getParameter("userid"));
		System.out.println("id->"+id1);
		int MessageCode= adminDAO.DeactiveUser(id1);
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();

		String userType = request.getParameter("user");

		ModelMap modelMap = new ModelMap();

		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("CurrentForm","View_User_Div");

		List<Users> userslist = new ArrayList<Users>();
		List<Users> inActiveList = new ArrayList<Users>();
		if(MessageCode == 0)
		{			
			modelMap.addAttribute("EMessage","Sorry User cannot be In-Activated at this time !");
		}
		else
		{
			if(userType.equals("admin")){
				userslist=adminDAO.listSuperAdminActive(CurrentUser);
				inActiveList  = adminDAO.listSuperAdminInactive(CurrentUser);
				modelMap.addAttribute("user","admin");
			}else{
				userslist=adminDAO.listSubscriberActive();
				inActiveList = adminDAO.listSubscriberInactive();
				modelMap.addAttribute("user","subscriber");
			}
			modelMap.addAttribute("SMessage","User In-Activated successfully...");
		}
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		return new ModelAndView("admin/addUserSuperAdmin",modelMap);
	}

	public ModelAndView ActiveSuperAdminUser(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="id", required=true) String id) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int id1=Integer.parseInt(request.getParameter("userid"));
		System.out.println("id->"+id1);
		int MessageCode= adminDAO.ActiveUser(id1);
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();

		String userType = request.getParameter("user");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("CurrentForm","View_User_Div");



		List<Users> userslist = new ArrayList<Users>();
		List<Users> inActiveList = new ArrayList<Users>();

		if(MessageCode == 0)
		{			
			modelMap.addAttribute("EMessage","Sorry User cannot be Activated at this time !");
		}
		else
		{

			if(userType.equals("admin")){
				userslist=adminDAO.listSuperAdminActive(CurrentUser);
				inActiveList  = adminDAO.listSuperAdminInactive(CurrentUser);
				modelMap.addAttribute("user","admin");
			}else{
				userslist=adminDAO.listSubscriberActive();
				inActiveList = adminDAO.listSubscriberInactive();
				modelMap.addAttribute("user","subscriber");
			}	
			modelMap.addAttribute("SMessage","User Activated successfully...");
		}
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		return new ModelAndView("admin/addUserSuperAdmin",modelMap);
	}

	public ModelAndView ActiveSubscription(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="id", required=true) String id) throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		int id1=Integer.parseInt(request.getParameter("userid"));
		System.out.println("id->"+id1);
		int MessageCode= adminDAO.activateSubscription(id1, CurrentUser.getUser_id());
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();

		String userType = request.getParameter("user");

		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("CurrentForm","View_User_Div");



		List<Users> userslist = new ArrayList<Users>();
		List<Users> inActiveList = new ArrayList<Users>();
		List<SubscriptionRquest> subReqList = new ArrayList<SubscriptionRquest>();
		if(MessageCode == 0)
		{			
			modelMap.addAttribute("EMessage","Sorry User cannot be Activated at this time !");
		}
		else
		{

			if(userType.equals("admin")){
				userslist=adminDAO.listSuperAdminActive(CurrentUser);
				inActiveList  = adminDAO.listSuperAdminInactive(CurrentUser);
				modelMap.addAttribute("user","admin");
			}else{
				userslist=adminDAO.listSubscriberActive();
				inActiveList = adminDAO.listSubscriberInactive();

				userslist=adminDAO.listSubscriberActive();
				inActiveList = adminDAO.listSubscriberInactive();
				subReqList = adminDAO.getSubscrptionRequestList();
				modelMap.addAttribute("subReqList",subReqList);
				modelMap.addAttribute("user","subscriber");

			}	
			modelMap.addAttribute("SMessage","User Activated successfully...");
		}
		modelMap.addAttribute("usr_id", CurrentUser.getUser_id());
		modelMap.addAttribute("inActiveList", inActiveList);
		modelMap.addAttribute("userslist",userslist);
		return new ModelAndView("admin/addUserSuperAdmin",modelMap);
	}


	public ModelAndView EditUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
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
		user.setCompany("");
		user.setFax(request.getParameter("Edit_user_fax"));
		user.setCity(request.getParameter("Edit_user_City"));

		user.setIs_active(1);
		user.setSubscription_id(CurrentUser.getSubscription_id());

		String userType = request.getParameter("user");
		List<Users> userslist = new ArrayList<Users>();
		List<Users> inActiveList = new ArrayList<Users>();
		ModelMap modelMap = new ModelMap();
		String userTypevar = "";
		if(userType.equals("admin")){
			userslist=adminDAO.listSuperAdminActive(CurrentUser);
			inActiveList  = adminDAO.listSuperAdminInactive(CurrentUser);
			user.setUser_type("super admin");
			userTypevar = "super admin";

		}else{
			userslist=adminDAO.listSubscriberActive();
			inActiveList = adminDAO.listSubscriberInactive();
			user.setUser_type("subscriber");
			userTypevar = "subscriber";
		}	
		int MessageCode=usersdao.editUser(user);
		List<Countries> countrieslist=countriesDAO.listCountry();
		List<Languages> Languageslist=languageDAO.listLanguages();


		modelMap.addAttribute("userslist",userslist);
		modelMap.addAttribute("Languageslist",Languageslist);
		modelMap.addAttribute("countrieslist",countrieslist);
		modelMap.addAttribute("inActiveList",inActiveList);
		modelMap.addAttribute("user",userTypevar);
		modelMap.addAttribute("CurrentForm","View_User_Div");

		modelMap.addAttribute("EditUserMessageCode",MessageCode);
		response.sendRedirect("showSuperAdmin.adm?CurrentForm=View_User_Div&control="+userTypevar+"&EditUserMessageCode="+MessageCode);
		return new ModelAndView("admin/addUserSuperAdmin", new ModelMap());

	}

	public ModelAndView SendMail(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		String result = adminDAO.sendEmail("Send_Email to", "message", "Subject");
		if(result.equals("mail sent")){
			return new ModelAndView("success",new ModelMap());
		}else{
			return new ModelAndView("error",new ModelMap());
		}

	}

	public ModelAndView resetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}else{
			String oldpassword = request.getParameter("oldPassword");
			String newpassword = request.getParameter("newPassword");
			String result = usersdao.passwordReset(CurrentUser.getUser_id(), oldpassword, newpassword);
			ModelMap modelMap = new ModelMap();
			if(result.equals("success")){
				modelMap.addAttribute("errorMessage", "");
				modelMap.addAttribute("successMessage", "Password Successfully Changed");
				return new ModelAndView("admin/resetPassword",modelMap);
			}else if(result.equals("fail old")){
				modelMap.addAttribute("errorMessage", "Old Password is not Correct");
				modelMap.addAttribute("successMessage","");
				return new ModelAndView("admin/resetPassword",modelMap);
			}else{
				modelMap.addAttribute("successMessage","");
				modelMap.addAttribute("errorMessage", "Unable to Reset Password");
				return new ModelAndView("admin/resetPassword",modelMap);
			}
		}
		return new ModelAndView("admin/resetPassword",new ModelMap());

	}
	public ModelAndView viewResetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null){
			response.sendRedirect("login.htm");
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("successMessage","");
		modelMap.addAttribute("errorMessage", "");
		return new ModelAndView("admin/resetPassword",modelMap);

	}
	public ModelAndView sendcontactRequests(HttpServletRequest request, HttpServletResponse response)throws Exception {
		CurrentUser=(Users)request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		List<Countries> countriesList=countriesDAO.listCountry();
		ModelMap modelMap=new ModelMap();
		modelMap.addAttribute("contries",countriesList);
		return new ModelAndView("contactSuperadmin",modelMap);
	}
	public ModelAndView viewcontactRequests(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelMap map=new ModelMap();
		map.addAttribute("userslist",contactdao.getContectRequests());
		return new ModelAndView("admin/viewcontact_requests",map);
	}
	public ModelAndView saveContactRequest(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ContactRequest contactReq=new ContactRequest();
		contactReq.setSalutation(request.getParameter("salutation"));
		contactReq.setFirst_name(request.getParameter("first_name"));
		contactReq.setLast_name(request.getParameter("last_name"));
		contactReq.setTitle(request.getParameter("title"));
		contactReq.setDepartment(request.getParameter("departmemt"));
		contactReq.setCompany(request.getParameter("company"));
		contactReq.setEmail(request.getParameter("email"));
		contactReq.setPhone(request.getParameter("phone"));
		contactReq.setAddress(request.getParameter("address"));
		contactReq.setCity(request.getParameter("city"));
		contactReq.setState(request.getParameter("state"));
		contactReq.setZip(request.getParameter("zip"));
		contactReq.setCountry_id(Integer.parseInt(request.getParameter("country")));
		contactReq.setComments(request.getParameter("comments"));
		contactReq.setRefferal_name(request.getParameter("refferal_name"));
		contactReq.setInformation(request.getParameter("information"));
		contactReq.setDepartment(request.getParameter("department"));
		if(contactdao.saveContactRequest(contactReq)==1){
			return new ModelAndView("successcontact");
		}
		else
		{
			return new ModelAndView("errorcontact");
		}

	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
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
	public UsersDAO getUsersdao() {
		return usersdao;
	}
	public void setUsersdao(UsersDAO usersdao) {
		this.usersdao = usersdao;
	}
	public ContactRequestDAO getContactdao() {
		return contactdao;
	}
	public void setContactdao(ContactRequestDAO contactdao) {
		this.contactdao = contactdao;
	}



}

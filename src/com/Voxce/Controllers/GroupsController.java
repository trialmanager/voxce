package com.Voxce.Controllers;
 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.Voxce.DAO.GroupsDAO;
import com.Voxce.Validator.CreateGroupsValidator;
import com.Voxce.model.GroupRights;
import com.Voxce.model.Groups;
import com.Voxce.model.Resources;
import com.Voxce.model.Users;

@Controller
public class GroupsController extends MultiActionController {
 
	private Users CurrentUser;
	private GroupsDAO groupdao;
	private BindingResult errors;
	
	
	public GroupsDAO getGroupDAO() {
		return groupdao;
	}

	public void setGroupDAO(GroupsDAO groupdao) {
		this.groupdao = groupdao;
	}

	public BindingResult getErrors(){
		return errors;
	}
	
	public void setErrors(BindingResult errors) {
		this.errors = errors;
	}
	
	public ModelAndView OnChangeGroupHandler(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		List<Groups> GroupList;
		
		
		List<String> resourceList=new ArrayList<String>();
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		long groupid = Long.parseLong(request.getParameter("groupid"));
		
		GroupList=groupdao.listGroup(CurrentUser);		
		ModelMap modelMap = new ModelMap();
		List<GroupRights> GRlist=null;
		try{
			if(GroupList.size() != 0)
			{
				GRlist=groupdao.listGroupRights(groupid);
			}
			List<Resources> resources=groupdao.getResources();
			
			modelMap.addAttribute("GRlist",GRlist);
			for(int i=0;i<GRlist.size();i++){
				resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
				resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			
		modelMap.addAttribute("grlist",resourceList);
		
		
		modelMap.addAttribute("mylist",GRlist);
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("CurrentGroup",groupid);
		modelMap.addAttribute("GroupMangement","current_btn");
		modelMap.addAttribute("CurrentForm","GroupRights_groupForm");		
		return new ModelAndView("groups",modelMap);
	}
	
	public ModelAndView SaveGroupRightsHandler(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try{
			
		List<Groups> GroupList;	
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
			System.out.println(request.getParameter("GroupSelection"));
			String rights=request.getParameter("rights");
			int pre=0;
			
			CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
			
			if(CurrentUser==null)
			{
				response.sendRedirect("login.htm");
			}
			try{
				
				long groupid = Long.parseLong(request.getParameter("GroupSelection"));
				ArrayList<Integer> list_rights=new ArrayList<Integer>();
				int main_right=0;
				int sub_right=0;
				for(int i=rights.length()-1;i>3;i--){
					if(rights.charAt(i)=='1'){
						main_right=1;
						sub_right=1;
					}
					else if(rights.charAt(i)=='3'){
						if(main_right==1){
							rights=replace(rights, '1', i);
							main_right=0;
							sub_right=0;
						}
						else{
							rights=replace(rights, '0', i);
						}
					}
					else if(rights.charAt(i)=='2')
					{
						if(sub_right==1){
							rights=replace(rights, '1', i);
							sub_right=0;
						}
						else{
							rights=replace(rights, '0', i);
						}
					}
					else if(rights.charAt(i)=='0'){
						
					}
				}
				
				for(int i=0;i<rights.length();i++)
				{
					
						list_rights.add(Integer.parseInt(Character.toString(rights.charAt(i))));
						//System.out.println(list_rights.size());
				}
				int Message=groupdao.saveGroupRights(CurrentUser.getUser_id(), groupid, list_rights);
			
				ModelMap modelMap = new ModelMap();
				if(Message==0)
				{
					modelMap.addAttribute("Error","Group cannot be assigned Rights at this time...");
				}
				else if(Message == 1)
				{
					modelMap.addAttribute("Success","Group Rights successfully saved !");
				}
				
				List<GroupRights> GRlist=groupdao.listGroupRights(groupid);	
				List<Resources> resources=groupdao.getResources();
				List<String> resourceList=new ArrayList<String>();
				for(int i=0;i<GRlist.size();i++){
					try{
						resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
						resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
						
					}catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					//	System.out.println("**-**-*-*-*-*-*-*-*-***-**-*-*-*-*-*-*-*-*-*"+i);
					}
				}
				
				GroupList=groupdao.listGroup(CurrentUser);	
				modelMap.addAttribute("grlist",resourceList);
				modelMap.addAttribute("GroupList",GroupList);
				//modelMap.addAttribute("GRlist",GRlist);
				modelMap.addAttribute("CurrentGroup",groupid);
				modelMap.addAttribute("CurrentForm","GroupRights_groupForm");
				
				return new ModelAndView("groups",modelMap);
				}
					catch (Exception e) {
						e.printStackTrace();
						// TODO: handle exception
					}
				
					return new ModelAndView("groups",new ModelMap());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("login.htm");
		}
		return new ModelAndView("groups",new ModelMap());
		
	}
	
	public ModelAndView savegroupHandler(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		List<Groups> GroupList;
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		Groups group=new Groups();
		group.setName(request.getParameter("Group_Name"));
		group.setDescription(request.getParameter("Group_Description"));
		group.setIs_global("N");
		group.setCreated_by((long) CurrentUser.getUser_id());
		group.setSubscriber_id(CurrentUser.getSubscription_id());
		int Message=groupdao.saveGroup(group, CurrentUser);
		
		
		GroupList=groupdao.listGroup(CurrentUser);
		List<GroupRights> GRlist=null;
		List<String> resourceList=new ArrayList<String>();
		List<Resources> resources=groupdao.getResources();
			
		try
		{
			if(Message== 0)
			{
				
				
				
				if(GroupList.size() != 0)
				{
					GRlist=groupdao.listGroupRights(GroupList.get(0).getId());
					for(int i=0;i<GRlist.size();i++){
						resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
						resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
					}
				}
				
				
				
				ModelMap modelMap = new ModelMap();
			
				
				
				modelMap.addAttribute("AddGroupMessageU","Group With this name already Exists !");
				modelMap.addAttribute("GroupList",GroupList);
				modelMap.addAttribute("grlist",resourceList);
				modelMap.addAttribute("CurrentForm","create_groupForm");
				
				modelMap.addAttribute("GroupMangement","current_btn");
				return new ModelAndView("groups",modelMap);
			}
			else if(Message ==1)
			{
				
				if(GroupList.size() != 0)
				{
					GRlist=groupdao.listGroupRights(GroupList.get(0).getId());
					for(int i=0;i<GRlist.size();i++){
						resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
						resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
					}
				}
				
				
			
				
				int MessageCode=groupdao.saveGroup(group, CurrentUser);
				ModelMap modelMap = new ModelMap();
				modelMap.addAttribute("AddGroupMessageS","Group Created Successfully !");
				modelMap.addAttribute("GroupList",GroupList);
				modelMap.addAttribute("grlist",resourceList);
				modelMap.addAttribute("MessageCode" ,MessageCode);
				modelMap.addAttribute("CurrentForm","create_groupForm");
				
				modelMap.addAttribute("GroupMangement","current_btn");
				return new ModelAndView("groups",modelMap);
			}
		}
		catch(Exception expObj)
		{
			return new ModelAndView("groups");
		}
		return  new ModelAndView("groups");	

	}
	
	public ModelAndView editgroupHandler(HttpServletRequest request, HttpServletResponse response)
	{
		ModelMap modelMap = new ModelMap();
	  try
	  {	  
		  List<Groups> GroupList;
		   String groupName=request.getParameter("Edit_Groups_Group_Name");
		   String description=request.getParameter("Edit_Groups_Group_Description");
		   long groupID = Integer.parseInt(request.getParameter("Groups_Edit_Select_tag"));
		   String operationType = request.getParameter("Groups_Hidden_Field_For_Add_Update");
		   
		   Groups myGroup = new Groups();
		   
		   myGroup.setId(groupID);
		   myGroup.setName(groupName);
		   myGroup.setDescription(description);
		   
		   int MessageCode=0;
		   if ( operationType.equalsIgnoreCase("Updated") == true){
		    MessageCode=groupdao.editGroup(myGroup);
		   }
		   else if ( operationType.equalsIgnoreCase("Deleted") == true ){
		    MessageCode=groupdao.deleteGroup(myGroup);
		   }
		   
			
		    GroupList=groupdao.listGroup(CurrentUser);
		    modelMap.addAttribute("GroupList",GroupList);
		    modelMap.addAttribute("CurrentForm" ,"edit_groupForm");
		    modelMap.addAttribute("command", new Groups() );
		   
		   if(MessageCode == 0  && operationType.equalsIgnoreCase("Updated") == true)
			   modelMap.addAttribute("MessageE","Group information cannot be updated at this time !");
		   else if(MessageCode == 1  && operationType.equalsIgnoreCase("Updated") == true)
			   modelMap.addAttribute("MessageS","Group information updated Successfully !");
		   else if(MessageCode == 0  && operationType.equalsIgnoreCase("Deleted") == true)
			   modelMap.addAttribute("MessageE","Group information cannot be deleted at this time !");
		   else if(MessageCode == 1  && operationType.equalsIgnoreCase("Deleted") == true)
			   modelMap.addAttribute("MessageS","Group information deleted Successfully !");
					   
		   modelMap.addAttribute("GroupMangement","current_btn");
	 	   return new ModelAndView("groups",modelMap);	   
		}
		catch(Exception expObj)
		{
			return new ModelAndView("groups",modelMap);
		} 
	 }
	
	protected void bind(HttpServletRequest request, Object command) throws Exception
	{
		System.out.println("In bind...");
		ServletRequestDataBinder binder = createBinder(request, command);
		binder.bind(request);
		errors = binder.getBindingResult();
	}

	public void validate(Object command)
	{
		System.out.println("In validate...");
		Validator[] validators = getValidators();
		if (validators != null)
		{
			for (int index = 0; index < validators.length; index++)
			{
				Validator validator = validators[index];
				if (validator instanceof CreateGroupsValidator)
				{
					if (((CreateGroupsValidator)validator).supports(command.getClass()))
						ValidationUtils.invokeValidator(validators[index], command, errors);
				}

				else if (validator.supports(command.getClass()))
					ValidationUtils.invokeValidator(validators[index], command, errors);
			}
		}
	}
//---------------------------------Main Permission Handler -------------------------------------------------------
//---------------------------------Main Permission Handler -------------------------------------------------------	
	public ModelAndView showGroupsindexHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");
		List<Groups> GroupList;
		
		if(CurrentUser==null)
		{
			response.sendRedirect("login.htm");
		}
		
		Groups group  = (Groups)newCommandObject(Groups.class);
		bind(request,group);
		
	
		GroupList=groupdao.listGroup(CurrentUser);
		List<GroupRights> GRlist=null;
		List<String> resourceList=new ArrayList<String>();
		List<Resources> resources=groupdao.getResources();
		try{
			if(GroupList.size() != 0)
			{
				
				GRlist=groupdao.listGroupRights(GroupList.get(0).getId());
				for(int i=0;i<GRlist.size();i++){
					resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
					resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
				}
			}
			for(int i=0;i<resourceList.size();i++)
			{
				System.out.println(resourceList.get(i));
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			}
		
		
		ModelMap modelMap = new ModelMap();
		//modelMap.addAttribute("GRlist",GRlist);
	/*	for(int i=0;i<GRlist.size();i++){
			resourceList.add(resources.get(GRlist.get(i).getRESOURCE_ID()-1).getCode().toLowerCase());
			resourceList.add(Integer.toString(GRlist.get(i).getRIGHT_TYPE_ID()));
		}*/
		
		modelMap.addAttribute("grlist",resourceList);
		CurrentUser =(Users) request.getSession().getAttribute("CurrentUser");	
	
		modelMap.addAttribute("GroupList",GroupList);
		modelMap.addAttribute("CurrentForm","create_groupForm");
		modelMap.addAttribute("GroupMangement","current_btn");
		
		
		// resource updater start
		/*groupdao.deleteResources();
		java.util.Date today = new java.util.Date();
		java.sql.Date dateCreated = new java.sql.Date(today.getTime());
		String thisLine;
		int i=0;
		BufferedReader br = new BufferedReader(new FileReader("D://res.text"));
		 while ((thisLine = br.readLine()) != null) { // while loop begins here
	         Resources r=new Resources();
	         r.setResource_id(i);
	         r.setCode(thisLine);
	         r.setCreated_by(1);
	         r.setModified_by(1);
	         r.setDate_created(dateCreated);
	         r.setDate_modified(dateCreated);
	         groupdao.saveResource(r);
	         i++;
	       } 
		br.close();*/
		//resource updater end
		return new ModelAndView("groups",modelMap);
	}
	private String replace(String s, char c, int index){
		
		return s.substring(0, index)+c+s.substring(index+1);
	}
}

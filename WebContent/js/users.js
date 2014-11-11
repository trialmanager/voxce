// Javascript
$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {

	

	
	//***********************************************************************************************************************
	//-----------------------------Start Setting UserGroup Multiselection css change----------------------------------------	 
		/*$(".ui-multiselect").width(width/2+"px").css("float","left").css("border","none");
		$(".selected").width("300px");
		$(".available").width("300px");*/
		
		
		
	//-----------------------------End Setting UserGroup Multiselection css change-------------------------------------------
	//************************************************************************************************************************	 	
		
	
	//UserGroup PreSelected & Unselected
	$("#UserGroup_Group_Name_Hidden").find("option").each(function(){
		  var outer = $(this);
		  $("#UserGroup_Group_Name").find("option").each(function(){
		   if($(this).val() == outer.val()){
		    $(this).attr("selected","selected");
		   }
		  });
	});
	//UserGroup PreSelected & Unselected	
	
	$('#UserGroup_User_Name').change(function() {
		if($('select#UserGroup_User_Name option:selected').val()=="" || $('select#UserGroup_User_Name option:selected').val()==null)
			return;					
		$('#typeofaction').val("ChangeUserGoup");
		$('#HiddenValue1').val($('select#UserGroup_User_Name option:selected').val());
		$('form#usershiddenform').submit();		 	
	});
	
	LoadFormUsers($("input#InterfaceState").val());		
	var message=$("input#UserReturnMessage").val();
	var editmessage=$("input#EditUserMessageCode").val();
	
	CreateUserMessage(message);
	EditUserReturnMessage(editmessage);
	DeleteUserEndMessage();
	
	//After Saving the groups against a user . setting the previous user on select box.
	$('#UserGroup_User_Name').val($('#HiddenValue2').val());
	$(".active-inactive").click(function(){
		$("#View_user_Table").toggle();
		$("#View_inactive_user_Table").toggle();

		if($(this).val()=="Inactive Users"){
			$(this).val("Active Users");
		}else if($(this).val()=="Active Users"){
			$(this).val("Inactive Users");
		}else if($(this).val()=="Inactive Administrators"){
			$(this).val("Active Administrators");
		}else if($(this).val()=="Active Administrators"){
			$(this).val("Inactive Administrators");
		}else if($(this).val()=="Inactive Subscribers"){
			$(this).val("Active Subscribers");
		}else if($(this).val()=="Active Subscribers"){
			$(this).val("Inactive Subscribers");
		}
		
	});
	
	//------------------------------------------------------------------------------------------------
	$("#Create_User_user_name").focusout(function(){
		$.post("uniqueUsername.users?username="+$(this).val(),function(data){
			if(data!="success"){
				$("#Username_exist_error").remove()
				$("#Create_User_user_name").after($("<span />").addClass("error_label_grp").attr("id","Username_exist_error").text("Username Already Exists!"));
			}else{
				$("#Username_exist_error").remove();
			}
		});
	});
	
	
	
	$("#Create_user_Email_Address").focusout(function(){
		$.post("uniqueEmail.users?email="+$(this).val(),function(data){
			if(data!="success"){
				$("#Email_Address_exist_error").remove();
				$("#Create_user_Email_Address").after($("<span />").addClass("error_label_grp").attr("id","Email_Address_exist_error").text("Email Already Exists Please Try Another!"));
			}else{
				$("#Email_Address_exist_error").remove();
			}
		});
	});
	
	
	$("#Edit_user_Email_Address").focusout(function(){
		if($(this).val()!= $(this).attr("email")){
			$.post("uniqueEmail.users?email="+$(this).val(),function(data){
				if(data!="success"){
					$("#Edit_user_Email_Address").after($("<span />").addClass("error_label_grp").attr("id","Email_Address_exist_error").text("Email Already Exists Please Try Another!"));
				}else{
					$("#Email_Address_exist_error").remove();
				}
			});
		}else{
			$("#Email_Address_exist_error").remove();
		}
	});
	
//---------------------------------------------View User Search---------------------------------------
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	
	
	
	 $("#View_users_Search_bar").keyup(function(){
		        $("#fbody").find("tr").hide();
		        var data = this.value.split(" ");
		        var jo = $("#fbody").find("tr");
		        $.each(data, function(i, v){		
		             //Use the new containsIgnoreCase function instead
		             jo = jo.filter("*:containsIgnoreCase('"+v+"')");
		        });
		
		        jo.show();
		
		    }).focus(function(){
		        this.value="";
		        $(this).css({"color":"black"});
		        $(this).unbind('focus');
		    }).css({"color":"#C0C0C0"});
		
	
	
	
//------------------------------------------------Create User---------------------------------------------------------
//------------------------------------------------Create User---------------------------------------------------------

	
	 
	$('#Create_User_form').submit(function(event) {
		var password=$.trim($('#Create_User_user_password').val());
		var password1=$.trim($('#Create_User_user_password_confirm').val());
		if($("#Username_exist_error").is(":visible")){
			Prevent_Event(event);
		}
		
		if($("#Email_Address_exist_error").is(":visible")){
			Prevent_Event(event);
		}
		
		if (!(/^[0-9A-Za-z]+$/.test(password)))
		{	
			$("#Create_User_user_password_error1").show();
			$("#Create_User_user_password_error1").html("Only Digits and alphabets allowed!");
			Prevent_Event(event);
		}
		else
			$("#Create_User_user_password_error1").hide();
		
		if(password=="" || password.length<8)
		{	
			$("#Create_User_user_password_error2").show();
			$("#Create_User_user_password_error2").html("Atleast 8 characters Required !");
			Prevent_Event(event);			
		}
		else
			$("#Create_User_user_password_error2").hide();
		
		if(password1 != password)
		{
			$("#Create_User_user_password_confirm_error").show();
			$("#Create_User_user_password_confirm_error").html("Password Mismatch !");
			Prevent_Event(event);
		}
		else
			$("#Create_User_user_password_confirm_error").hide();
		
		Check_isempty(event,'Create_user_Division_Selection','Create_user_Division_Selection_error');
		Check_isempty(event,'Create_User_Language_Selection','Create_User_Language_Selection_error');
		
		Check_isempty(event,'Create_User_user_name','Create_User_user_name_error');
		CheckAlphaNumeric(event,'Create_User_user_name','Create_User_user_name_error1');
		
		Check_isempty(event,'Create_user_First_Name','Create_user_First_Name_error');
		CheckAlpha(event,'Create_user_First_Name','Create_user_First_Name_error1');
		
		//Check_isempty(event,'Create_user_Middle_Name','Create_user_Middle_Name_error');
		if($('#Create_user_Middle_Name').val().length>0)
		CheckAlpha(event,'Create_user_Middle_Name','Create_user_Middle_Name_error1');
		
		Check_isempty(event,'Create_user_Last_Name','Create_user_Last_Name_error');
		CheckAlpha(event,'Create_user_Last_Name','Create_user_Last_Name_error1');
		
		 Check_isempty(event,'Create_user_Address_1','Create_user_Address_1_error');
		 
		validateEmail(event,'Create_user_Email_Address','Create_user_Email_Address_error');
		Check_isempty(event,'Create_user_City','Create_user_City_error');
		Check_isempty(event,'Create_user_State','Create_user_State_error');
		
		if($.trim($('#Create_user_postal_Code').val())!="")			
			CheckAlphaNumeric(event,'Create_user_postal_Code','Create_user_postal_Code_error');
		else
			$('#Create_user_phone_error').hide();
		
	/*	if($.trim($('#Create_user_phone').val())!="")
		//	Validate_Numeric(event,'Create_user_phone','Create_user_phone_error');
		else
			$('#Create_user_phone_error').hide();
		
		if($.trim($('#Create_user_cell').val())!="")
		//	Validate_Numeric(event,'Create_user_cell','Create_user_cell_error');
		else
			$('#Create_user_cell_error').hide();
		
	if($.trim($('#Create_user_fax').val())!="")
		//	Validate_Numeric(event,'Create_user_fax','Create_user_fax_error');
		else
			$('#Create_user_fax_error').hide();*/
		//Validate_Numeric ,Check_isempty,Prevent_Event
	});
	
	
	$('#Edit_User_form').submit(function(event) {

		/*
		var password=$.trim($('#Edit_User_user_password').val());
		var password1=$.trim($('#Edit_User_user_password_confirm').val());
		
		if (!(/^[0-9A-Za-z]+$/.test(password)))
		{	
			$("#Edit_User_user_password_error").show();
			$("#Edit_User_user_password_error").html("Password can only have Digits and alphabets !");
			Prevent_Event(event);
		}
		else
			$("#Edit_User_user_password_error").hide();
		
		if(password=="" || password.length<8)
		{	
			$("#Edit_User_user_password_error1").show();
			$("#Edit_User_user_password_error1").html("Password Should be atleast 8 characters long !");
			Prevent_Event(event);			
		}
		else
			$("#Edit_User_user_password_error1").hide();
		
		if(password1 != password)
		{
			$("#Edit_User_user_password_confirm_error").show();
			$("#Edit_User_user_password_confirm_error").html("Password Mismatch !");
			Prevent_Event(event);
		}
		else
			$("#Edit_User_user_password_confirm_error").hide();
		*/
		
		Check_isempty(event,'Edit_user_Division_Selection','Edit_user_Division_Selection_error');
		
		Check_isempty(event,'Edit_User_Language_Selection','Edit_User_Language_Selection_error');
		
		Check_isempty(event,'Edit_user_First_Name','Edit_user_First_Name_error');
		CheckAlpha(event,'Edit_user_First_Name','Edit_user_First_Name_error1');
		
		//Check_isempty(event,'Edit_user_Middle_Name','Edit_user_Middle_Name_error');
		if($("#Edit_user_Middle_Name").val().length>0)
		CheckAlpha(event,'Edit_user_Middle_Name','Edit_user_Middle_Name_error1');
		
		Check_isempty(event,'Edit_user_Last_Name','Edit_user_Last_Name_error');
		CheckAlpha(event,'Edit_user_Last_Name','Edit_user_Last_Name_error1');
		
		Check_isempty(event,'Edit_user_Address_1','Edit_user_Address_1_error');
		
		validateEmail(event,'Edit_user_Email_Address','Edit_user_Email_Address_error');
		Check_isempty(event,'Edit_user_City','Edit_user_City_error');
		Check_isempty(event,'Edit_user_State','Edit_user_State_error');
		
		if($.trim($('#Edit_user_postal_Code').val())!="")			
			CheckAlphaNumeric(event,'Edit_user_postal_Code','Edit_user_postal_Code_error');
		else
			$('#Edit_user_postal_Code_error').hide();
		
		/*if($.trim($('#Edit_user_phone').val())!="")
		//	Validate_Numeric(event,'Edit_user_phone','Edit_user_phone_error');
		else
			$('#Edit_user_phone_error').hide();
		
		if($.trim($('#Edit_user_cell').val())!="")
		//	Validate_Numeric(event,'Edit_user_cell','Edit_user_cell_error');
		else
			$('#Edit_user_cell_error').hide();
		
		if($.trim($('#Edit_user_fax').val())!="")
		//	Validate_Numeric(event,'Edit_user_fax','Edit_user_fax_error');
		else
			$('#Edit_user_fax_error').hide();*/
	
	});

	
	//-----------------------------------Add User Group form--------------------------------------------------------------------
	//-----------------------------------Add User Group form----------------------------------------------------------------------
	
	$('#Add_UserGroup_Form').submit(function(event){
		
		var UserLen=$('select#UserGroup_User_Name').length;		
		var Usersel=$('select#UserGroup_User_Name').val();
		
		if(UserLen==0 || Usersel==null)
		{
			$('#UserGroup_Main_Error').html("Please Select a user !").show();
			$('#UserGroup_Main_Success').hide();
			Prevent_Event(event);
		}		
	});
	//---------------------------------End User Group form------------------------------------------------------------
	//----------------------------------End User Group form-----------------------------------------------------------
	
	
	/*
	$('#View_user_Table td img.delete_view_user_row').click(function(){
		
		if( !confirm('Are you sure you want to delete this user ?')) {
            return false; 
		}			
				
			var id=$(this).parent().parent().attr("id");
			$(this).parent().parent().remove();
			  $.ajax({  
			    type: "POST",
			    cache: false,
			    dataType: "text",
			    url: "/Voxce/DeleteUser.users",  
			    data: "id=" + id,  
			    success: function(response){  
			    	$(this).parent().parent().remove();
			    	var message=$("input#UserReturnMessage").val();
			    	
			    	if(message=='0'){			    			
			    		
			    	}
			    	else if(message== '1'){			    		
				    		$(this).parent().parent().remove();
			    	}
			    },  
			    error: function(e){
			    	
			    	var message=$("input#UserReturnMessage").val();
			    	
			    	if(message=='0'){	
			    		
			    	}
			    	else if(message== '1'){			    		
				    		$(this).parent().parent().remove();
			    	}
			    } 
			  });  
							
	});// End Function*/

	$('#CancelUserEditing').click(function(){
		$("#View_User_Div").show("slow").siblings().hide();
		Prevent_Event();		
	});	
	
	if($.trim($('#UserGroup_Main_Error').html())!="")
		$('#UserGroup_Main_Error').show();			
	else if($.trim($('#UserGroup_Main_Success').html())!="")
		$('#UserGroup_Main_Success').show();
	
	
});
//---------------------------------------------End Create User-------------------------------------------------------------------------	
//---------------------------------------------End Create User-------------------------------------------------------------------------	
	

function DeleteUserEndMessage()
{
	if($.trim($('#ViewusersMessageCodeError').html())!="")
		$('#ViewusersMessageCodeError').show();			
	else if($.trim($('#ViewusersMessageCodeSuccess').html())!="")
		$('#ViewusersMessageCodeSuccess').show();
}


//-------------------------------------------Javascriptfunctions--------------------------------------

function edit_view_user_row(id,login,password,address1,address2,address3,division,language,title,country,first_name,middle_name,last_name,suffix,email,city,state,postal_code,phone,cell,fax,company,user_type,isActive)
{		
	$('#EditUserCrumbsusername').html(login);
	$('#Edit_User_Countries_Selection').find("option").each(function(){
		if($(this).attr("value") == country){
			$(this).attr("selected","selected");
		}
	});
	//$('#Edit_User_Countries_Selection').val(country);
	$('#Edit_user_Division_Selection').val(division);
	$('#Edit_User_Language_Selection').val(language);
	$('#Edit_user_Title').val(title);
	
		$('#Edit_User_user_id').val(id);
		$('#Edit_User_user_name').val(login);
		$('#Edit_User_user_password').val(password);
		/*$('#Edit_User_user_password_confirm').val(password);*/
		$('#Edit_user_Address_1').val(address1);
		$('#Edit_user_Address_2').val(address2);
		$('#Edit_user_Address_3').val(address3);
		$('#Edit_user_First_Name').val(first_name);
		$('#Edit_user_Middle_Name').val(middle_name);
		$('#Edit_user_Last_Name').val(last_name);
		$('#Edit_user_Suffix').val(suffix);
		$('#Edit_user_Email_Address').val(email);
		$('#Edit_user_Email_Address').attr("email",email);
		$('#Edit_user_City').val(city);
		$('#Edit_user_State').val(state);
		$('#Edit_user_postal_Code').val(postal_code);
		$('#Edit_user_phone').val(phone);
		$('#Edit_user_cell').val(cell);
		$('#Edit_user_fax').val(fax);
		$('#Edit_user_company').val(company);	
		$('#Edit_user_usertype').val(user_type);
		$('#Edit_User_user_active').val(isActive);
		$("#Edit_User_Div").show("slow").siblings().hide();
		//var message=$("input#UserReturnMessage").val();		
}



function EditUserReturnMessage(val)
{		
	if(val== '0')
	{
		$("#Edit_User_Div").hide();
		$("#Edit_User_error_message").show();
		document.getElementById('Edit_User_error_message').innerHTML="Sorry! user information cannot be updated at this time ...";
	}
	if(val == '1')
	{
		$("#Edit_User_Div").hide();
		$("#Edit_User_error_message").show();
		document.getElementById('Edit_User_error_message').innerHTML="User Information updated Successfully !";		
	}
}

function CreateUserMessage(val)
{	
	if(val== '0')
	{
		$("#Create_User_user_name_error").show();
		document.getElementById('Create_User_user_name_error').innerHTML="Username already exists";
	}
	else if(val == '1')
	{
		$("#Create_User_error_message").show();
		document.getElementById('Create_User_error_message').innerHTML="User Created Successfully";		
	}
}

function LoadFormUsers(id)
{
	//alert($(".hasan").width());
	    if(id=="Create_User_Div" || id=="" || id==null)
		 {
			 $('a[name="hrefCreate_User_Div"]').attr('id', 'current');
			 $('a[name="hrefView_User_Div"]').attr('id', '');
			 $('a[name="hrefAdd_UserGroup_Div"]').attr('id', '');
			
		 }
		 else if(id=="View_User_Div")
		 {
			 $('a[name="hrefCreate_User_Div"]').attr('id', '');
			 $('a[name="hrefView_User_Div"]').attr('id', 'current');
			 $('a[name="hrefAdd_UserGroup_Div"]').attr('id', '');
			 
		 }
		 else if(id=="Add_UserGroup_Div")
		 {
			 $('a[name="hrefCreate_User_Div"]').attr('id', '');
			 $('a[name="hrefView_User_Div"]').attr('id', '');
			 $('a[name="hrefAdd_UserGroup_Div"]').attr('id', 'current');
		 }
	    
		$('.error_label_grp').hide();
		$('.chk_avail_yes').hide();
		
		 if(id=="" || id== null)
			 $("#Create_User_Div").show("slow").siblings().hide("slow");
		 else
			 $("#"+id).show("slow").siblings().hide("slow");
	
}

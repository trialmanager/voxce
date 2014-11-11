<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js"></script>

<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>

<script type="text/javascript" src="js/validation.js"></script>


<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />

<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />


<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
		$(document).ready(function(){
			$("#Edit_User_account_Countries_Selection").find("option").each(function(){
				if($(this).attr("value")  == $(".country_hidden").val()){
					$(this).attr("selected","selected");
				}
			});
			if($(".successMessage").text() != ""){
				$(".successMessage").show();
				$(".errorMessage").hide();
			}else if($(".errorMessage").text() != ""){
				$(".errorMessage").show();
				$(".successMessage").hide();
			}
			
			$("#CancelUserAccount").click(function(){
				window.location.href = "ShowHomeIndex.home";
			});
			
			
			$('#Edit_User_account_form').submit(function(event) {

				
			/*	var password=$.trim($('#Edit_User_account_user_password').val());
				var password1=$.trim($('#Edit_User_account_user_password_confirm').val());
				
				if (!(/^[0-9A-Za-z]+$/.test(password)))
				{	
					$("#Edit_User_account_user_password_error").show();
					$("#Edit_User_account_user_password_error").html("Password can only have Digits and alphabets !");
					Prevent_Event(event);
				}
				else
					$("#Edit_User_user_password_error").hide();
				
				if(password=="" || password.length<8)
				{	
					$("#Edit_User_account_user_password_error1").show();
					$("#Edit_User_account_user_password_error1").html("Password Should be atleast 8 characters long !");
					Prevent_Event(event);			
				}
				else
					$("#Edit_User_account_user_password_error1").hide();
				
				if(password1 != password)
				{
					$("#Edit_User_account_user_password_confirm_error").show();
					$("#Edit_User_account_user_password_confirm_error").html("Password Mismatch !");
					Prevent_Event(event);
				}
				else
					$("#Edit_User_account_user_password_confirm_error").hide();*/
				
				
				Check_isempty(event,'Edit_user_account_Address_1','Edit_user_account_Address_1_error');
				
				validateEmail(event,'Edit_user_account_Email_Address','Edit_user_account_Email_Address_error');
				Check_isempty(event,'Edit_user_account_City','Edit_user_account_City_error');
				Check_isempty(event,'Edit_user_account_State','Edit_user_account_State_error');
				
				if($.trim($('#Edit_user_account_postal_Code').val())!="")			
					CheckAlphaNumeric(event,'Edit_user_account_postal_Code','Edit_user_account_postal_Code_error');
				else
					$('#Edit_user_account_postal_Code_error').hide();
				Check_isempty(event,'Edit_user_account_phone','Edit_user_account_phone_error');
				Check_isempty(event,'Edit_user_account_cell','Edit_user_account_phone_cell_error');
				Check_isempty(event,'Edit_user_account_fax','Edit_user_account_phone_fax_error');
				
				
				/*if($.trim($('#Edit_user_fax').val())!="")
					//Validate_Numeric(event,'Edit_user_account_fax','Edit_user_account_fax_error');
				else
					$('#Edit_user_account_fax_error').hide();*/
				
			});
			$("#Edit_user_account_Email_Address").focusout(function(){
				
					if($(this).val()!= $(this).attr("email")){
						$.post("uniqueEmail.users?email="+$(this).val(),function(data){
							if(data!="success"){
								$("#Edit_user_account_Email_Address").after($("<span />").addClass("error_label_grp").attr("id","Email_Address_exist_error").text("Email Already Exists Please Try Another!"));
							}else{
								$("#Email_Address_exist_error").remove();
							}
						});
					}else{
						$("#Email_Address_exist_error").remove();
					}
				
			});
			
		
				$(".reset_password").click(function(){
					if($(".newPassword").val() == $(".confirmPassword").val()){
						$("#resetpassword").submit();
					}else{
						$(".pannel_bg_error").text("Confirm Password dose not Match New Password");
					}
				});
				$(".pannel_bg_error").each(function(){
					if($(this).text() == ""){
						$(this).css("display","none");
					}else{
						$(this).show();
					}
				});
				
				$("#resetCancle").click(function(){
					window.location.href = "ShowHomeIndex.home";
				});
			
			
			
		});
	</script>


</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>




	<!-- wrapper starts here -->
	<div class="wrapper">
		<div class="logo_area">
			<!-- logo placeholder here -->
			<div class="logo" style="margin-top: 0px;">
				<a href="#"><img src="images/logo.jpg" border="0" alt="logo" /></a>
			</div>
			<!-- logo placehorder ends here -->

			<!-- logoout and welcome placeholder starts here -->
			<div class="logoout_welcome_area">
				<div class="logout_btn">
					<a href="<c:url value='Logout.htm' />"><img
						src="images/logout_btn.jpg" alt="logout" border="0" /></a>
				</div>
				<div class="welcome_area">
					<div class="welcome_corner"></div>
					<span>Welcome:</span> <strong>
						<%
							out.println(obj.getLogin());
						%>
					</strong>| <a href="ShowAccountSetting.users" class="flinks accountSettings">Account
						Settings</a>
				</div>
			</div>
			<!-- logoout and welcome placeholder ends here -->

		</div>
		<!-- logo_area ends here -->

		<!-- menu starts here -->
		<div class="menu_bar">
			<div class="top_menu_set">
				<a href="<c:url value='ShowHomeIndex.home' />"
					class="current_btn top_btn"><span>Account Management</span></a>

			</div>
		</div>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<a href="javascript://" id="current" class="nav_l side_link"
							name="hrefcreate_groupForm">Contact Information</a> <a
							href="viewPasswordReset.users" class="nav_l side_link"
							name="hrefcreate_groupForm">Reset Password</a>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv" style="width: 80%">



				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<div class="body_inner" id="Edit_User_account_Div">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Contact Information</a>
							</div>

						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="Edit_group_container">

						<div id="user_account" class="myform user">
							<span class="errorMessage" style="display: none; color: red;">${Errormessage}</span>
							<span class="successMessage" style="display: none; color: green;">${message}</span>
							<form id="Edit_User_account_form" name="form" method="post"
								action="editAccountSetting.users">


								<label>E-mail :</label> <input maxlength="200"
									name="Edit_user_Email_Address" type="text" class="input_txt"
									email="${us.email}" id="Edit_user_account_Email_Address"
									value="${us.email}"></input> <span
									id="Edit_user_account_Email_Address_error"
									class="error_label_grp"></span> <label>Address :</label> <input
									maxlength="200" name="Edit_user_Address_1" type="text"
									class="input_txt" id="Edit_user_account_Address_1"
									value="${us.address1}"></input> <span
									id="Edit_user_account_Address_1_error" class="error_label_grp"></span>
								<input maxlength="200" name="Edit_user_Address_2" type="text"
									class="input_txt2" id="Edit_user_account_Address_2"
									value="${us.address2}"></input> <br /> <input maxlength="200"
									name="Edit_user_Address_3" type="text" class="input_txt2"
									id="Edit_user_account_Address_3" value="${us.address3}"></input>
								<br /> <label>Country :</label> <select
									id="Edit_User_account_Countries_Selection"
									name="Edit_User_Countries_Selection" class="drop_txt">
									<c:forEach items="${countrieslist}" var="countries"
										varStatus="status">
										<option id="${countries.COUNTRY_ID}"
											value="${countries.COUNTRY_ID}">${countries.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span class="error_label_grp"></span> <input
									class="country_hidden" type="hidden" value="${us.country_id }" />
								<label>City :</label> <input maxlength="200"
									name="Edit_user_City" type="text" class="input_txt"
									id="Edit_user_account_City" value="${us.city}"></input> <span
									id="Edit_user_account_City_error" class="error_label_grp"></span>

								<label>State :</label> <input maxlength="200"
									name="Edit_user_State" type="text" class="input_txt"
									id="Edit_user_account_State" value="${us.state}"></input> <span
									id="Edit_user_account_State_error" class="error_label_grp"></span>

								<label>Postal Code :</label> <input maxlength="18"
									name="Edit_user_postal_Code" type="text" class="small"
									id="Edit_user_account_postal_Code" value="${us.postal_code}"></input>
								<span id="Edit_user_account_postal_Code_error"
									class="error_label_grp"></span> <label>Phone :</label> <input
									maxlength="18" name="Edit_user_phone" type="text"
									class="input_txt" id="Edit_user_account_phone"
									value="${us.phone}"></input> <span
									id="Edit_user_account_phone_error" class="error_label_grp"></span>

								<label>Cell :</label> <input maxlength="18"
									name="Edit_user_cell" type="text" class="input_txt"
									id="Edit_user_account_cell" value="${us.cell}"></input> <span
									id="Edit_user_account_cell_error" class="error_label_grp"></span>

								<label>Fax :</label> <input maxlength="18" name="Edit_user_fax"
									type="text" class="input_txt" id="Edit_user_account_fax"
									value="${us.fax}"></input> <span
									id="Edit_user_account_fax_error" class="error_label_grp"></span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 267px;">
									<button class="blue-pill" type="submit">Save</button>
									<input type="button" class="grey-pill" style="padding: 6px;"
										id="CancelUserAccount" value="Cancel" />
								</div>


							</form>
						</div>

					</div>
				</div>







				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->


				<!--  												End User View-->
				<!--  												End User View-->




			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>


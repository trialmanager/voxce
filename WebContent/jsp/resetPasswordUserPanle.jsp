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
			$(".cancelresetUserPanle").click(function(){
				$(".errorMessage").remove();
				window.location.href = "ShowHomeIndex.home";
			});
		
			
			var oldpassword="<%=session.getAttribute("password")%>";
			
			
			if($(".successMessage").text() != ""){
				$(".successMessage").show();
				$(".errorMessage").hide();
			}else if($(".errorMessage").text() != ""){
				$(".errorMessage").show();
				$(".successMessage").hide();
			}
		
				$(".reset_password").click(function(){
					$(".errorMessage").hide();
					$(".successMessage").hide();
					
					if($(".old").val().length<1){
						$(".errorMessage").text("Please Enter Old Password").show();
						return;
					}
					if($(".newPassword").val().length<1){
						$(".errorMessage").text("Please Enter New Password").show();
						return;
					}
					
					if(oldpassword==$(".old").val()){
						if($(".newPassword").val().length<8)
							{
								$(".errorMessage").text("Atleast 8 charactors required! ").show();
								return;
							}
						if($(".newPassword").val() == $(".confirmPassword").val() && $(".errorMessage").text()!= "User Name Already Exists!"){
							$("#resetpassword").submit();
						}else{
							$(".errorMessage").text("Confirm Password does not Match New Password").show();
						}
					}
					else{
						$(".errorMessage").text("Old Password does not match").show();
					}
				});
				
				$(".pannel_bg_error").each(function(){
					if($(this).text() == ""){
						$(this).css("display","none");
					}else{
						$(this).show();
					}
				});
				
				
				$(".userName").focusout(function(){
					$.post("uniqueUsername.users?username="+$(this).val(),function(data){
						if(data != "success"){
							var str = $(".userName").val().toString();
							if(str != $(".userName").attr("user").toString()){
								
								$(".errorMessage").show().text("User Name Already Exists!");
							}
							else{
								$(".errorMessage").hide().text("");
								
							}
						}else{
							$(".errorMessage").text("").hide();
						}
					});
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
						<a href="ShowAccountSetting.users" class="nav_l side_link"
							name="hrefcreate_groupForm">Contact Information</a> <a
							href="javascript://" id="current" class="nav_l side_link"
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




				<div class="body_inner" id="passwordReSet">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Reset Password</a>
							</div>

						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>

					<div class="dashboard_pannel"
						style="width: 100%; margin-top: 50px; margin-left: 0px; margin-bottom: 50px;">
						<div class="pannel_bg2" style="height: 324px;">

							<form id="resetpassword" style="margin-top: 4px; float: left;"
								method="post" action="resetPasswordUser.users">

								<div class="pannel_bg_txt">User Name</div>
								<div class="pannel_bg_field2">
									<input name="userName" type="text" class="userName login_field"
										user="${CurrentUser.login}" value="${CurrentUser.login}" />
								</div>
								<div class="pannel_bg_txt">Enter Old Password</div>
								<div class="pannel_bg_field2">
									<input name="oldPassword" type="password"
										class="old login_field" />
								</div>
								<div class="pannel_bg_txt">Enter New Password</div>
								<div class="pannel_bg_field2">
									<input name="newPassword" type="password"
										class="newPassword login_field" />
								</div>
							</form>
							<div class="pannel_bg_txt">Confirm New Password</div>
							<div class="pannel_bg_field2">
								<input name="Confirm_password" type="password"
									class="confirmPassword login_field" />
							</div>

							<div class="pannel_bg_error errorMessage" style="display: none;">
								<c:out value="${errorMessage}" />
							</div>
							<div class="pannel_bg_error successMessage"
								style="display: none; color: green;">
								<c:out value="${successMessage}" />
							</div>
							<div style="margin-left: 61.6%; clear: both;">
								<span><input type="button" style="padding: 6px;"
									value="Submit" class="blue-pill reset_password" /></span> <span
									style="margin-left: 5px;"><input id="resetCancle"
									type="button" style="padding: 6px;" value="Cancel"
									class="grey-pill reset_password cancelresetUserPanle" /></span>
							</div>

						</div>
					</div>

				</div>



				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->


				<!--  												End User View-->
				<!--  												End User View-->

				<!-- 
					<label>Old Password :</label>
					<input maxlength="16" name="Edit_User_old_user_password" type="password" class="input_txt" id="Edit_old_User_account_user_password"  ></input> <span id="Edit_User_account_user_password_error" class="error_label_grp" ></span>			
					<label>New Password :</label>
					<input maxlength="16" name="Edit_User_user_password" type="password" class="input_txt" id="Edit_User_account_user_password"  ></input> <span id="Edit_User_account_user_password_error" class="error_label_grp" ></span><span id="Edit_User_account_user_password_error1" class="error_label_grp" ></span>
			
					<label>Confirm Password :</label>
					<input maxlength="16" name="Edit_User_user_password_confirm" type="password" class="input_txt" id="Edit_User_account_user_password_confirm"  ></input> <span id="Edit_User_account_user_password_confirm_error" class="error_label_grp"></span>
 -->



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


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var oldpassword="<%=session.getAttribute("password")%>
	";
						//alert(oldpassword);

						$(".reset_password")
								.click(
										function() {

											$(".success").hide();
											$(".error").hide();

											if ($(".old").val().length < 1) {
												$(".error")
														.text(
																"Please Enter Old Password")
														.show();
												return;
											}
											if ($(".newPassword").val().length < 1) {
												$(".error")
														.text(
																"Please Enter New Password")
														.show();
												return;
											}

											if (oldpassword == $(".old").val()) {

												if ($(".newPassword").val().length < 8) {
													$(".error")
															.text(
																	"Atleast 8 characters Required !")
															.show();
												} else {
													if ($(".newPassword").val() == $(
															".confirmPassword")
															.val()) {
														$("#resetpassword")
																.submit();
													} else {
														$(".error")
																.text(
																		"Confirm Password does not Match New Password")
																.show();
													}
												}
											} else {

												$(".error")
														.text(
																"Old Password does not match")
														.show();
											}
										});
						$(".pannel_bg_error").each(function() {
							if ($(this).text() == "") {
								$(this).css("display", "none");
							} else {
								$(this).show();
							}
						});

						$("#resetCancle").click(function() {
							window.location.href = "ShowControlPanle.adm";
						});
						var wid = $(".body_content").outerWidth();
						wid = wid - 280;
						$('.right_body_content').css('width', wid);
						elipsis();
					});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The CTMS</title>



</head>

<body>
	<div class="wrapper">
		<div class="container">
			<div>
				<a href="Logout.htm" class="logout_btn"></a>
			</div>
			<div class="logo_admin">
				<a href="#"><img src="images/ctms_logo.jpg" alt="" border="0" /></a>
			</div>
			<div class="dashboard_pannel">
				<div class="pannel_bg2" style="height: 297px;">

					<form id="resetpassword" style="margin-top: 40px; float: left;"
						method="post" action="resetPassword.adm">
						<div class="pannel_bg_txt">Enter Old Password</div>
						<div class="pannel_bg_field2">

							<input name="oldPassword" type="password" class="old login_field" />
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

					<div class="pannel_bg_error error" style="display: none;">
						<c:out value="${errorMessage}" />
					</div>
					<div class="pannel_bg_error success"
						style="display: none; color: green;">
						<c:out value="${successMessage}" />
					</div>
					<div style="margin-left: 61.6%; clear: both;">
						<span><input type="button" style="padding: 6px;"
							value="Submit" class="blue-pill reset_password" /></span><span
							style="margin-left: 5px;"><input id="resetCancle"
							type="button" style="padding: 6px;" value="Cancel"
							class="grey-pill reset_password" /></span>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>

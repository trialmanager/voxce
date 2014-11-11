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


<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script src="JQuery/jquery-ui.min.js"></script>
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />

<link href="css/login.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<!-- wrapper starts here -->
	<div class="wrapper"></div>
	<div class="internal_wrapper">
		<!-- login_panel with absolute position starts here -->
		<div class="login_panel_bg">
			<!-- 
	<div class="subscribe_area"><a href="#"><img src="images/subscribe_btn.png" alt="subscribe" border="0" /></a></div>
	subscribe ends here -->
			<!-- login form starts here -->
			<div class="login_header">Member Login</div>

			<form id="Login_User_Form" method="post" action="LoginUser.htm">
				<div class="login_form">
					<label>User Name: <span id="Login_User_Form_username_Error"
						style="display: none;">Username Cannot be Empty !</span></label> <input
						name="Login_User_Form_username" id="Login_User_Form_username"
						type="text" value="" /> <label>Password:</label> <input
						name="Login_User_Form_password" id="Login_User_Form_password"
						type="password" value="" /> <span
						id="Login_User_Form_password_Error"
						style="font-size: 14px; color: red;">${MessageCode}</span>
					<div class="forgot_pass_area">
						<a href="javascript://" class="more forgetPasswords">Forgot
							Password?</a>
					</div>
					<div class="login_btn">
						<button type="submit" class="login_button"></button>
					</div>
				</div>
			</form>
			<!-- login form ends here -->
			<div id="signupABC" class="signup_area">
				<a href="singUp.htm"> <img src="images/signup_btn.png"
					alt="signup" border="0" /></a>
			</div>
		</div>
		<!-- login_panel with absolute position ends here -->

		<!-- logo/menu part starts here -->
		<div class="logo_areas">
			<!-- logo placeholder here -->
			<div class="logo">
				<a href="login.htm"><img src="images/logo_login.jpg" border="0"
					alt="logo" /></a>
			</div>
			<!-- logo placehorder ends here -->
			<!-- top_menu starts here -->
			<div class="top_menu">
				<!-- 
	<a href="#" class="logintop_btn"><span>ABOUT US</span></a>
	<a href="#" class="logintop_btn"><span>FAQ'S</span></a>
	<a href="#" class="logintop_btn"><span>CONTACT US</span></a>
	 -->
			</div>
			<!-- top menu ends here -->
		</div>
		<!-- logo/menu part starts here -->
		<!-- header part starts here -->
		<div class="header_area">
			<img src="images/header_img.png" />
		</div>
		<!-- header part ends here-->

		<!-- body content starts here -->
		<div class="body_content">
			<!-- body left starts here -->
			<div class="body_left">
				<div class="page_heading">
					<img src="images/site_icon.png" /> Welcome
				</div>
				<div class="page_txt">


					<div>
						<div style="">Voxce&trade;&nbsp;is an affordable SaaS
							Clinical Trial Management solution providing flexible and
							configurable tools to help users effectively manage their trials.
							&nbsp;This subscription based solution allows each subscription
							owner to configure their own approval types, submission types,
							create assessment forms and more. &nbsp;</div>
						<div style="">
							<br />
						</div>
						<div style="">Voxce&trade;&nbsp;features include;</div>
						<div style="">
							<br />
						</div>
						<div style="">
							<ul style="">
								<li style="">Study and protocol setup</li>
								<li style="">Trial budgeting</li>
								<li style="">Contract tracking</li>
								<li style="">Submission tracking</li>
								<li style="">Site and User Training</li>
								<li style="">User CV</li>
								<li style="">Document management&nbsp;</li>
								<li style="">Recruitment module</li>
								<li style="">Laboratory library</li>
								<li style="">Investigator and Site tracking</li>
								<li style="">Medical License</li>
								<li style="">Financial Disclosure</li>
								<li style="">Monitoring Visit Reports</li>
								<li style="">Form Builder</li>
								<li style="">CRF assessment and analysis</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- body left ends here -->

			<!-- body right starts here -->
			<div class="body_right">
				<div class="toll_bg">
					<br />
					<h1>Contact Us:</h1>
					<a href="mailto:Info@Voxce.com" class="mlinks">Info@Voxce.com</a>
				</div>
				<div></div>
				<!-- body right ends here -->

			</div>
			<!-- body content ends here -->


		</div>

	</div>
	<!-- footer starts here -->
	<%@include file="footer.jsp"%>
	<!-- footer ends here -->
	<!-- wrapper ends here -->
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="wrapper">
		<div class="container">
			<div>
				<a href="Logout.htm" class="logout_btn"></a>
			</div>
			<div class="logo_admin">
				<a href="javascript://"><img src="images/ctms_logo.jpg" alt=""
					border="0" /></a>
			</div>
			<div class="dashboard_pannel">
				<a href="showSuperAdmin.adm?control=admin" class="dash_bg"><span
					class="heading_blue">Super Administrator</span> <br /> <span
					class="nor_txt">Add Administrator</span></a> <a
					href="ShowLoginAsSubscriber.adm" class="dash_bg"><span
					class="heading_blue">LOGIN</span> <br /> <span class="nor_txt">As
						Subscriber</span></a> <a href="viewResetPassword.adm" class="dash_bg"><span
					class="heading_blue">My Account</span> <br /> <span
					class="nor_txt">Reset Password</span></a> <a
					href="showSuperAdmin.adm?control=subscriber" class="dash_bg"><span
					class="heading_blue">Subscriber</span> <br /> <span
					class="nor_txt">Add New Subscribers</span></a> <a
					href="viewcontactRequests.adm" class="dash_bgc"><span
					class="heading_blue">Contact</span> <br /> <span class="nor_txt">Contact
						Requests</span></a>
				<!-- <a href="javascript://" class="dash_bg"><span class="heading_blue"></span> <br />
<span class="nor_txt"></span></a>
<a href="javascript://" class="dash_bg"><span class="heading_blue"></span> <br />
<span class="nor_txt"></span></a>

<a href="javascript://" refr="showresetPasswordUser.users" class="dash_bg"><span class="heading_blue"></span> <br />
<span class="nor_txt"></span></a>
<a href="javascript://" class="dash_bg"><span class="heading_blue"></span> <br />
<span class="nor_txt"></span></a>
<a href="javascript://" class="dash_bg"><span class="heading_blue"></span> <br />
<span class="nor_txt"></span></a>
 -->
			</div>
		</div>
	</div>
</body>
</html>

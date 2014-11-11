<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js"></script>




<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />




</head>

<body>

	<!-- wrapper starts here -->
	<div class="wrapper">

		<!-- logo_area starts here -->
		<div class="logo_area">
			<!-- logo placeholder here -->
			<div class="logo">
				<a href="login.htm"><img src="images/logo.jpg" border="0"
					alt="logo" /></a>
			</div>
			<!-- logo placehorder ends here -->

			<!-- logoout and welcome placeholder starts here -->
			<div class="logoout_welcome_area">

				<div class="welcome_area">
					<div class="welcome_corner"></div>
					<span>Welcome:</span> <strong>Guest</strong>
				</div>
			</div>
			<!-- logoout and welcome placeholder ends here -->

		</div>
		<!-- logo_area ends here -->

		<!-- menu starts here -->
		<div class="menu_bar">
			<div class="top_menu_set">


				<a href="javascript://" class="current_btn"><span>Contact
						Us</span></a>

				<!--<a href="<c:url value='showUsersindex.users' />" class="current_btn"><span>User Management</span></a>
	<a href="<c:url value='showGroupsindex.groups' />" class="top_btn"><span>Group Management</span></a>	
	<a href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />" class="top_btn"><span>Library</span></a>	
	<a href="<c:url value='ShowSponsorDivIndex.spondiv' />" class="top_btn"><span>Sponsor & Division</span></a>	
	<a href="<c:url value='ShowSitesIndex.sites' />" class="top_btn"><span>Sites</span></a>
	<a href="<c:url value='ShowVisitsIndex.visits' />" class="top_btn"><span>Visits</span></a>
	<a href="<c:url value='ShowCRFIndex.crf?CurrentForm=add_question_form' />" class="top_btn"><span>Form</span></a></div>
	-->
			</div>
			<!-- menu ends here -->

			<!-- content starts here -->
			<div class="body_content">

				<div align="centor" class="" id="mainFormsDiv"
					style="margin-left: 36%; height: 450px;">

					<img src="images/camera_test.png" alt=""
						style="margin-top: 11%; margin-left: 14%;">
						<div>Your message is sent to administrator!</div>
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


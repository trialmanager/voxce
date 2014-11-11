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
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript">
	$(function() {
		$(".multiselect").multiselect();
	});
</script>
<script type="text/javascript" src="js/sites/studysitesusers.js"></script>



<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
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
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="AddSiteMessageCode" id="AddSiteMessageCode"
		value="${MessageCode}" />

	<!-- <input type="hidden" name="Addsitestudylist" id="Addsitestudylist" value="${siteslist}" />  -->
	<!-- wrapper starts here -->
	<div class="wrapper">


		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<c:if test="${tl:rightsofView(resourceList,'Add Site')==1}">
							<a
								href="<c:url value="ShowSitesIndex.sites?CurrentForm=Sites_Add_Div"  />"
								class="nav_l" name="hrefSites_Add_Div">Add Site</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Sites')==1}">
							<a
								href="<c:url value="ShowSitesIndex.sites?CurrentForm=Sites_View_Div"  />"
								class="nav_l" name="hrefSites_View_Div">View Site</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Add Study Site')==1}">
							<a
								href="<c:url value="ShowSitesStudyIndex.sites?CurrentForm=Sites_Study_add_div" />"
								class="nav_l" name="hrefSites_Study_add_div">Add Study Site</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Sites')==1}">
							<a
								href="<c:url value="ShowSitesStudyIndex.sites?CurrentForm=Sites_Study_view_div" />"
								class="nav_l" name="hrefSites_Study_view_div">View Study
								Sites</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Users')==1}">
							<a
								href="<c:url value="ShowSitesUserIndex.sites?CurrentForm=Add_Site_User_Div" />"
								class="nav_l" name="hrefAdd_Site_User_Div">Site Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Study Site Users')==1}">
							<a
								href="<c:url value="ShowSitesStudyUserIndex.sites?CurrentForm=Add_StudySiteUser_div" />"
								class="nav_l" name="hrefAdd_StudySiteUser_div" id="current">Study Site
								Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Site Laboratory')==1}">
							<a
								href="<c:url value="OpenSiteLaborotoryIndex.sites?CurrentForm=Sites_AddLaborotoryDiv" />"
								class="nav_l" name="">Site Laboratory</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">


				<!-- ////////////////////////////////////////Start Add Study site user////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////Start Add Study site user////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Add_StudySiteUser_div">
					<div class="body_inner_header" id="Sites_Study_add_div_title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowSitesIndex.sites?CurrentForm=Sites_Add_Div' />">Site
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Add Site Users to Study</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform site">
							<span id="Add_StudySiteUser_Main_Error" class="error_label_grp"
								style="display: none; width: auto;">${Add_StudySiteUser_Main_Error}</span>
							<span id="Add_StudySiteUser_Main_Success" class="chk_avail_yes"
								style="display: none; width: auto;">${Add_StudySiteUser_Main_Success}</span>

							<form id="Add_StudySiteUser_Form" name="Add_StudySiteUser_Form"
								method="post" action="SaveStudySiteuser.sites" class="site">

								<label>Select Study:</label> <select
									name="Add_StudySiteUser_Study_Selection"
									id="Add_StudySiteUser_Study_Selection" class="drop_txt">
									<c:forEach items="${studieslist}" var="slist22"
										varStatus="status">
										<option id="${slist22.study_id}" value="${slist22.study_id}"
											onclick="">${slist22.study_name}</option>
									</c:forEach>
								</select><br />
								<span class="error_label_grp"></span> <label>Select Site
									:</label> <select name="Add_StudySiteUser_Site_Selection"
									id="Add_StudySiteUser_Site_Selection" class="drop_txt">
									<c:forEach items="${currentstudysites}" var="silist"
										varStatus="status">
										<option id="${silist.site_id}" value="${silist.site_id}">
											${silist.site_name}</option>
									</c:forEach>
								</select><br /> <span class="error_label_grp"></span> <label
									id="Add_StudySiteUser_usertype_selection" style="display: none">
									<input type="radio" name="adddrugtype" value="1" /> <span
									class="txt_norm">Sponsor User</span> <input type="radio"
									name="adddrugtype" value="2" /> <span class="txt_norm">Site
										User</span>
								</label> <label>Select Users :</label> <select
									id="Add_StudySiteUser_select_siteuser"
									name="Add_StudySiteUser_select_siteuser" class="multiselect"
									multiple="multiple">
									<c:forEach items="${siteusers}" var="uslist" varStatus="status">
										<option id="${uslist.user_id }" value="${uslist.user_id}">
											${uslist.first_name} ${uslist.last_name} ( ${uslist.email} )</option>
									</c:forEach>
								</select> <select id="hidennSelected_SiteUser"
									name="hidennSelected_SiteUser" style="display: none;">
									<c:forEach items="${siteusers_sel}" var="siuslist"
										varStatus="status">
										<option id="${siuslist.user_id}" value="${siuslist.user_id}"
											onclick="">${siuslist.first_name} ${ulist.last_name}
											( ${ulist.email} )</option>
									</c:forEach>
								</select>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<!--  <button class="grey-pill">Cancel</button>  -->
								</div>

							</form>
							<form id="Add_StudySiteUser_Form_hidden"
								name="Add_StudySiteUser_Form_hidden" method="post"
								action="ReturnSiteUsers.sites" style="">
								<input type="hidden" id="Add_StudySiteUser_Form_hidden_siteid"
									name="Add_StudySiteUser_Form_hidden_siteid" /> <input
									type="hidden" id="Add_StudySiteUser_Form_hidden_studyid"
									name="Add_StudySiteUser_Form_hidden_studyid" />

							</form>

						</div>
					</div>
				</div>
				<!-- ////////////////////////////////////////End Add Study site user////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////End Add Study site user////////////////////////////////////////////////////// -->



				<!-- ////////////////////////////////////////Start View Study site user////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////Start View Study site user////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////End View Study site user////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////End View Study site user////////////////////////////////////////////////////// -->

				<form id="studysitehiddenform" name="studysitehiddenform"
					action="HiddenActions.sites">
					<input type="hidden" id="typeofaction" name="typeofaction" value=""></input>
					<input type="hidden" id="HiddenValue1" name="HiddenValue1" value=""></input>
					<input type="hidden" id="HiddenValue2" name="HiddenValue2" value=""></input>
					<input type="hidden" id="HiddenValue3" name="HiddenValue3"
						value="${CurrentStudy}"></input> <input type="hidden"
						id="HiddenValue4" name="HiddenValue4" value="${CurrentSiteID}"></input>
				</form>


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


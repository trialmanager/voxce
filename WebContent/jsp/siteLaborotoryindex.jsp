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
<script type="text/javascript" src="js/sites/sitesLab.js"></script>



<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
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
								class="nav_l" name="hrefAdd_StudySiteUser_div">Study Site
								Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Site Laboratory')==1}">
							<a
								href="<c:url value="OpenSiteLaborotoryIndex.sites?CurrentForm=Sites_AddLaborotoryDiv" />"
								class="nav_l" name="" id="current">Site Laboratory</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">



				<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////Start Add Site Laborotory////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Sites_AddLaborotoryDiv">
					<div class="body_inner_header" id="Sites_AddLaborotoryDiv_title">
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
								<a href="#">Add Laboratory to Site</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform site">
							<span id="SiteLaborotory_Add_Main_Error" class="error_label_grp"
								style="display: none; width: auto;">${AddErrorMessage}</span> <span
								id="SiteLaborotory_Add_Main_Success" class="chk_avail_yes"
								style="display: none; width: auto;">${AddSuccessMessage}</span>

							<form id="SiteLaborotory_Add_Form" name="SiteLaborotory_Add_Form"
								method="post" action="SaveStudySiteLaborotory.sites"
								class="site">

								<label>Select Study Name :</label> <select
									id="sitelab_StudySelection" name="sitelab_StudySelection"
									class="drop_txt">
									<c:forEach items="${studieslist}" var="stlist"
										varStatus="status">
										<option id="${stlist.study_id}" value="${stlist.study_id}"
											onclick="">${stlist.study_name}</option>
									</c:forEach>
								</select> <span id="SiteLaborotory_Add_study_Selection_error"
									class="error_label_grp"></span> <label>Select Site Name
									:</label> <select name="SiteLaborotory_Add_Site_Selection"
									id="SiteLaborotory_Add_Site_Selection" class="drop_txt">
									<c:forEach items="${Currentsiteslist}" var="cslist"
										varStatus="status">
										<option id="${cslist.site_id}" value="${cslist.site_id}"
											onclick="">${cslist.site_name}</option>
									</c:forEach>
								</select><br />
								<span id="SiteLaborotory_Add_Site_Selection_error"
									class="error_label_grp"></span> <label>Select
									Laboratories :</label> <select
									name="SiteLaborotory_Add_Laborotory_Selection"
									id="SiteLaborotory_Add_Laborotory_Selection"
									class="multiselect" multiple="multiple">
									<c:forEach items="${laboratorylist}" var="lablist"
										varStatus="status">
										<option id="${lablist.labratory_id}"
											value="${lablist.labratory_id}" onclick="">${lablist.lab_name}</option>
									</c:forEach>
								</select><br />
								<span id="SiteLaborotory_Add_Laborotory_Selection_error"
									class="error_label_grp"></span> <select
									id="hidennSelected_Sitelab" name="hidennSelected_Sitelab"
									style="display: none;">
									<c:forEach items="${laboratorylist_Sel}" var="labSellist"
										varStatus="status">
										<option id="${labSellist.labratory_id}"
											value="${labSellist.labratory_id}" onclick="">${labSellist.lab_name}</option>
									</c:forEach>
								</select>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill">Save</button>
									<!--   <button class="grey-pill">Cancel</button> -->
								</div>

							</form>

						</div>
					</div>
				</div>

				<!-- //////////////////////////////////////////End Add Site Laborotory/////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

				<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////Start View Site Laborotory////////////////////////////////////////////////////// -->


				<!-- //////////////////////////////////////////End View Site Laborotory/////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

				<form id="SaveStudySitesLaborotoryStudyChangeForm"
					name="SaveStudySitesLaborotoryStudyChangeForm"
					action="StudyChangeSaveStudySiteLaborotory.sites">
					<input type="hidden"
						id="SiteLaborotory_Add_study_Selection_preselect"
						name="SiteLaborotory_Add_study_Selection_preselect" value="" /> <input
						type="hidden"
						id="SiteLaborotory_Add_study_Selection_preselect_response"
						name="SiteLaborotory_Add_study_Selection_preselect_response"
						value="${PreSelectedStudy}" />
				</form>
				<form id="SaveStudySitesLaborotorySiteChangeForm"
					name="SaveStudySitesLaborotorySiteChangeForm"
					action="StudySiteChangeSaveStudySiteLaborotory.sites">
					<input type="hidden"
						id="SiteLaborotory_Add_study_Selection_preselect1"
						name="SiteLaborotory_Add_study_Selection_preselect1" value="" />
					<input type="hidden"
						id="SiteLaborotory_Add_study_Selection_preselect_response1"
						name="SiteLaborotory_Add_study_Selection_preselect_response1"
						value="${PreSelectedStudy1}" /> <input type="hidden"
						id="SiteLaborotory_Site_Selection_preselect"
						name="SiteLaborotory_Site_Selection_preselect" value="" /> <input
						type="hidden"
						id="SiteLaborotory_Site_Selection_preselect_response"
						name="SiteLaborotory_Site_Selection_preselect_response"
						value="${PreSelectedSite}" />
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


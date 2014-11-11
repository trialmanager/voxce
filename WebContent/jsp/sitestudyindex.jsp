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

<script type="text/javascript" src="JQuery/jquery-ui.min.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript">
	/* var width = $(document).width();
	width = width - 230;
	$('.right_body_content').css('width',width);
	$(window).resize(function() {
	    var width = $(document).width();
	 width = width - 230;
	 $('.right_body_content').css('width',width);
	});
	 */
	$(function() {
		$(".multiselect").multiselect();
	});
</script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/sites/sitesstudy.js"></script>



<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />
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
	<input type="hidden" name="EditSSMessageCode" id="EditSSMessageCode"
		value="${EditSSMessageCode}" />
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




				<!-- //////////////////////////////////////// Start Add Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start Add Site Study ////////////////////////////////////////////////////// -->

				<div class="body_inner" id="Sites_Study_add_div"
					style="display: none;">
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
								<a href="#">Add Site to Study</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform site">
							<span id="Add_StudySite_Main_Error" class="error_label_grp"
								style="display: none; width: auto;">${Add_StudySite_Main_Error}</span>
							<span id="Add_StudySite_Main_Error1" class="error_label_grp"
								style="display: none; width: auto;">${Add_StudySite_Main_Error1}</span>
							<span id="Add_StudySite_Main_Success" class="chk_avail_yes"
								style="display: none; width: auto;">${Add_StudySite_Main_Success}</span>
							<form id="Add_StudySite_Form" name="Add_StudySite_Form"
								method="post" action="SaveStudySite.sites" class="site">

								<label>Select Study Name :</label> <select
									name="Add_StudySite_Study_Selection"
									id="Add_StudySite_Study_Selection" class="drop_txt">
									<c:forEach items="${studieslist}" var="slist"
										varStatus="status">
										<option id="${slist.study_id}" value="${slist.study_id}"
											onclick="">${slist.study_name}</option>
									</c:forEach>
								</select><br />
								<span class="error_label_grp"></span> <label>Select Site
									Name :</label> <select name="Add_StudySite_Site_Selection"
									id="Add_StudySite_Site_Selection" class="drop_txt">
									<c:forEach items="${siteslist}" var="silist" varStatus="status">
										<option id="${silist.site_id}" value="${silist.site_id}"
											onclick="">${silist.site_name}</option>
									</c:forEach>
								</select> <span class="error_label_grp"></span>
								<!--<c:url value='ShowSitesIndex.sites' />-->
								<label>Study Site Number :</label> <input maxlength="10"
									name="Add_StudySite_studysitenumber"
									id="Add_StudySite_studysitenumber" type="text"
									class="input_txt" value="" /> <span
									id="Add_StudySite_studysitenumber_error"
									class="error_label_grp" style="display: none;">Please
									Provide a valid study site number !</span> <label>Investigator
									Name :</label> <select name="Add_StudySite_Investigator_Selection"
									id="Add_StudySite_Investigator_Selection" class="drop_txt">
									<c:forEach items="${siteinvestigators}" var="invest"
										varStatus="status">
										<option id="${invest.user_id}" value="${invest.user_id}"
											onclick="">${invest.first_name} ${invest.last_name}</option>
									</c:forEach>
								</select> <span id="Add_StudySite_Investigator_Selection_error"
									class="error_label_grp"></span> <input type="hidden"
									id="Add_StudySite_checkinvestigatorbutton"
									name="Add_StudySite_checkinvestigatorbutton" value="0" />
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill">Save</button>
									<input type="button" class="grey-pill" value="Cancel" />
								</div>

							</form>

						</div>
					</div>
				</div>

				<!-- //////////////////////////////////////// End Add Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End End Site Study ////////////////////////////////////////////////////// -->



				<!-- //////////////////////////////////////// Start View Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start View Site Study ////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Sites_Study_view_div"
					style="display: none;">
					<div class="body_inner_header" id="Sites_Study_addview_div_title">
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
								<a href="#">View Study Sites</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>

					<div class="field_txt_view_list">
						<div class="field_set">
							<input id="View_StudySite_Search_bar"
								name="View_StudySite_Search_bar" type="text" class="input_txt"
								value="" /> <span class="search_btn"><a href="#"><img
									src="images/search.png" alt="search" title="search" border="0" /></a></span>
						</div>
						<span id="View_StudySite_Main_Error" class="error_label_grp"
							style="display: none; width: auto;"></span> <span
							id="View_StudySite_Main_Success" class="chk_avail_yes"
							style="display: none; width: auto;"></span>



						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							class="table_border_view_list">
							<tr class="rights_header_view_list">
								<td width="30%" align="left" valign="middle">&nbsp;Study</td>
								<td width="30%" align="left" valign="middle">&nbsp;Site</td>
								<td width="34%" align="left" valign="middle">&nbsp;Investigator</td>
								<td width="6%" align="center" valign="middle">Delete</td>
							</tr>
							<tbody id="SSbody">
								<c:set var="tempRowStyle" scope="page"
									value="white_row_view_list" />
								<c:set var="tempRowStyle"
									value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
								<c:forEach items="${studysitelist}" var="stsilist"
									varStatus="status">

									<tr class="${tempRowStyle}" id="${stsilist.study_site_id}">

										<c:set var="studynamefield" scope="page" value="" />

										<c:forEach items="${studieslist}" var="stlist"
											varStatus="status">
											<c:if test="${stsilist.study_id == stlist.study_id}">
												<c:set var="studynamefield" value="${stlist.study_name}" />
											</c:if>

										</c:forEach>

										<c:set var="sitenamefield" scope="page" value="" />

										<c:forEach items="${siteslist}" var="silist"
											varStatus="status">
											<c:if test="${stsilist.site_id == silist.site_id}">
												<c:set var="sitenamefield" value="${silist.site_name}" />
											</c:if>
										</c:forEach>

										<c:set var="investnamefield" scope="page" value="" />
										<c:forEach items="${investigators}" var="investlist"
											varStatus="status">
											<c:if
												test="${stsilist.principal_investigator_id == investlist.user_id}">
												<c:set var="investnamefield"
													value="${investlist.first_name} ${investlist.last_name}" />
											</c:if>
										</c:forEach>

										<td valign="top" align="left" class="set_padding">${studynamefield}</td>
										<td valign="top" align="left" class="set_padding">${sitenamefield}</td>
										<td valign="top" align="left" class="set_padding">${investnamefield}</td>
										<c:if
											test="${tl:rightsofView(resourceList,'Delete Study Sites')==1}">
											<td valign="top" align="center" class="set_padding2"><a
												href="<c:url value='EditStudySite.sites?studysiteid=${stsilist.study_site_id}'/>"><img
													src="images/delete.png" alt="Edit" title="Edit" border="0" /></a></td>
										</c:if>
									</tr>


								</c:forEach>
							</tbody>
						</table>
					</div>
					<form id="Edit_StudySitehidden_Form"
						name="Edit_StudySitehidden_Form" method="post"
						action="EditStudySite.sites">
						<input type="hidden" name="hiddenfieldstudysiteid"
							id="hiddenfieldstudysiteid" value="${CurrentForm}" /> <input
							type="hidden" name="hiddenfieldstudyid" id="hiddenfieldstudyid"
							value="${CurrentForm}" /> <input type="hidden"
							name="hiddenfieldsiteid" id="hiddenfieldsiteid"
							value="${CurrentForm}" />
					</form>
					<div class="spacer"></div>
					<div style="clear: both; margin-top: 20px;">
						<!--  <button class="blue-pill">Save</button> <button class="grey-pill">Cancel</button>-->
					</div>


				</div>
				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->
				<form id="studysitehiddenform" name="studysitehiddenform"
					action="HiddenActions.sites">
					<input type="hidden" id="typeofaction" name="typeofaction" value=""></input>
					<input type="hidden" id="HiddenValue1" name="HiddenValue1" value=""></input>
					<input type="hidden" id="HiddenValue2" name="HiddenValue2" value=""></input>
					<input type="hidden" id="HiddenValue3" name="HiddenValue3" value="">${SSN}</input>
					<input type="hidden" id="HiddenValue5" name="HiddenValue5"
						value="${Sites_Study_add_div_studyid}"></input> <input
						type="hidden" id="HiddenValue6" name="HiddenValue6"
						value="${Sites_Study_add_div_siteid}"></input>
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


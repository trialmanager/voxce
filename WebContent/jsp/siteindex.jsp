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

<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/sites.js"></script>

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
<script type="text/javascript">
	$(function() {
		$(".multiselect").multiselect();
	});
</script>
</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="AddSiteMessageCode" id="AddSiteMessageCode"
		value="${MessageCode}" />
	<input type="hidden" name="EditSiteMessageCode"
		id="EditSiteMessageCode" value="${EditMessageCode}" />

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
								class="nav_l" name="hrefSites_Add_Div" id="current">Add Site</a>
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

				<!-- //////////////////////////////////////// Start Add Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start Add Site ////////////////////////////////////////////////////// -->

				<div class="body_inner resourceRights" id="Sites_Add_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'Add Site')}">
					<div class="body_inner_header" id="Sites_Add_Div_Title">
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
								<a href="#">Create Site</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform site">
							<form id="Add_Site_Form" name="Add_Site_Form" method="post"
								action="SaveSite.sites" class="site">
								<span id="Add_Site_Main_Error" class="error_label_grp"
									style="display: none; width: auto;"></span> 
									<span id="Add_Site_Main_Success" class="chk_avail_yes"
									style="display: none; width: auto;"></span> 
									
									<input
									name="Add_Site_Siteid" id="Add_Site_Siteid" type="text"
									class="input_txt" value="" style="display: none" /> <label>Name
									:</label> <input maxlength="200" name="Add_Site_Name"
									id="Add_Site_Name" type="text" class="input_txt" value="" /> <span
									id="Add_Site_Name_Error" class="error_label_grp"
									style="display: none"></span><span id="Add_Site_Name_Error1"
									class="error_label_grp" style="display: none"></span> <label>Address
									:</label> <input maxlength="200" name="Add_Site_Address_1"
									id="Add_Site_Address_1" type="text" class="input_txt" value="" />
								<span id="Add_Site_Address_Error" class="error_label_grp"
									style="display: none">Please provide valid Address !</span> <input
									maxlength="200" name="Add_Site_Address_2"
									id="Add_Site_Address_2" type="text" class="input_txt2" value="" />
								<br /> <input maxlength="200" name="Add_Site_Address_3"
									id="Add_Site_Address_3" type="text" class="input_txt2" value="" />
								<br /> <label>City :</label> <input maxlength="200"
									name="Add_Site_City" id="Add_Site_City" type="text"
									class="input_txt" value="" /> <span id="Add_Site_City_Error"
									class="error_label_grp" style="display: none"></span> <span
									id="Add_Site_City_Error1" class="error_label_grp"
									style="display: none"></span> <label>State :</label> <input
									maxlength="200" name="Add_Site_State" id="Add_Site_State"
									type="text" class="input_txt" value="" /> <span
									id="Add_Site_State_Error" class="error_label_grp"
									style="display: none"></span><span id="Add_Site_State_Error1"
									class="error_label_grp" style="display: none"></span> <label>Postal
									Code :</label> <input maxlength="18" name="Add_Site_Postal_Code"
									id="Add_Site_Postal_Code" type="text" class="small" value="" />
								<span id="Add_Site_Postal_Code_Error" class="error_label_grp"
									style="display: none"></span><span
									id="Add_Site_Postal_Code_Error1" class="error_label_grp"
									style="display: none"></span> <label>Country :</label> <select
									name="Add_Site_Country" id="Add_Site_Country" class="drop_txt">
									<c:forEach items="${countrieslist}" var="countries"
										varStatus="status">
										<option id="${countries.COUNTRY_ID}"
											value="${countries.COUNTRY_ID}" onclick="">${countries.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span id="Add_Site_Country_Error" class="error_label_grp"></span>


								<label>Phone :</label> <input maxlength="18"
									name="Add_Site_Phone" id="Add_Site_Phone" type="text"
									class="input_txt" value="" /> <span id="Add_Site_Phone_Error"
									class="error_label_grp" style="display: none"></span><span
									id="Add_Site_Phone_Error1" class="error_label_grp"
									style="display: none"></span> <label>Cell :</label> <input
									maxlength="18" name="Add_Site_Cell" id="Add_Site_Cell"
									type="text" class="input_txt" value="" /> <span
									id="Add_Site_Cell_Error" class="error_label_grp"
									style="display: none">Please provide Valid Cell#</span> <label>Fax
									:</label> <input maxlength="18" name="Add_Site_Fax" id="Add_Site_Fax"
									type="text" class="input_txt" value="" /> <span
									id="Add_Site_Fax_Error" class="error_label_grp"
									style="display: none">Please provide Valid Fax#</span> <label>E-mail
									:</label> <input maxlength="200" name="Add_Site_Email"
									id="Add_Site_Email" type="text" class="input_txt" value="" />
								<span id="Add_Site_Email_Error" class="error_label_grp"
									style="display: none">Please provide Valid Email Address
									!</span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" type="reset"
										onclick="AddSiteCancel()">Cancel</button>
								</div>

							</form>
						</div>

					</div>
				</div>

				<!-- //////////////////////////////////////// End Add Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End Add Site ////////////////////////////////////////////////////// -->



				<!-- //////////////////////////////////////// Start View Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start View Site ////////////////////////////////////////////////////// -->
				<c:set value="0" var="zero"></c:set>
				<c:set value="1" var="one"></c:set>
				<div class="body_inner resourceRights" id="Sites_View_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'View Sites')}">
					<div class="body_inner_header" id="Sites_View_Div_Title">
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
								<a href="#">View Sites</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="field_set">
							<input id="View_Site_Search_bar" name="View_Site_Search_bar"
								type="text" class="input_txt" value="Search..." /> <span
								class="search_btn"><a href="#"><img
									src="images/search.png" alt="search" title="search" border="0" /></a></span>
						</div>
						<span id="Edit_Site_error_message" class="error_label_grp"
							style="display: none; width: auto;"></span> <span
							id="Edit_Site_success_message" class="chk_avail_yes"
							style="display: none; width: auto;"></span>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tbody>
										<tr class="rights_header_view_list">
											<td width="12%" align="left" valign="middle">&nbsp;Name</td>
											<td width="12%" align="left" valign="middle">&nbsp;Address</td>
											<td width="10%" align="left" valign="middle">&nbsp;Country</td>
											<td width="12%" align="left" valign="middle">&nbsp;Email</td>
											<td width="12%" align="left" valign="middle">&nbsp;Contact</td>
											<td width="10%" align="left" valign="middle">&nbsp;Status</td>
											<c:if test="${tl:rightsofView(resourceList,'Edit Sites')==1}">
												<td width="5%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>
									</tbody>
									<tbody id="fbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${siteslist}" var="sitelist"
											varStatus="status">
											<c:set var="sitenamefield" scope="page" value="" />
											<c:forEach items="${countrieslist}" var="clist"
												varStatus="status">
												<c:if test="${sitelist.country_id == clist.COUNTRY_ID}">
													<c:set var="sitenamefield" value="${clist.COUNTRY_NAME}" />
												</c:if>
											</c:forEach>

											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

											<tr class="${tempRowStyle}" id="${sitelist.site_id}">
												<td valign="top" align="left" class="set_padding">${sitelist.site_name}</td>
												<td valign="top" align="left" class="set_padding">${sitelist.address1},
													${sitelist.address2}, ${sitelist.address3}</td>
												<td valign="top" align="left" class="set_padding">${sitenamefield}</td>
												<td valign="top" align="left" class="set_padding">${sitelist.email}</td>
												<td valign="top" align="left" class="set_padding">${sitelist.phone},
													${sitelist.cell}, ${sitelist.fax}</td>

												<c:choose>
													<c:when test="${sitelist.status == 0}">
														<td valign="top" align="left" class="set_padding"><a
															href="<c:url value='ChangeSiteStatus.sites?Status=1&Site_id=${sitelist.site_id}' />"
															class="inactive_txt"><strong>Inactive</strong></a></td>
													</c:when>
													<c:when test="${sitelist.status == 1}">
														<td valign="top" align="left" class="set_padding"><a
															href="<c:url value='ChangeSiteStatus.sites?Status=0&Site_id=${sitelist.site_id}' />"
															class="active_txt"><strong>Active</strong></a></td>
													</c:when>
												</c:choose>

												<c:if
													test="${tl:rightsofView(resourceList,'Edit Sites')==1}">
													<td valign="top" align="center" class="set_padding2"><img
														onclick="edit_view_site_row('${sitelist.site_id}','${sitelist.site_name}','${sitelist.email}','${sitelist.address1}','${sitelist.address2}','${sitelist.address3}','${sitelist.city}','${sitelist.state}','${sitelist.country_id}','${sitelist.postal_code}', '${sitelist.phone}' ,'${sitelist.cell}','${sitelist.fax}')"
														src="images/edit_row_icon.png" alt="Edit" title="Edit"
														border="0" /></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>


				<!-- //////////////////////////////////////// End View Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End View Site ////////////////////////////////////////////////////// -->

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


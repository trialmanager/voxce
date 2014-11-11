<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/home/study/sitedetail.js"></script>
<script type="text/javascript" src="js/validation.js"></script>


<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>

	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="CurrentCountryID" id="CurrentCountryID"
		value="${currentsite.country_id}">

	<div class="wrapper">
		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->

			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->

			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">

						<c:if test="${tl:rightsofView(resourceList,'Patients')==1}">
							<a
								href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Patients</a>
						</c:if>
						<a
							href="<c:url value='OpenStudySiteChange.study?siteid=${currentsite.site_id}' />"
							class="nav_l" name="">Site Change</a>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='OpenStudySiteInvestigators.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Investigators</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Laboratories')==1}">
							<a
								href="<c:url value='OpenStudySiteLaborotories.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Laboratories
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Document')==1}">
							<a
								href="<c:url value='OpenStudySiteDocuments.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Documents</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Users')==1}">
							<a
								href="<c:url value='OpenStudySiteUsers.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Site Details')==1}">
							<a
								href="<c:url value='OpenStudySiteDetail.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="" id="current">Site Detail</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='discrepenciesInSite.study?stiteId=${currentsite.site_id}' />"
								class="nav_l" name="">Site Discrepancy</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!-- //////////////////////////////////////// Start  Study Detail ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start  Study Detail ////////////////////////////////////////////////////// -->
				<div class="body_inner" id="SiteDetailDiv">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Site Detail</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="show_hide_form">

							<span id="Edit_Site_Main_Error" class="error_label_grp"
								style="display: none;">${EMessage}</span> <span
								id="Edit_Site_Main_Success" class="chk_avail_yes"
								style="display: none;">${SMessage}</span>

							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Site Name:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.site_name}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Status:&nbsp;</td>
										<c:choose>
											<c:when test="${currentsite.status == 0}">
												<td width="81%" valign="middle" align="left"
													class="lable_t_imp">&nbsp;<strong class="inactive_txt">Inactive</strong></td>
											</c:when>
											<c:when test="${currentsite.status == 1}">
												<td width="81%" valign="middle" align="left"
													class="lable_t_imp">&nbsp;<strong class="active_txt">Active</strong></td>
											</c:when>
										</c:choose>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Address 1:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.address1}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Address 2:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.address2}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Address 3:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.address3}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">City:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.city}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">State:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.state}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Country:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${country.COUNTRY_NAME}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Phone:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.phone}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Cell:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.cell}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Fax:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.fax}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Postal Code:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.postal_code}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Email:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.email}</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t">Date Created:&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp;${currentsite.date_created}</td>
									</tr>
								</table>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 300px; float: left;">
									<button class="blue-pill" onclick="EditSite()">Edit
										Site</button>
								</div>

							</div>


						</div>
					</div>
				</div>
				<!-- //////////////////////////////////////// End Study Detail ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End Study Detail////////////////////////////////////////////////////// -->


				<!-- //////////////////////////////////////// Start Add Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start Add Site ////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Sites_Add_Div" style="display: none;">
					<div class="body_inner_header" id="Sites_Add_Div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Edit Site</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform site">
							<form id="Edit_Site_Form" name="Edit_Site_Form" method="post"
								action="EditSiteDetail.study" class="site">

								<input name="countryid" id="countryid" type="hidden"
									value="${currentsite.country_id}" /> <input name="sitestatus"
									id="sitestatus" type="hidden" value="${currentsite.status}" />
								<label>Name :</label> <input maxlength="200"
									name="Add_Site_Name" id="Add_Site_Name" type="text"
									class="input_txt" value="${currentsite.site_name}" /> <span
									id="Add_Site_Name_Error" class="error_label_grp"
									style="display: none">Please provide valid site name !</span> <label>Address
									:</label> <input maxlength="200" name="Add_Site_Address_1"
									id="Add_Site_Address_1" type="text" class="input_txt"
									value="${currentsite.address1}" /> <span
									id="Add_Site_Address_Error" class="error_label_grp"
									style="display: none">Please provide valid Address !</span> <input
									maxlength="200" name="Add_Site_Address_2"
									id="Add_Site_Address_2" type="text" class="input_txt2"
									value="${currentsite.address2}" /> <br /> <input
									maxlength="200" name="Add_Site_Address_3"
									id="Add_Site_Address_3" type="text" class="input_txt2"
									value="${currentsite.address3}" /> <br /> <label>City
									:</label> <input maxlength="200" name="Add_Site_City"
									id="Add_Site_City" type="text" class="input_txt"
									value="${currentsite.city}" /> <span id="Add_Site_City_Error"
									class="error_label_grp" style="display: none">Please
									provide Valid City !</span> <label>State :</label> <input
									maxlength="200" name="Add_Site_State" id="Add_Site_State"
									type="text" class="input_txt" value="${currentsite.state}" />
								<span id="Add_Site_State_Error" class="error_label_grp"
									style="display: none">Please provide Valid State !</span> <label>Postal
									Code :</label> <input maxlength="18" name="Add_Site_Postal_Code"
									id="Add_Site_Postal_Code" type="text" class="small"
									value="${currentsite.postal_code}" /> <span
									id="Add_Site_Postal_Code_Error" class="error_label_grp"
									style="display: none">Please provide Valid Postal Code !</span>

								<label>Country :</label> <select name="Add_Site_Country"
									id="Add_Site_Country" class="drop_txt">
									<c:forEach items="${countrieslist}" var="countries"
										varStatus="status">
										<option id="${countries.COUNTRY_ID}"
											value="${countries.COUNTRY_ID}" onclick="">${countries.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span id="Add_Site_Country_Error" class="error_label_grp"></span>


								<label>Phone :</label> <input maxlength="18"
									name="Add_Site_Phone" id="Add_Site_Phone" type="text"
									class="input_txt" value="${currentsite.phone}" /> <span
									id="Add_Site_Phone_Error" class="error_label_grp"
									style="display: none">Please provide Valid Phone#</span> <label>Cell
									:</label> <input maxlength="18" name="Add_Site_Cell" id="Add_Site_Cell"
									type="text" class="input_txt" value="${currentsite.cell}" /> <span
									id="Add_Site_Cell_Error" class="error_label_grp"
									style="display: none">Please provide Valid Cell#</span> <label>Fax
									:</label> <input maxlength="18" name="Add_Site_Fax" id="Add_Site_Fax"
									type="text" class="input_txt" value="${currentsite.fax}" /> <span
									id="Add_Site_Fax_Error" class="error_label_grp"
									style="display: none">Please provide Valid Fax#</span> <label>E-mail
									:</label> <input maxlength="200" name="Add_Site_Email"
									id="Add_Site_Email" type="text" class="input_txt"
									value="${currentsite.email}" /> <span
									id="Add_Site_Email_Error" class="error_label_grp"
									style="display: none">Please provide Valid Email Address
									!</span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<button id="EditSiteCancelbutton" class="grey-pill"
										type="reset">Cancel</button>
								</div>

							</form>
						</div>

					</div>
				</div>
				<!-- //////////////////////////////////////// End Add Site ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End Add Site ////////////////////////////////////////////////////// -->


			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="../footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>

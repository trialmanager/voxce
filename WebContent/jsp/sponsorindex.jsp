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
		$(function(){
			$(".multiselect").multiselect();
		});
	</script>



<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/sponsor.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />


</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>

	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="AddSponsorMessageCode"
		id="AddSponsorMessageCode" value="${AddSponsorMessageCode}" />
	<input type="hidden" name="AddSponsorDevisionMessageCode"
		id="AddSponsorDevisionMessageCode"
		value="${AddSponsorDevisionMessageCode}" />
	<input type="hidden" name="AddSponDivUsMessage"
		id="AddSponDivUsMessage" value="${AddSponDivUsMessage}" />
	<input type="hidden" name="ViewSponDivUsMessage"
		id="ViewSponDivUsMessage" value="${ViewSponDivUsMessage}" />

	<!-- wrapper starts here -->
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<!-- menu ends here -->
		<script type="text/javascript" src="js/spondiv.js"></script>
		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<c:if test="${tl:rightsofView(resourceList,'Add Sponsor')==1}">
							<a href="#" class="nav_l" name="hrefAdd_SponsorDiv"
								onclick="LoadFormSponsor('Add_SponsorDiv')">Add Sponsor</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Sponsor')==1}">
							<a href="#" class="nav_l" name="hrefView_SponsorDiv"
								onclick="LoadFormSponsor('View_SponsorDiv')">View Sponsor </a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Add Division')==1}">
							<a href="#" class="nav_l" name="hrefAdd_SponsorDivisionDiv"
								onclick="LoadFormSponsor('Add_SponsorDivisionDiv')">Add
								Division</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Division')==1}">
							<a href="#" class="nav_l" name="hrefView_SponsorDivisionDiv"
								onclick="LoadFormSponsor('View_SponsorDivisionDiv')">View
								Division</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Add Sponsor User')==1}">
							<a href="#" class="nav_l" name="hrefAdd_User_SponsorDivisionDiv"
								onclick="LoadFormSponsor('Add_User_SponsorDivisionDiv')">Add
								Sponsor User</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Sponsor Users')==1}">
							<a href="#" class="nav_l" name="hrefView_User_SponsorDivisionDiv"
								onclick="LoadFormSponsor('View_User_SponsorDivisionDiv')">View
								Sponsor User</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<c:set value="0" var="zero"></c:set>
				<c:set value="1" var="one"></c:set>
				<!--  //////////////////////////////////////////Start Add Sponsor/////////////////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start Add Sponsor/////////////////////////////////////////////// -->

				<div class="body_inner resourceRights" id="Add_SponsorDiv"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'Add Sponsor')}">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Add Sponsor</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div id="" class="myform sponsor">
							<form id="Add_Sponsor_Form" name="Add_Sponsor_Form" method="post"
								action="SaveSponsor.spondiv">

								<span id="Add_Sponsor_Main_Error" class="error_label_grp"
									style="display: none;"></span> <span
									id="Add_Sponsor_Main_Success" class="chk_avail_yes"
									style="display: none;"></span> <input
									name="Add_Sponsor_sponsorid" id="Add_Sponsor_sponsorid"
									type="text" class="input_txt"
									value="${CurrentSponsor.sponsor_id}" style="display: none" />
								<label>Sponsor :</label> <input name="Add_Sponsor_Name"
									id="Add_Sponsor_Name" type="text" class="input_txt"
									value="${CurrentSponsor.name}" maxlength="50" /> <span
									id="Add_Sponsor_Name_Error" class="error_label_grp"></span><span
									id="Add_Sponsor_Name_Error1" class="error_label_grp"></span> <label>Address
									:</label> <input name="Add_Sponsor_Address_1"
									id="Add_Sponsor_Address_1" type="text" class="input_txt"
									value="${CurrentSponsor.address1}" maxlength="100" /> <span
									id="Add_Sponsor_Address_error" class="error_label_grp"></span>
								<input name="Add_Sponsor_Address_2" id="Add_Sponsor_Address_2"
									type="text" class="input_txt2"
									value="${CurrentSponsor.address2}" maxlength="100" /> <br />
								<input name="Add_Sponsor_Address_3" id="Add_Sponsor_Address_3"
									type="text" class="input_txt2"
									value="${CurrentSponsor.address3}" maxlength="100" /> <br />
								<label>City :</label> <input name="Add_Sponsor_City"
									id="Add_Sponsor_City" type="text" class="input_txt"
									value="${CurrentSponsor.city}" maxlength="100" /> <span
									id="Add_Sponsor_City_error" class="error_label_grp"></span><span
									id="Add_Sponsor_City_error1" class="error_label_grp"></span> <label>State
									:</label> <input name="Add_Sponsor_State" id="Add_Sponsor_State"
									type="text" class="input_txt" value="${CurrentSponsor.state}"
									maxlength="100" /> <span id="Add_Sponsor_State_error"
									class="error_label_grp"></span><span
									id="Add_Sponsor_State_error1" class="error_label_grp"></span> <label>Zip
									Code :</label> <input name="Add_Sponsor_ZipCode"
									id="Add_Sponsor_ZipCode" type="text" class="small"
									value="${CurrentSponsor.zip}" maxlength="20" /> <span
									id="Add_Sponsor_ZipCode_error" class="error_label_grp"></span><span
									id="Add_Sponsor_ZipCode_error1" class="error_label_grp"></span>

								<label>Country :</label> <select name="Add_Sponsor_Country"
									id="Add_Sponsor_Country" class="drop_txt">
									<c:forEach items="${countrieslist}" var="country"
										varStatus="status">
										<option id="${country.COUNTRY_ID}"
											value="${country.COUNTRY_ID}" onclick="">${country.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span id="Add_Sponsor_Country_error" class="error_label_grp"></span>

								<label>Phone :</label> <input name="Add_Sponsor_Phone"
									id="Add_Sponsor_Phone" type="text" class="input_txt"
									value="${CurrentSponsor.phone}" maxlength="20" /> <span
									id="Add_Sponsor_Phone_error" class="error_label_grp"></span><span
									id="Add_Sponsor_Phone_error1" class="error_label_grp"></span> <label>Fax
									:</label> <input name="Add_Sponsor_Fax" id="Add_Sponsor_Fax"
									type="text" class="input_txt" value="${CurrentSponsor.fax}"
									maxlength="20" /> <span id="Add_Sponsor_Fax_error"
									class="error_label_grp"></span> <label>E-mail :</label> <input
									name="Add_Sponsor_Email" id="Add_Sponsor_Email" type="text"
									class="input_txt" value="${CurrentSponsor.email}"
									maxlength="50" /> <span id="Add_Sponsor_Email_error"
									class="error_label_grp"></span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px;">
									<button class="blue-pill" type="submit">Save</button>
									<button type="reset" class="grey-pill"
										onclick="AddSponsorCancel()">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--  //////////////////////////////////////////End Add Sponsor///////////////////////////////////////////////// -->
				<!--  //////////////////////////////////////////End Add Sponsor///////////////////////////////////////////////// -->


				<!-- <c:out value="${tl:rightsofView(resourceList,'View Sponsor')}"></c:out> -->


				<!--  //////////////////////////////////////////Start View Sponsor/////////////////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start View Sponsor/////////////////////////////////////////////// -->

				<div class="body_inner resourceRights" id="View_SponsorDiv"
					style="display: block;"
					right="${tl:rightsofView(resourceList,'View Sponsor')}">

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View Sponsor</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_set">
							<input id="View_sponsor_Search_bar"
								name="View_sponsor_Search_bar" type="text" class="input_txt"
								value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>

						<span id="Edit_Sponsor_error_message" class="chk_avail_yes"></span>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">

									<tr class="rights_header_view_list">
										<td width="15%" align="left" valign="middle">&nbsp;Name</td>
										<td width="18%" align="left" valign="middle">&nbsp;Email</td>
										<td width="30%" align="left" valign="middle">&nbsp;Address</td>
										<td width="22%" align="left" valign="middle">&nbsp;Contact
											Numbers</td>
										<c:if
											test="${tl:rightsofView(resourceList,'Edit Sponsor')==1}">
											<td width="6%" align="center" valign="middle">Edit</td>
										</c:if>
									</tr>
									<tbody id="gbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />

										<c:forEach items="${sponsorslist}" var="sponsor"
											varStatus="status">

											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

											<tr class="${tempRowStyle}" id="${sponsor.sponsor_id}">
												<td valign="top" align="left" class="set_padding">${sponsor.name}</td>
												<td valign="top" align="left" class="set_padding">${sponsor.email}</td>
												<td valign="top" align="left" class="set_padding">${sponsor.address1},${sponsor.address2},${sponsor.address3}</td>
												<td valign="top" align="left" class="set_padding">${sponsor.phone},
													${sponsor.fax}</td>
												<c:if
													test="${tl:rightsofView(resourceList,'Edit Sponsor')==1}">
													<td valign="top" align="center" class="set_padding2"><img
														onclick="edit_view_sponsor_row('${sponsor.sponsor_id}','${sponsor.name}','${sponsor.email}','${sponsor.address1}','${sponsor.address2}','${sponsor.address3}','${sponsor.city}','${sponsor.state}','${sponsor.country_id}','${sponsor.zip}', '${sponsor.phone}' ,'${sponsor.fax}','${sponsor.email}')"
														src="images/edit_row_icon.png" alt="Edit" title="Edit"
														border="0" /></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<input name="Sponsor_Hidden_ID" id="Sponsor_Hidden_ID"
								type="hidden" class="input_txt" value="" />
						</div>
					</div>
				</div>

				<!--  //////////////////////////////////////////End View Sponsor//////////////////////////////////////////////// -->
				<!--  //////////////////////////////////////////End View Sponsor//////////////////////////////////////////////// -->





				<!--  //////////////////////////////////////////Start Add Sponsor_Division////////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start Add Sponsor_Division////////////////////////////////////// -->

				<div class="body_inner resourceRights" id="Add_SponsorDivisionDiv"
					style="display: block;"
					right="${tl:rightsofView(resourceList,'Add Division')}">


					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Add Division</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div id="" class="myform sponsor">
							<form id="Add_SponsorDivision_Form"
								name="Add_SponsorDivision_Form" method="post"
								action="SaveSponsorDivision.spondiv">
								<span id="Add_SponsorDivision_Main_Error"
									class="error_label_grp" style="display: none;"></span> <span
									id="Add_SponsorDivision_Main_Success" class="chk_avail_yes"
									style="display: none;"></span> <input
									name="Add_SponsorDivision_divisionid"
									id="Add_SponsorDivision_divisionid" type="text"
									class="input_txt" value="" style="display: none" /> <label>Select
									Sponsor :</label> <select name="Add_SponsorDivision_Select_Sponsor"
									id="Add_SponsorDivision_Select_Sponsor" class="drop_txt">
									<c:forEach items="${sponsorslist}" var="sponslist"
										varStatus="status">
										<option id="${sponslist.sponsor_id}"
											value="${sponslist.sponsor_id}" onclick="">${sponslist.name}</option>
									</c:forEach>
								</select> <span id="Add_SponsorDivision_Select_Sponsor_error"
									class="error_label_grp"></span> <label>Division :</label> <input
									name="Add_SponsorDivision_divisionname"
									id="Add_SponsorDivision_divisionname" type="text"
									class="input_txt" value="" maxlength="50" /> <span
									id="Add_SponsorDivision_divisionname_error"
									class="error_label_grp"></span><span
									id="Add_SponsorDivision_divisionname_error1"
									class="error_label_grp"></span> <label>Address :</label> <input
									name="Add_SponsorDivision_address1"
									id="Add_SponsorDivision_address1" type="text" class="input_txt"
									value="" maxlength="100" /> <span
									id="Add_SponsorDivision_address1_error" class="error_label_grp"></span>
								<input name="Add_SponsorDivision_address2"
									id="Add_SponsorDivision_address2" type="text"
									class="input_txt2" value="" maxlength="100" /> <br /> <input
									name="Add_SponsorDivision_address3"
									id="Add_SponsorDivision_address3" type="text"
									class="input_txt2" value="" maxlength="100" /> <br /> <label>City
									:</label> <input name="Add_SponsorDivision_City"
									id="Add_SponsorDivision_City" type="text" class="input_txt"
									value="" maxlength="100" /> <span
									id="Add_SponsorDivision_City_error" class="error_label_grp"></span><span
									id="Add_SponsorDivision_City_error1" class="error_label_grp"></span>

								<label>State :</label> <input name="Add_SponsorDivision_State"
									id="Add_SponsorDivision_State" type="text" class="input_txt"
									value="" maxlength="100" /> <span
									id="Add_SponsorDivision_State_error" class="error_label_grp"></span><span
									id="Add_SponsorDivision_State_error1" class="error_label_grp"></span>

								<label>Zip Code :</label> <input
									name="Add_SponsorDivision_Zipcode"
									id="Add_SponsorDivision_Zipcode" type="text" class="small"
									value="" maxlength="20" /> <span
									id="Add_SponsorDivision_Zipcode_error" class="error_label_grp"></span>

								<label>Country :</label> <select
									name="Add_SponsorDivision_country"
									id="Add_SponsorDivision_country" class="drop_txt">
									<c:forEach items="${countrieslist}" var="country"
										varStatus="status">
										<option id="${country.COUNTRY_ID}"
											value="${country.COUNTRY_ID}" onclick="">${country.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span id="Add_SponsorDivision_country_error"
									class="error_label_grp"></span> <label>Phone :</label> <input
									name="Add_SponsorDivision_phone" id="Add_SponsorDivision_phone"
									type="text" class="input_txt" value="" maxlength="20" /> <span
									id="Add_SponsorDivision_phone_Error" class="error_label_grp"></span>

								<label>Fax :</label> <input name="Add_SponsorDivision_fax"
									id="Add_SponsorDivision_fax" type="text" class="input_txt"
									value="" maxlength="20" /> <span
									id="Add_SponsorDivision_fax_error" class="error_label_grp"></span>

								<label>E-mail :</label> <input name="Add_SponsorDivision_email"
									id="Add_SponsorDivision_email" type="text" class="input_txt"
									value="" maxlength="50" /> <span
									id="Add_SponsorDivision_email_Error" class="error_label_grp"></span>



								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px;">
									<input type="submit" class="blue-pill"></input>
									<input type="button" class="grey-pill" value="Reset"></input>
								</div>
							</form>
						</div>

					</div>
				</div>
				<!--  //////////////////////////////////////////End Add Sponsor_Division/////////////////////////////////////// -->
				<!--  //////////////////////////////////////////End Add Sponsor_Division/////////////////////////////////////// -->





				<!--  //////////////////////////////////////////Start View Sponsor_Division//////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start View Sponsor_Division//////////////////////////////////// -->

				<div class="body_inner resourceRights" id="View_SponsorDivisionDiv"
					style="display: block;"
					right="${tl:rightsofView(resourceList,'View Division')}">

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View Division</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_set">

							<input id="View_SponsorDivision_Search_bar"
								name="View_SponsorDivision_Search_bar" type="text"
								class="input_txt" value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>

						<div id="Edit_SponsorDivision_error_message" class="chk_avail_yes"></div>

						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">

									<tr class="rights_header_view_list">
										<td width="15%" align="left" valign="middle">&nbsp;Sponsor
											Name</td>
										<td width="15%" align="left" valign="middle">&nbsp;Division
											Name</td>
										<td width="20%" align="left" valign="middle">&nbsp;Email</td>
										<td width="30%" align="left" valign="middle">&nbsp;Address</td>
										<td width="15%" align="left" valign="middle">&nbsp;Contact
											Numbers</td>
										<c:if
											test="${tl:rightsofView(resourceList,'View Division')==1}">
											<td width="5%" align="center" valign="middle">Edit</td>
										</c:if>
									</tr>
									<tbody id="fbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />

										<c:forEach items="${SponsorDevisionlist}" var="SponDivlist"
											varStatus="status1">

											<c:set var="sponsornamefield" scope="page" value="" />
											<c:forEach items="${sponsorslist}" var="Slist"
												varStatus="stat">
												<c:if test="${SponDivlist.sponsor_id == Slist.sponsor_id}">
													<c:set var="sponsornamefield" value="${Slist.name}" />
												</c:if>
											</c:forEach>

											<c:set var="tempRowStyle"
												value="${(status1.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle}" id="${SponDivlist.devision_id}">
												<td valign="top" align="left" class="set_padding">${sponsornamefield}</td>
												<td valign="top" align="left" class="set_padding">${SponDivlist.name}</td>
												<td valign="top" align="left" class="set_padding">${SponDivlist.email}</td>
												<td valign="top" align="left" class="set_padding">${SponDivlist.address1},
													${SponDivlist.address2}, ${SponDivlist.address3}</td>
												<td valign="top" align="left" class="set_padding">${SponDivlist.phone},
													${SponDivlist.fax}</td>
												<c:if
													test="${tl:rightsofView(resourceList,'View Division')==1}">
													<td valign="top" align="center" class="set_padding2"><img
														onclick="edit_view_sponsordivision_row('${SponDivlist.devision_id}','${SponDivlist.sponsor_id}','${SponDivlist.name}','${SponDivlist.address1}','${SponDivlist.address2}','${SponDivlist.address3}','${SponDivlist.city}','${SponDivlist.state}','${SponDivlist.country_id}','${SponDivlist.zip}','${SponDivlist.phone}','${SponDivlist.fax}','${SponDivlist.email}')"
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


				<!--  //////////////////////////////////////////End View Sponsor_Division//////////////////////////////////////-->
				<!--  //////////////////////////////////////////End View Sponsor_Division///////////////////////////////////// -->



				<!--  //////////////////////////////////////////Start Add Sponsor_User//////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start Add Sponsor_User//////////////////////////////////// -->


				<div class="body_inner resourceRights"
					id="Add_User_SponsorDivisionDiv" style="display: block;"
					right="${tl:rightsofView(resourceList,'Add Sponsor User')}">
					<div class="body_inner_header"
						id="Add_User_SponsorDivisionDiv_tile">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Add Sponsor User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="myform sponsor">
							<form id="Add_user_SponsorDivision_Form"
								name="Add_user_SponsorDivision_Form" method="post"
								action="SaveSponsorDivisionUser.spondiv">
								<span id="Add_SponsorDivisionUser_Main_Error"
									class="error_label_grp" style="display: none;"></span> <span
									id="Add_SponsorDivisionUser_Main_Success" class="chk_avail_yes"
									style="display: none;"></span> <label>Sponsor Name :</label> <select
									name="Add_Sponsor_User_Sponsorslist"
									id="Add_Sponsor_User_Sponsorslist" class="drop_txt"
									onchange="Reload_Divisions()">
									<c:forEach items="${sponsorslist}" var="sponslist"
										varStatus="status">
										<option id="${sponslist.sponsor_id}"
											value="${sponslist.sponsor_id}" onclick="">${sponslist.name}</option>
									</c:forEach>
								</select> <span class="error_label_grp"></span> <label>Division
									Name :</label> <select name="Add_Sponsor_User_Divisionlist"
									id="Add_Sponsor_User_Divisionlist" class="drop_txt">
									<c:forEach items="${SelectedSponsorDivisions}" var="SSDlist"
										varStatus="status">
										<option id="${SSDlist.sponsor_id}"
											value="${SSDlist.devision_id}" onclick="">${SSDlist.name}</option>
									</c:forEach>

								</select> <span class="error_label_grp"></span> <label>User Name
									:</label> <select id="Add_Sponsor_User_select_user" class="multiselect"
									multiple="multiple" name="Add_Sponsor_User_select_user">
									<c:forEach items="${users}" var="ulist" varStatus="status">
										<option id="${ulist.user_id}" value="${ulist.user_id}"
											onclick="">${ulist.first_name} ${ulist.last_name} (
											${ulist.email} )</option>
									</c:forEach>
								</select> <select id="hiddenAdd_Sponsor_User_select_user"
									name="hiddenAdd_Sponsor_User_select_user"
									style="display: none;">
									<c:forEach items="${selectedSponsorDivisionUser }"
										var="spdivulist" varStatus="status">
										<c:forEach items="${users}" var="ulist" varStatus="status">
											<c:if test="${spdivulist.user_id==ulist.user_id }">
												<option id="${ulist.user_id}" value="${ulist.user_id}"
													onclick="">${ulist.first_name} ${ulist.last_name}
													( ${ulist.email} )</option>
											</c:if>
										</c:forEach>
									</c:forEach>

								</select>


								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill">Save</button>
									<input type="button" class="grey-pill" value="Cancel" id="sponsor_user_btn" />
								</div>
							</form>
						</div>
					</div>
				</div>

				<!--  //////////////////////////////////////////End Add Sponsor_User//////////////////////////////////// -->
				<!--  //////////////////////////////////////////End Add Sponsor_User//////////////////////////////////// -->

				<!--  //////////////////////////////////////////Start View Sponsor_User//////////////////////////////////// -->
				<!--  //////////////////////////////////////////Start View Sponsor_User//////////////////////////////////// -->
				<div class="body_inner resourceRights"
					id="View_User_SponsorDivisionDiv" style="display: block;"
					right="${tl:rightsofView(resourceList,'Add Sponsor User')}">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowSponsorDivIndex.spondiv' />">Sponsor
									& Divisions</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View Sponsor User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="field_set">
							<input id="View_SponsorDivisionUser_Search_bar"
								name="View_SponsorDivisionUser_Search_bar" type="text"
								class="input_txt" value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<span id="View_SponsorDivisionUser_Main_Error"
							class="error_label_grp" style="display: none;"></span> <span
							id="View_SponsorDivisionUser_Main_Success" class="chk_avail_yes"
							style="display: none;"></span>

						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="29%" align="left" valign="middle">&nbsp;Sponsor
											Name</td>
										<td width="43%" align="left" valign="middle">&nbsp;Division
											Name</td>
										<td width="22%" align="left" valign="middle">&nbsp;User
											Name</td>
										<c:if
											test="${tl:rightsofView(resourceList,'View Sponsor User')==1}">
											<td width="6%" align="center" valign="middle">Delete</td>
										</c:if>
									</tr>
									<tbody id="sdubody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />

										<c:forEach items="${SponsorDevisionUserlist}"
											var="SponDivUserlist" varStatus="status2">

											<c:set var="sponsornamefield1" scope="page" value="" />
											<c:forEach items="${sponsorslist}" var="Slist"
												varStatus="status">
												<c:if
													test="${SponDivUserlist.sponsor_id == Slist.sponsor_id}">
													<c:set var="sponsornamefield1" value="${Slist.name}" />
												</c:if>
											</c:forEach>

											<c:set var="divisionnamefield1" scope="page" value="" />
											<c:forEach items="${SponsorDevisionlist}" var="SDlist"
												varStatus="status">
												<c:if
													test="${SponDivUserlist.devision_id == SDlist.devision_id}">
													<c:set var="divisionnamefield1" value="${SDlist.name}" />
												</c:if>
											</c:forEach>

											<c:set var="usernamefield1" scope="page" value="" />
											<c:forEach items="${users}" var="Ulist" varStatus="status">
												<c:if test="${SponDivUserlist.user_id == Ulist.user_id}">
													<c:set var="usernamefield1"
														value="${Ulist.first_name} ${Ulist.last_name}" />
												</c:if>
											</c:forEach>

											<c:set var="tempRowStyle2"
												value="${(status2.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle2}"
												id="${SponDivUserlist.sponsor_devision_user_id}">
												<td valign="top" align="left" class="set_padding">&nbsp;${sponsornamefield1}</td>
												<td valign="top" align="left" class="set_padding">${divisionnamefield1}</td>
												<td valign="top" align="left" class="set_padding">${usernamefield1}</td>
												<c:if
													test="${tl:rightsofView(resourceList,'View Sponsor User')==1}">
													<td valign="top" align="center" class="set_padding2"><a
														href="<c:url value='DeleteSponsorDivisionUser.spondiv?id=${SponDivUserlist.sponsor_devision_user_id}' />"><img
															src="images/delete.png" alt="del" title="Delete"
															border="0" /></a></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>



						</div>
					</div>
				</div>
				<!--  //////////////////////////////////////////End View Sponsor_User//////////////////////////////////// -->
				<!--  //////////////////////////////////////////End View Sponsor_User//////////////////////////////////// -->



				<form id="SponsorHiddenForm" name="SponsorHiddenForm"
					action="getDivisionOnSponsorChange.spondiv">
					<input type="hidden" id="SponsorDivisionHiddenAction"
						name="SponsorDivisionHiddenAction" value="" /> <input
						type="hidden" id="Field1" name="Field1" value="" /> <input
						type="hidden" id="Field2" name="Field2"
						value="${PreSelectedSponsor}" />
				</form>
				<form id="SponsorDivHiddenForm" name="SponsorDivHiddenForm"
					action="getUserOnDivisionChange.spondiv">
					<input type="hidden" id="SponsorDivisionUserHiddenAction"
						name="SponsorDivisionUserHiddenAction" value="" /> <input
						type="hidden" id="Field12" name="Field12" value="" /> <input
						type="hidden" id="Field22" name="Field22" value="" /> <input
						type="hidden" id="Field33" name="Field33"
						value="${PreSelectedDivision}" />
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

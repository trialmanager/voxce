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

<script type="text/javascript" src="js/users.js"></script>


<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
	$(document).ready(function() {
		$(".multiselect").multiselect();
		$(".ui-multiselect").css("width", "60%").css("float", "left");
		$(".available").css("width", "50.5%");
		$(".selected").css("width", "49.3%");
		$(".search").width("96%");
	});
</script>
</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="UserReturnMessage" id="UserReturnMessage"
		value="${MessageCode}" />
	<input type="hidden" name="EditUserMessageCode"
		id="EditUserMessageCode" value="${EditUserMessageCode}" />



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
						<c:if test="${tl:rightsofView(resourceList,'Create User')==1}">
							<a href="#" name="hrefCreate_User_Div" class="nav_l" id="current"
								onclick="LoadFormUsers('Create_User_Div')">User Profile</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View User')==1}">
							<a href="#" name="hrefView_User_Div" class="nav_l"
								onclick="LoadFormUsers('View_User_Div')">View User</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Set Group Rights')==1}">
							<a href="#" name="hrefAdd_UserGroup_Div" class="nav_l"
								onclick="LoadFormUsers('Add_UserGroup_Div')">User Groups</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv" style="">




				<!-- 												Start Create User-->
				<!-- 												Start Create User-->
				<div class="body_inner resourceRights" id="Create_User_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'Create User')}">

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='showUsersindex.users' />">User
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Create User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="Create_User_error_message" class="chk_avail_yes"
							style="display: none;"></div>
						<div class="myform user">
							<form id="Create_User_form" name="form" method="post"
								action="SaveUser.users" class="user">
								<label>Division Name :</label> <select
									id="Create_user_Division_Selection"
									name="Create_user_Division_Selection" class="drop_txt">
									<c:forEach items="${sponsordivisionlist}" var="division"
										varStatus="status">
										<option id="${division.devision_id}"
											value="${division.devision_id}" onclick="">${division.name}</option>
									</c:forEach>
								</select> <span id="Create_user_Division_Selection_error"
									class="error_label_grp"></span> <label>Language :</label> <select
									name="Create_User_Language_Selection"
									id="Create_User_Language_Selection" class="drop_txt">
									<c:forEach items="${Languageslist}" var="language"
										varStatus="status">
										<option id="${language.language_id}"
											value="${language.language_id}" onclick="">${language.name}</option>
									</c:forEach>
								</select> <span id="Create_User_Language_Selection_error"
									class="error_label_grp"></span> <label>User Name :</label> <input
									maxlength="200" name="Create_User_user_name" type="text"
									class="input_txt" id="Create_User_user_name"
									value="${us.login}"></input> <span
									id="Create_User_user_name_error" class="error_label_grp"
									style="color: #C02345;"></span><span
									id="Create_User_user_name_error1" class="error_label_grp"
									style="color: #C02345;"></span> <label>Password :</label> <input
									maxlength="16" name="Create_User_user_password" type="password"
									class="input_txt" id="Create_User_user_password"></input> <span
									id="Create_User_user_password_error1" class="error_label_grp"></span><span
									id="Create_User_user_password_error2" class="error_label_grp"></span>

								<label>Confirm Password :</label> <input maxlength="16"
									name="Create_User_user_password_confirm" type="password"
									class="input_txt" id="Create_User_user_password_confirm"></input>
								<span id="Create_User_user_password_confirm_error"
									class="error_label_grp"></span> <label>Title :</label> <select
									name="Create_user_Title" class="drop_txt_small">
									<option>Mr.</option>
									<option>Miss.</option>
									<option>Mrs.</option>
									<option>Ms.</option>
								</select> <span id="" class="error_label_grp"></span> <label>First
									Name :</label> <input maxlength="200" name="Create_user_First_Name"
									type="text" class="input_txt" id="Create_user_First_Name"
									value="${us.first_name}"></input> <span
									id="Create_user_First_Name_error" class="error_label_grp"></span><span
									id="Create_user_First_Name_error1" class="error_label_grp"></span>

								<label>Middle Name :</label> <input maxlength="200"
									name="Create_user_Middle_Name" type="text" class="input_txt"
									id="Create_user_Middle_Name" value="${us.middle_name}"></input>
								<span id="Create_user_Middle_Name_error" class="error_label_grp"></span><span
									id="Create_user_Middle_Name_error1" class="error_label_grp"></span>

								<label>Last Name :</label> <input maxlength="200"
									name="Create_user_Last_Name" type="text" class="input_txt"
									id="Create_user_Last_Name" value="${us.last_name}"></input> <span
									id="Create_user_Last_Name_error" class="error_label_grp"></span><span
									id="Create_user_Last_Name_error1" class="error_label_grp"></span>

								<label>Suffix :</label> <input maxlength="50"
									name="Create_user_Suffix" type="text" class="input_txt"
									id="Create_user_Suffix" value="${us.suffix}"></input> <span
									id="Create_user_Suffix_error" class="error_label_grp"></span> <label>E-mail
									:</label> <input maxlength="200" name="Create_user_Email_Address"
									type="text" class="input_txt" id="Create_user_Email_Address"
									value="${us.email}"></input> <span
									id="Create_user_Email_Address_error" class="error_label_grp"></span>

								<label>Address :</label> <input maxlength="200"
									name="Create_user_Address_1" type="text" class="input_txt"
									id="Create_user_Address_1" value="${us.address1}"></input> <span
									id="Create_user_Address_1_error" class="error_label_grp"></span>
								<input maxlength="200" name="Create_user_Address_2" type="text"
									class="input_txt2" id="Create_user_Address_2"
									value="${us.address2}"></input> <br /> <input maxlength="200"
									name="Create_user_Address_3" type="text" class="input_txt2"
									id="Create_user_Address_3" value="${us.address3}"></input> <br />

								<label>Country :</label> <select
									name="Create_User_Countries_Selection" class="drop_txt">
									<c:forEach items="${countrieslist}" var="countries"
										varStatus="status">
										<option id="${countries.COUNTRY_ID}"
											value="${countries.COUNTRY_ID}" onclick="">${countries.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span class="error_label_grp"></span> <label>City :</label> <input
									maxlength="200" name="Create_user_City" type="text"
									class="input_txt" id="Create_user_City" value="${us.city}"></input>
								<span id="Create_user_City_error" class="error_label_grp"></span>

								<label>State :</label> <input maxlength="200"
									name="Create_user_State" type="text" class="input_txt"
									id="Create_user_State" value="${us.state}"></input> <span
									id="Create_user_State_error" class="error_label_grp"></span> <label>Postal
									Code :</label> <input maxlength="18" name="Create_user_postal_Code"
									type="text" class="small" id="Create_user_postal_Code"
									value="${us.postal_code}"></input> <span
									id="Create_user_postal_Code_error" class="error_label_grp"></span>

								<label>Phone :</label> <input maxlength="18"
									name="Create_user_phone" type="text" class="input_txt"
									id="Create_user_phone" value="${us.phone}"></input> <span
									id="Create_user_phone_error" class="error_label_grp"></span> <label>Cell
									:</label> <input maxlength="18" name="Create_user_cell" type="text"
									class="input_txt" id="Create_user_cell" value="${us.cell}"></input>
								<span id="Create_user_cell_error" class="error_label_grp"></span>

								<label>Fax :</label> <input maxlength="18"
									name="Create_user_fax" type="text" class="input_txt"
									id="Create_user_fax" value="${us.fax}"></input> <span
									id="Create_user_fax_error" class="error_label_grp"></span> <label>Company
									:</label> <input maxlength="200" name="Create_user_company" type="text"
									class="input_txt" id="Create_user_company"
									value="${us.company}" /> <span id="Create_user_company_error"
									class="error_label_grp"></span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px;">
									<button class="blue-pill" type="submit">Save</button>
									<button type="reset" class="grey-pill">Reset</button>
								</div>
							</form>
						</div>

					</div>
				</div>



				<!--  												End Create User-->
				<!--  												End Create User-->

				<!--  												Start User View-->
				<!--  												Start User View-->

				<c:set var="zero" value="0" />
				<c:set var="one" value="1" />

				<div class="body_inner resourceRights" id="View_User_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'View User')}">

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='showUsersindex.users' />">User
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="field_set">
							<input id="View_users_Search_bar" name="View_users_Search_bar"
								type="text" class="input_txt" value="Search..." /> <span
								class="search_btn"><a href="#"><img
									src="images/search.png" alt="search" title="search" border="0" /></a></span>
						</div>

						<span id="ViewusersMessageCodeError" class="error_label_grp"
							style="display: none;">${EMessage}</span> <span
							id="ViewusersMessageCodeSuccess" class="chk_avail_yes"
							style="display: none;">${SMessage}</span>
						<div id="Edit_User_error_message" class="chk_avail_yes"
							style="display: none;"></div>
						<div class="active-user-button" style="float: right;">
							<input class='blue-pill active-inactive' value="Inactive Users"
								type="button" />
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Title</td>
										<td width="15%" align="left" valign="middle">&nbsp;User
											Name</td>
										<td width="15%" align="left" valign="middle">&nbsp;Full
											Name</td>
										<td width="15%" align="left" valign="middle">&nbsp;Email</td>
										<td width="15%" align="left" valign="middle">&nbsp;Address</td>
										<td width="15%" align="left" valign="middle">&nbsp;Contact
											Numbers</td>
										<td width="15%" align="left" valign="middle">&nbsp;Company
											Name</td>
										<c:if test="${tl:rightsofView(resourceList,'Edit User')==1}">
											<td width="8%" align="center" valign="middle">Edit</td>
										</c:if>
										<c:if
											test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
											<td width="8%" align="center" valign="middle">Inactivate</td>
										</c:if>
									</tr>
									<tbody id="fbody">
										<c:set var="ViewUsersTempVariablecss" scope="page"
											value="${true}" />

										<c:forEach items="${userslist}" var="uslist"
											varStatus="status">

											<c:choose>
												<c:when test="${ViewUsersTempVariablecss == true}">
													<tr class="white_row_view_list" id="${uslist.user_id}">
														<td valign="top" align="left" class="set_padding">${uslist.title}</td>
														<td valign="top" align="left" class="set_padding">${uslist.login}</td>
														<td valign="top" align="left" class="set_padding">${uslist.first_name}
															${uslist.middle_name} ${uslist.last_name}</td>
														<td valign="top" align="left" class="set_padding">${uslist.email}</td>
														<td valign="top" align="left" class="set_padding">${uslist.address1}
															, ${uslist.address2} , ${uslist.address3}</td>
														<td valign="top" align="left" class="set_padding">${uslist.phone},
															${uslist.cell}</td>
														<td valign="top" align="left" class="set_padding">${uslist.company}
														</td>
														<c:if
															test="${tl:rightsofView(resourceList,'Edit User')==1}">
															<td valign="top" align="center" class="set_padding2"><img
																onclick="edit_view_user_row('${uslist.user_id}','${uslist.login}','${uslist.password}','${uslist.address1}','${uslist.address2}','${uslist.address3}','${uslist.devision_id}','${uslist.preferred_language_id}','${uslist.title}','${uslist.country_id}','${uslist.first_name}', '${uslist.middle_name}' ,'${uslist.last_name}','${uslist.suffix}','${uslist.email}','${uslist.city}','${uslist.state}','${uslist.postal_code}','${uslist.phone}','${uslist.cell}','${uslist.fax}','${uslist.company}','${uslist.user_type }','${uslist.is_active }')"
																src="images/edit_row_icon.png" alt="Edit" title="Edit"
																border="0" /></td>
														</c:if>
														<td valign="top" align="center" class="set_padding2">
															<c:choose>
																<c:when test="${CurrentUser.user_id==uslist.user_id}">
																	<c:if
																		test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
																		<a href="javascript://"><img
																			src="images/deleteGrey.png" alt="Delete"
																			title="Delete" border="0" /></a>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<c:if
																		test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
																		<a
																			href="<c:url value='DeleteUser.users?userid=${uslist.user_id}&pak=${CurrentUser.user_id }' />"><img
																			src="images/delete.png" alt="Delete" title="Delete"
																			border="0" /></a>
																	</c:if>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</c:when>
												<c:when test="${ViewUsersTempVariablecss == false}">
													<tr class="grey_row_view_list" id="${uslist.user_id}">
														<td valign="top" align="left" class="set_padding">${uslist.title}</td>
														<td valign="top" align="left" class="set_padding">${uslist.login}</td>
														<td valign="top" align="left" class="set_padding">${uslist.first_name}
															${uslist.middle_name} ${uslist.last_name}</td>
														<td valign="top" align="left" class="set_padding">${uslist.email}</td>
														<td valign="top" align="left" class="set_padding">${uslist.address1}
															, ${uslist.address2} , ${uslist.address3}</td>
														<td valign="top" align="left" class="set_padding">${uslist.phone},
															${uslist.cell}</td>
														<td valign="top" align="left" class="set_padding">${uslist.company}
														</td>

														<c:if
															test="${tl:rightsofView(resourceList,'Edit User')==1}">
															<td valign="top" align="center" class="set_padding2"><img
																onclick="edit_view_user_row('${uslist.user_id}','${uslist.login}','${uslist.password}','${uslist.address1}','${uslist.address2}','${uslist.address3}','${uslist.devision_id}','${uslist.preferred_language_id}','${uslist.title}','${uslist.country_id}','${uslist.first_name}', '${uslist.middle_name}' ,'${uslist.last_name}','${uslist.suffix}','${uslist.email}','${uslist.city}','${uslist.state}','${uslist.postal_code}','${uslist.phone}','${uslist.cell}','${uslist.fax}','${uslist.company}','${uslist.user_type }','${uslist.is_active}')"
																src="images/edit_row_icon.png" alt="Edit" title="Edit"
																border="0" /></td>
														</c:if>
														<td valign="top" align="center" class="set_padding2">

															<c:choose>
																<c:when test="${CurrentUser.user_id==uslist.user_id}">
																	<c:if
																		test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
																		<a href="javascript://"><img
																			src="images/deleteGrey.png" alt="Delete"
																			title="Delete" border="0" /></a>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<c:if
																		test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
																		<a
																			href="<c:url value='DeleteUser.users?userid=${uslist.user_id}&pak=${CurrentUser.user_id }' />"><img
																			src="images/delete.png" alt="Delete" title="Delete"
																			border="0" /></a>
																	</c:if>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</c:when>
											</c:choose>



											<c:choose>
												<c:when test="${ViewUsersTempVariablecss == true}">
													<c:set var="ViewUsersTempVariablecss" scope="page"
														value="${false}" />
												</c:when>
												<c:when test="${ViewUsersTempVariablecss == false}">
													<c:set var="ViewUsersTempVariablecss" scope="page"
														value="${true}" />
												</c:when>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>
								<table id="View_inactive_user_Table" style="display: none;"
									width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="12%" align="left" valign="middle">&nbsp;Title</td>
										<td width="12%" align="left" valign="middle">&nbsp;User
											Name</td>
										<td width="12%" align="left" valign="middle">&nbsp;Full
											Name</td>
										<td width="12%" align="left" valign="middle">&nbsp;Email</td>
										<td width="12%" align="left" valign="middle">&nbsp;Address</td>
										<td width="12%" align="left" valign="middle">&nbsp;Contact
											Numbers</td>
										<td width="12%" align="left" valign="middle">&nbsp;Company
											Name</td>
										<c:if test="${tl:rightsofView(resourceList,'Edit User')==1}">
											<td width="8%" align="center" valign="middle">Edit</td>
										</c:if>
										<c:if
											test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
											<td width="8%" align="center" valign="middle">Activate</td>
										</c:if>
									</tr>
									<tbody id="fbody">
										<c:set var="ViewUsersTempVariablecss" scope="page"
											value="${true}" />

										<c:forEach items="${inActiveList}" var="uslist"
											varStatus="status">

											<c:choose>
												<c:when test="${ViewUsersTempVariablecss == true}">
													<tr class="white_row_view_list" id="${uslist.user_id}">
														<td valign="top" align="left" class="set_padding">${uslist.title}</td>
														<td valign="top" align="left" class="set_padding">${uslist.login}</td>
														<td valign="top" align="left" class="set_padding">${uslist.first_name}
															${uslist.middle_name} ${uslist.last_name}</td>
														<td valign="top" align="left" class="set_padding">${uslist.email}</td>
														<td valign="top" align="left" class="set_padding">${uslist.address1}
															, ${uslist.address2} , ${uslist.address3}</td>
														<td valign="top" align="left" class="set_padding"><strong>${uslist.phone},
																${uslist.cell}</strong></td>
														<td valign="top" align="left" class="set_padding">${uslist.company}
														</td>
														<c:if
															test="${tl:rightsofView(resourceList,'Edit User')==1}">
															<td valign="top" align="center" class="set_padding2">
																<img
																onclick="edit_view_user_row('${uslist.user_id}','${uslist.login}','${uslist.password}','${uslist.address1}','${uslist.address2}','${uslist.address3}','${uslist.devision_id}','${uslist.preferred_language_id}','${uslist.title}','${uslist.country_id}','${uslist.first_name}', '${uslist.middle_name}' ,'${uslist.last_name}','${uslist.suffix}','${uslist.email}','${uslist.city}','${uslist.state}','${uslist.postal_code}','${uslist.phone}','${uslist.cell}','${uslist.fax}','${uslist.company}','${uslist.user_type }','${uslist.is_active }')"
																src="images/edit_row_icon.png" alt="Edit" title="Edit"
																border="0" />
															</td>
														</c:if>
														<c:if
															test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
															<td valign="top" align="center" class="set_padding2"><a
																href="<c:url value='ActiveUser.users?userid=${uslist.user_id}' />">
																	<img src="images/tick.png" alt="Activate"
																	title="Activate" border="0" />
															</a></td>
														</c:if>
													</tr>
												</c:when>
												<c:when test="${ViewUsersTempVariablecss == false}">
													<tr class="grey_row_view_list" id="${uslist.user_id}">
														<td valign="top" align="left" class="set_padding">${uslist.title}</td>
														<td valign="top" align="left" class="set_padding">${uslist.login}</td>
														<td valign="top" align="left" class="set_padding">${uslist.first_name}
															${uslist.middle_name} ${uslist.last_name}</td>
														<td valign="top" align="left" class="set_padding">${uslist.email}</td>
														<td valign="top" align="left" class="set_padding">${uslist.address1}
															, ${uslist.address2} , ${uslist.address3}</td>
														<td valign="top" align="left" class="set_padding"><strong>${uslist.phone},
																${uslist.cell}</strong></td>
														<td valign="top" align="left" class="set_padding">${uslist.company}
														</td>
														<c:if
															test="${tl:rightsofView(resourceList,'Edit User')==1}">
															<td valign="top" align="center" class="set_padding2">
																<img
																onclick="edit_view_user_row('${uslist.user_id}','${uslist.login}','${uslist.password}','${uslist.address1}','${uslist.address2}','${uslist.address3}','${uslist.devision_id}','${uslist.preferred_language_id}','${uslist.title}','${uslist.country_id}','${uslist.first_name}', '${uslist.middle_name}' ,'${uslist.last_name}','${uslist.suffix}','${uslist.email}','${uslist.city}','${uslist.state}','${uslist.postal_code}','${uslist.phone}','${uslist.cell}','${uslist.fax}','${uslist.company}','${uslist.user_type }','${uslist.is_active }')"
																src="images/edit_row_icon.png" alt="Edit" title="Edit"
																border="0" />
															</td>
														</c:if>
														<c:if
															test="${tl:rightsofView(resourceList,'Avtive/Inaactive User')==1}">
															<td valign="top" align="center" class="set_padding2">
																<a
																href="<c:url value='ActiveUser.users?userid=${uslist.user_id}' />"><img
																	src="images/tick.png" alt="Activate" title="Activate"
																	border="0" /></a>
															</td>
														</c:if>
													</tr>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ViewUsersTempVariablecss == true}">
													<c:set var="ViewUsersTempVariablecss" scope="page"
														value="${false}" />
												</c:when>
												<c:when test="${ViewUsersTempVariablecss == false}">
													<c:set var="ViewUsersTempVariablecss" scope="page"
														value="${true}" />
												</c:when>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>

				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////Start Edit User////////////////////////////////////////////////////////////-->
				<div class="body_inner" id="Edit_User_Div" style="display: none;">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='showUsersindex.users' />">User
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Edit User</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id=""></a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="Edit_group_container">

						<div id="user" class="myform user">
							<form id="Edit_User_form" name="form" method="post"
								action="EditUser.users">
								<input type="hidden" id="Edit_user_usertype"
									name="Edit_user_usertype" /> <label>Division Name :</label> <select
									id="Edit_user_Division_Selection"
									name="Edit_user_Division_Selection" class="drop_txt">
									<c:forEach items="${sponsordivisionlist}" var="division"
										varStatus="status">
										<option id="${division.devision_id}"
											value="${division.devision_id}" onclick="">${division.name}</option>
									</c:forEach>
								</select> <span id="Edit_user_Division_Selection_error"
									class="error_label_grp"></span> <input name="Edit_User_user_id"
									type="text" class="input_txt" id="Edit_User_user_id"
									style="display: none;"></input><input name="Edit_User_user_active"
									type="text" class="input_txt" id="Edit_User_user_active"
									style="display: none;"></input> <input
									name="Edit_User_user_name" type="text" class="input_txt"
									id="Edit_User_user_name" style="display: none;"></input> <label>Language
									:</label> <select name="Edit_User_Language_Selection"
									id="Edit_User_Language_Selection" class="drop_txt">
									<c:forEach items="${Languageslist}" var="language"
										varStatus="status">
										<option id="${language.language_id}"
											value="${language.language_id}" onclick="">${language.name}</option>
									</c:forEach>
								</select> <span id="Edit_User_Language_Selection_error"
									class="error_label_grp"></span>

								<!-- <label>New Password :</label>-->
								<input maxlength="16" name="Edit_User_user_password"
									type="hidden" class="input_txt" id="Edit_User_user_password"></input>
								<span id="Edit_User_user_password_error" class="error_label_grp"></span><span
									id="Edit_User_user_password_error1" class="error_label_grp"></span>

								<!--	<label>Confirm Password :</label>
					<input maxlength="16" name="Edit_User_user_password_confirm" type="password" class="input_txt" id="Edit_User_user_password_confirm"  ></input> <span id="Edit_User_user_password_confirm_error" class="error_label_grp"></span>
			 -->
								<label>Title :</label> <select name="Edit_user_Title"
									class="drop_txt_small">
									<option>Mr.</option>
									<option>Miss.</option>
									<option>Mrs.</option>
									<option>Ms.</option>
								</select> <span class="error_label_grp"></span> <label>First Name
									:</label> <input maxlength="200" name="Edit_user_First_Name"
									type="text" class="input_txt" id="Edit_user_First_Name"
									value="${us.first_name}"></input> <span
									id="Edit_user_First_Name_error" class="error_label_grp"></span>
								<span id="Edit_user_First_Name_error1" class="error_label_grp"></span>

								<label>Middle Name :</label> <input maxlength="200"
									name="Edit_user_Middle_Name" type="text" class="input_txt"
									id="Edit_user_Middle_Name" value="${us.middle_name}"></input> <span
									id="Edit_user_Middle_Name_error" class="error_label_grp"></span>
								<span id="Edit_user_Middle_Name_error1" class="error_label_grp"></span>

								<label>Last Name :</label> <input maxlength="200"
									name="Edit_user_Last_Name" type="text" class="input_txt"
									id="Edit_user_Last_Name" value="${us.last_name}"></input> <span
									id="Edit_user_Last_Name_error" class="error_label_grp"></span>
								<span id="Edit_user_Last_Name_error1" class="error_label_grp"></span>

								<label>Suffix :</label> <input maxlength="50"
									name="Edit_user_Suffix" type="text" class="input_txt"
									id="Edit_user_Suffix" value="${us.suffix}"></input> <span
									id="Edit_user_Suffix_error" class="error_label_grp"></span> <label>E-mail
									:</label> <input maxlength="200" name="Edit_user_Email_Address"
									type="text" class="input_txt" id="Edit_user_Email_Address"
									value="${us.email}"></input> <span
									id="Edit_user_Email_Address_error" class="error_label_grp"></span>

								<label>Address :</label> <input maxlength="200"
									name="Edit_user_Address_1" type="text" class="input_txt"
									id="Edit_user_Address_1" value="${us.address1}"></input> <span
									id="Edit_user_Address_1_error" class="error_label_grp"></span>
								<input maxlength="200" name="Edit_user_Address_2" type="text"
									class="input_txt2" id="Edit_user_Address_2"
									value="${us.address2}"></input> <br /> <input maxlength="200"
									name="Edit_user_Address_3" type="text" class="input_txt2"
									id="Edit_user_Address_3" value="${us.address3}"></input> <br />

								<label>Country :</label> <select
									id="Edit_User_Countries_Selection"
									name="Edit_User_Countries_Selection" class="drop_txt">
									<c:forEach items="${countrieslist}" var="countries"
										varStatus="status">
										<option id="${countries.COUNTRY_ID}"
											value="${countries.COUNTRY_ID}" onclick="">${countries.COUNTRY_NAME}</option>
									</c:forEach>
								</select> <span class="error_label_grp"></span> <label>City :</label> <input
									maxlength="200" name="Edit_user_City" type="text"
									class="input_txt" id="Edit_user_City" value="${us.city}"></input>
								<span id="Edit_user_City_error" class="error_label_grp"></span>

								<label>State :</label> <input maxlength="200"
									name="Edit_user_State" type="text" class="input_txt"
									id="Edit_user_State" value="${us.state}"></input> <span
									id="Edit_user_State_error" class="error_label_grp"></span> <label>Postal
									Code :</label> <input maxlength="18" name="Edit_user_postal_Code"
									type="text" class="small" id="Edit_user_postal_Code"
									value="${us.postal_code}"></input> <span
									id="Edit_user_postal_Code_error" class="error_label_grp"></span>

								<label>Phone :</label> <input maxlength="18"
									name="Edit_user_phone" type="text" class="input_txt"
									id="Edit_user_phone" value="${us.phone}"></input> <span
									id="Edit_user_phone_error" class="error_label_grp"></span> <label>Cell
									:</label> <input maxlength="18" name="Edit_user_cell" type="text"
									class="input_txt" id="Edit_user_cell" value="${us.cell}"></input>
								<span id="Edit_user_cell_error" class="error_label_grp"></span>

								<label>Fax :</label> <input maxlength="18" name="Edit_user_fax"
									type="text" class="input_txt" id="Edit_user_fax"
									value="${us.fax}"></input> <span id="Edit_user_fax_error"
									class="error_label_grp"></span> <label>Company :</label> <input
									maxlength="200" name="Edit_user_company" type="text"
									class="input_txt" id="Edit_user_company" value="${us.company}" />
								<span id="Edit_user_company_error" class="error_label_grp"></span>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" id="CancelUserEditing">Cancel</button>
								</div>


							</form>
						</div>

					</div>
				</div>

				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->
				<!--  /////////////////////////////////////////////End Edit User////////////////////////////////////////////////////////////-->


				<!--  												End User View-->
				<!--  												End User View-->



				<!-- ////////////////////////////////////////Start Add User Groups////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////StartAdd User  Groups////////////////////////////////////////////////////// -->
				<c:if test="${tl:rightsofView(resourceList,'User Groups')==1}">
					<c:choose>
						<c:when test="${tl:rightsofView(resourceList,'User Profile')==0}">
							<div class="body_inner" id="Add_UserGroup_Div"
								style="display: block;">
						</c:when>
						<c:otherwise>
							<div class="body_inner" id="Add_UserGroup_Div"
								style="display: none;">
						</c:otherwise>
					</c:choose>
					<div class="body_inner_header" id="Add_UserGroup_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='showUsersindex.users' />">User
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Assign Group to User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<span id="UserGroup_Main_Error" class="error_label_grp"
							style="display: none; width: auto;">${UGError}</span> <span
							id="UserGroup_Main_Success" class="chk_avail_yes"
							style="display: none; width: auto;">${UGSuccess}</span>

						<div class="myform site">
							<form id="Add_UserGroup_Form" name="Add_UserGroup_Form"
								method="post" action="SaveUserGroups.users" class="site">

								<label>User Name</label> <select name="UserGroup_User_Name"
									id="UserGroup_User_Name" class="drop_txt">
									<c:forEach items="${userslist}" var="uslist"
										varStatus="status1">
										<option id="${uslist.user_id}" value="${uslist.user_id}"
											onclick="">${uslist.first_name} ${uslist.last_name}
											(${uslist.email})</option>
									</c:forEach>

								</select> <span class="error_label_grp"></span> <label>Group Name
									:</label> <select id="UserGroup_Group_Name" name="UserGroup_Group_Name"
									class="multiselect" multiple="multiple">
									<c:forEach items="${GroupList}" var="GList" varStatus="status2">
										<option id="${GList.id}" value="${GList.id}">${GList.name}
										</option>
									</c:forEach>
								</select> <select id="UserGroup_Group_Name_Hidden"
									name="UserGroup_Group_Name_Hidden" style="display: none;">
									<c:forEach items="${userGroupList}" var="Sel_GList"
										varStatus="status2">
										<option id="${Sel_GList.group_id}"
											value="${Sel_GList.group_id}">${Sel_GList.group_id}
										</option>
									</c:forEach>
								</select>


								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
								</div>
							</form>
						</div>
					</div>

				</c:if>
			</div>
			<!-- ////////////////////////////////////////End Add User Groups////////////////////////////////////////////////////// -->
			<!-- ////////////////////////////////////////End Add User Groups////////////////////////////////////////////////////// -->


			<form id="usershiddenform" name="usershiddenform"
				action="HiddenActions.users">
				<input type="hidden" id="typeofaction" name="typeofaction" value=""></input>
				<input type="hidden" id="HiddenValue1" name="HiddenValue1" value=""></input>
				<input type="hidden" id="HiddenValue2" name="HiddenValue2"
					value="${LastUserID}"></input>
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


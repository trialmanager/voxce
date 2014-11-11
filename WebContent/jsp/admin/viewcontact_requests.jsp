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
	$(document).ready(
			function() {
				$(".requests").click(function() {
					$("#View_users_Search_bar_sub").val("");
					$("#View_users_Search_bar").val("");
					$("tr").css("display", "table-row");
					$(".subrequest_view").toggle();
					$(".sub_view").toggle();
					$(".active-inactive").toggle();
					if ($(this).val() == "Subscribers Requests") {
						$(this).val("Show Subscribers");
					} else {
						$(this).val("Subscribers Requests");
					}
				});

				$.expr[':'].containsIgnoreCase = function(e, i, m) {
					return jQuery(e).text().toUpperCase().indexOf(
							m[3].toUpperCase()) >= 0;
				};

				$("#View_users_Search_bar_sub").keyup(function() {
					$("#fbodysubrequest").find("tr").hide();
					var data = this.value.split(" ");
					var jo = $("#fbodysubrequest").find("tr");
					$.each(data, function(i, v) {
						//Use the new containsIgnoreCase function instead
						jo = jo.filter("*:containsIgnoreCase('" + v + "')");
					});

					jo.show();

				}).focus(function() {
					this.value = "";
					$(this).css({
						"color" : "black"
					});
					$(this).unbind('focus');
				}).css({
					"color" : "#C0C0C0"
				});
				var wid = $(".body_content").outerWidth();
				wid = wid - 280;
				$('.right_body_content').css('width', wid);
				elipsis();

			});
</script>
<style>
span.tooltip-style1 {
	display: none;
	position: absolute;
	z-index: 1000;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 6px;
	border: solid 1px black;
	opacity: .9;
}

.tooltip-style1 {
	background: #5a85a5;
	color: white;
	min-height: 30px;
	padding: 10px 10px 10px 10px;
	opacity: .9;
}

.tooltip-style2 {
	background: #363636;
	padding: 3px;
	color: white;
	text-align: center;
}

.tooltip-style3 {
	background: #e8e8e8;
	color: black;
	padding: 15px;
}

pre {
	font-size: 10px;
}
</style>
</head>

<body onload="LoadFormUsers('View_User_Div')">
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="UserReturnMessage" id="UserReturnMessage"
		value="${MessageCode}" />
	<input type="hidden" name="EditUserMessageCode"
		id="EditUserMessageCode" value="${EditUserMessageCode}" />

	<div id="pop-up"
		style="display: none; z-index: 1; position: absolute; left: 0px; top: 0px; background-color: #0E8CCD; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 27px; width: 150px;">
	</div>

	<!-- wrapper starts here -->
	<div class="wrapper">

		<!-- logo_area starts here -->
		<div class="logo_area">
			<!-- logo placeholder here -->
			<div class="logo">
				<a href="javascript://"><img src="images/logo.jpg" border="0"
					alt="logo" /></a>
			</div>
			<!-- logo placehorder ends here -->

			<!-- logoout and welcome placeholder starts here -->
			<div class="logoout_welcome_area">
				<div class="logout_btn">
					<a href="<c:url value='Logout.htm' />"><img
						src="images/logout_btn.jpg" alt="logout" border="0" /></a>
				</div>
				<div class="welcome_area">
					<div class="welcome_corner"></div>
					<span>Welcome:</span> <strong>
						<%
							out.println(obj.getLogin());
						%>
					</strong>
				</div>
			</div>
			<!-- logoout and welcome placeholder ends here -->

		</div>
		<!-- logo_area ends here -->

		<!-- menu starts here -->
		<div class="menu_bar">
			<div class="top_menu_set">
				<c:set var="userType" value="admin" />
				<c:choose>
					<c:when test="${user == userType }">
						<a href="javascript://" class="current_btn"><span>Administrator</span></a>
					</c:when>
					<c:otherwise>
						<a href="javascript://" class="current_btn"><span>Subscribers</span></a>
					</c:otherwise>
				</c:choose>

				<!--<a href="<c:url value='showUsersindex.users' />" class="current_btn"><span>User Management</span></a>
				<a href="<c:url value='showGroupsindex.groups' />" class="top_btn"><span>Group Management</span></a>	
				<a href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />" class="top_btn"><span>Library</span></a>	
				<a href="<c:url value='ShowSponsorDivIndex.spondiv' />" class="top_btn"><span>Sponsor & Division</span></a>	
				<a href="<c:url value='ShowSitesIndex.sites' />" class="top_btn"><span>Sites</span></a>
				<a href="<c:url value='ShowVisitsIndex.visits' />" class="top_btn"><span>Visits</span></a>
				<a href="<c:url value='ShowCRFIndex.crf?CurrentForm=add_question_form' />" class="top_btn"><span>Form</span></a></div>
				-->
			</div>
		</div>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<a href="javascript://" name="hrefView_User_Div" class="nav_l "
							id="current" onclick="LoadFormUsers('View_User_Div')">View
							Administrator</a>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv"
				style="overflow: scroll;">

				<!--  												Start User View-->
				<!--  												Start User View-->


				<div class="body_inner" id="View_User_Div" style="display: block;">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="ShowControlPanle.adm">Control Panel</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">View User</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<span id="ViewusersMessageCodeError" class="error_label_grp"
							style="display: none;">${EMessage}</span> <span
							id="ViewusersMessageCodeSuccess" class="chk_avail_yes"
							style="display: none;">${SMessage}</span>
						<div id="Edit_User_error_message" class="chk_avail_yes"
							style="display: none;"></div>

						<div class="show_hide_form sub_view">
							<div class="field_set">
								<input id="View_users_Search_bar" name="View_users_Search_bar"
									type="text" class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="javascript://"><img
										src="images/search.png" alt="search" title="search" border="0" /></a></span>
							</div>

							<div class="field_txt_view_list">
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="12%" align="left" valign="middle">&nbsp;Title</td>
										<td width="12%" align="left" valign="middle">&nbsp;Full
											Name</td>
										<td width="12%" align="left" valign="middle">&nbsp;Email</td>
										<td width="12%" align="left" valign="middle">&nbsp;Department</td>
										<td width="12%" align="left" valign="middle">&nbsp;Phone
											No</td>
										<td width="12%" align="left" valign="middle">&nbsp;Company</td>
										<td width="12%" align="left" valign="middle">&nbsp;Address</td>
										<td width="12%" align="left" valign="middle">&nbsp;Refferal
											Name</td>
										<td width="12%" align="left" valign="middle">&nbsp;Comments</td>
									</tr>
									<tbody id="fbody">
										<c:set var="ViewUsersTempVariablecss" scope="page"
											value="${true}" />

										<c:forEach items="${userslist}" var="uslist" varStatus="status">

											<tr class="white_row_view_list">
												<td valign="top" align="left" class="set_padding">${uslist.title}</td>
												<td valign="top" align="left" class="set_padding">${uslist.salutation}
													${uslist.first_name} ${uslist.last_name}</td>
												<td valign="top" align="left" class="set_padding">${uslist.email}</td>
												<td valign="top" align="left" class="set_padding">${uslist.department}</td>
												<td valign="top" align="left" class="set_padding"><strong>${uslist.phone}</strong></td>
												<td valign="top" align="left" class="set_padding">${uslist.company}</td>
												<td valign="top" align="left" class="set_padding">${uslist.address}</td>
												<td valign="top" align="left" class="set_padding">${uslist.refferal_name}</td>
												<td valign="top" align="left" class="set_padding ">${uslist.comments}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>


						<div class="subrequest_view" style="display: none;">
							<div class="field_set">
								<input id="View_users_Search_bar_sub"
									name="View_users_Search_bar_sub" type="text" class="input_txt"
									value="Search..." /> <span class="search_btn"><a
									href="javascript://"><img src="images/search.png"
										alt="search" title="search" border="0" /></a></span>
							</div>
							<div class="field_txt_view_list">
								<table id="View_user_Table_subrequest" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
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

										<td width="8%" align="center" valign="middle">Activate</td>
									</tr>
									<tbody id="fbodysubrequest">
										<c:set var="ViewUsersTempVariablecss" scope="page"
											value="${true}" />

										<c:forEach items="${subReqList}" var="subreq"
											varStatus="status">

											<c:choose>
												<c:when test="${ViewUsersTempVariablecss == true}">
													<tr class="white_row_view_list" id="${subreq.user_id}">
														<td valign="top" align="left" class="set_padding">${subreq.title}</td>
														<td valign="top" align="left" class="set_padding">${subreq.login}</td>
														<td valign="top" align="left" class="set_padding">${subreq.first_name}
															${subreq.middle_name} ${subreq.last_name}</td>
														<td valign="top" align="left" class="set_padding">${subreq.email}</td>
														<td valign="top" align="left" class="set_padding">${subreq.address1}
															, ${subreq.address2} , ${subreq.address3}</td>
														<td valign="top" align="left" class="set_padding"><strong>${subreq.phone},
																${subreq.cell}</strong></td>
														<td valign="top" align="left" class="set_padding">${subreq.company}</td>
														<td valign="top" align="center" class="set_padding2"><a
															href="ActiveSubscription.adm?userid=${subreq.user_id}&user=${user}"><img
																src="images/tick.png" alt="Activate" title="Activate"
																border="0" /></a></td>

													</tr>
												</c:when>
												<c:when test="${ViewUsersTempVariablecss == false}">
													<tr class="grey_row_view_list" id="${subreq.user_id}">
														<td valign="top" align="left" class="set_padding">${subreq.title}</td>
														<td valign="top" align="left" class="set_padding">${subreq.login}</td>
														<td valign="top" align="left" class="set_padding">${subreq.first_name}
															${subreq.middle_name} ${subreq.last_name}</td>
														<td valign="top" align="left" class="set_padding">${subreq.email}</td>
														<td valign="top" align="left" class="set_padding">${subreq.address1}
															, ${subreq.address2} , ${subreq.address3}</td>
														<td valign="top" align="left" class="set_padding"><strong>${subreq.phone},
																${subreq.cell}</strong></td>
														<td valign="top" align="left" class="set_padding">${subreq.company}</td>
														<td valign="top" align="center" class="set_padding2"><a
															href="ActiveSubscription.adm?userid=${subreq.user_id}&user=${user}"><img
																src="images/tick.png" alt="Activate" title="Activate"
																border="0" /></a></td>
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
			</div>
		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<div class="footer_bar">
			<div class="footer_left">
				<a href="javascript://" class="flinks">Home</a> | <a
					href="javascript://" class="flinks">About Us</a> | <a
					href="javascript://" class="flinks">FAQ</a> | <a
					href="javascript://" class="flinks">Logout</a> | <a
					href="javascript://" class="flinks">Contact Us</a>
			</div>

			<!-- footer ends here -->

		</div>
	</div>
	<!-- wrapper ends here -->
	<div id="header_wrapper" class="tooltips">
		<pre>
		</pre>
		<span class="tooltip-style1"> </span>
	</div>
</body>
</html>


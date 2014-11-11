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


<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>

<script type="text/javascript" src="JQuery/jquery-ui.min.js"></script>


<script type="text/javascript" src="js/visits.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>

<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<link href="css/crf.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/payment.css" rel="stylesheet" type="text/css" />
<link href="css/visits.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>
<!-- <link href="css/tooltipStyle.css" rel="stylesheet" type="text/css" />  -->
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />

<script>
	$(document).ready(function() {
		//$("#datepicker1").datepick({dateFormat: 'yyyy-mm-dd'});
		$("#datepicker1").datepicker({
			 changeMonth: true,
	            changeYear: true,
			dateFormat : 'yy-mm-dd'
		});

	});
</script>
<style>
span.tooltip-style1 {
	display: none;
	position: absolute;
	z-index: 1000;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
}

.tooltip-style1 {
	background: #5a85a5 url(/public/images/icons/onebit_47.png) 10px center
		no-repeat;
	color: white;
	min-height: 30px;
	padding: 10px 20px 10px 65px;
	opacity: 0.9;
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

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" id="study" value="${study }"></input>
	<!-- wrapper starts here -->
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<c:if test="${tl:rightsofView(resourceList,'Create Visit')==1}">
							<a href="#" class="nav_l" name="hrefCreate_Visit_Div"
								onclick="LoadVisitsForm('Create_Visit_Div')">Create Visit</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Visit')==1}">
							<a href="#" class="nav_l" name="hrefView_Visitlist_Div"
								onclick="LoadVisitsForm('View_Visitlist_Div')">Visits List</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<!-- ************************************************************************************************************************************************** -->
				<!-- ****************************************************Start Create Visit *************************************************************************** -->
				<div class="body_inner resourceRights" id="Create_Visit_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'Create Visit')}">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowVisitsIndex.visits' />">Visits</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Create Visit</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform visit">
							<form id="createVisitForm" name="createVisitForm" method="post"
								action="createVisit.visits" class="visit">
								<span id="Create_Visit_Main_Error" class="error_label_grp"
									style="width: 244px; display: none;">${error_message}</span> <span
									id="Create_Visit_Main_Success" class="chk_avail_yes"
									style="display: none;">${message}</span> <label>Select
									Study</label> <select name="study" class="study_select drop_txt">

									<option value="0">Please Select Study</option>
									<c:forEach items="${studyList}" var="study"
										varStatus="studyStatus">
										<option studyName="${study.study_name}"
											value="${study.study_id}">${study.study_name}</option>
									</c:forEach>
								</select><span id="noStudy" style="float: left;"></span> <label>Visit
									Name : </label> <select style="display: none" name="hiddenvisitname"
									class="site_drop_txt drop_txt element" id="hiddenvisitname"
									style="float:left;text-align:center;">
									<option id="zero" value="0">----- Select Visit ----</option>
									<c:forEach items="${Visitslist}" var="vntlist"
										varStatus="status">
										<c:forEach items="${VisitNameTextslist}" var="visitname"
											varStatus="status">
											<c:if
												test="${visitname.visit_name_text_id== vntlist.visit_name_text_id}">
												<option id="${visitname.visit_name}"
													study="${vntlist.study_id}" value="${vntlist.visit_id}"
													onclick="">${visitname.visit_name}</option>
											</c:if>
										</c:forEach>
									</c:forEach>
								</select> <select name="visitName" class="site_drop_txt drop_txt element"
									id="visitName"
									style="float: left; text-align: center; display: none;">
									<option id="zero" value="0">----- Select Visit ----</option>

								</select>
								<!-- <a href = "javascript://" style = "float:left;margin-left:5px;text-decoration: none;color:#1090D1;" class = "show-my-own">Add New Visit Text</a> -->
								<input type="text" name="visit_name" id="visit_name"
									style="margin-left: 5px; width: 150px;" class="myOwn input_txt"
									maxlength="255" /> <span id="visitName_error"
									class="error_label"></span> <label>Is Related :</label><input
									type="checkbox" style="float: left;"
									class="checkbox_IsRepeted element" />
								<div class="visit_related_with"
									style="width: 90%; float: left; display: none;">
									<label>Select Visit:</label> <select name="relatedVisit"
										class="site_drop_txt drop_txt element" id="visitRelated"
										style="float: left; text-align: center;">
										<option id="zeror" value="0">----- Select Visit to
											RelRstyate----</option>
									</select> <label>Optimum Days</label> <input id='optimum_days'
										class="element input_txt" name="dateOfVisit"
										style="float: left;" /><span id="noDate" style="float: left;"></span>
								</div>

								<label>Visit Description:</label>
								<textarea id="visitDescription" class="element"
									name="visitDescription"></textarea>
								<span id="visitDescription_error" class="error_label_grp"></span>
								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Type :</label><br />
									<div style="float: left">
										<input id="mandatory" class="type-of-visit element"
											name="mandatory" type="checkbox" /> <span class="txt_norm">Mandatory</span>
										<input id="scheduled" class="type-of-visit element"
											name="scheduled" type="checkbox" /> <span class="txt_norm">Scheduled</span>
										<input id="monitor" class="type-of-visit element"
											name="monitor" type="checkbox" /> <span class="txt_norm">Monitoring</span>
										<input id="adverse" class="type-of-visit element"
											name="adverse" type="checkbox" /> <span class="txt_norm">Adverse
											Event</span>
									</div>
									<label id="primaryVisitLabel">Primary Visit :</label>
									<div style="float: left">
										<input id="primaryVisit" class="type-of-visit element"
											name="primaryVisit" type="checkbox" style="margin-top: 8px;" />
									</div>
									<span id="typesVisit" class="error_label_grp"></span>
								</div>
								<div class="visit_related_with"
									style="width: 90%; float: left; display: none;">
									<label>Window Open :</label> <input id="openWindow"
										name="openWindow" type="text" value=""
										class="input_txt element" /> <span id="openWindow_error"
										class="error_label"></span> <label>Window Close :</label> <input
										id="closeWindow" name="closeWindow" type="text" value=""
										class="input_txt element" /> <span id="closeWindow_error"
										class="error_label"></span>
								</div>
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<input type="hidden" class="is_rel" /> <input
										class="blue-pill submit-button" type="button" value="Save" />
								</div>
							</form>
						</div>
					</div>

				</div>

				<!-- ****************************************************End Create Visit*************************************************************************** -->
				<!-- *********************************************************************************************************************************************** -->

				<!-- ******************************************************************************************************************************* -->
				<!-- ****************************************************Start Visit List*************************************************************************** -->
				<c:set value="0" var="zero"></c:set>
				<c:set value="1" var="one"></c:set>

				<div class="body_inner resourceRights" id="View_Visitlist_Div"
					style="display: none;"
					right="${tl:rightsofView(resourceList,'View Visit')}">

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='ShowVisitsIndex.visits' />">Visits</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View Visits</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="show_hide_form">
							<span id="view_Visit_Main_Error" class="error_label_grp"
								style="width: 244px; display: none;">${error_message}</span> <span
								id="view_Visit_Main_Success" class="chk_avail_yes"
								style="display: none;">${message}</span>
							<div class="field_txt_view_list">

								<select id="Visit_study_Search_baro" class="drop_txt">
									<c:forEach items="${studyList}" var="study"
										varStatus="crfState">

										<option value="${study.study_name}">${study.study_name}</option>

									</c:forEach>
								</select>
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="15%" align="left" valign="middle"
											style="display: none;">&nbsp;Study</td>
										<td width="15%" align="left" valign="middle">&nbsp;Visit</td>
										<td width="7%" align="left" valign="middle">&nbsp;Scheduled</td>
										<td width="9%" align="left" valign="middle">&nbsp;Adverse
											Event</td>
										<td width="6%" align="left" valign="middle">&nbsp;Monitor</td>
										<td width="7%" align="left" valign="middle">&nbsp;Mandatory</td>
										<td width="9%" align="left" valign="middle">&nbsp;Windows
											Open</td>
										<td width="9%" align="left" valign="middle">&nbsp;Windows
											Close</td>
										<td width="10%" align="left" valign="middle">&nbsp;CRF</td>
										<c:if test="${tl:rightsofView(resourceList,'Edit Visit')==1}">
											<td width="5%" align="center" valign="middle">Edit</td>
										</c:if>
										<c:if
											test="${tl:rightsofView(resourceList,'Delete Visit')==1}">
											<td width="5%" align="center" valign="middle"
												style="display: none;">Delete</td>
										</c:if>
									</tr>
									<tbody id="fbody">
										<c:forEach items="${Visitslist}" var="visits"
											varStatus="status">

											<c:set var="visitNameText" scope="page" value="" />
											<c:forEach items="${VisitNameTextslist}" var="visitName"
												varStatus="statusList">
												<c:if
													test="${visits.visit_name_text_id == visitName.visit_name_text_id}">
													<c:set var="visitNameText" value="${visitName.visit_name}" />
													<c:set var="visitNameTextID"
														value="${visitName.visit_name_text_id}" />
												</c:if>
											</c:forEach>
											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle}" id="${visits.visit_id}">
												<c:forEach items="${studyList}" var="study1"
													varStatus="crfState">
													<c:if test="${study1.study_id == visits.study_id}">
														<td valign="top" align="left" style="display: none;"
															class="set_padding study_to_visit">${study1.study_name}</td>
													</c:if>
												</c:forEach>
												<td valign="top" align="left" class="set_padding">
													<span text="${visitNameTextID}" class="name-visit">${visitNameText}</span>
													<a href="javascript://" class="desc_icon desciption" des="${visits.description}" >
														<img src="images/view.png" />
													</a>
												</td>
												<td valign="top" align="left" class="set_padding">${visits.is_scheduled}</td>
												<td valign="top" align="left" class="set_padding">${visits.is_adverse}</td>
												<td valign="top" align="left" class="set_padding">${visits.is_monitor}</td>
												<td valign="top" align="left" class="set_padding">${visits.is_mandatory}</td>
												<td valign="top" align="left" class="set_padding">${visits.window_open}</td>
												<td valign="top" align="left" class="set_padding">${visits.window_close}</td>
												<td valign="top" align="left" class="set_padding"><select
													class="change-the-selected-crf" style="width: 130px;">
														<option value="1">CRFs OF This Visit</option>
														<c:forEach items="${visitCrf}" var="visitCrfs"
															varStatus="ststus">
															<c:if test="${visitCrfs.visit_id == visits.visit_id }">
																<c:forEach items="${crf}" var="crfs"
																	varStatus="crfStatus">

																	<c:if
																		test="${crfs.crf_id == visitCrfs.case_report_form_id}">
																		<option value='${crfs.crf_html}'>${crfs.crf_name}</option>
																	</c:if>
																</c:forEach>
															</c:if>

														</c:forEach>
												</select> <a
													href="<c:url value='ShowAssignVisit.visits?visits_id=${visits.visit_id}'/>">
														<img src="images/patient_visit.png" alt="Edit"
														title="Assign Crfs To visit" border="0" />
												</a></td>
												<c:if
													test="${tl:rightsofView(resourceList,'Edit Visit')==1}">
													<td valign="top" align="center" class="set_padding2"><a
														href="<c:url value='ShowEditVisit.visits?visits_id=${visits.visit_id}&study=${visits.study_id}'/>"><img
															src="images/edit.png" alt="Edit" title="Edit" border="0" /></a></td>
												</c:if>
												<c:if
													test="${tl:rightsofView(resourceList,'Delete Visit')==1}">
													<td style="display: none;" top" align="center"
														class="set_padding2"><a
														href="<c:url value='deleteVisits.visits?visits_id=${visits.visit_id}&study=${visits.study_id}'/>"><img
															src="images/delete.png" alt="Del" title="Delete"
															border="0" /></a></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<div class="spacer"></div>
							<div style="clear: both; margin-top: 20px;"></div>

						</div>
					</div>
				</div>


				<!-- ****************************************************End Visit List*************************************************************************** -->
				<!-- ******************************************************************************************************************************* -->
			</div>

			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<div class="footer_bar">
			<div class="footer_left">
				<a href="#" class="flinks">Home</a> | <a href="#" class="flinks">About
					Us</a> | <a href="#" class="flinks">FAQ</a> | <a href="#"
					class="flinks">Logout</a> | <a href="#" class="flinks">Contact
					Us</a>
			</div>

			<div class="footer_right">� 2011, Al Rights Reserved.</div>
		</div>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
	<div id="header_wrapper" class="tooltips">
		<pre></pre>
		<span class="tooltip-style1"></span>
	</div>


	<div class="value-dialog" style="display: none;"></div>

</body>

</html>


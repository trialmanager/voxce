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
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>

<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".multiselect").multiselect();
	});
</script>

<script type="text/javascript" src="js/patient.js"></script>

<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/visits.css" rel="stylesheet" type="text/css" />
<link href="css/crf.css" rel="stylesheet" type="text/css" />



</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />




	<!-- wrapper starts here -->
	<div class="wrapper">
		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu"></div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!-- 												Start Create Patient CRF related-->
				<!-- 												Start Create Patient CRF related-->
				<div class="body_inner" id="Patient_CRF_div">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
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
								<a href="<c:url value='OpenStudySiteDetail.study' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
									Patient</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">Patients
									List</a>
							</div>
							<div class="crumbs-link">
								<a href="#">CRFs</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Select Visit</div>
						<select id="View_Patient_Search_baro" class="drop_txt">
							<c:forEach items="${visitslist}" var="cvisits"
								varStatus="crfState">
								<c:forEach items="${visitsName}" var="visitName"
									varStatus="visitStatus">
									<c:if
										test="${cvisits.visit_name_text_id == visitName.visit_name_text_id}">
										<option value="${visitName.visit_name}">${visitName.visit_name}</option>
									</c:if>
								</c:forEach>
							</c:forEach>
						</select> <a href="javascript://"><img
							onclick="create_visit('${patientid}','${patientNumber}')"
							src="images/patient_visit.png" alt="Edit" title="Visit"
							border="0" /></a>

						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<input name="visit_id1" id="visit_id1" type="text" value="0"
									class="input_txt" style="display: none" />
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Name</td>
										<td width="8%" align="left" valign="middle">&nbsp;Crf
											Status</td>
										<td width="8%" align="left" valign="middle">&nbsp;Crf
											Name</td>
										<td width="8%" align="left" valign="middle">&nbsp;Open
											Crf</td>
									</tr>
									<tbody id="fbodyo">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${mape}" var="mapeCrf"
											varStatus="statusMape">
											<c:set var="tempRowStyle"
												value="${(statusMape.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle}" id="${mapeCrf.patient_crf_id}">
												<c:forEach items="${visitslist}" var="cvisits"
													varStatus="crfState">

													<c:if test="${cvisits.visit_id == mapeCrf.visit_id}">
														<c:forEach items="${visitsName}" var="visitName"
															varStatus="visitStatus">
															<c:if
																test="${cvisits.visit_name_text_id == visitName.visit_name_text_id}">
																<td valign="top" align="left" class="set_padding">${visitName.visit_name}</td>
															</c:if>
														</c:forEach>

													</c:if>
												</c:forEach>

												<td valign="top" align="left" class="set_padding st_status">${mapeCrf.crf_status}</td>
												<c:forEach items="${patentCrf}" var="crf"
													varStatus="statusCrf">
													<c:if test="${crf.crf_id == mapeCrf.crf_id }">
														<td valign="top" align="left" class="set_padding ">${crf.crf_name}</td>
													</c:if>

												</c:forEach>
												<td><a href="javascript://" style="margin-left: 48%;"
													class="show-in-dialog html-data"
													htmlData='${mapeCrf.crf_html}'><img
														src="images/viewer.png" alt="Edit" title="Visit"
														border="0" /></a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div id="Patient_Visit_div" class="myform visit"
							style="display: none;">
							<form id="patient_visit_form" name="patient_visit_form"
								method="post" action="assignPatientVisit.pat" class="visit">
								<input name="edit_id_patient_visit" id="edit_id_patient_visit"
									type="text" value="0" class="input_txt" style="display: none" />
								<label>Patient Number :</label> <input readonly="readonly"
									id="patient_no" name="patient_no" type="text" value="Enter "
									class="input_txt_color" /> <label>Patient Visits :</label> <select
									id="patient_visit" class="multiselect" multiple="multiple"
									name="patient_visit">

									<c:forEach items="${visitslist}" var="vis" varStatus="status">
										<c:forEach items="${visitsName}" var="namelist"
											varStatus="status">

											<c:if
												test="${namelist.visit_name_text_id== vis.visit_name_text_id}">
												<option id="${namelist.visit_name_text_id}"
													value="${vis.visit_id}" onclick="">${namelist.visit_name}</option>
											</c:if>
										</c:forEach>
									</c:forEach>
								</select> <select id="hidennSelectedPatient_visit" name=""
									style="display: none;">

									<c:forEach items="${selectedVisits}" var="selectedVisits"
										varStatus="status">

										<option id="" value="${selectedVisits.visit_id}" onclick=""></option>

									</c:forEach>
								</select>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<button class="blue-pill">Save</button>
									<button class="grey-pill">Clear</button>
								</div>
							</form>
						</div>
					</div>
					<div id="Edit_User_error_message" class="chk_avail_yes"></div>
				</div>

				<!--  												End Create Patient CRF related-->
				<!--  												End Create Patient CRF related-->
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
				<div class="dialog-div" style="display: none;"></div>
				<div class="footer_right">© 2011, Al Rights Reserved.</div>
			</div>
			<!-- footer ends here -->
			<form id="saveHtml" method="post" action="savePatientCrfs.pat">
				<input name="data_html" type="hidden" value="" id="data" /> <input
					name="status" type="hidden" value="false" id="filled" /> <input
					name="patientid" type="hidden" value="${patientid}" /> <input
					name="id" type="hidden" value="" id="idOfPCRT" />
			</form>
		</div>


	</div>




	<!-- wrapper ends here -->
</body>
</html>

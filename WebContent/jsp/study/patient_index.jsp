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
<script src="JQuery/jquery-ui.min.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="js/patient.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>

<script type="text/javascript">
	$(function() {
		$(".multiselect").multiselect();
	});
	$(function() {
		$("#datepicker1").datepick({
			 changeMonth: true,
	            changeYear: true,
			dateFormat : 'dd-M-yy'
		});
		$("#datepicker2").datepick({
			 changeMonth: true,
	            changeYear: true,
			dateFormat : 'dd-M-yy'
		});
		$("#datepicker3").datepick({
			 changeMonth: true,
	            changeYear: true,
			dateFormat : 'dd-M-yy'
		});
	});
</script>

<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/visits.css" rel="stylesheet" type="text/css" />
<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("table")
								.find("td")
								.each(
										function() {
											try {
												var td = $.datepicker
														.parseDate("yy-mm-dd",
																$(this).text());
												/*  *//* 	alert(td); */
												$(this)
														.text(
																$.datepicker
																		.formatDate(
																				'dd-M-yy',
																				td));
											} catch (err) {
												//	alert(err);
											}

											/* 		 var wid = $(".body_content").outerWidth();
											 wid = wid - 280;
											 $('.right_body_content').css('width',wid); */

											if ($("#PatientReturnMessage")
													.val() == "1") {

												$(
														"#Create_Patient_Main_Success")
														.text(
																"Patient Created Successfully !!!")
														.show().delay(3000)
														.hide("slow");
											} else if ($(
													"#PatientReturnMessage")
													.val() == "0") {
												$("#Create_Patient_Main_Error")
														.text(
																"Patient Already Exisits in "
																		+ $(
																				"#patientStudy")
																				.val()
																		+ " !!!")
														.show().delay(3000)
														.hide("slow");
											} else {
												//Create_Patient_Main_Error
											}

										});
					});
</script>



</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="PatientReturnMessage"
		id="PatientReturnMessage" value="${MessageCode}" />
	<input type="hidden" id="patientStudy"
		value="${currentstudy.study_name}" />


	<!-- wrapper starts here -->
	<div class="wrapper">

		<!-- logo_area starts here -->

		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<c:if test="${tl:rightsofView(resourceList,'Patients')==1}">
							<a
								href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />"
								class="nav_l" name="" id="current">Patients</a>
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
								class="nav_l" name="">Site Laboratories</a>
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
								class="nav_l" name="">Site Detail</a>
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



				<!--  												Start Patient View-->
				<!--  												Start Patient View-->

				<c:if test="${tl:rightsofView(resourceList,'View Patients')==1}">
					<div class="body_inner" id="View_Patient_Div">
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
									<a
										href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
								</div>
								<div class="crumbs-link">
									<a
										href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
										Patient</a>
								</div>

							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->

						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Patient :</div>
							<div class="field_set">
								<input id="View_Patient_Search_bar"
									name="View_Patient_Search_bar" type="text" class="input_txt"
									value="Search..." /> <span class="search_btn"><a
									href="#"><img src="images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">
									<input name="visit_id1" id="visit_id1" type="text" value="0"
										class="input_txt" style="display: none" />
									<div
										style="clear: both; padding-left: 0px; float: right; width: 400px; text-align: right;">
										<span id="Create_Patient_Main_Error" class="error_label_grp"
											style="display: none;">Patient Created Successfully
											!!!</span> <span id="Create_Patient_Main_Success"
											class="chk_avail_yes" style="display: none;">Patient
											Already Exisits in Cardiology !!!</span>
										<c:if test="${tl:rightsofView(resourceList,'Add Patient')==1}">
											<button class="blue-pill"
												onclick="LoadPatientForm('createpatientdiv')"
												style="align: right;">Add New Patient</button>
										</c:if>
									</div>
									<table id="View_user_Table" width="100%" border="0"
										cellspacing="1" cellpadding="0" class="table_border_view_list">
										<tr class="rights_header_view_list">
											<td width="10%" align="left" valign="middle">&nbsp;Patient
												Number</td>
											<td width="8%" align="left" valign="middle">&nbsp;Initials</td>
											<td width="11%" align="left" valign="middle">&nbsp;Gender</td>
											<td width="15%" align="left" valign="middle">&nbsp;Date
												of Birth</td>
											<td width="15%" align="left" valign="middle">&nbsp;Date
												of Informed Consent</td>
											<td width="15%" align="left" valign="middle">&nbsp;Date
												of Randomization</td>
											<!-- 	<td width="13%"  align="left" valign="middle">&nbsp;Status</td> -->
											<c:if
												test="${tl:rightsofView(resourceList,'Edit Patient')==1}">
												<td width="3%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>
										<tbody id="fbody">
											<c:set var="tempRowStyle" scope="page"
												value="white_row_view_list" />
											<c:forEach items="${patientlist}" var="patlist"
												varStatus="status">
												<c:set var="tempRowStyle"
													value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
												<tr class="${tempRowStyle}" id="${patlist.patient_id}">
													<c:if
														test="${tl:rightsofView(resourceList,'View Patients')==1}">
														<td valign="top" align="left" class="set_padding"><a
															style="text-decoration: none; color: #1D99D9;"
															href="<c:url value='PatientVisits.pat?patientId=${patlist.patient_id}&patientNumber=${patlist.patient_number}&studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${patlist.patient_number}</a></td>
													</c:if>
													<c:if
														test="${tl:rightsofView(resourceList,'View Patients')==0}">
														<td valign="top" align="left" class="set_padding"><a
															style="text-decoration: none; color: #1D99D9;"
															href="javascript://">${patlist.patient_number}</a></td>
													</c:if>
													<td valign="top" align="left" class="set_padding">${patlist.initials}</td>
													<td valign="top" align="left" class="set_padding">${patlist.gender}</td>
													<td valign="top" align="left" class="set_padding">${patlist.date_of_birth}</td>
													<td valign="top" align="left" class="set_padding">${patlist.date_of_informed_consent}</td>
													<td valign="top" align="left" class="set_padding">${patlist.date_of_randomization}</td>
													<c:if
														test="${tl:rightsofView(resourceList,'Edit Patient')==1}">
														<td valign="top" align="center" class="set_padding2">
															<img
															onclick="edit_view_patient_row('${patlist.patient_id}','${patlist.patient_number}','${patlist.initials}','${patlist.gender}','${patlist.date_of_birth}','${patlist.date_of_informed_consent}','${patlist.date_of_randomization}','${patlist.date_created}','${patlist.created_by}')"
															src="images/edit_row_icon.png" alt="Edit" title="Edit"
															border="0" />
														</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="Edit_User_error_message" class="chk_avail_yes"></div>
					</div>
				</c:if>
				<!--  												End View Patient-->
				<!--  												End View Patient-->

				<!-- 												Start Create Patient-->
				<!-- 												Start Create Patient-->
				<div id="createpatientdiv" class="body_inner" style="display: none;">
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
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
									Patient</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id="create_patient_title">Create Patient</a>
							</div>
						</div>
						<div class="crumb_right"></div>

						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform patient">
							<form id="create_patient_form" name="form" method="post"
								action="savePatient.pat" class="patient">

								<input name="edit_id" id="edit_id" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="date_created" id="date_created" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="created_by" id="created_by" type="text" value="0"
									class="input_txt" style="display: none" /> <label>Patient
									Number :</label> <input name="number" id="number" type="text"
									maxlength="9" value="" class="input_txt" style="width: 100px;" />
								<span id="Number_Error" class="error_label"></span> <label>Patient
									Initials :</label> <input type="text" name="initials" id="initials"
									value="" class="input_txt" style="width: 100px;" maxlength="5" />
								<span id="initial_error" class="error_label"></span>
								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Gender :</label><br /> <input type="radio"
										name="gender" id="gender" value="M" checked="checked" /> <span
										class="txt_norm">Male</span> <input type="radio" name="gender"
										id="gender" value="F" /> <span class="txt_norm">Female</span>
								</div>
								<label>Date Of Birth :</label> <input type="text"
									readonly="readonly" name="dateofbirth" id="datepicker1"
									value="" class="input_txt" style="width: 100px;" /> <span
									id="Doberror" class="error_label"></span> <label>Date
									Of Informed Consent :</label> <input type="text" readonly="readonly"
									name="dateofinformedconsent" id="datepicker2" value=""
									class="input_txt" style="width: 100px;" /><span
									id="Dateofinformedconsenterror" class="error_label"></span> <label>Date
									Of Randomization :</label> <input type="text" readonly="readonly"
									name="dateofrandomization" id="datepicker3" value=""
									class="input_txt" style="width: 100px;" /><span
									id="dateofrandomization_error" class="error_label"></span>
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<input type="submit" class="blue-pill" value="Save" />
									<button id="cancel" class="grey-pill"
										onclick="LoadPatientForm('View_Patient_Div')">Cancel</button>
								</div>
							</form>
						</div>
					</div>

				</div>


				<!--  												End Create Patient-->
				<!--  												End Create Patient-->

				<!-- 												Start Create Patient Visit-->
				<!-- 												Start Create Patient Visit-->
				<div class="body_inner" id="Patient_Visit" style="display: none;">
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
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
									Patient</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Assign Visit</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform visit">
							<form id="patient_visit_form" name="patient_visit_form"
								method="post" action="assignPatientVisit.pat" class="visit">
								<input name="edit_id_patient_visit" id="edit_id_patient_visit"
									type="text" value="0" class="input_txt" style="display: none" />
								<label style="float: left;">Patient Number :</label> <input
									readonly="readonly" id="patient_no" name="patient_no"
									style="float: left;" type="text" value="Enter "
									class="input_txt_color" /> <label style="float: left;">Patient
									Visits :</label> <select id="patient_visit" class="multiselect"
									multiple="multiple" name="patient_visit">

									<c:forEach items="${visitslist}" var="vis" varStatus="status">
										<c:forEach items="${visitnamelist}" var="namelist"
											varStatus="status">

											<c:if
												test="${namelist.visit_name_text_id== vis.visit_name_text_id}">
												<option id="${namelist.visit_name_text_id}"
													value="${vis.visit_id}" onclick="">${namelist.visit_name}</option>
											</c:if>
										</c:forEach>
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
				</div>

				<!--  												End Create Patient Visit-->
				<!--  												End Create Patient Visit-->

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

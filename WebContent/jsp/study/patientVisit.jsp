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
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>

<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				$(".multiselect").multiselect();

				$(".patient_visit_date").each(
						function() {
							var da;
							if ($(this).val() != "Not Set") {
								try {
									da = $.datepicker.parseDate('yy-mm-dd', $(
											this).val());
								} catch (e) {

									da = new Date($(this).val());
								}
								$(this)
										.val(
												$.datepicker.formatDate(
														'dd M, yy', da));
							}
						});

				$(".orignal_dueDate").each(
						function() {
							var da;
							if ($(this).text().length > 4) {
								try {
									da = $.datepicker.parseDate("yy-mm-dd", $(
											this).text());

								} catch (err) {
									da = new Date($(this).text());

								}

								$(this)
										.text(
												$.datepicker.formatDate(
														'dd M, yy', da));

							}
						});

				$(".orignal_slab").each(
						function() {
							var da;
							if ($(this).text().length > 4) {
								try {
									var sp_date = $(this).text().split('-');
									var open = sp_date[0] + "-" + sp_date[1]
											+ "-" + sp_date[2];
									var close = sp_date[3] + "-" + sp_date[4]
											+ "-" + sp_date[5];

									var od = $.datepicker.parseDate("yy-mm-dd",
											open);
									var cd = $.datepicker.parseDate("yy-mm-dd",
											close);
									$(this).text(
											$.datepicker.formatDate("dd M, yy",
													od)
													+ " - "
													+ $.datepicker.formatDate(
															"dd M, yy", cd));
									// alert("try");
								} catch (err) {
									// alert(err+"000000");
								}
							}
						});

				/*	$(".visit_date_patient_td").each(function(){
						alert(123);
						if($(this).attr("related")!="0"){
							var relatedVisit = $(this);
							var visitToRelate = $(this);
							if(relatedVisit.attr("related") != 0 ){
								$(".visit_date_patient_td").each(function(){
									if(relatedVisit.attr("related") == $(this).attr("visit")){
										visitToRelate = $(this);
									}
								});
							}
							try{
								var d = visitToRelate.find(".patient_visit_date").val().split('-');
								var testDate=new Date(d[2],d[1],d[0]);
								//
								var optimumDate;
								if(relatedVisit.siblings(".orignal_dueDate").attr("optimum")!= undefined && visitToRelate.find("input").val() != "Not Set"){
								
										var optimum = parseInt(relatedVisit.siblings(".orignal_dueDate").attr("optimum"));
										optimumDate=new Date(testDate.getFullYear(),(testDate.getMonth()-1),(testDate.getDate()+optimum));
										
										relatedVisit.siblings(".orignal_dueDate").text(optimumDate.getDate()+"-"+(optimumDate.getMonth()+1)+"-"+optimumDate.getFullYear());
										
										
										$.ajaxSetup({async: false});
										$.post("updateOptimum.pat?optimumDate="+relatedVisit.siblings(".orignal_dueDate").text()+"&pvid="+$(this).parent().attr("id"),function(data){

										});
										 $.ajaxSetup({async: true});
										var open = parseInt(relatedVisit.siblings(".orignal_slab").attr("openW"));
										var close = parseInt(relatedVisit.siblings(".orignal_slab").attr("close"));
										var openDate = new Date(optimumDate.getFullYear(),(optimumDate.getMonth()),(optimumDate.getDate()-open));
										var closeDate = new Date(optimumDate.getFullYear(),(optimumDate.getMonth()),(optimumDate.getDate()+close));
										var nowDate = new Date();
										
										
								
											relatedVisit.siblings(".orignal_slab").html(openDate.getDate()+"-"+(openDate.getMonth()+1)+"-"+openDate.getFullYear()+" <b>&nbsp;-&nbsp;</b> "+closeDate.getDate()+"-"+(closeDate.getMonth()+1)+"-"+closeDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("open_date",openDate.getDate()+"/"+(openDate.getMonth()+1)+"/"+openDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("close_date",closeDate.getDate()+"/"+(closeDate.getMonth()+1)+"/"+closeDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("due_date",optimumDate.getDate()+"/"+(optimumDate.getMonth()+1)+"/"+optimumDate.getFullYear());
										if(relatedVisit.siblings(".related_visit_status") == ""){
											if(openDate < nowDate && closeDate < nowDate){
												relatedVisit.siblings(".related_visit_status").text("Missied");
											}
										}
									//	alert("try");
										
								}
							}catch(err){
							//	alert("catch");
								var d = new Date(visitToRelate.find(".patient_visit_date").val());
						
								var optimumDate = new Date();
								if(relatedVisit.siblings(".orignal_dueDate").attr("optimum")!= undefined && visitToRelate.find("input").val() != "Not Set"){
								
										var optimum = parseInt(relatedVisit.siblings(".orignal_dueDate").attr("optimum"));
									
				
										optimumDate.setDate(d.getDate() + optimum);
										
										relatedVisit.siblings(".orignal_dueDate").text(optimumDate.getDate()+"-"+(optimumDate.getMonth()+1)+"-"+optimumDate.getFullYear());
										var open = parseInt(relatedVisit.siblings(".orignal_slab").attr("openW"));
										var close = parseInt(relatedVisit.siblings(".orignal_slab").attr("close"));
										var openDate = new Date(optimumDate);
										var closeDate = new Date(optimumDate);
										var nowDate = new Date();
										
										
											openDate.setDate(optimumDate.getDate() - open);
											closeDate.setDate(optimumDate.getDate() + close);
										
											relatedVisit.siblings(".orignal_slab").html(openDate.getDate()+"-"+(openDate.getMonth()+1)+"-"+openDate.getFullYear()+" <b>&nbsp;-&nbsp;</b> "+closeDate.getDate()+"-"+(closeDate.getMonth()+1)+"-"+closeDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("open_date",(openDate.getMonth()+1)+"/"+openDate.getDate()+"/"+openDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("close_date",(closeDate.getMonth()+1)+"/"+closeDate.getDate()+"/"+closeDate.getFullYear());
											relatedVisit.siblings(".orignal_dueDate").attr("due_date",(d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear());
										if(relatedVisit.siblings(".related_visit_status") == ""){
											if(openDate < nowDate && closeDate < nowDate){
												relatedVisit.siblings(".related_visit_status").text("Missied");
											}
										}
										
								}
							}	
						}
							
						
					});
				 */
				$("table").each(function() {
					$(this).find("tr").removeClass("white_row_view_list");
					$(this).find("tr").removeClass("grey_row_view_list");
					$(this).find("tr").each(function(index) {
						if (index % 2 == 0) {
							$(this).addClass("grey_row_view_list");
						} else {
							$(this).addClass("white_row_view_list");
						}
					});
				});

			});
</script>



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
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/crf.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/patient.js"></script>
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
								<a href="<c:url value='OpenStudySiteDetail.study?studyid=${currentstudy.study_id }&siteid=${currentsite.site_id }' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
									Patient</a>
							</div>
							<div class="crumbs-link">
								<a href='javascript://'>${patientNumber}</a>
							</div>

						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">


						<!-- <a href="javascript://" ><img onclick="create_visit('${patientid}','${patientNumber}')" src="images/patient_visit.png" alt="Edit" title="Visit" border="0" /></a>
	
		-->


						<c:if
							test="${tl:rightsofView(resourceList,'Patient Visits History')==1}">
							<div class="show_hide_form">

								<div class="field_label_view_list">Visit History</div>

								<!--   Patient Visit -->

								<div class="field_txt_view_list" style="display: block">
									<input name="visit_id1" id="visit_id1" type="text" value="0"
										class="input_txt" style="display: none" />
									<table id="visit_Table" width="100%" border="0" cellspacing="1"
										cellpadding="0" class="table_border_view_list">
										<tr class="rights_header_view_list">
											<td width="10%" align="left" valign="middle">&nbsp;Visit
												Name</td>
											<td width="10%" align="left" valign="middle">&nbsp;Patient
												Visit Date</td>
											<td width="10%" align="left" valign="middle">&nbsp;Due
												Date</td>
											<td width="10%" align="left" valign="middle">&nbsp;Window</td>
											<td width="10%" align="left" valign="middle">&nbsp;Related
												Visit Status</td>
											<td width="10%" align="left" valign="middle">&nbsp;Visit
												Status</td>

										</tr>
										<tbody id="">
											<c:set var="tempRowStyle" scope="page"
												value="white_row_view_list" />
											<c:forEach items="${visitslist}" var="cvisits"
												varStatus="crfState0">
												<c:forEach items="${selectedVisits}" var="selectedVisits"
													varStatus="status0">
													<c:if
														test="${cvisits.visit_id == selectedVisits.visit_id && !cvisits.is_adverse && !cvisits.is_monitor}">
														<c:set var="tempRowStyle"
															value="${(crfState0.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
														<tr class="${tempRowStyle}"
															id="${selectedVisits.patient_visit_id}">
															<c:forEach items="${visitsName}" var="visitName"
																varStatus="visitStatus0">
																<c:if
																	test="${cvisits.visit_name_text_id == visitName.visit_name_text_id }">
																	<td valign="top" align="left" class="set_padding"><a
																		style="text-decoration: none; color: #1D99D9;"
																		href="<c:url value='PatientVisitCRF.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}&patientNumber=${patientNumber}&patientId=${patientid}&visitName=${visitName.visit_name}&visitid=${cvisits.visit_id }&patient_visit_id=${selectedVisits.patient_visit_id}' />">${visitName.visit_name}</a></td>
																</c:if>
															</c:forEach>

															<c:choose>
																<c:when
																	test='${selectedVisits.visit_date != "1901-01-01" }'>
																	<td valign="top" align="left"
																		related="${cvisits.related_visit_id}"
																		visit="${cvisits.visit_id}"
																		class="set_padding visit_date_patient_td"><input
																		class="date patient_visit_date"
																		value="${selectedVisits.visit_date}" /></td>
																</c:when>
																<c:otherwise>
																	<td valign="top" align="left"
																		related="${cvisits.related_visit_id}"
																		visit="${cvisits.visit_id}"
																		class="set_padding visit_date_patient_td"><input
																		class="date" value="Not Set" /></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${cvisits.related_visit_id != 0}">
																	<td valign="top" optimum="${cvisits.visit_optimum}"
																		align="center" class="set_padding orignal_dueDate">${selectedVisits.expected_date}</td>
																	<td valign="top" openW="${cvisits.window_open}"
																		close="${cvisits.window_close}" align="center"
																		class="set_padding orignal_slab">${selectedVisits.start_date_for_visit}-${selectedVisits.last_date_for_visit
																		}</td>
																	<td valign="top" align="center"
																		class="set_padding related_visit_status">${selectedVisits.rel_visit_status}</td>
																</c:when>
																<c:otherwise>
																	<td valign="top" align="left" class="set_padding"></td>
																	<td valign="top" align="left" class="set_padding"></td>
																	<td valign="top" align="left" class="set_padding "></td>
																</c:otherwise>
															</c:choose>
															<td valign="top" align="left"
																class="set_padding status_visit">${selectedVisits.visit_status}</td>
														</tr>
													</c:if>
												</c:forEach>

											</c:forEach>

										</tbody>
									</table>
								</div>
						</c:if>
						<!--  End Patient Visit -->

						<!-- Adverse Evenbt History -->
						<c:if
							test="${tl:rightsofView(resourceList,'Patient Advers Event Visit History')==1}">

							<div class="field_txt_view_list" style="display: block">

								<div class="field_label_view_list">Advers Event History</div>
								<input name="visit_id2" id="visit_id2" type="text" value="0"
									class="input_txt" style="display: none" />
								<table id="visit_Table" width="100%" border="0" cellspacing="1"
									cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Name</td>
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Date</td>
										<td width="10%" align="left" valign="middle">&nbsp;Due
											Date</td>
										<td width="10%" align="left" valign="middle">&nbsp;Window</td>
										<td width="10%" align="left" valign="middle">&nbsp;Related
											Visit Status</td>
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Status</td>

									</tr>
									<tbody id="">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${visitslist}" var="cvisits"
											varStatus="crfState1">
											<c:forEach items="${selectedVisits}" var="selectedVisits"
												varStatus="status1">
												<c:if
													test="${cvisits.visit_id == selectedVisits.visit_id && cvisits.is_adverse && !cvisits.is_monitor}">
													<c:set var="tempRowStyle"
														value="${(crfState1.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
													<tr class="${tempRowStyle}"
														id="${selectedVisits.patient_visit_id}">
														<c:forEach items="${visitsName}" var="visitName"
															varStatus="visitStatus1">
															<c:if
																test="${cvisits.visit_name_text_id == visitName.visit_name_text_id }">
																<td valign="top" align="left" class="set_padding"><a
																	style="text-decoration: none; color: #1D99D9;"
																	href="<c:url value='PatientVisitCRF.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}&patientNumber=${patientNumber}&patientId=${patientid}&visitName=${visitName.visit_name}&visitid=${cvisits.visit_id }&patient_visit_id=${selectedVisits.patient_visit_id}' />">${visitName.visit_name}</a></td>
															</c:if>
														</c:forEach>

														<c:choose>
															<c:when
																test='${selectedVisits.visit_date != "1901-01-01" }'>
																<td valign="top" align="left"
																	related="${cvisits.related_visit_id}"
																	visit="${cvisits.visit_id}"
																	class="set_padding visit_date_patient_td"><input
																	class="date patient_visit_date"
																	value="${selectedVisits.visit_date}" /></td>

															</c:when>
															<c:otherwise>
																<td valign="top" align="left"
																	related="${cvisits.related_visit_id}"
																	visit="${cvisits.visit_id}"
																	class="set_padding visit_date_patient_td"><input
																	class="date" value="Not Set" /></td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${cvisits.related_visit_id != 0}">
																<td valign="top" optimum="${cvisits.visit_optimum}"
																	align="center" class="set_padding orignal_dueDate">${selectedVisits.expected_date}</td>
																<td valign="top" openW="${cvisits.window_open}"
																	close="${cvisits.window_close}" align="center"
																	class="set_padding orignal_slab">${selectedVisits.start_date_for_visit}-${selectedVisits.last_date_for_visit
																	}</td>
																<td valign="top" align="center"
																	class="set_padding related_visit_status">${selectedVisits.rel_visit_status}</td>
															</c:when>
															<c:otherwise>
																<td valign="top" align="left" class="set_padding"></td>
																<td valign="top" align="left" class="set_padding"></td>
																<td valign="top" align="left" class="set_padding "></td>
															</c:otherwise>
														</c:choose>
														<td valign="top" align="left" class="set_padding">${selectedVisits.visit_status}</td>
													</tr>
												</c:if>
											</c:forEach>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</c:if>
						<!-- End Adverse Event History -->
						<!--  Minitor History -->

						<c:if
							test="${tl:rightsofView(resourceList,'Patient Monitor Visit History')==1}">

							<div class="field_txt_view_list" style="display: block">

								<div class="field_label_view_list">Monitor History</div>
								<input name="visit_id3" id="visit_id3" type="text" value="0"
									class="input_txt" style="display: none" />
								<table id="visit_Table" width="100%" border="0" cellspacing="1"
									cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Name</td>
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Date</td>
										<td width="10%" align="left" valign="middle">&nbsp;Due
											Date</td>
										<td width="10%" align="left" valign="middle">&nbsp;Window</td>
										<td width="10%" align="left" valign="middle">&nbsp;Related
											Visit Status</td>
										<td width="10%" align="left" valign="middle">&nbsp;Visit
											Status</td>

									</tr>
									<tbody id="">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${visitslist}" var="cvisits"
											varStatus="crfState2">
											<c:forEach items="${selectedVisits}" var="selectedVisits"
												varStatus="status2">
												<c:if
													test="${cvisits.visit_id == selectedVisits.visit_id && !cvisits.is_adverse && cvisits.is_monitor}">
													<c:set var="tempRowStyle"
														value="${(crfState2.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
													<tr class="${tempRowStyle}"
														id="${selectedVisits.patient_visit_id}">
														<c:forEach items="${visitsName}" var="visitName"
															varStatus="visitStatus2">
															<c:if
																test="${cvisits.visit_name_text_id == visitName.visit_name_text_id }">
																<td valign="top" align="left" class="set_padding"><a
																	style="text-decoration: none; color: #1D99D9;"
																	href="<c:url value='PatientVisitCRF.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}&patientNumber=${patientNumber}&patientId=${patientid}&visitName=${visitName.visit_name}&visitid=${cvisits.visit_id }&patient_visit_id=${selectedVisits.patient_visit_id}' />">${visitName.visit_name}</a></td>
															</c:if>
														</c:forEach>

														<c:choose>
															<c:when
																test='${selectedVisits.visit_date != "1901-01-01" }'>
																<td valign="top" align="left"
																	related="${cvisits.related_visit_id}"
																	visit="${cvisits.visit_id}"
																	class="set_padding visit_date_patient_td"><input
																	class="date patient_visit_date"
																	value="${selectedVisits.visit_date}" /></td>
															</c:when>
															<c:otherwise>
																<td valign="top" align="left"
																	related="${cvisits.related_visit_id}"
																	visit="${cvisits.visit_id}"
																	class="set_padding visit_date_patient_td"><input
																	class="date" value="Not Set" /></td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${cvisits.related_visit_id != 0}">
																<td valign="top" optimum="${cvisits.visit_optimum}"
																	align="center" class="set_padding orignal_dueDate">${selectedVisits.expected_date}</td>
																<td valign="top" openW="${cvisits.window_open}"
																	close="${cvisits.window_close}" align="center"
																	class="set_padding orignal_slab">${selectedVisits.start_date_for_visit}-${selectedVisits.last_date_for_visit
																	}</td>
																<td valign="top" align="center"
																	class="set_padding related_visit_status">${selectedVisits.rel_visit_status}</td>
															</c:when>
															<c:otherwise>
																<td valign="top" align="left" class="set_padding"></td>
																<td valign="top" align="left" class="set_padding"></td>
																<td valign="top" align="left" class="set_padding "></td>
															</c:otherwise>
														</c:choose>
														<td valign="top" align="left" class="set_padding">${selectedVisits.visit_status}</td>
													</tr>
												</c:if>
											</c:forEach>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</c:if>
					</div>

					<!--  End Monitor History -->



					<div id="Patient_Visit_div" class="myform visit"
						style="display: none;">
						<form id="patient_visit_form" name="patient_visit_form"
							method="post" action="assignPatientVisit.pat" class="visit">
							<input name="edit_id_patient_visit" id="edit_id_patient_visit"
								type="text" value="0" class="input_txt" style="display: none" />
							<label style="float: left; width: 100px;">Patient Number
								:</label> <input style="float: left;" readonly="readonly"
								id="patient_no" name="patient_no" type="text" value="Enter "
								class="input_txt_color" /> <br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<label style="float: left; width: 100px;">Patient Visits
								:</label> <select id="patient_visit" class="multiselect"
								multiple="multiple" name="patient_visit">

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
							<div style="clear: both; margin-top: 10px; padding-left: 370px;">
								<button class="blue-pill">Save</button>
								<input class="grey-pill" type="button"
									onclick="cancleAssignCrf()" value="Cancel" />
							</div>
						</form>

					</div>
				</div>
				<div class="dialog-div" style="display: none;"></div>
				<div class="controls" style="display: none;">
					<input type="button" class="save-button-p-crf blue-pill"
						style="margin-left: 45%" value="Save" /> <input type="button"
						class="cancle-button-p-crf grey-pill" value="Cancle" />
				</div>
				<div id="Edit_User_error_message" class="chk_avail_yes"></div>
			</div>

			<!--  												End Create Patient CRF related-->
			<!--  												End Create Patient CRF related-->
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="../footer.jsp"%>
		<!-- footer ends here -->
		<form id="saveHtml" method="post" action="savePatientCrfs.pat">
			<input name="data_html" type="hidden" value="" id="data" /> <input
				name="status" type="hidden" value="false" id="filled" /> <input
				name="patientid" type="hidden" value="${patientid}" /> <input
				name="patientNumber" type="hidden" value="${patientNumber}" /> <input
				name="id" type="hidden" value="" id="idOfPCRT" />
		</form>
	</div>
	<div id="confirmDiscrepancy"
		style="display: none; border: 1px dashed PaleTurquoise;">
		<span>This Form Is Not Filled as Required!<br />Do you Want to
			Save this with All Discrepancies?
		</span>
	</div>
	<!-- wrapper ends here -->
	<input type="hidden" id="relatedvisitStatus">
</body>
</html>

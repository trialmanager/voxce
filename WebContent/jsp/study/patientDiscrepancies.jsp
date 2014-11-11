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

<script src="JQuery/jquery.fileupload.js"></script>
<script src="JQuery/jquery.fileupload-ui.js"></script>
<script src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/home/study/studyusers.js"></script>

<script type="text/javascript" src="js/home/study/studydocument.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script>
	
</script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css"
	id="theme">

<link href="css/jquery.fileupload-ui.css" rel="stylesheet"
	type="text/css">
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
						<c:if test="${tl:rightsofView(resourceList,'Site Change')==1}">
							<a
								href="<c:url value='OpenStudySiteChange.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Change</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Site Investigators')==1}">
							<a
								href="<c:url value='OpenStudySiteInvestigators.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Investigators</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Site Laborotories')==1}">
							<a
								href="<c:url value='OpenStudySiteLaborotories.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Laboratories</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Site Documents')==1}">
							<a
								href="<c:url value='OpenStudySiteDocuments.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Documents</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Site Users')==1}">
							<a
								href="<c:url value='OpenStudySiteUsers.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Users</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Site Detail')==1}">
							<a
								href="<c:url value='OpenStudySiteDetail.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Detail</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Patient Discrepancy')==1}">
							<a
								href="<c:url value='discrepenciesInPatient.pat?patientId=${patientid}&patientNumber=${patientNumber}'/>"
								id="current" class="nav_l" name="">Patient Discrepancy</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>

				<!-- left navigation ends here -->
				<!-- ********************************** -->
				<!-- ********************************** -->
				<!-- ********************************** -->

			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!--  												Start User View-->
				<!--  												Start User View-->


				<div class="body_inner" id="View_User_Div">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">
									<%
										out.println(obj.getFirst_name() + " " + obj.getLast_name());
									%>
								</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='OpenStudySiteChange.study?siteid=${currentsite.site_id}'/>">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">${patientNumber} Discrepancies</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Discrepancy :</div>
						<div class="field_set">

							<input id="View_users_Search_bar" name="View_users_Search_bar"
								type="text" class="input_txt" value="Search..." /> <span
								class="search_btn"><a href="#"><img
									src="images/search.png" alt="search" title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="11%" align="left" valign="middle">&nbsp;Case
											Report Form</td>
										<td width="11%" align="left" valign="middle">&nbsp;Section</td>
										<td width="11%" align="left" valign="middle">&nbsp;Question</td>
										<td width="11%" align="left" valign="middle">&nbsp;Status</td>
										<td width="11%" align="center" valign="middle">Action</td>
										<td width="11%" align="left" valign="middle">&nbsp;Reason</td>
										<td width="11%" align="left" valign="middle">&nbsp;Last
											Modified by</td>
										<td width="11%" align="left" valign="middle">&nbsp;Date
											Of Query</td>
										<td width="11%" align="center" valign="middle">Date of
											reply</td>

									</tr>
									<tbody id="fbody">

										<c:forEach items="${disc_list}" var="discList"
											varStatus="status">
											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

											<tr class="${tempRowStyle}" id="">
												<c:forEach items="${pList}" var="pList"
													varStatus="pCrfStatus">
													<c:if
														test="${pList.patient_crf_id ==discList.patient_crf_id }">
														<c:forEach items="${crfList}" var="crfList"
															varStatus="crfListStatus">
															<c:if test="${pList.crf_id == crfList.crf_id}">
																<td valign="top" align="left" class="set_padding">${crfList.crf_name}</td>
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach>

												<td valign="top" align="left" class="set_padding">${discList.section}</td>
												<td valign="top" align="left" class="set_padding">${discList.question_text}</td>
												<td valign="top" align="left" class="set_padding">${discList.status}</td>
												<td valign="top" align="left" class="set_padding">${discList.action}</td>
												<td valign="top" align="left" class="set_padding">${discList.reasion}</td>
												<c:forEach items="${userList}" var="userList"
													varStatus="userListStatus">
													${userList.last_name}
													<c:if test="${userList.user_id == discList.modifiedBy}">
																	
														<td valign="top" align="left" class="set_padding">${userList.first_name}
															${userList.last_name}</td>
													</c:if>
												</c:forEach>

												<td valign="top" align="left" class="set_padding">${discList.createdDate}</td>
												<td valign="top" align="left" class="set_padding">${discList.modifiedDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
					<div id="Edit_User_error_message" class="chk_avail_yes"></div>
				</div>

				<!-- ***********************************End User List************************************************************ -->
				<!-- ********************************************************************************************************************* -->
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

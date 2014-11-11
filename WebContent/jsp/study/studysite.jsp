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
<script type="text/javascript" src="js/home/study/studysite.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script type="text/javascript">
	
</script>


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
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Sites')==1}">
							<a href="<c:url value='OpenViewStudy.study' />" class="nav_l"
								name="" id="current">Study Sites </a>
						</c:if>
						<a href="<c:url value='OpenChangeStudy.study' />" class="nav_l"
							name="">Change Study</a>
						<c:if
							test="${tl:rightsofView(resourceList,'Enrollment Schedule')==1}">
							<a href="<c:url value='OpenEnrollmentStudy.study' />"
								class="nav_l" name="">Enrollment Schedule</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Detail')==1}">
							<a href="<c:url value='OpenViewStudyDetail.study' />"
								class="nav_l" name="">Study Detail</a>
						</c:if>

						<c:if test="${tl:rightsofView(resourceList,'View Document')==1}">
							<a href="<c:url value='OpenStudyDocuments.study' />"
								class="nav_l" name="">Documents</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Investigators')==1}">
							<a href="<c:url value='OpenViewStudyInvestigators.study' />"
								class="nav_l" name="">Investigators</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Users')==1}">
							<a href="<c:url value='OpenUsersStudy.study' />" class="nav_l"
								name="">Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Laboratory')==1}">
							<a href="<c:url value='OpenViewStudyLaboratory.study' />"
								class="nav_l" name="">laboratories</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Payment')==1}">
							<a
								href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />"
								class="nav_l" name="">Payment</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Trail Managment')==1}">
							<a
								href="<c:url value='ShowTrials.trial?studyid=${currentstudy.study_id}' />"
								class="nav_l" name="">Trial Management</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'Discripency in Study')==1}">
							<a href="<c:url value='discrepenciesInStudy.study' />"
								class="nav_l" name="">Discrepancies In Study</a>
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

				<!-- //////////////////////////////////////// Start View Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start View Site Study ////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Sites_Study_view_div">
					<div class="body_inner_header" id="Sites_Study_addview_div_title">
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
								<a href="#">Study Sites</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation***************************************** -->

					</div>
					<br />


					<div class="show_hide_form" style="clear: both;">
						<div class="field_txt_view_list">
							<div class="field_set">

								<input id="View_StudySite_Search_bar"
									name="View_StudySite_Search_bar" type="text" class="input_txt"
									value="Search..." /> <span class="search_btn"><a
									href="#"><img src="images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>

							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="table_border_view_list">
								<tr class="rights_header_view_list">
									<td width="35%" align="left" valign="middle">&nbsp;Site</td>
									<td width="35%" align="left" valign="middle">&nbsp;Total
										Patients</td>
									<td width="30%" align="left" valign="middle">&nbsp;Site
										Status</td>
								</tr>
								<tbody id="SSbody">
									<c:set var="tempRowStyle" scope="page"
										value="white_row_view_list" />
									<c:forEach items="${siteslist}" var="silist" varStatus="status">

										<c:set var="tempRowStyle"
											value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

										<c:set var="patienttotal" scope="page" value="" />
										<c:forEach items="${sitepatientlist}" var="sipalist"
											varStatus="status">
											<c:if test="${sipalist.site_id == silist.site_id}">
												<c:set var="patienttotal" value="${sipalist.patient_count}" />
											</c:if>
										</c:forEach>

										<tr class="${tempRowStyle}" id="${silist.site_id}">
											<td valign="top" align="left" class="set_padding"><c:if
													test="${tl:rightsofView(resourceList,'View Site Details')==1}">
													<c:if test="${silist.status == 1}">
														<a
															href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${silist.site_id}' />"
															style="text-decoration: none; color: #1090d1;">${silist.site_name}</a>
													</c:if>
													<c:if test="${silist.status == 0}">
														<a href="#" style="text-decoration: none; color: #1090d1;">${silist.site_name}</a>
													</c:if>
												</c:if> <c:if
													test="${tl:rightsofView(resourceList,'View Site Details')==0}">
													<a href="#" style="text-decoration: none; color: #1090d1;">${silist.site_name}</a>
												</c:if></td>

											<td valign="top" align="left" class="set_padding">${patienttotal}</td>

											<c:choose>
												<c:when test="${silist.status == 0}">
													<td valign="top" align="left" class="set_padding"><strong
														class="inactive_txt">Inactive</strong></td>
												</c:when>
												<c:when test="${silist.status == 1}">
													<td valign="top" align="left" class="set_padding"><strong
														class="active_txt">Active</strong></td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="spacer"></div>
						<div style="clear: both; margin-top: 20px;"></div>

					</div>
				</div>
				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->


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


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
<script type="text/javascript" src="js/home/study/studyEnrollment.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script type="text/javascript">
	
</script>


<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />
<link href="css/sponsor.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>

	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="maxenroll1" id="maxenroll1"
		value="${currentprotocol.max_enrollment}">
	<input type="hidden" name="protocolversion" id="protocolversion"
		value="${currentprotocol.protocol_version_id}">
	<input type="hidden" name="lastprotocoldate" id="lastprotocoldate"
		value="${LastProtocolDate}">


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
								name="" >Study Sites </a>
						</c:if>
						<a href="<c:url value='OpenChangeStudy.study' />" class="nav_l"
							name="">Change Study</a>
						<c:if
							test="${tl:rightsofView(resourceList,'Enrollment Schedule')==1}">
							<a href="<c:url value='OpenEnrollmentStudy.study' />"
								class="nav_l" id="current" name="">Enrollment Schedule</a>
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
				<div class="body_inner" id="StudyEnrollmentDiv">
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
								<a href="#">Enrollment Schedule</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<span id="EnrollmentError" class="error_label_grp"
							style="width: auto; display: none;">${Error}</span> <span
							id="EnrollmentSuccess" class="chk_avail_yes"
							style="width: auto; display: none;">${Success}</span>
						<div class="myform site">
							<form id="EnrollmentForm" name="EnrollmentForm" method="post"
								action="SaveEnrollment.study" class="user">
								<label style="float: left;">Select Protocol:</label> <select
									name="protocolselection" id="protocolselection"
									class="drop_txt" style="float: left; width: 20%;">
									<c:forEach items="${protocolList}" var="plist"
										varStatus="Status">
										<option id="${plist.protocol_version_id}"
											value="${plist.protocol_version_id}">${plist.protocol_id}
											- ${plist.version}</option>
									</c:forEach>
								</select> <span id="protocolselectionerror" class="error_label_grp"></span>

								<label style="float: left;">Duration:</label> <span
									id="durationspan" class="chk_avail_yes">${currentprotocol.duration}
									Months</span> <label style="float: left;">Max Enrollment:</label> <span
									id="maxEnrolled" class="chk_avail_yes"></span>



								<div class="field_txt_view_list"
									style="overflow: scroll; margin-top: 20px">
									<div class="show_hide_form" style="max-width: 700px;">

										<table width="100%" border="0" cellspacing="1" cellpadding="0"
											style="width: auto;" class="table_border_view_list"
											id="EnrollmentTable">

											<tr class="rights_header_view_list" style="">
												<td align="left" valign="middle">&nbsp;Site Name</td>
												<c:forEach items="${Schedule}" var="sec" varStatus="status">
													<td align="left" valign="middle">&nbsp;${sec}</td>
												</c:forEach>
											</tr>

											<tbody id="fbody">


												<c:set var="count" value="0" scope="page" />
												<c:set var="temppat" value="${sitelist.site_id}-${i}"
													scope="page" />
												<c:set var="tempid" value="${sitelist.site_id}-${i}"
													scope="page" />
												<c:forEach items="${SitesList}" var="sitelist"
													varStatus="status">
													<c:set var="tempRowStyle"
														value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

													<tr class="${tempRowStyle} site-name-enrollment-tr"
														id="${sitelist.site_id}">

														<td valign="top" align="left" class="set_padding">${sitelist.site_name}</td>

														<c:forEach var="i" begin="1"
															end="${currentprotocol.duration}" step="1"
															varStatus="status1">

															<c:if test="${ensch == null}">
																<c:set var="temppat" value="0" scope="page" />
															</c:if>
															<c:if test="${fn:length(ensch) != 0 }">
																<c:set var="temppat" value="${ensch[count].patients}"
																	scope="page" />
															</c:if>
															<c:if test="${count >= fn:length(ensch)}">
																<c:set var="temppat" value="0" scope="page" />
															</c:if>

															<c:set var="count" value="${count + 1}" scope="page" />
															<c:set var="tempid" value="${sitelist.site_id}-${i}"
																scope="page" />
															<td valign="top" align="left"
																class="set_padding site-name-enrollment-td"><input
																type="text" name="${tempid}" id="" class="input_txt3"
																maxlength="5" value="${temppat}" /></td>
														</c:forEach>

													</tr>
												</c:forEach>
											</tbody>

										</table>
										<input type="hidden" name="currentprotocolduration"
											id="currentprotocolduration"
											value="${currentprotocol.duration}">

										<div class="spacer"></div>
										<div
											style="clear: both; margin-top: 20px; padding-left: 130px;">
											<button class="blue-pill" type="submit">Save</button>
										</div>

									</div>

								</div>

							</form>
						</div>
					</div>
				</div>

				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End View Site Study ////////////////////////////////////////////////////// -->

				<form id="hiddenform" name="hiddenform" method="post"
					action="GetEnrollmentStudy.study">
					<input type="hidden" id="protocol_version_id"
						name="protocol_version_id" value="">
				</form>
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

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

<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/home/study/studydetail.js"></script>

<script type="text/javascript" src="js/date.js"></script>
<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	$(function() {
		$("#AddProtocolStartDate").datepick({
			dateFormat : 'yyyy-mm-dd'
		});
	});
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
								class="nav_l" name="">Enrollment Schedule</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Detail')==1}">
							<a href="<c:url value='OpenViewStudyDetail.study' />"
								class="nav_l" id="current" name="">Study Detail</a>
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

				<!-- //////////////////////////////////////// Start  Study Detail ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start  Study Detail ////////////////////////////////////////////////////// -->
				<div class="body_inner" id="ViewStudyDetailDiv">
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
								<a href="#">Study Detail</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="show_hide_form">
							<span id="AddProtocol_Main_Error" class="error_label_grp"
								style="display: none;">${Errorpresent}
								${Errorunsuccessful}</span> <span id="AddProtocol_Main_Success"
								class="chk_avail_yes" style="display: none;">${Success}</span> <span
								id="EditStudy_Main_Error" class="error_label_grp"
								style="display: none;">${EditError}</span> <span
								id="EditStudy_Main_Success" class="chk_avail_yes"
								style="display: none;">${EditSuccess}</span>

							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Study Name:</strong>&nbsp;</td>
										<td width="500px" valign="middle" align="left"
											class="lable_t_imp"><span>&nbsp;${currentstudy.study_name}</span></td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Client Name:</strong>&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp"><span>&nbsp;${client.name}</span></td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Welcome Templates:</strong>&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp; <textarea
												name="viewwellcometemplate" id="viewwellcometemplate"
												style="margin-left: -4px; height: 50%; min-width: 402px; max-width: 402px; min-height: 100px; max-height: 100px;"
												readonly="readonly">${currentstudy.welcome_template}</textarea>
										</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Study Text:</strong>&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp">&nbsp; <textarea name="viewstudyte"
												id="viewstudyte"
												style="margin-left: +4px; height: 50%; min-width: 402px; max-width: 402px; min-height: 100px; max-height: 100px; display: block;"
												readonly="readonly">${currentstudy.study_text}</textarea>
										</td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Code:</strong>&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp"><span>&nbsp;${currentstudy.code}</span></td>
									</tr>
									<tr>
										<td width="19%" height="35" align="left" valign="middle"
											class="lable_t"><strong>Date Created:</strong>&nbsp;</td>
										<td width="81%" valign="middle" align="left"
											class="lable_t_imp"><span>&nbsp;${currentstudy.date_created}</span></td>
									</tr>
								</table>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 300px; float: left;">
									<button class="blue-pill"
										onclick="EditStudy('${currentstudy.study_id}','${currentstudy.study_name}','${client.sponsor_id}','${currentstudy.welcome_template}','${currentstudy.study_text}')">Edit
										Study</button>
								</div>
							</div>

							<div style="clear: both; padding-left: 130px; float: right;">
								<button class="blue-pill"
									onclick="LoadNewProtocol('AddProtocolDiv')">Add New
									Protocol</button>
							</div>
							<table id="Home_Study_Viewstudy_table"
								class="table_border_view_list" style="width: 100%; float: left;"
								border="0" cellspacing="1" cellpadding="0">

								<tr class="rights_header_view_list">
									<td width="10%" align="left" valign="middle">&nbsp;Protocol</td>
									<td width="10%" align="left" valign="middle">&nbsp;Version</td>
									<td width="10%" align="left" valign="middle">&nbsp;Name</td>
									<td width="10%" align="left" valign="middle">&nbsp;Start
										Date</td>
									<td width="10%" align="left" valign="middle">&nbsp;Duration</td>
									<td width="10%" align="left" valign="middle">&nbsp;Max
										Enrollment</td>
									<td width="5%" align="center" valign="middle">Edit</td>
								</tr>

								<tbody id="fbody">
									<c:set var="tempRowStyle" scope="page"
										value="white_row_view_list" />
									<c:forEach items="${protocolList}" var="plist"
										varStatus="status1">
										<c:set var="tempRowStyle"
											value="${(status1.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

										<tr class="${tempRowStyle}" id="${plist.protocol_version_id}">
											<td valign="top" align="left" class="set_padding">${plist.protocol_id}</td>
											<td valign="top" align="left" class="set_padding">${plist.version}</td>
											<td valign="top" align="left" class="set_padding">${plist.name}</td>
											<td valign="top" align="left" class="set_padding">${plist.start_date}</td>
											<td valign="top" align="left" class="set_padding">${plist.duration}</td>
											<td valign="top" align="left" class="set_padding">${plist.max_enrollment}</td>
											<td valign="top" align="center" class="set_padding2"><img
												onclick="EditProtocol('${plist.protocol_version_id}','${plist.protocol_id}','${plist.version}','${plist.name}','${plist.description}','${plist.start_date}','${protocolList[status1.index -1].start_date}','${protocolList[status1.index +1].start_date}','${plist.duration}','${plist.max_enrollment}')"
												src="images/edit_row_icon.png" alt="Edit" title="Edit"
												border="0" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>

				</div>


				<!-- //////////////////////////////////////// End Study Detail ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End Study Detail////////////////////////////////////////////////////// -->

				<!-- *********************************************************************************************************************** -->
				<!-- *****************************************Start Edit Study*********************************************************** -->
				<div class="body_inner" id="EditStudyDiv" style="display: none;">
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
								<a href="#">Study Detail</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
						<div class="spacer" style=""></div>
						<div
							style="clear: both; margin-top: 10px; padding-left: 130px; float: right;">
							<button class="blue-pill"
								onclick="LoadProtocolForm('ViewStudyDetailDiv')">Study
								Detail</button>
						</div>
					</div>

					<div class="create_group_container">

						<form id="EditStudyForm" name="EditStudyForm" method="post"
							action="EditStudy.study" class="site">
							<div class="myform site">

								<label>Study Name :</label> <input maxlength="500"
									name="studyname" id="studyname" type="text" class="input_txt"
									value="" /> <span id="studynameerror" class="error_label_grp"></span>

								<label>Client Name:</label> <select name="clientname"
									id="clientname" class="drop_txt">
									<c:forEach items="${sponsorlist}" var="spons"
										varStatus="Status">
										<option id="${spons.sponsor_id}" value="${spons.sponsor_id}">${spons.name}</option>
									</c:forEach>
								</select> <span id="clientnameerror" class="error_label_grp"></span> <label>Welcome
									Template:</label>
								<textarea name="wellcometemplate" id="wellcometemplate"
									style="height: 50%; min-width: 402px; max-width: 402px; min-height: 100px; max-height: 100px;"
									onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)"></textarea>
								<span id="wellcometemplateerror" class="error_label_grp"></span>

								<label>Study Text:</label>
								<textarea id="studytext" name="studytext"
									style="height: 50%; min-width: 402px; max-width: 402px; min-height: 100px; max-height: 100px;"
									onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)"></textarea>
								<span id="studytext_error" class="error_label_grp"></span> <input
									name="studyidhidden" id="studyidhidden" type="hidden"
									class="input_txt" value="" />

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" id="EditStudyCancelButton">Cancel</button>
								</div>
							</div>
						</form>
					</div>


				</div>
				<!-- *****************************************End Edit Study************************************************************** -->
				<!-- ************************************************************************************************************************ -->



				<!-- *********************************************************************************************************************** -->
				<!-- *****************************************Start Add Protocol*********************************************************** -->
				<div class="body_inner" id="AddProtocolDiv" style="display: none;">
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
								<a href="#">Study Detail</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
						<div class="spacer" style=""></div>
						<div
							style="clear: both; margin-top: 10px; padding-left: 130px; float: right;">
							<button class="blue-pill"
								onclick="LoadProtocolForm('ViewStudyDetailDiv')">Study
								Detail</button>
						</div>
					</div>

					<div class="create_group_container">
						<div class="myform site">

							<form id="AddProtocolForm" name="AddProtocolForm" method="post"
								action="AddProtocol.study" class="site">

								<label>Protocol Identifier:</label> <input maxlength="8"
									name="AddProtocolIdentifier" id="AddProtocolIdentifier"
									type="text" class="input_txt" value="" /> <span
									id="AddProtocolIdentifierError" class="error_label_grp"></span><span
									id="AddProtocolIdentifierError1" class="error_label_grp"></span>

								<label>Version</label> <input maxlength="20"
									name="AddProtocolVersion" id="AddProtocolVersion" type="text"
									class="input_txt" value="" /> <span id="AddProtocolError"
									class="error_label_grp"></span><span id="AddProtocolError1"
									class="error_label_grp"></span> <label>Name</label> <input
									maxlength="20" name="AddProtocolName" id="AddProtocolName"
									type="text" class="input_txt" value="" /> <span
									id="AddProtocolNameError" class="error_label_grp"></span> <label>Description</label>
								<textarea name="AddProtocolDescription"
									id="AddProtocolDescription" cols="" rows="3">
					</textarea>
								<span id="AddProtocolDescriptionError" class="error_label_grp"></span>

								<label>Start Date:</label> <input name="AddProtocolStartDate"
									id="AddProtocolStartDate" readonly="readonly" type="text"
									class="small" value="" /><img src="images/calender.png" alt=""
									border="0" style="float: left; margin: 0;" /> <span
									id="AddProtocolStartDateError" class="error_label_grp"
									style="width: auto;"></span> <label>Duration (Months):</label>
								<input name="AddProtocolDuration" id="AddProtocolDuration"
									maxlength="5" type="text" class="small" value="" /> <span
									id="AddProtocolDurationError" class="error_label_grp"></span> <label>Max
									Enrollment:</label> <input name="AddProtocolMaxEroll"
									id="AddProtocolMaxEroll" maxlength="8" type="text"
									class="small" value="" /> <span id="AddProtocolMaxErollError"
									class="error_label_grp"></span> <input
									name="protocol_version_id" id="protocol_version_id"
									type="hidden" class="small" value="" /> <input
									name="ActionType" id="ActionType" type="hidden" class="small"
									value="" /> <input name="AddProtocolNextDate"
									id="AddProtocolNextDate" type="hidden" class="small" value="" />
								<input name="AddProtocolPreviousDate"
									id="AddProtocolPreviousDate" type="hidden" class="small"
									value="" />

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" type="reset"
										id="AddprotocolCancelButton">Cancel</button>
								</div>

							</form>
						</div>

					</div>
				</div>

				<!-- *****************************************End Add Protocol************************************************************** -->
				<!-- ************************************************************************************************************************ -->

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

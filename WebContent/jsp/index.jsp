<%@page import="com.TrialManager.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VOXCE :: New Era in Clinical Trial Optimization</title>
<script src="JQuery/jquery-ui.min.js" type="text/javascript"></script>
<script src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/home/home.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
<script type="text/javascript">
	ddaccordion.init({
		headerclass : "expandable",
		contentclass : "categoryitems",
		revealtype : "click",
		mouseoverdelay : 200,
		collapseprev : true,
		defaultexpanded : [ 0 ],
		onemustopen : false,
		animatedefault : false,
		persiststate : true,
		toggleclass : [ "", "openheader" ],
		togglehtml : [ "prefix", "", "" ],
		animatespeed : "fast",
		oninit : function(headers, expandedindices) {
		},
		onopenclose : function(header, index, state, isuseractivated) {
		}
	});

	$(function() {
		$("#StartDate").datepick({
			dateFormat : 'yyyy-mm-dd'
		});
	});
</script>

<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />

<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>



</head>

<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>

	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">

	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>

		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->

			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->

			<div class="left_nav" id="MainDiv">

				<div class="left_nav_header">Administration</div>
				<c:if test="${tl:rightsofView(resourceList,'STUDY')==1}">

					<div class="nav_body">
						<div class="arrowlistmenu">
							<h3 class="menuheader expandable" id="current">Study</h3>
							<ul class="categoryitems">
								<c:if test="${tl:rightsofView(resourceList,'Study List')==1}">
									<li><a id="" href="#" name="hrefHome_Study_Viewstudy_div"
										onclick="NavigationFormHome('Home_Study_Viewstudy_div')">&bull;
											Study List</a></li>
								</c:if>
								<c:if test="${tl:rightsofView(resourceList,'Create Study')==1 }">
									<li><a id="" href="#"
										name="hrefHome_Study_createstudy_div"
										onclick="NavigationFormHome('Home_Study_createstudy_div')">&bull;
											Create Study</a></li>
								</c:if>
							</ul>
						</div>

					</div>

				</c:if>
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

				<!-- //////////////////////////////////////// Start View Study List ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start View Study List ////////////////////////////////////////////////////// -->
				<div class="body_inner resourceRights" id="Home_Study_Viewstudy_div"
					right="${tl:rightsofView(resourceList,'Study List')}">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Study List</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>

					<div class="create_group_container">

						<span id="Home_Study_Viewstudy_error_message"
							class="error_label_grp" style="display: none;"></span> <span
							id="Home_Study_Viewstudy_success_message" class="chk_avail_yes"
							style="display: none;"></span>
						<div class="show_hide_form">
							<div class="field_txt_view_list">

								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list" id="Home_Study_Viewstudy_table">

									<tr class="rights_header_view_list">
										<td width="20%" align="left" valign="middle">&nbsp;Study</td>
										<td width="20%" align="left" valign="middle">&nbsp;Sponsor</td>
										<td width="10%" align="left" valign="middle">&nbsp;Code</td>
										<td width="20%" align="left" valign="middle">&nbsp;Wellcome</td>
										<td width="15%" align="left" valign="middle">&nbsp;Date
											Created</td>
										<td width="15%" align="left" valign="middle">&nbsp;Date
											Modified</td>
									</tr>
									<c:forEach items="${studieslist}" var="studylist"
										varStatus="status">
										<c:set var="studysponsor" scope="page" value="" />
										<c:forEach items="${sponsorlist}" var="spl" varStatus="status">
											<c:if test="${spl.sponsor_id == studylist.client_name}">
												<c:set var="studysponsor" value="${spl.name}" />
											</c:if>
										</c:forEach>

										<c:set var="count" value="2" scope="page" />
										<c:forEach items="${protocollist}" var="plist"
											varStatus="status">
											<c:if test="${plist.study_id == studylist.study_id}">
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:if>
										</c:forEach>
										<c:set var="postcount" value="${count}" scope="page" />
										<c:if test="${count ==2 }">
											<c:set var="count" value="1" scope="page" />
										</c:if>
										<tr class="grey_row_view_list" id="${studylist.study_id}">

											<td rowspan="${count}" valign="top" align="left"
												class="set_padding"><c:if
													test="${tl:rightsofView(resourceList,'View Study')==1 }">
													<a
														href="<c:url value='ViewStudy.study?studyid=${studylist.study_id}' />"
														style="width: -moz-available; float: left; margin-left: 5px; text-decoration: none; color: #1090d1; font-weight: bold; font-size: 13px;"><img
														src="images/viewer.png" alt="del" title="View" border="0"
														style="float: left; margin-right: 5px;" />${studylist.study_name}
													</a>
												</c:if> <c:if
													test="${tl:rightsofView(resourceList,'View Study')==0 }">
													<a href="javascript://"
														style="width: -moz-available; float: left; margin-left: 5px; text-decoration: none; color: #1090d1; font-weight: bold; font-size: 13px;"><img
														src="images/viewer.png" alt="del" title="View" border="0"
														style="float: left; margin-right: 5px;" />
														${studylist.study_name} </a>
												</c:if></td>

											<td valign="top" align="left" class="set_padding">${studysponsor}</td>
											<td valign="top" align="left" class="set_padding">${studylist.code}</td>
											<td valign="top" align="left" class="set_padding">${studylist.welcome_template}</td>
											<td valign="top" align="left" class="set_padding">${studylist.date_created}</td>
											<td valign="top" align="left" class="set_padding">${studylist.date_modified}</td>
										</tr>

										<c:if test="${postcount != 2}">
											<!-- ******************************Protocol Header******************** -->
											<tr class="rights_header_view_list2">
												<td width="20%" align="left" valign="middle">&nbsp;Protocol</td>
												<td width="10%" align="left" valign="middle">&nbsp;Version</td>
												<td width="20%" align="left" valign="middle">&nbsp;Start
													Date</td>
												<td width="15%" align="left" valign="middle">&nbsp;Duration</td>
												<td width="15%" align="left" valign="middle">&nbsp;Max
													Enrollment</td>
											</tr>
											<!-- ******************************Protocol Header******************** -->

											<c:forEach items="${protocollist}" var="plist"
												varStatus="status">
												<c:if test="${plist.study_id == studylist.study_id}">
													<tr class="white_row_view_list" id="">
														<td valign="top" align="left" class="set_padding">${plist.protocol_id}</td>
														<td valign="top" align="left" class="set_padding">${plist.version}</td>
														<td valign="top" align="left" class="set_padding">${plist.start_date}</td>
														<td valign="top" align="left" class="set_padding">${plist.duration}</td>
														<td valign="top" align="left" class="set_padding">${plist.max_enrollment}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>

								</table>
							</div>
						</div>
					</div>

				</div>

				<!-- //////////////////////////////////////// End View Study List ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End View Study List ////////////////////////////////////////////////////// -->



				<!-- //////////////////////////////////////// Start Create Study  ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// Start Create Study  ////////////////////////////////////////////////////// -->

				<div class="body_inner resourceRights"
					id="Home_Study_createstudy_div"
					style="display: block; float: left;"
					right="${tl:rightsofView(resourceList,'Create Study')}">


					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Create Study</a>
							</div>

						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<form id="CreateStudyForm" name="CreateStudyForm" method="post"
							action="CreateStudy.home" class="site">


							<div class="myform site"
								style="width: 45%; float: left; margin-left: 10px">

								<span id="Home_Study_createstudy_Main_Error"
									class="error_label_grp" style="display: none;">${CreateStudyMessageCodeError}</span>
								<span id="Home_Study_createstudy_Main_Success"
									class="chk_avail_yes" style="display: none;">${CreateStudyMessageCodeSuccess}</span>

								<label>Study Name :</label> <input maxlength="500"
									name="studyname" id="studyname" type="text" class="input_txt"
									value="" style="width: 50%" /> <span id="studynameerror"
									class="error_label_grp" style="margin-left: 130px;"></span> <label>Client
									Name:</label> <select name="clientname" id="clientname"
									class="drop_txt" style="width: 50%">
									<c:forEach items="${sponsorlist}" var="spons"
										varStatus="Status">
										<option id="${spons.sponsor_id}" value="${spons.sponsor_id}">${spons.name}</option>
									</c:forEach>
								</select> <span id="clientnameerror" class="error_label_grp"></span> <label>Welcome
									Template:</label>
								<textarea name="wellcometemplate" id="wellcometemplate"
									style="width: 50%; height: 50%; min-width: 314px; max-width: 314px; min-height: 100px; max-height: 100px;"
									onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)"></textarea>
								<span id="wellcometemplateerror" class="error_label_grp"></span>

								<label>Study Text:</label>
								<textarea name="studytext"
									style="width: 50%; height: 50%; min-width: 314px; max-width: 314px; min-height: 100px; max-height: 100px;"
									onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)"></textarea>
								<span id="studytext_error" class="error_label_grp"></span> <label>Enter
									Code</label> <input maxlength="90"
									name="Home_Study_createstudy_code_field"
									id="Home_Study_createstudy_code_field" type="text"
									class="input_txt" value="" style="width: 50%;" /> <span
									id="Home_Study_createstudy_code_field_error"
									class="error_label_grp" style="margin-left: 130px;"></span>
								<!-- 
					<div  style="clear:both; margin-bottom:8px; padding-bottom:5px;">
					<label>Enter Code As :</label>	
					<input name="Home_Study_createstudy_codetype" id="Home_Study_createstudy_codetype" type="radio"  value="one" /><span id="Home_Study_createstudy_codetype_text1" class="txt_norm">Input Code In Field</span>
					<input name="Home_Study_createstudy_codetype" id="Home_Study_createstudy_codetype" type="radio" value="two"  /> <span id="Home_Study_createstudy_codetype_text2" class="txt_norm">Select Code From List</span>
					</div>
					
					<label></label>
					<input maxlength="90" name="Home_Study_createstudy_code_field" id="Home_Study_createstudy_code_field" type="text" class="input_txt"  value="" style="width:50%; display: none" /> <span id="Home_Study_createstudy_code_field_error" class="error_label_grp" style="margin-left: 130px;"></span>
					<select name="Home_Study_createstudy_code_select" id="Home_Study_createstudy_code_select" class="drop_txt input_txt2" style="height: auto; width:50%;">
					 	 <c:forEach items="${studieslist}" var="stlist" varStatus="Status">
							<option id="${stlist.study_id}" value="${stlist.code}">${stlist.code}</option>
						</c:forEach>
					</select> <span id="Home_Study_createstudy_code_select_error" class="error_label_grp" style="margin-left: 130px;"></span>
					 -->
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" type="reset">Reset</button>
								</div>
							</div>



							<div class="myform site" style="width: 45%; float: right;">
								<label>Protocol Number:</label> <input name="ProtocolNumber"
									id="ProtocolNumber" type="text" class="input_txt" value=""
									maxlength="8" style="width: 30%" /> <span
									id="ProtocolNumberError" class="error_label_grp"></span> <label>Version:</label>
								<input name="ProtocolVersion" id="ProtocolVersion" type="text"
									class="input_txt" value="" maxlength="20" style="width: 30%" />
								<span id="ProtocolVersionError" class="error_label_grp"></span>

								<label>Protocol Name:</label> <input name="ProtocolName"
									id="ProtocolName" type="text" class="input_txt" value=""
									maxlength="20" style="width: 30%" /> <span
									id="ProtocolNameError1" class="error_label_grp"></span> <label>Description:</label>
								<textarea name="protocoldesc"
									style="width: 50%; height: 50%; min-width: 314px; max-width: 314px; min-height: 100px; max-height: 100px;"></textarea>
								<span id="protocoldescerror" class="error_label_grp"></span> <label>Start
									Date:</label> <input name="StartDate" id="StartDate"
									readonly="readonly" type="text" class="small" value="" /><img
									src="images/calender.png" alt="" border="0"
									style="float: left; margin: 0;" /> <span id="StartDateError"
									class="error_label_grp"></span> <label>Duration
									(Months):</label> <input name="ProtocolDuration" id="ProtocolDuration"
									maxlength="5" type="text" class="small" value="" /> <span
									id="ProtocolDurationError" class="error_label_grp"></span> <label>Max
									Enrollment:</label> <input name="ProtocolEnrollment"
									id="ProtocolEnrollment" maxlength="8" type="text" class="small"
									value="" /> <span id="ProtocolEnrollmentError"
									class="error_label_grp"></span>

							</div>
						</form>
					</div>
				</div>



				<!-- //////////////////////////////////////// End Create Study    ////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////// End Create Study    ////////////////////////////////////////////////////// -->

			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<%@include file="footer.jsp"%>

	</div>
	<!-- wrapper ends here -->

</body>

</html>


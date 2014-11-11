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

<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript" src="js/trials.js"></script>
<script src="JQuery/jquery.fileupload.js"></script>
<script src="JQuery/jquery.fileupload-ui.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	ddaccordion.init({
		headerclass : "expandable", //Shared CSS class name of headers group that are expandable
		contentclass : "categoryitems", //Shared CSS class name of contents group
		revealtype : "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay : 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev : true, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded : [ 7 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
		onemustopen : false, //Specify whether at least one header should be open always (so never all headers closed)
		animatedefault : false, //Should contents open by default be animated into view?
		persiststate : true, //persist state of opened contents within browser session?
		toggleclass : [ "", "openheader" ], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
		togglehtml : [ "prefix", "", "" ], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
		animatespeed : "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
		oninit : function(headers, expandedindices) { //custom code to run when headers have initalized
			//do nothing
		},
		onopenclose : function(header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
			//do nothing
		}
	});
</script>

<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>

<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />
<link href="css/jquery.fileupload-ui.css" rel="stylesheet"
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






</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentFormApprovalType}" />
	<input type="hidden" name="ApprovalStatusMessage"
		id="ApprovalStatusMessage" value="${MessageCode}" />






	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">Trial Management</div>
				<div class="nav_body">

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Approval Status Type</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Approval Status Type')==1}">
								<li><a href="#" name="hrefviewapprovalstatustypediv"
									id="hrefviewapprovalstatustypediv"
									onclick="LoadTrialsForm('View_Approval_Status_Type_div')">&bull;
										View Approval Status Type</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Add Approval Status Type')==1}">
								<li><a href="#" name="hrefcreateapprovalstatustypediv"
									id="hrefcreateapprovalstatustypediv"
									onclick="LoadTrialsForm('Create_Approval_Status_Type_div')">&bull;
										Create Approval Status Type</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">

						<h3 class="menuheader expandable">Submission Type</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Submissions')==1}">
								<li><a
									href="<c:url value='ShowSubmissionType.trial?studyid=${currentstudy.study_id}&sub_type_form=1' />"
									name="hrefviewsubmissiontypediv" onclick="">&bull; View
										Submission Type</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Add Submissions')==1}">
								<li><a
									href="<c:url value='ShowSubmissionType.trial?studyid=${currentstudy.study_id}&sub_type_form=2' />"
									name="hrefcreatesubmissiontypediv" onclick="">&bull; Create
										Submission Type</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Training Type</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Training Type')==1}">
								<li><a
									href="<c:url value='ShowTrainingType.trial?studyid=${currentstudy.study_id}&train_type_form=1' />"
									name="hrefviewtrainingdiv" onclick="">&bull; View Training</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Add Training Type')==1}">
								<li><a
									href="<c:url value='ShowTrainingType.trial?studyid=${currentstudy.study_id}&train_type_form=2' />"
									name="hrefcreatetrainingdiv" onclick="">&bull; Create
										Training</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">User CV</h3>
						<ul class="categoryitems">
							<c:if test="${tl:rightsofView(resourceList,'View User CV')==1}">
								<li><a
									href="<c:url value='ShowUserCV.trial?studyid=${currentstudy.study_id}&user_cv_form=1' />"
									name="hrefviewusercvdiv" onclick="">&bull; View User CV</a></li>
							</c:if>
							<c:if test="${tl:rightsofView(resourceList,'Create User CV')==1}">
								<li><a
									href="<c:url value='ShowUserCV.trial?studyid=${currentstudy.study_id}&user_cv_form=2' />"
									name="hrefcreateusercvdiv" onclick="">&bull; Create User CV</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">User Training</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'Create User Training')==1}">
								<li><a
									href="<c:url value='ShowTrainingUser.trial?studyid=${currentstudy.study_id}&train_user_form=1' />"
									name="hrefviewtraininguserdiv" onclick="">&bull; View User
										Training</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create User Training')==1}">
								<li><a
									href="<c:url value='ShowTrainingUser.trial?studyid=${currentstudy.study_id}&train_user_form=2' />"
									name="hrefcreatetraininguserdiv" onclick="">&bull; Create
										User Training</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Submissions</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Submissions')==1}">
								<li><a
									href="<c:url value='ShowSubmission.trial?studyid=${currentstudy.study_id}&submission_form=1' />"
									name="hrefviewsubmissiondiv" onclick="">&bull; View
										Submissions</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Add Submissions')==1}">
								<li><a
									href="<c:url value='ShowSubmission.trial?studyid=${currentstudy.study_id}&submission_form=2' />"
									name="hrefcreatesubmissiondiv" onclick="">&bull; Create
										Submissions</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Medical License</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Medical License')==1}">
								<li><a
									href="<c:url value='ShowMedicalLicense.trial?studyid=${currentstudy.study_id}&medical_form=1' />"
									name="hrefviewmedicallicensediv" onclick="">&bull; View
										Medical License</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Medical License')==1}">
								<li><a
									href="<c:url value='ShowMedicalLicense.trial?studyid=${currentstudy.study_id}&medical_form=2' />"
									name="hrefcreatemedicallicensediv" onclick="">&bull; Create
										Medical License</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Financial Disclosure</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Financial Disclosure')==1}">
								<li><a
									href="<c:url value='ShowFinancialDisc.trial?studyid=${currentstudy.study_id}&financial_disc_form=1' />"
									name="hrefviewfinancialdisclosurediv" onclick="">&bull;
										View Financial Disclosure</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Financial Disclosure')==1}">
								<li><a
									href="<c:url value='ShowFinancialDisc.trial?studyid=${currentstudy.study_id}&financial_disc_form=2' />"
									name="hrefcreatefinancialdisclosurediv" onclick="">&bull;
										Create Financial Disclosure</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Contracts</h3>
						<ul class="categoryitems">
							<c:if test="${tl:rightsofView(resourceList,'View Contracts')==1}">
								<li><a
									href="<c:url value='ShowContracts.trial?studyid=${currentstudy.study_id}&contract_form=1' />"
									name="hrefviewcontractdiv" onclick="">&bull; View Contract</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Contracts')==1}">
								<li><a
									href="<c:url value='ShowContracts.trial?studyid=${currentstudy.study_id}&contract_form=2' />"
									name="hrefcreatecontractdiv" onclick="">&bull; Create
										Contract</a></li>
							</c:if>
						</ul>
					</div>

					<!-- ==================================================================================================================== -->
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<!--  												Start Approval_Status_Type View-->
				<!--  												Start Approval_Status_Type View-->


				<div class="body_inner" id="View_Approval_Status_Type_div"
					style="display: none;">
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
								<a
									href="<c:url value='ShowTrials.trial?studyid=${currentstudy.study_id}' />">Trial
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">View Approval Status Type</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>

					<div class="create_group_container">
						<div class="field_label_view_list">Search :</div>
						<div class="field_set">
							<input id="View_Approval_Status_bar"
								name="View_Approval_Status_bar" type="text" class="input_txt"
								value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">

							<span id="Edit_Approval_Status_Type_Error"
								class="error_label_grp" style="display: none; width: auto;">${EEMessage}</span>
							<span id="Edit_Approval_Status_Type_Success"
								class="chk_avail_yes" style="display: none; width: auto;">${ESMessage}</span>

							<div class="field_txt_view_list">
								<input name="visit_id1" id="visit_id1" type="text" value="0"
									class="input_txt" style="display: none" />
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Code</td>
										<td width="8%" align="left" valign="middle">&nbsp;Name</td>
										<td width="11%" align="left" valign="middle">&nbsp;Description</td>
										<td width="3%" align="center" valign="middle">Edit</td>
									</tr>
									<tbody id="fbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${approvalstatustypelist}" var="typelist"
											varStatus="status">
											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle}"
												id="${typelist.approval_status_type_id}">
												<td valign="top" align="left" class="set_padding">${typelist.code}</td>
												<td valign="top" align="left" class="set_padding">${typelist.name}</td>
												<td valign="top" align="left" class="set_padding">${typelist.description}</td>
												<td valign="top" align="center" class="set_padding2"><img
													onclick="edit_view_approval_status_type_row('${typelist.approval_status_type_id}','${typelist.code}','${typelist.name}','${typelist.description}','${typelist.date_created}','${typelist.created_by}')"
													src="images/edit_row_icon.png" alt="Edit" title="Edit"
													border="0" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="Edit_User_error_message" class="chk_avail_yes"></div>
				</div>
				<!--  												End Approval_Status_Type Patient-->
				<!--  												End Approval_Status_Type Patient-->

				<!-- 												Start Create Approval_Status_Type-->
				<!-- 												Start Create Approval_Status_Type-->
				<div class="body_inner" id="Create_Approval_Status_Type_div"
					style="display: none;">
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
								<a
									href="<c:url value='ShowTrials.trial?studyid=${currentstudy.study_id}' />">Trial
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id="approval_status_type_title">Create Approval
									Status Type</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->

					</div>
					<div class="create_group_container">
						<div id="" class="myform visit">
							<form id="approval_status_type_form"
								name="approval_status_type_form" method="post"
								action="CreateApprovalStatusType.trial" class="visit">

								<span id="Create_Approval_Status_Type_Error"
									class="error_label_grp" style="display: none; width: auto;">${EMessage}</span>
								<span id="Create_Approval_Status_Type_Success"
									class="chk_avail_yes" style="display: none; width: auto;">${SMessage}</span>

								<input name="edit_id_approval_status"
									id="edit_id_approval_status" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="date_created" id="date_created" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="created_by" id="created_by" type="text" value="0"
									class="input_txt" style="display: none" /> <label>Code
									:</label> <input id="code" name="code" type="text" value=""
									class="input_txt" maxlength="20" /><span id="code_error"
									class="error_label"></span> <label>Name :</label> <input
									id="name" name="name" type="text" value="" class="input_txt"
									maxlength="100" /><span id="name_error" class="error_label"></span>
								<label>Description :</label>
								<textarea id="description" name="description" cols="" rows=""
									onkeyup="if (this.value.length > 500)this.value = this.value.substring(0, 500)">
</textarea>
								<span id="description_error" class="error_label_grp"></span>
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<button class="blue-pill">Save</button>
									<button class="grey-pill" type="reset"
										onclick="LoadTrialsForm('View_Approval_Status_Type_div')">Cancel</button>
								</div>
							</form>
						</div>
					</div>

				</div>

				<!--  												End Create Approval_Status_Type-->
				<!--  												End Create Approval_Status_Type-->



			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>

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

<script src="JQuery/jquery-1.7.1.js"></script>

<script src="JQuery/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".assisgn-Crf-to-visit-sub").click(function() {
		//	window.loacation.href = "ShowVisitsIndex.visits";
			
		});

		$("#crf_hidden").find("option").each(function() {
			var select = $(this);
			$("#visitCrf_hidden").find("option").each(function() {
				
				if ($(this).attr("value") == select.attr("value")) {
					select.attr("selected", "selected");
					
				}
			});
		});
		$(".multiselect").html($("#crf_hidden").html());
		$(".multiselect").multiselect();
		$(".ui-multiselect").removeAttr("style");
		$(".ui-multiselect").css("float", "left");
	});
</script>
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="AddSiteMessageCode" id="AddSiteMessageCode"
		value="${MessageCode}" />
	<input type="hidden" name="AddStudySiteMessageCode"
		id="AddStudySiteMessageCode" value="${AddSSMessageCode}" />
	<input type="hidden" name="EditStudySiteMessageCode"
		id="EditStudySiteMessageCode" value="${EditSSMessageCode}" />
	<input type="hidden" name="EditSiteMessageCode"
		id="EditSiteMessageCode" value="${EditMessageCode}" />
	<input type="hidden" name="AddSiteUserMessageCode"
		id="AddSiteUserMessageCode" value="${AddSiteUserMessageCode}" />
	<input type="hidden" name="Deletesiteusermessage"
		id="Deletesiteusermessage" value="${Deletesiteusermessage}" />
	<input type="hidden" name="AddStudySiteUserMessageCode"
		id="AddStudySiteUserMessageCode" value="${StudySiteUserMessageCode}" />
	<input type="hidden"
		id="Add_StudySiteUser_Form_hidden_siteid_preselect"
		name="Add_StudySiteUser_Form_hidden_studyid_preselect"
		value="${AddstudySiteUsersiteid}" />
	<input type="hidden"
		id="Add_StudySiteUser_Form_hidden_studyid_preselect"
		name="Add_StudySiteUser_Form_hidden_studyid_preselect"
		value="${AddstudySiteUserstudyid}" />
	<input type="hidden" id="DeleteStudySiteUserMessageCode"
		name="DeleteStudySiteUserMessageCode"
		value="${DeleteStudySiteUserMessageCode}" />
	<!-- <input type="hidden" name="Addsitestudylist" id="Addsitestudylist" value="${siteslist}" />  -->
	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<a href="<c:url value='ShowVisitsIndex.visits'/>" class="nav_l"
							name="" onclick="">Create Visit</a> <a href="" class="nav_l"
							name="" onclick="" id="current">Visits List</a>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv"
				style="min-width: 60%;">



				<!-- ////////////////////////////////////////Start Add User to Site////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////StartAdd User to Site////////////////////////////////////////////////////// -->
				<div class="body_inner" id="Add_Site_User_Div">
					<div class="body_inner_header" id="Add_Site_User_Div_Title">
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
								<a href="#">Add CRF to Visit</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<span id="Add_Site_User_Main_Error" class="error_label_grp"
							style="display: none;"></span> <span
							id="Add_Site_User_Main_Success" class="chk_avail_yes"
							style="display: none;"></span>
						<div class="myform site">
							<form id="Add_Site_User_Form" name="Add_Site_User_Form"
								method="post" action="SaveAssignVisit.visits" class="site">
								<select id="crf_to_visit" style="width: 601px"
									class="multiselect" multiple="multiple" name="crf_to_visit">
								</select> <select id="crf_hidden" style="display: block;">
									<c:forEach items="${crf}" var="crfs" varStatus="Crfstatus">
										<option value="${crfs.crf_id}" onclick=""selected="selected">${crfs.crf_name}</option>
									</c:forEach>
								</select> <select id="visitCrf_hidden" style="display: block;">
									<c:forEach items="${visitCRFs}" var="visList"
										varStatus="Crfstatus">
										<option value="${visList.case_report_form_id}" onclick="">${visList.case_report_form_id}</option>
									</c:forEach>
								</select> <input type="hidden" value="${visitId}" name="visitId" />
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px; padding-left: 130px;">
									<button class="blue-pill assisgn-Crf-to-visit-sub">Save</button>
									<button class="grey-pill cancle-Crf-to-visit-sub">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ////////////////////////////////////////End Add User to Site////////////////////////////////////////////////////// -->
				<!-- ////////////////////////////////////////End Add User to Site////////////////////////////////////////////////////// -->




			</div>


			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<%@include file="footer.jsp"%>

	</div>
	<!-- wrapper ends here -->
</body>
</html>


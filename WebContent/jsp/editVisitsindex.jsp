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
<!-- https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15 -->
<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<!--  <script type="text/javascript" src="JQuery/jquery-ui-1.8.17.custom.min.js"></script>-->
<script src="JQuery/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/jquery.betterTooltip.js"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>

<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>

<link href="css/crf.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/payment.css" rel="stylesheet" type="text/css" />
<link href="css/visits.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<!-- <link href="css/tooltipStyle.css" rel="stylesheet" type="text/css" />  -->
<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="js/visits.js"></script>
<script>
	var relatedTo = '<c:out value="${visit.related_visit_id}" />';
	var visitName = '<c:out value="${visit.related_visit_id}" />';
	var study = '<c:out value="${study}" />';

	$(document).ready(function() {
		$(".study_select").find("option").removeAttr("selected");
		$(".study_select").find("option").each(function() {

			if ($(this).attr("value") == study) {
				$(this).attr("selected", "selected");
				//alert(study+"    "+$(this).attr("value"));
			}
		});
		var start = $(this).find("#zero").clone();
		$("#visitRelated").append(start);
		value = $(".study_select").val();
		if (value != 0) {
			$(".element").removeAttr("disabled");
			$(".myOwn").removeAttr("disabled");
			$("#visitName").empty();
			$("#visitRelated").empty();
			$("#zero").attr("selected", "selected");
			$("#zeror").attr("selected", "selected");
			$("#hiddenvisitname").find("option").each(function() {
				if ($(this).attr("study") == value) {
					var div = $(this).clone();
					var div2 = $(this).clone();
					$("#visitName").append(div);
					$("#visitRelated").append(div2);
				} else {
					//	$(this).attr("disabled",true);
				}
			});
		} else {
			$(".myOwn").attr("disabled", "disabled");
			$(".element").attr("disabled", "disabled");
		}

		//	alert(relatedTo);
		$("#visitRelated").find("option").removeAttr("selected");
		if (relatedTo != "" && relatedTo != null && relatedTo != 0) {
			$(".visit_related_with").show();
			$(".checkbox_IsRepeted").attr("checked", "checked");
			$("#visitRelated").find("option").each(function() {
				//alert($(this).attr("value")+"    "+relatedTo);
				if ($(this).attr("value") == relatedTo) {
					$(this).attr("selected", "selected");
				}
			});
		} else {
			$(".visit_related_with").hide();
		}
		//$("#datepicker1").datepick({dateFormat: 'yyyy-mm-dd'});
		$("#datepicker1").datepicker({
			 changeMonth: true,
	            changeYear: true,
			dateFormat : 'yy-mm-dd'
		});
		//	$(".study_select").find("option").removeAttr("selected");

		
			if($(".checkbox_IsRepeted").is(":checked")){
				$("#primaryVisit").removeAttr("checked");
				$("#primaryVisit").hide();
				$("#primaryVisitLabel").hide();
			}else{
				$("#primaryVisit").show();
				$("#primaryVisitLabel").show();			
			}
		});
	
</script>
<style>
span.tooltip-style1 {
	display: none;
	position: absolute;
	z-index: 1000;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
}

.tooltip-style1 {
	background: #5a85a5 url(/public/images/icons/onebit_47.png) 10px center
		no-repeat;
	color: white;
	min-height: 30px;
	padding: 10px 20px 10px 65px;
	opacity: 0.9;
}

.tooltip-style2 {
	background: #363636;
	padding: 3px;
	color: white;
	text-align: center;
}

.tooltip-style3 {
	background: #e8e8e8;
	color: black;
	padding: 15px;
}

pre {
	font-size: 10px;
}
</style>
</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />

	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<a href="<c:url value='ShowVisitsIndex.visits'/>" class="nav_l"
							name="" onclick="">Create Visit</a> <a
							href="<c:url value='ShowVisitsIndex.visits'/>" class="nav_l"
							name="" onclick="" id="current">Visits List</a>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<!-- ************************************************************************************************************************************************** -->
				<!-- ****************************************************Start Create Visit *************************************************************************** -->
				<div class="body_inner" id="Create_Visit_Div" style="display: none;">
					<div class="body_inner_header">
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
								<a href="#">Edit Visit</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform visit">
							<form id="createVisitForm" name="editVisitForm" method="post"
								action="editVisit.visits" class="visit">
								<span id="Create_Visit_Main_Error" class="error_label_grp"
									style="display: none;"></span> <span
									id="Create_Visit_Main_Success" class="chk_avail_yes"
									style="display: none;"></span> <label>Select Study</label> <input
									type="hidden" name="vnt" value="${visitnametextid }" /> <select
									name="study" class="study_select drop_txt" disabled="true">
									<option value="0">----Please Select Study----</option>
									<c:forEach items="${studyList}" var="study"
										varStatus="studyStatus">
										<option value="${study.study_id}">${study.study_name}</option>
									</c:forEach>
								</select><span id="noStudy" style="float: left;"></span> <label>Visit
									Name : </label> <select style="display: none" name="hiddenvisitname"
									class="site_drop_txt drop_txt element" id="hiddenvisitname"
									style="float:left;text-align:center;">
									<c:forEach items="${Visitslist}" var="vntlist"
										varStatus="status">
										<c:forEach items="${VisitNameTextslist}" var="visitname"
											varStatus="status">
											<c:if
												test="${visitname.visit_name_text_id== vntlist.visit_name_text_id}">
												<option id="${visitname.visit_name}"
													study="${vntlist.study_id}" value="${vntlist.visit_id}"
													onclick="">${visitname.visit_name}</option>
											</c:if>
										</c:forEach>
									</c:forEach>
								</select> <select name="visitName" class="site_drop_txt drop_txt element"
									id="visitName"
									style="float: left; text-align: center; display: none;">
									<option id="zero" value="0">----- Select Visit ----</option>

								</select>
								<!-- <a href = "javascript://" style = "float:left;margin-left:5px;text-decoration: none;color:#1090D1;" class = "show-my-own">Add New Visit Text</a> -->
								<input type="text" name="visit_name" id="visit_name"
									style="margin-left: 5px; width: 150px;" class="myOwn input_txt"
									maxlength="255" value="${visitname }" /> <span
									id="visitName_error" class="error_label"></span> <label>Is
									Related :</label><input type="checkbox" style="float: left;"
									class="checkbox_IsRepeted" />
								<div class="visit_related_with"
									style="width: 90%; float: left; display: none;">
									<label>Select Visit :</label> <select name="relatedVisit"
										class="site_drop_txt drop_txt element" id="visitRelated"
										style="float: left; text-align: center;">
										<option id="zeror" value="0">----- Select Visit to
											RelRstyate----</option>
									</select> <label>Optimum Days</label> <input id='optimum_days'
										class="element input_txt" name="dateOfVisit"
										value="${visit.visit_optimum}" style="float: left;" /><span
										id="noDate" style="float: left;"></span>
								</div>


								<label>Visit Description:</label>
								<textarea id="visitDescription" name="visitDescription">${visit.description}</textarea>
								<span id="visitDescription_error" class="error_label_grp"></span>
								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Type :</label><br />
									<div style="float: left">
										<c:choose>
											<c:when test="${visit.is_mandatory == true}">
												<input id="mandatory" class="type-of-visit"
													checked="checked" name="mandatory" type="checkbox" />
												<span class="txt_norm">Mandatory</span>
											</c:when>
											<c:otherwise>
												<input id="mandatory" class="type-of-visit" name="mandatory"
													type="checkbox" />
												<span class="txt_norm">Mendatory</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${visit.is_scheduled == true}">
												<input id="scheduled" class="type-of-visit"
													checked="checked" name="scheduled" type="checkbox" />
												<span class="txt_norm">Scheduled</span>
											</c:when>
											<c:otherwise>
												<input id="scheduled" class="type-of-visit" name="scheduled"
													type="checkbox" />
												<span class="txt_norm">Scheduled</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${visit.is_monitor == true}">
												<input id="monitor" class="type-of-visit" name="monitor"
													checked="checked" type="checkbox" />
												<span class="txt_norm">Monitoring</span>
											</c:when>
											<c:otherwise>
												<input id="monitor" class="type-of-visit" name="monitor"
													type="checkbox" />
												<span class="txt_norm">Monitoring</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${visit.is_adverse == true}">
												<input id="adverse" class="type-of-visit" name="adverse"
													checked="checked" type="checkbox" />
												<span class="txt_norm">Adverse Event</span>
											</c:when>
											<c:otherwise>
												<input id="adverse" class="type-of-visit" name="adverse"
													type="checkbox" />
												<span class="txt_norm">Adverse Event</span>
											</c:otherwise>
										</c:choose>

									</div>
									<span id="typesVisit" class="error_label_grp"></span>
								</div>
								<label id="primaryVisitLabel">Primary Visit :</label>
								<div style="float: left">
									<c:if test="${visit.is_primary==1 }">
										<input id="primaryVisit" class="type-of-visit element"
											name="primaryVisit" type="checkbox" checked="checked"
											style="margin-top: 8px;" />
									</c:if>
									<c:if test="${visit.is_primary==0 }">
										<input id="primaryVisit" class="type-of-visit element"
											name="primaryVisit" type="checkbox" style="margin-top: 8px;" />
									</c:if>
								</div>
								<div class="visit_related_with"
									style="width: 90%; float: left; display: none;">

									<label>Window Open :</label> <input id="openWindow"
										name="openWindow" type="text" value="${visit.window_open}"
										class="input_txt" /> <span id="openWindow_error"
										class="error_label"></span> <label>Window Close :</label> <input
										id="closeWindow" name="closeWindow" type="text"
										value="${visit.window_close}" class="input_txt" /> <span
										id="closeWindow_error" class="error_label"></span>
								</div>
								<input name="visitId" type="hidden" value="${visit.visit_id}" />
								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<input type="button" class="blue-pill submit-button"
										value="Save" />

								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- ****************************************************End Create Visit*************************************************************************** -->
				<!-- *********************************************************************************************************************************************** -->

				<!-- ******************************************************************************************************************************* -->
				<!-- ****************************************************Start Visit List*************************************************************************** -->
				<div class="body_inner" id="View_Visitlist_Div"
					style="display: none;">
					<div class="body_inner_header">
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
								<a href="#">View Visits</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<span id="View_Visitlist_Main_Error" class="error_label_grp"
									style="display: none;"></span> <span
									id="View_Visitlist_Main_Success" class="chk_avail_yes"
									style="display: none;"></span>
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle">&nbsp;Visit</td>
										<td width="10%" align="left" valign="middle">&nbsp;Scheduled</td>
										<td width="10%" align="left" valign="middle">&nbsp;Adverse
											Event</td>
										<td width="10%" align="left" valign="middle">&nbsp;Monitor</td>
										<td width="10%" align="left" valign="middle">&nbsp;Mandatory</td>
										<td width="10%" align="left" valign="middle">&nbsp;Windows
											Open</td>
										<td width="10%" align="left" valign="middle">&nbsp;Windows
											Close</td>
										<td width="8%" align="center" valign="middle">Edit</td>
										<td width="7%" align="center" valign="middle">Delete</td>
									</tr>

									<c:forEach items="${Visitslist}" var="visits"
										varStatus="status">

										<c:set var="visitNameText" scope="page" value="" />
										<c:forEach items="${VisitNameTextslist}" var="visitName"
											varStatus="statusList">
											<c:if
												test="${visits.visit_name_text_id == visitName.visit_name_text_id}">
												<c:set var="visitNameText" value="${visitName.visit_name}" />
											</c:if>
										</c:forEach>
										<c:set var="tempRowStyle"
											value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
										<tr class="${tempRowStyle}" id="${visits.visit_id}">
											<td valign="top" align="left" class="set_padding">${visitNameText}<a
												href="javascript://" class="desc_icon desciption"
												des="${visits.description}"><img src="images/edit.png" /></a></td>
											<td valign="top" align="left" class="set_padding">${visits.is_scheduled}</td>
											<td valign="top" align="left" class="set_padding">${visits.is_adverse}</td>
											<td valign="top" align="left" class="set_padding">${visits.is_monitor}</td>
											<td valign="top" align="left" class="set_padding">${visits.is_mandatory}</td>
											<td valign="top" align="left" class="set_padding">${visits.window_open}</td>
											<td valign="top" align="left" class="set_padding">${visits.window_close}</td>
											<td valign="top" align="center" class="set_padding2"><a
												href=""><img src="images/edit.png" alt="Edit"
													title="Edit" border="0" /></a></td>
											<td valign="top" align="center" class="set_padding2"><a
												href="<c:url value='deleteVisits.visits?visits_id=${visits.visit_id}'/>"><img
													src="images/delete.png" alt="Del" title="Delete" border="0" /></a></td>
										</tr>
									</c:forEach>
								</table>
							</div>

							<div class="spacer"></div>
							<div style="clear: both; margin-top: 20px;">
								<button class="blue-pill">Save</button>
							</div>

						</div>
					</div>
				</div>
				<!-- ****************************************************End Visit List*************************************************************************** -->
				<!-- ******************************************************************************************************************************* -->
			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
	<div id="header_wrapper" class="tooltips">
		<pre></pre>
		<span class="tooltip-style1"></span>
	</div>

</body>

</html>


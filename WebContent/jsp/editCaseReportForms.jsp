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
<!-- https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15-->
<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script src="JQuery/jquery-ui.min.js"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/library.css" rel="stylesheet" type="text/css" />
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />
<link href="css/crf.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/gen_validatorv4.js">
	
</script>

<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
<script type="text/javascript">
	var crfId = "<c:out value = '${caseReportFormHtml.crf_id}' />";
	ddaccordion.init({
		headerclass : "expandable", //Shared CSS class name of headers group that are expandable
		contentclass : "categoryitems", //Shared CSS class name of contents group
		revealtype : "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay : 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev : true, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded : [ 9 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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

	function back() {
		window.location.href = "ShowCRFPage.crf?CurrentForm=viewcrfdiv";

	}
</script>
<script type="text/javascript" src="js/crf.js">
	
</script>
<script>
	$(document)
			.ready(
					function() {

						$(".crf-block")
								.find(".section-div")
								.find(".section-list")
								.each(
										function() {

											var valure = $(this);
											$(this)
													.find("option")
													.each(
															function() {
																var textString = valure
																		.parent()
																		.find(
																				".crf-section-block")
																		.find(
																				".section-name")
																		.text();
																//textString = textString.substr(textString.indexOf(":",0)+2);
																if (textString == $(
																		this)
																		.text()) {
																	$(this)
																			.attr(
																					"selected",
																					"selected");
																}
															});

										});
					});
</script>
</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="EditMessageCode" id="EditMessageCode"
		value="${EditMessageCode}">


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

				<div class="left_nav_header">Case Report Forms</div>
				<div class="nav_body">

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Question</h3>
						<ul class="categoryitems">
							<li><a
								href="<c:url value='ShowCRFIndex.crf?CurrentForm=add_question_form'/>">&bull;
									Create Question</a></li>
							<li><a
								href="<c:url value='ShowCRFIndex.crf?CurrentForm=list_question_form'/>">&bull;
									View Question</a></li>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Section</h3>
						<ul class="categoryitems">
							<li><a href="javascript://" name="hrefadd_question_form"
								onclick="LoadCRFForm('add_question_form')">&bull; Create
									Question</a></li>
							<li><a href="javascript://" name="hreflist_question_form"
								onclick="LoadCRFForm('list_question_form')">&bull; View
									Question</a></li>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">CRF</h3>
						<ul class="categoryitems">
							<li><a
								href="<c:url value='ShowCRFPage.crf?CurrentForm=addcrfdiv'/>"
								id="add_lab">&bull;Create CRF</a></li>
							<li><a
								href="<c:url value='ShowCRFPage.crf?CurrentForm=viewcrfdiv'/>"
								id="view_labs">&bull; View CRFs</a></li>
						</ul>
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
			<div class="right_body_content" id="mainFormsDiv"
				style="width: 700px;">

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start add crf  ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="add_questiontext_form">
					<div class="body_inner_header">Add Section Text</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formAddSection" name="formAddSection" method="POST"
								action="editCRF.crf" class="">

								<span id="AddQTGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="AddQTErrorMessage"
									class="error_label" style="display: none;"></span>


								<div class="section-container"
									style="border: 1px solid scrollbar; width: 98.8%; float: left; padding: 5px; margin: 5px;">
									${caseReportFormHtml.crf_edit_html}</div>

								<div class="spacer"></div>
								<div style="clear: both;">
									<input type="hidden" id="htmlData" name="htmlData"> <input
										type="hidden" id="editHtmlData" name="editHtmlData"> <input
										type="hidden" id="crfId" value="${caseReportFormHtml.crf_id}"
										name="crfId">
									<button id="submit_crf" type="button"
										style="width: 100px; margin-left: 39%; height: 32px"
										class="blue-pill save-crf">Save</button>
									<input id="cancleSubmit" onclick="back()" style="width: 100px;"
										type="button" class="grey-pill" value="Cancel">
								</div>

							</form>


						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add crf ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view crf ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="list_questiontexts_form"
					style="display: none;">
					<div class="body_inner_header">View Case Report Form</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Case Report Form:</div>
						<div class="field_set">
							<input id="View_QuestionTexts_Search_Bar"
								name="View_QuestionTexts_Search_Bar" type="text"
								class="input_txt" value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">

								<form id="view_question_form">

									<table width="60%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">

										<tr class="rights_header_view_list">
											<td width="22%" height="20" align="left" valign="middle">&nbsp;Name</td>
											<td width="20%" align="left" valign="middle">&nbsp;View</td>
											<c:if test="${tl:rightsofView(resourceList,'Edit CRFs')==1 }">
												<td width="12%" align="left" valign="middle">&nbsp;Edit</td>
											</c:if>
											<c:if
												test="${tl:rightsofView(resourceList,'Delete CRFs')==1 }">
												<td width="12%" align="left" valign="middle">&nbsp;Delete</td>
											</c:if>
										</tr>

										<tbody id="fbody">
											<c:forEach items="${caseReportFormsList}" var="crf"
												varStatus="status">
												<c:set var="tempRowStyle"
													value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
												<tr class="${tempRowStyle}" id="${crf.crf_id}">
													<td valign="top" align="left"
														class="set_padding name-section-text">${crf.crf_name}</td>
													<td valign="top" align="left" class="set_padding"><a
														href="javascript://" class="desc_icon view-question"
														htmlData='${crf.crf_html}'><img src="images/view.png" /></a></td>
													<c:if
														test="${tl:rightsofView(resourceList,'Edit CRFs')==1 }">
														<td valign="top" align="left" class="set_padding" edit=''><a
															class="edit-crf-section"
															href='<c:url value="ShowEditCrf.crf?crf_id=${crf.crf_id}"/>'><img
																src="images/edit.png" alt="Edit" title="Edit" border="0" /></a></td>
													</c:if>
													<c:if
														test="${tl:rightsofView(resourceList,'Delete CRFs')==1 }">
														<td valign="top" align="center" class="set_padding2"><a
															href="<c:url value='deleteCrf.crf?crf_id=${crf.crf_id}'/>"><img
																src="images/delete.png" alt="Del" title="Delete"
																border="0" /></a></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</form>
								<div class="section-div section-div-remove"
									style="display: none; float: left; width: 97%; border: 1px solid silver; padding: 5px; margin: 10px;">
									<label class="removeable">Select Section: </label><select
										class="section-list removeable drop_txt">
										<option value="">-- Select Section --</option>
										<c:forEach items="${sectionList}" var="section"
											varStatus="status">
											<option value='${section.section_html}'>${section.section_name}</option>
										</c:forEach>
									</select> <a href="javascript://" style="float: right;"
										class="removeable delete-div"><img src="images/delete.png"
										alt="Del" title="Delete" border="0" /></a>
									<div class="crf-section-block"
										style="padding: 10px; float: left; width: 98%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end view crf ************************ -->
				<!-- ------------------------------------------------------------------- -->


				<!-- <div id="library" class="myform"> -->

				<div class="tl_corner"></div>
				<div class="tr_corner"></div>
				<div class="bl_corner"></div>
				<div class="br_corner"></div>

			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<div class="footer_bar">
			<div class="footer_left">
				<a href="#" class="flinks">Home</a> | <a href="#" class="flinks">About
					Us</a> | <a href="#" class="flinks">FAQ</a> | <a href="#"
					class="flinks">Logout</a> | <a href="#" class="flinks">Contact
					Us</a>
			</div>

			<div class="footer_right">© 2011, Al Rights Reserved.</div>
		</div>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
<div id="viewDialog" style="display: none;"></div>
</html>


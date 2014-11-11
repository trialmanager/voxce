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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/payment.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	$(function() {
		$("#patient_payment_chequedate").datepick({
			dateFormat : 'yyyy-mm-dd'
		});
		$("#chequedate").datepick({
			dateFormat : 'yyyy-mm-dd'
		});
		$("#study_chequedate").datepick({
			dateFormat : 'yyyy-mm-dd'
		});

	});

	if ($.trim($('#Add_Site_User_Main_Error').html()) != "")
		$('#Add_Site_User_Main_Error').show();
	else if ($.trim($('#Add_Site_User_Main_Success').html()) != "")
		$('#Add_Site_User_Main_Success').show();
</script>
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

<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/payment.css" rel="stylesheet" type="text/css" />

<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>


</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="PaymentScheduleMessage"
		id="PaymentScheduleMessage" value="${Message}" />
	<input type="hidden" name="PaymentCodeMessage" id="PaymentCodeMessage"
		value="${related_to}" />




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
					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Payments</h3>
						<ul class="categoryitems">
							<c:if test="${tl:rightsofView(resourceList,'View Payments')==1}">
								<li><a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />"
									name="href_view_payment_div" id="href_view_payment_div"
									onclick="">&bull; View Patient Payments</a></li>
							</c:if>
							<li><a
								href="<c:url value='ShowSitePayments.pay?studyid=${currentstudy.study_id}' />"
								name="href_view_payment_div" id="href_view_payment_div"
								onclick="Loadpage('View_Payment_Div')">&bull; View
									Study/Site Payments</a></li>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Study Payment')==1}">
								<li><a
									href="<c:url value='ShowCreateStudySitePayments.pay?studyid=${currentstudy.study_id}&payment_form=2' />"
									name="href_create_study_payment_div"
									id="href_create_study_payment_div" onclick="">&bull; Create
										Study Payments</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Site Payment')==1}">
								<li><a
									href="<c:url value='ShowCreateStudySitePayments.pay?studyid=${currentstudy.study_id}&payment_form=3' />"
									name="href_create_site_payment_div"
									id="href_create_site_payment_diview_drugs" onclick="">&bull;
										Create Site Payments</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Visit CRF Payment')==1}">
								<li><a
									href="<c:url value='ShowCreateStudySitePayments.pay?studyid=${currentstudy.study_id}&payment_form=4' />"
									name="href_create_visit_payment_div"
									id="href_create_visit_payment_div" onclick="">&bull; Create
										Visit/CRF Payments</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">

						<h3 class="menuheader expandable">Payment Code</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Payment Code')==1}">
								<li><a href="#" name="href_create_payment_code_div"
									onclick="Loadpage('View_Payment_Code_Div')"> &bull; View
										Payment Code</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Payment Code')==1}">
								<li><a href="#" name="href_create_payment_code_div"
									onclick="Loadpage('New_Payment_Code_Div')"> &bull; Create
										New Payment Code</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Payment Schedule</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Payment Schedule')==1}">
								<li><a
									href="<c:url value='ShowPaymentSchedule.pay?studyid=${currentstudy.study_id}&pay_sched_form=1' />"
									name="href_view_payment_schedule_div" onclick="">&bull;
										View Payments Schedule</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Payment Schedule')==1}">
								<li><a
									href="<c:url value='ShowPaymentSchedule.pay?studyid=${currentstudy.study_id}&pay_sched_form=2' />"
									name="href_create_payment_schedule_div"
									onclick="Loadpage('Site_Payment_Div')">&bull; Create
										Payment Schedule</a></li>
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


				<!--  												Start Payment Code View-->
				<!--  												Start Payment Code View-->

				<c:if test="${tl:rightsofView(resourceList,'View Payment Code')==1}">
					<div class="body_inner" id="View_Payment_Code_Div"
						style="display: none;">
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
									<a
										href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
								</div>
								<div class="crumbs-link">
									<a href="#">Payments Code List</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->

						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Payment Code :</div>
							<div class="field_set">
								<input id="View_Payment_Code_Search_bar"
									name="View_Payment_Code_Search_bar" type="text"
									class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										src="images/search.png" alt="search" title="search" border="0" /></a></span>
							</div>

							<div class="show_hide_form">

								<span id="Edit_Payment_Code_Main_Error" class="error_label_grp"
									style="display: none; width: auto;">${EMessage}</span> <span
									id="Edit_Payment_Code_Main_Success" class="chk_avail_yes"
									style="display: none; width: auto;">${SMessage}</span>

								<div class="field_txt_view_list">
									<table id="View_payment_Table" width="100%" border="0"
										cellspacing="1" cellpadding="0" class="table_border_view_list">
										<tr class="rights_header_view_list">
											<td width="8%" align="left" valign="middle">&nbsp;Code</td>
											<td width="8%" align="left" valign="middle">&nbsp;Name</td>
											<td width="8%" align="left" valign="middle">&nbsp;Text</td>
											<td width="11%" align="left" valign="middle">&nbsp;Related
												to</td>
											<td width="17%" align="left" valign="middle">&nbsp;Description</td>
											<c:if
												test="${tl:rightsofView(resourceList,'Edit Payment Code')==1}">
												<td width="3%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>
										<tbody id="fbody">
											<c:set var="tempRowStyle" scope="page"
												value="white_row_view_list" />
											<c:forEach items="${codelist}" var="code" varStatus="status">
												<c:set var="tempRowStyle"
													value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
												<tr class="${tempRowStyle}" id="${code.payment_code_id}">
													<td valign="top" align="left" class="set_padding">${code.code}</td>
													<td valign="top" align="left" class="set_padding">${code.name}</td>
													<td valign="top" align="left" class="set_padding">${code.text}</td>
													<td valign="top" align="left" class="set_padding">${code.related_to}</td>
													<td valign="top" align="left" class="set_padding">${code.description}</td>
													<c:if
														test="${tl:rightsofView(resourceList,'Edit Payment Code')==1}">
														
														<td valign="top" align="center" class="set_padding2">
															<img src="images/edit_row_icon.png" alt="Edit"
															title="Edit" border="0"
															onclick="edit_payment_code('${code.payment_code_id}','${code.code}','${code.name}','${code.text}','${code.related_to}','${code.description}')" />
														</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="Edit_User_error_message" class="chk_avail_yes"></div>
					</div>
				</c:if>
				<!--  												End Payment Code View -->
				<!--  												End Payment Code View-->


				<!--  												Start creat new Payment Code-->
				<!--  												Start creat new Payment Code-->

				<c:if
					test="${tl:rightsofView(resourceList,'Create Payment Code')==1}">
					<div id="New_Payment_Code_Div" class="body_inner"
						style="display: none;">
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
									<a
										href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
								</div>
								<div class="crumbs-link">
									<a href="#" id="payment_code_title">Create Payments Code</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->

						</div>
						<div class="create_group_container">
							<div id="" class="myform payment">
								<form id="new_payment_code_form" name="form" method="post"
									action="newPaymentCode.pay" class="patient">
									<span id="Payment_Code_Main_Error" class="error_label_grp"
										style="display: none; width: auto;">${CEMessage}</span> <span
										id="Payment_Code_Main_Success" class="chk_avail_yes"
										style="display: none; width: auto;">${CSMessage}</span> <input
										name="studyid" id="studyid" type="text"
										value="${currentstudy.study_id}" class="input_txt"
										style="display: none" /> <input name="edit_id"
										id="code_edit_id" type="text" value="0" class="input_txt"
										style="display: none" /> <input name="date_created"
										id="code_date_created" type="text" value="0" class="input_txt"
										style="display: none" /> <label>Code :</label> <input
										id="code" name="code" type="text" value="" class="input_txt"
										maxlength="50" /> <span id="code_error" class="error_label"></span>
									<label>Name :</label> <input id="name" name="name" type="text"
										value="" class="input_txt" maxlength="100" /> <span
										id="name_error" class="error_label"></span> <label>Text:</label>
									<input id="text" name="text" type="text" value=""
										class="input_txt" maxlength="100" /> <span id="text_error"
										class="error_label"></span>
									<div
										style="clear: both; width: 800px; margin-bottom: 8px; padding-bottom: 5px;">

										<label>Related to :</label><br /> <input
											name="related_to_study" id="related_to_study" type="checkbox"
											value="Study" checked="checked" disabled="disabled" /> <span
											class="txt_norm">Study</span> <input name="related_to_site"
											id="related_to_site" type="checkbox" value="Site" /> <span
											class="txt_norm">Site</span> <span id="related_to_error"
											class="error_txt_red"></span>
									</div>

									<label>Description:</label>
									<textarea id="code_description" name="description" cols=""
										rows=""
										onkeyup="if (this.value.length > 500)this.value = this.value.substring(0, 500)">
</textarea>
									<span id="code_description_error" class="error_label_grp"></span>
									<div class="spacer"></div>
									<div
										style="clear: both; margin-top: 10px; padding-left: 170px;">
										<button class="blue-pill">Save</button>
										<button class="grey-pill" type="reset"
											onclick="Loadpage('View_Payment_Code_Div')">Cancel</button>
									</div>
								</form>
							</div>
						</div>

					</div>
				</c:if>

				<!--  												End creat new Payment Code-->
				<!--  												End creat new Payment Code-->
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

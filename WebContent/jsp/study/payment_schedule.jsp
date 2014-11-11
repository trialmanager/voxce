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

<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/payment.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
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
								<li><a
									href="<c:url value='ShowPaymentCode.pay?studyid=${currentstudy.study_id}&payment_code_form=1' />"
									name="href_create_payment_code_div" onclick="">&bull; View
										Payment Code</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Payment Code')==1}">
								<li><a
									href="<c:url value='ShowPaymentCode.pay?studyid=${currentstudy.study_id}&payment_code_form=2' />"
									name="href_create_payment_code_div" onclick="">&bull;
										Create New Payment Code</a></li>
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
									name="href_create_payment_schedule_div" onclick="">&bull;
										Create Payment Schedule</a></li>
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


				<!--  												Start creat new Payment Schedule-->
				<!--  												Start creat new Payment Schedule-->
				<c:if
					test="${tl:rightsofView(resourceList,'Create Payment Schedule')==1}">
					<div id="New_Payment_Schedule_Div" class="body_inner"
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
									<a href="#" id="payment_schedule_title">Payments Schedule</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->

						</div>
						<div class="create_group_container">
							<div id="" class="myform payment">
								<form id="new_payment_schedule_form" name="form" method="post"
									action="newPaymentschedule.pay" class="patient">
									<span id="Payment_Schedule_Main_Error" class="error_label_grp"
										style="display: none; width: auto;"></span> <span
										id="Payment_Schedule_Main_Success" class="chk_avail_yes"
										style="display: none; width: auto;"></span> <input
										name="payment_schedule_date_created"
										id="payment_schedule_date_created" type="text" value="0"
										class="input_txt" style="display: none" /> <input
										name="payment_schedule__createdby"
										id="payment_schedule__createdby" type="text" value="0"
										class="input_txt" style="display: none" /> <input
										name="edit_id" id="edit_id" type="text" value="0"
										class="input_txt" style="display: none" /> <label>Site
										:</label> <select id="payment_schedule_site"
										name="payment_schedule_site" class="drop_txt">
										<c:forEach items="${siteslist}" var="site" varStatus="status">
											<option id="${site.site_id}" value="${site.site_id}"
												onclick="">${site.site_name}</option>
										</c:forEach>
									</select> <span id="payment_schedule_site_error" class="error_label_grp"></span>


									<label>Payment Type:</label> <select name="Add_Payment_Type"
										id="Add_Payment_Type" class="drop_txt">
										<c:forEach items="${codelist}" var="types" varStatus="status">
											<c:set var="paymenttype" scope="page"
												value="${types.related_to}" />
											<option id="${types.related_to}"
												value="${types.payment_code_id}">${types.name}</option>
										</c:forEach>
									</select><span id="add_pyment_type_display" class="chk_avail_yes"
										style="color: #660000;"></span> <span
										id="add_pyment_type_error" class="error_label_grp"></span> <label>Visit
										:</label> <select name="visit" id="visit" class="drop_txt">
										<c:forEach items="${VisitsWithNames}" var="vis"
											varStatus="status">
											<option id="${vis.visitid}" value="${vis.visitid}" onclick="">${vis.visitname}</option>
										</c:forEach>


									</select> <span id="visit_error" class="error_label_grp"></span> <label>CRF
										:</label> <select name="crf" id="crf" class="drop_txt">
										<option id="" value=""></option>
										<c:forEach items="${CaseReportFormsli}" var="crf"
											varStatus="status">
											<option id="${crf.crf_id}" value="${crf.crf_id}" onclick="">${crf.crf_name}</option>
										</c:forEach>
									</select> <span id="crf_error" class="error_label_grp"></span>
									<div id="enable"
										style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
										<label>Status :</label><br /> <input id="status"
											name="status" type="radio" value="Complete"
											disabled="disabled" checked="checked" /> <span
											class="txt_norm">Complete</span> <input id="status"
											name="status" type="radio" value="Approved"
											disabled="disabled" /> <span class="txt_norm">Approved</span>
										<input id="status" name="status" type="radio" value="Signed"
											disabled="disabled" /> <span class="txt_norm">Signed</span> <input
											id="status" name="status" type="radio" value="locked"
											disabled="disabled" /> <span class="txt_norm">locked</span>
									</div>

									<label>Amount :</label> <input id="amount" name="amount"
										type="text" value="" class="input_txt" maxlength="11" /> <span
										id="schedule_amount_error" class="error_label"></span> <label>Description:</label>
									<textarea id="schedule_description" name="description" cols=""
										rows=""
										onkeyup="if (this.value.length > 500)this.value = this.value.substring(0, 500)">
</textarea>
									<span id="schedule_description_error" class="error_label_grp"></span>
									<div class="spacer"></div>
									<div
										style="clear: both; margin-top: 10px; padding-left: 170px;">
										<button class="blue-pill">Save</button>
										<button onclick="Loadpage('View_Payment_Schedule_Div')"
											class="grey-pill" type="reset">Cancel</button>
									</div>
								</form>
							</div>
						</div>

					</div>
				</c:if>

				<!--  												End creat new Payment Schedule-->
				<!--  												End creat new Payment Schedule-->

				<!--  												Start Payment Schedule View-->
				<!--  												Start Payment Schedule View-->

				<c:if
					test="${tl:rightsofView(resourceList,'View Payment Schedule')==1}">
					<div class="body_inner" id="View_Payment_Schedule_Div"
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
									<a href="#">Payments Schedule List</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->

						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Payment Schedule
								:</div>
							<div class="field_set">
								<input id="View_Payment_Schedule_Search_bar"
									name="View_Payment_Schedule_Search_bar" type="text"
									class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										src="images/search.png" alt="search" title="search" border="0" /></a></span>
							</div>

							<div class="show_hide_form">

								<span id="Edit_Payment_Schedule_Main_Error"
									class="error_label_grp" style="display: none; width: auto;">${EMessage}</span>
								<span id="Edit_Payment_Schedule_Main_Success"
									class="chk_avail_yes" style="display: none; width: auto;">${SMessage}</span>

								<div class="field_txt_view_list">
									<table id="View_payment_Table" width="100%" border="0"
										cellspacing="1" cellpadding="0" class="table_border_view_list">
										<tr class="rights_header_view_list">
											<td width="8%" align="left" valign="middle">&nbsp;Payment
												Type</td>
											<td width="8%" align="left" valign="middle">&nbsp;Site</td>
											<td width="11%" align="left" valign="middle">&nbsp;Visit</td>
											<td width="17%" align="left" valign="middle">&nbsp;CRF</td>
											<td width="8%" align="left" valign="middle">&nbsp;Status</td>
											<td width="8%" align="left" valign="middle">&nbsp;Amount</td>
											<c:if
												test="${tl:rightsofView(resourceList,'Edit Payment Schedule')==1}">
												<td width="3%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>
										<tbody id="fbody">
											<c:set var="tempRowStyle" scope="page"
												value="white_row_view_list" />
											<c:forEach items="${paymentschedulelist}" var="paylist"
												varStatus="status">
												<c:set var="tempRowStyle"
													value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
												<tr class="${tempRowStyle}"
													id="${paylist.payment_schedule_id}">
													<td valign="top" align="left" class="set_padding">${paylist.payment_type_name}</td>
													<c:if test="${(paylist.site_id) != null }">
														<td valign="top" align="left" class="set_padding">${paylist.site_name}</td>
													</c:if>
													<c:if test="${(paylist.site_id) == null}">
														<td valign="top" align="left" class="set_padding"></td>
													</c:if>

													<td valign="top" align="left" class="set_padding">${paylist.visit_name}</td>
													<td valign="top" align="left" class="set_padding">${paylist.crf_name}</td>
													<td valign="top" align="left" class="set_padding">${paylist.status}</td>
													<td valign="top" align="left" class="set_padding">${paylist.amount}</td>
													<c:if
														test="${tl:rightsofView(resourceList,'Edit Payment Schedule')==1}">
														<td valign="top" align="center" class="set_padding2"><img
															onclick="edit_payment_schedule('${paylist.payment_schedule_id}')"
															src="images/edit_row_icon.png" alt="Edit" title="Edit"
															border="0" /></td>
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

				<!--  												End Payment Schedule View -->
				<!--  												End Payment Schedule View-->

				<!-- right body content ends here -->

			</div>
			<!-- content ends here -->

			<!-- footer starts here -->
			<%@include file="../footer.jsp"%>
			<!-- footer ends here -->
			<form id="paymentSchedulehiddenform" name="paymentSchedulehiddenform"
				action="HiddenActions.pay">
				<input type="hidden" id="typeofaction" name="typeofaction" value=""></input>
				<input type="hidden" id="HiddenValue1" name="HiddenValue1" value=""></input>
				<input type="hidden" id="HiddenValue2" name="HiddenValue2" value=""></input>
				<input type="hidden" id="HiddenValue3" name="HiddenValue3" value=""></input>


				<input type="hidden" id="HiddenValue7" name="HiddenValue7"
					value="${currentpaymentSchedule.visit}"></input> <input
					type="hidden" id="HiddenValue8" name="HiddenValue8"
					value="${currentpaymentSchedule.crf}"></input> <input type="hidden"
					id="HiddenValue9" name="HiddenValue9"
					value="${currentpaymentSchedule.status}"></input> <input
					type="hidden" id="HiddenValue10" name="HiddenValue10"
					value="${currentpaymentSchedule.amount}"></input> <input
					type="hidden" id="HiddenValue11" name="HiddenValue11"
					value="${currentpaymentSchedule.description}"></input> <input
					type="hidden" id="HiddenValue13" name="HiddenValue13"
					value="${currentpaymentSchedule.payment_schedule_id}"></input> <input
					type="hidden" id="HiddenValue14" name="HiddenValue14"
					value="${currentpaymentSchedule.payment_type}"></input> <input
					type="hidden" id="HiddenValue6" name="HiddenValue6"
					value="${currentpaymentSchedule.visit}"></input>
			</form>
		</div>
		<!-- wrapper ends here -->
</body>
</html>

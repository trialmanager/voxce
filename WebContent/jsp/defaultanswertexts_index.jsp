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

<script type="text/javascript" src="../JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="../js/defaultanswertexts.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>


<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<link href="../css/library.css" rel="stylesheet" type="text/css" />
<link href="../css/accordion.css" rel="stylesheet" type="text/css" />
<link href="../css/buttons.css" rel="stylesheet" type="text/css" />
<link href="../css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="../css/view_list.css" rel="stylesheet" type="text/css" />
<link href="../css/crumbs.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/gen_validatorv4.js">
	
</script>
<script type="text/javascript" src="../JQuery/ddaccordion.js"></script>
<script type="text/javascript">
	ddaccordion.init({
		headerclass : "expandable", //Shared CSS class name of headers group that are expandable
		contentclass : "categoryitems", //Shared CSS class name of contents group
		revealtype : "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay : 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev : true, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded : [ 12 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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

</head>

<body>

	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="EditMessageCode" id="EditMessageCode"
		value="${EditMessageCode}">


	<!-- wrapper starts here  -->
	<div class="wrapper">
		<%
			Users obj = (Users) session.getAttribute("CurrentUser");
		%>
		<%@include file="libheader.jsp"%>

		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->
			<%@include file="libSideNevigation.jsp"%>
			<!-- left navigation ends here -->
			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start add default answer text ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="add_defaultanswertext_form">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Add Default Answer Text </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formAddDefaultAnswerText"
								name="formAddDefaultAnswerText" method="POST"
								action="addDefaultAnswerText.defaultanswertexts" class="library">

								<span id="AddATGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="AddATErrorMessage"
									class="error_label" style="display: none;"></span> <label>Question
									Text :</label> <select id="addatquestiontextid"
									name="addatquestiontextid" class="drop_txt">
									<option id="00" value="00" selected>[Select Question
										Text]</option>
									<c:forEach items="${questList}" var="question"
										varStatus="status">
										<option id="${question.question_text_id }"
											value="${question.question_text_id }" onclick="">${question.name
											}</option>
									</c:forEach>
								</select> <span
									id="formAddDefaultAnswerText_addatquestiontextid_errorloc"
									class="error_label"></span> <label>Display Order :</label> <input
									id="addatdisplayorder" name="addatdisplayorder" type="text"
									value="${datAdd.display_order}" class="input_txt" /> <span
									id="formAddDefaultAnswerText_addatdisplayorder_errorloc"
									class="error_label"></span> <label>Answer Text :</label> <select
									id="addatanswertextid" name="addatanswertextid"
									class="drop_txt">
									<option id="01" value="01" selected>[Select Answer
										Text]</option>
									<c:forEach items="${ansList}" var="answer" varStatus="status">
										<option id="${answer.answer_text_id }"
											value="${answer.answer_text_id }" onclick="">${answer.name
											}</option>
									</c:forEach>
								</select> <span id="formAddDefaultAnswerText_addatanswertextid_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
								var addfrmvalidator = new Validator(
										"formAddDefaultAnswerText");
								addfrmvalidator.EnableOnPageErrorDisplay();
								addfrmvalidator.EnableMsgsTogether();

								addfrmvalidator.addValidation(
										"addatquestiontextid", "dontselect=00",
										"*Please, select question text");
								addfrmvalidator.addValidation(
										"addatanswertextid", "dontselect=01",
										"*Please, select answer text");
								addfrmvalidator.addValidation(
										"addatdisplayorder", "number",
										"*numeric only");
								addfrmvalidator.addValidation(
										"addatdisplayorder", "maxlen=10",
										"*number too large");
							</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add Default answer text ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view Default answer texts ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="list_defaultanswertexts_form">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">View Default Answer Texts </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Default Answer
							Text :</div>
						<div class="field_set">
							<input id="View_DefaultAnswerTexts_Search_Bar"
								name="View_DefaultAnswerTexts_Search_Bar" type="text"
								class="input_txt" value="Search..." /> <span class="search_btn"><a
								href="#"><img src="../images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">

								<form id="view_edit_form">

									<table width="60%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">


										<tr class="rights_header_view_list">
											<td width="35%" align="left" valign="middle">&nbsp;Question
												Text</td>
											<td width="35%" align="left" valign="middle">&nbsp;Answer
												Text</td>
											<td width="20%" align="left" valign="middle">&nbsp;Display
												Order</td>
											<td width="9%" align="center" valign="middle">Edit</td>
										</tr>

										<c:if test="${fn:length(dansList) > 0}">

											<tbody id="fbody">
												<c:forEach items="${dansList}" var="aText"
													varStatus="status">

													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list" id="${status.index}">

															<c:forEach items="${questList}" var="aQuest"
																varStatus="questStatus">
																<c:if
																	test="${aQuest.question_text_id == aText.question_text_id }">
																	<c:set var="question" value="${aQuest.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${question}</td>

															<c:forEach items="${ansList}" var="anAnswer"
																varStatus="ansStatus">
																<c:if
																	test="${anAnswer.answer_text_id == aText.answer_text_id }">
																	<c:set var="answer" value="${anAnswer.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${answer}</td>

															<td valign="top" align="left" class="set_padding">${aText.display_order}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aText.default_answer_text_id}','${aText.question_text_id}','${aText.display_order}','${aText.answer_text_id}','edit_form','edit_defaultanswertext_form')" /></a></td>
														</tr>
													</c:if>

													<c:if test="${status.index % 2 != 0}">
														<tr class="grey_row_view_list" id="${status.index}">
															<c:forEach items="${questList}" var="aQuest"
																varStatus="questStatus">
																<c:if
																	test="${aQuest.question_text_id == aText.question_text_id }">
																	<c:set var="question" value="${aQuest.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${question}</td>

															<c:forEach items="${ansList}" var="anAnswer"
																varStatus="ansStatus">
																<c:if
																	test="${anAnswer.answer_text_id == aText.answer_text_id }">
																	<c:set var="answer" value="${anAnswer.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${answer}</td>

															<td valign="top" align="left" class="set_padding">${aText.display_order}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aText.default_answer_text_id}','${aText.question_text_id}','${aText.display_order}','${aText.answer_text_id}','edit_form','edit_defaultanswertext_form')" /></a></td>
														</tr>
													</c:if>

												</c:forEach>
											</tbody>
										</c:if>

									</table>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end view Default answer texts ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit Default answer text ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_defaultanswertext_form">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/dans_txt/showDefaultAnswerTextsIndex.defaultanswertexts?FormCalled=list_defaultanswertexts_form' />">View
									Default Answer Texts</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Default Answer Text </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditDefaultAnswerText"
								name="formEditDefaultAnswerText" method="POST"
								action="editDefaultAnswerText.defaultanswertexts"
								class="library">

								<input type="hidden" id="editdatid" name="editdatid"
									value="${datEdit.answer_text_id}" /> <span
									id="EditATGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditATErrorMessage"
									class="error_label" style="display: none;"></span> <label>Question
									Text :</label> <select id="editdatquestiontextid"
									name="editdatquestiontextid" class="drop_txt">
									<c:forEach items="${questList}" var="question"
										varStatus="status">
										<option id="${question.question_text_id }"
											value="${question.question_text_id }" onclick="">${question.name
											}</option>
									</c:forEach>
								</select> <label>Display Order :</label> <input id="editdatdisplayorder"
									name="editdatdisplayorder" type="text"
									value="${datEdit.display_order}" class="input_txt" /> <span
									id="formEditAnswerText_editdatdisplayorder_errorloc"
									class="error_label"></span> <label>Answer Text :</label> <select
									id="editdatanswertextid" name="editdatanswertextid"
									class="drop_txt">
									<c:forEach items="${ansList}" var="answer" varStatus="status">
										<option id="${answer.answer_text_id }"
											value="${answer.answer_text_id }" onclick="">${answer.name
											}</option>
									</c:forEach>
								</select>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditDefaultAnswerText");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editatquestiontextid","dontselect=00","*Please, select question text");
 editfrmvalidator.addValidation("editatanswertextid","dontselect=01","*Please, select answer text");
 editfrmvalidator.addValidation("editatdisplayorder","number","*numeric only");
 editfrmvalidator.addValidation("editatdisplayorder","maxlen=10","*number too large");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit Default answer text ************************ -->
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
		<%@include file="libfooter.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>

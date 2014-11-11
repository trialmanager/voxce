<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.TrialManager.model.Users"%>

<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script type="text/javascript" src="../JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="../js/questiontexts.js"></script>
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
</script>

</head>

<body>

	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="EditMessageCode" id="EditMessageCode"
		value="${EditMessageCode}">


	<!-- wrapper starts here -->
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
				<!-- ************************ start add question text ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="add_questiontext_form">
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
								<a href="javascript://">Add Question Texts </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formAddQuestionText" name="formAddQuestionText"
								method="POST" action="addQuestionText.questiontexts"
								class="library">

								<span id="AddQTGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="AddQTErrorMessage"
									class="error_label" style="display: none;"></span> <label>Code:
								</label> <input id="addqtcode" name="addqtcode" type="text"
									value="${qtAdd.code}" class="input_txt" /> <span
									id="formAddQuestionText_addqtcode_errorloc" class="error_label"></span>

								<label>Name :</label> <input id="addqtname" name="addqtname"
									type="text" value="${qtAdd.name}" class="input_txt" /> <span
									id="formAddQuestionText_addqtname_errorloc" class="error_label"></span>

								<label>Category :</label> <select id="addqtcategory"
									name="addqtcategory" class="drop_txt">
									<c:forEach items="${categoriesList}" var="category"
										varStatus="status">
										<option id="${category.category_id }"
											value="${category.category_id }" onclick="">${category.category_name
											}</option>
									</c:forEach>
								</select> <span id="formAddQuestionText_addqtcategory_errorloc"
									class="error_label"></span>
								<div style="clear: both;"></div>

								<label>Text :</label>
								<textarea id="addqttext" name="addqttext" cols="" rows="">${qtAdd.text}</textarea>
								<span id="formAddQuestionText_addqttext_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>
							<script type="text/javascript" language="JavaScript">
								var addfrmvalidator = new Validator(
										"formAddQuestionText");
								addfrmvalidator.EnableOnPageErrorDisplay();
								addfrmvalidator.EnableMsgsTogether();

								addfrmvalidator.addValidation("addqtcode",
										"req", "*required field");
								addfrmvalidator
										.addValidation("addqtcode",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								addfrmvalidator.addValidation("addqtcode",
										"maxlen=255",
										"*Text exceeds given character limit");
								addfrmvalidator.addValidation("addqtname",
										"req", "*required field");
								addfrmvalidator
										.addValidation("addqtname",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								addfrmvalidator.addValidation("addqtname",
										"maxlen=255",
										"*Text exceeds given character limit");
								addfrmvalidator.addValidation("addqttext",
										"maxlen=255",
										"*Text exceeds given character limit");
							</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add question text ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view question texts ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="list_questiontexts_form">
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
								<a href="javascript://">View Question Texts </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Question Text :</div>
						<div class="field_set">
							<input id="View_QuestionTexts_Search_Bar"
								name="View_QuestionTexts_Search_Bar" type="text"
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
											<td width="22%" height="20" align="left" valign="middle">&nbsp;Name</td>
											<td width="20%" align="left" valign="middle">&nbsp;Code</td>
											<td width="12%" align="left" valign="middle">&nbsp;Category</td>
											<td width="40%" align="left" valign="middle">&nbsp;Text</td>
											<td width="6%" align="center" valign="middle">Edit</td>
										</tr>

										<tbody id="fbody">
											<c:if test="${fn:length(questionTextsList) > 0}">
												<c:forEach items="${questionTextsList}" var="aText"
													varStatus="status">
													<!-- make empty -->
													<c:set var="aCat_name" value="" />

													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list" id="${status.index}">
															<td valign="top" align="left" class="set_padding">${aText.code}</td>
															<td valign="top" align="left" class="set_padding">${aText.name}</td>

															<!-- Iterate Category List and -->
															<c:forEach items="${categoriesList}" var="aCat"
																varStatus="categoryStatus">
																<c:if test="${aCat.category_id == aText.category_id }">
																	<c:set var="aCat_name" value="${aCat.category_name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${aCat_name}</td>
															<td valign="top" align="left" class="set_padding">${aText.text}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aText.question_text_id}','${aText.code}','${aText.name}','${aText.category_id}','${aCat_name}','${aText.text}','edit_form','edit_questiontext_form')" /></a></td>
														</tr>
													</c:if>
													<c:if test="${status.index % 2 != 0}">
														<tr class="white_row_view_list" id="${status.index}">
															<td valign="top" align="left" class="set_padding">${aText.code}</td>
															<td valign="top" align="left" class="set_padding">${aText.name}</td>
															<c:forEach items="${categoriesList}" var="aCat"
																varStatus="categoryStatus">
																<c:if test="${aCat.category_id == aText.category_id }">
																	<c:set var="aCat_name" value="${aCat.category_name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${aCat_name}</td>
															<td valign="top" align="left" class="set_padding">${aText.text}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aText.question_text_id}','${aText.code}','${aText.name}','${aText.category_id}','${aCat_name}','${aText.text}','edit_form','edit_questiontext_form')" /></a></td>
														</tr>
													</c:if>

												</c:forEach>
											</c:if>
										</tbody>

									</table>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end view question texts ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit question text ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_questiontext_form">
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
									href="<c:url value='/qu_txt/showQuestionTextsIndex.questiontexts?FormCalled=list_questiontexts_form' />">View
									Question Texts</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Question Texts</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditQuestionText" name="formEditQuestionText"
								method="POST" action="editQuestionText.questiontexts"
								class="library">

								<input type="hidden" id="editqtid" name="editqtid"
									value="${qtEdit.question_text_id}" /> <span
									id="EditQTGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditQTErrorMessage"
									class="error_label" style="display: none;"></span> <label>Code:
								</label> <input id="editqtcode" name="editqtcode" type="text"
									value="${qtEdit.code}" class="input_txt" /> <span
									id="formEditQuestionText_editqtcode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="editqtname" name="editqtname" type="text"
									value="${qtEdit.name}" class="input_txt" /> <span
									id="formEditQuestionText_editqtname_errorloc"
									class="error_label"></span> <label>Category :</label> <select
									id="editqtcategory" name="editqtcategory" class="drop_txt">
									<c:forEach items="${categoriesList}" var="category"
										varStatus="status">
										<option id="${category.category_id }"
											value="${category.category_id }" onclick="">"${category.category_name
											}"</option>
									</c:forEach>
								</select> <span id="formEditQuestionText_editqtcategory_errorloc"
									class="error_label"></span>
								<div style="clear: both;"></div>

								<label>Text :</label>
								<textarea id="editqttext" name="editqttext" cols="" rows="">${qtEdit.text}</textarea>
								<span id="formEditQuestionText_editqttext_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>
							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditQuestionText");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editqtcode","req","*required field");
 editfrmvalidator.addValidation("editqtcode","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editqtcode","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editqtname","req","*required field");
 editfrmvalidator.addValidation("editqtname","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editqtname","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editqttext","maxlen=255","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit question text ************************ -->
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

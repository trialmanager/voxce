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
<script type="text/javascript" src="../js/questiontypes.js"></script>
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
		defaultexpanded : [ 10 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start add lab ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="add_questiontype_form">
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
								<a href="javascript://">Add Question Type</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formAddQuestionType" name="formAddQuestionType"
								method="POST" action="addQuestionType.questiontypes"
								class="library">

								<span id="AddQuestionTypeGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span
									id="AddQuestionTypeErrorMessage" class="error_label"
									style="display: none;"></span> <label>Code: </label> <input
									id="addquestiontypecode" name="addquestiontypecode" type="text"
									value="${qtAdd.code}" class="input_txt" /> <span
									id="formAddQuestionType_addquestiontypecode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="addquestiontypename" name="addquestiontypename" type="text"
									value="${qtAdd.name}" class="input_txt" /> <span
									id="formAddQuestionType_addquestiontypename_errorloc"
									class="error_label"></span> <label>Description :</label>
								<textarea id="addquestiontypedescription"
									name="addquestiontypedescription" cols="" rows="">${qtAdd.description}</textarea>
								<span
									id="formAddQuestionType_addquestiontypedescription_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
								var addfrmvalidator = new Validator(
										"formAddQuestionType");
								addfrmvalidator.EnableOnPageErrorDisplay();
								addfrmvalidator.EnableMsgsTogether();

								addfrmvalidator.addValidation(
										"addquestiontypecode", "req",
										"*required field");
								addfrmvalidator
										.addValidation("addquestiontypecode",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								addfrmvalidator.addValidation(
										"addquestiontypecode", "maxlen=255",
										"*Text exceeds given character limit");
								addfrmvalidator.addValidation(
										"addquestiontypename", "req",
										"*required field");
								addfrmvalidator
										.addValidation("addquestiontypename",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								addfrmvalidator.addValidation(
										"addquestiontypename", "maxlen=255",
										"*Text exceeds given character limit");
							</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add questiontype ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view questiontypes ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="list_questiontypes_form">
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
								<a href="javascript://">View Question Types</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Question Types :</div>
						<div class="field_set">
							<input id="View_QuestionTypes_Search_Bar"
								name="View_QuestionTypes_Search_Bar" type="text"
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
											<td width="15%" align="left" valign="middle">&nbsp;Code</td>
											<td width="25%" align="left" valign="middle">&nbsp;Name</td>
											<td width="51%" align="left" valign="middle">&nbsp;Description</td>
											<td width="9%" align="center" valign="middle">Edit</td>
										</tr>

										<c:if test="${fn:length(questiontypesList) > 0}">

											<tbody id="fbody">
												<c:forEach items="${questiontypesList}" var="aQT"
													varStatus="status">

													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list" id="${status.index}">
															<td valign="top" align="left" class="set_padding">${aQT.code}</td>
															<td valign="top" align="left" class="set_padding">${aQT.name}</td>
															<td valign="top" align="left" class="set_padding">${aQT.description}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aQT.question_type_id}','${aQT.code}','${aQT.name}','${aQT.description}','edit_form','edit_questiontype_form')" /></a></td>
														</tr>
													</c:if>

													<c:if test="${status.index % 2 != 0}">
														<tr class="white_row_view_list" id="${status.index}">
															<td valign="top" align="left" class="set_padding">${aQT.code}</td>
															<td valign="top" align="left" class="set_padding">${aQT.name}</td>
															<td valign="top" align="left" class="set_padding">${aQT.description}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aQT.question_type_id}','${aQT.code}','${aQT.name}','${aQT.description}','edit_form','edit_questiontype_form')" /></a></td>
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
				<!-- ************************ end view questiontypes ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit questiontype ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_questiontype_form">
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
									href="<c:url value='/qu_type/showQuestionTypesIndex.questiontypes?FormCalled=list_questiontypes_form' />">View
									Question Types</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Question Type</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditQuestionType" name="formEditQuestionType"
								method="POST" action="editQuestionType.questiontypes">

								<input type="hidden" id="editquestiontypeid"
									name="editquestiontypeid" value="${qtEdit.question_type_id}" />

								<span id="EditQuestionTypeGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span
									id="EditQuestionTypeErrorMessage" class="error_label"
									style="display: none;"></span> <label>Code: </label> <input
									id="editquestiontypecode" name="editquestiontypecode"
									type="text" value="${qtEdit.code}" class="input_txt" /> <span
									id="formEditQuestionType_editquestiontypecode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="editquestiontypename" name="editquestiontypename"
									type="text" value="${qtEdit.name}" class="input_txt" /> <span
									id="formEditQuestionType_editquestiontypename_errorloc"
									class="error_label"></span> <label>Description :</label>
								<textarea id="editquestiontypedescription"
									name="editquestiontypedescription" cols="" rows="">${qtEdit.description}</textarea>
								<span
									id="formEditQuestionType_editquestiontypedescription_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
								var editfrmvalidator = new Validator(
										"formEditQuestionType");
								editfrmvalidator.EnableOnPageErrorDisplay();
								editfrmvalidator.EnableMsgsTogether();

								editfrmvalidator.addValidation(
										"editquestiontypecode", "req",
										"*required field");
								editfrmvalidator
										.addValidation("editquestiontypecode",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								editfrmvalidator.addValidation(
										"editquestiontypecode", "maxlen=255",
										"*Text exceeds given character limit");
								editfrmvalidator.addValidation(
										"editquestiontypename", "req",
										"*required field");
								editfrmvalidator
										.addValidation("editquestiontypename",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								editfrmvalidator.addValidation(
										"editquestiontypename", "maxlen=255",
										"*Text exceeds given character limit");
							</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit questiontype ************************ -->
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

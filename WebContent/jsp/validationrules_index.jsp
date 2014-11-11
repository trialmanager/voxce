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
<script type="text/javascript" src="../js/validationrules.js"></script>
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
		defaultexpanded : [ 16 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start add validation rule ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if
					test="${tl:rightsofView(resourceList,'Add Validation Rule')==1}">
					<div class="body_inner" id="add_vrule_form" style="display: none;">
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
									<a href="javascript://">Add Validation Rule</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div id="" class="myform library">

								<form id="formAddVRule" name="formAddVRule" method="POST"
									action="addValidationRule.validationrules" class="library">

									<span id="AddVRuleGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span id="AddVRuleErrorMessage"
										class="error_label" style="display: none;"></span> <label>Name:
									</label> <input id="addvrulename" name="addvrulename" type="text"
										value="${vruleAdd.name}" class="input_txt" /> <span
										id="formAddVRule_addvrulename_errorloc" class="error_label"></span>

									<label>Text :</label> <input id="addvruletext"
										name="addvruletext" type="text" value="${vruleAdd.text}"
										class="input_txt" /> <span
										id="formAddVRule_addvruletext_errorloc" class="error_label"></span>

									<label>Type :</label> <input id="addvruletype"
										name="addvruletype" type="text" value="${vruleAdd.type}"
										class="input_txt" /> <span
										id="formAddVRule_addvruletype_errorloc" class="error_label"></span>

									<label>Argument :</label>
									<textarea id="addvruleargument" name="addvruleargument" cols=""
										rows="">${vruleAdd.argument}</textarea>
									<span id="formAddVRule_addvruleargument_errorloc"
										class="error_label"></span>

									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type="submit" class="blue-pill">Save</button>
										<button type="reset" class="grey-pill">Clear</button>
									</div>

								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddVRule");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation(
											"addvrulename", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addvrulename",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addvrulename",
													"maxlen=50",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addvruletext", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addvruletext",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addvruletext",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addvruletype", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addvruletype",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addvruletype",
													"maxlen=50",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addvruleargument", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addvruleargument",
													"maxlen=1000",
													"*Text exceeds given character limit");
								</script>

							</div>
						</div>

					</div>
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add Validation Rule ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view Validation Rules ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if
					test="${tl:rightsofView(resourceList,'View Validation Rule')==1}">
					<div class="body_inner" id="list_vrules_form"
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
										href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
								</div>
								<div class="crumbs-link">
									<a href="javascript://">View Validation Rules</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Validation Rules
								:</div>
							<div class="field_set">
								<input id="View_ValidationRules_Search_Bar"
									name="View_ValidationRules_Search_Bar" type="text"
									class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										src="../images/search.png" alt="search" title="search"
										border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">
									<span id="AddVRuleGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span id="AddVRuleErrorMessage"
										class="error_label" style="display: none;"></span>

									<form id="view_edit_form">

										<table width="60%" border="0" cellspacing="1" cellpadding="0"
											class="table_border_view_list">


											<tr class="rights_header_view_list">
												<td width="20%" align="left" valign="middle">&nbsp;Name</td>
												<td width="20%" align="left" valign="middle">&nbsp;Text</td>
												<td width="20%" align="left" valign="middle">&nbsp;Type</td>
												<td width="30%" align="left" valign="middle">&nbsp;Argument</td>
												<c:if
													test="${tl:rightsofView(resourceList,'View Validation Rules')==1}">
													<td width="9%" align="center" valign="middle">Edit</td>
												</c:if>
											</tr>

											<c:if test="${fn:length(vrulesList) > 0}">

												<tbody id="fbody">
													<c:forEach items="${vrulesList}" var="aRule"
														varStatus="status">

														<c:if test="${status.index % 2 == 0}">
															<tr class="white_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aRule.name}</td>
																<td valign="top" align="left" class="set_padding">${aRule.text}</td>
																<td valign="top" align="left" class="set_padding">${aRule.type}</td>
																<td valign="top" align="left" class="set_padding">${aRule.argument}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'View Validation Rules')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aRule.validation_rule_id}','${aRule.name}','${aRule.text}','${aRule.type}','${aRule.argument}','edit_form','edit_vrule_form')" /></a></td>
																</c:if>
															</tr>
														</c:if>
														<c:if test="${status.index % 2 != 0}">
															<tr class="white_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aRule.name}</td>
																<td valign="top" align="left" class="set_padding">${aRule.text}</td>
																<td valign="top" align="left" class="set_padding">${aRule.type}</td>
																<td valign="top" align="left" class="set_padding">${aRule.argument}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'View Validation Rules')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aRule.validation_rule_id}','${aRule.name}','${aRule.text}','${aRule.type}','${aRule.argument}','edit_form','edit_vrule_form')" /></a></td>
																</c:if>
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
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end view Validation Rules ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit Validation Rules ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_vrule_form">
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
									href="<c:url value='/vrules/showValidationRulesIndex.validationrules?FormCalled=list_vrules_form' />">View
									Validation Rules</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Validation Rule</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditVRule" name="formEditVRule" method="POST"
								action="editValidationRule.validationrules">

								<input type="hidden" id="editvruleid" name="editvruleid"
									value="${vruleEdit.validation_rule_id}" /> <span
									id="EditVRuleGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditVRuleErrorMessage"
									class="error_label" style="display: none;"></span> <label>Name:
								</label> <input id="editvrulename" name="editvrulename" type="text"
									value="${vruleEdit.name}" class="input_txt" /> <span
									id="formEditVRule_editvrulename_errorloc" class="error_label"></span>

								<label>Text: </label> <input id="editvruletext"
									name="editvruletext" type="text" value="${vruleEdit.text}"
									class="input_txt" /> <span
									id="formEditVRule_editvruletext_errorloc" class="error_label"></span>

								<label>Type: </label> <input id="editvruletype"
									name="editvruletype" type="text" value="${vruleEdit.type}"
									class="input_txt" /> <span
									id="formEditVRule_editvruletype_errorloc" class="error_label"></span>

								<label>Argument :</label>
								<textarea id="editvruleargument" name="editvruleargument"
									cols="" rows="">${vruleEdit.argument}</textarea>
								<span id="formEditVRule_editvruleargument_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
								var editfrmvalidator = new Validator(
										"formEditVRule");
								editfrmvalidator.EnableOnPageErrorDisplay();
								editfrmvalidator.EnableMsgsTogether();

								editfrmvalidator.addValidation("editvrulename",
										"req", "*required field");
								editfrmvalidator
										.addValidation("editvrulename",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								editfrmvalidator.addValidation("editvrulename",
										"maxlen=50",
										"*Text exceeds given character limit");
								editfrmvalidator.addValidation("editvruletext",
										"req", "*required field");
								editfrmvalidator
										.addValidation("editvruletext",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								editfrmvalidator.addValidation("editvruletext",
										"maxlen=255",
										"*Text exceeds given character limit");
								editfrmvalidator.addValidation("editvruletype",
										"req", "*required field");
								editfrmvalidator
										.addValidation("editvruletype",
												"regexp=[0-9a-zA-Z_]",
												"*Please enter only alphabets, numbers, space and _");
								editfrmvalidator.addValidation("editvruletype",
										"maxlen=50",
										"*Text exceeds given character limit");
								editfrmvalidator.addValidation(
										"editvruleargument", "req",
										"*required field");
								editfrmvalidator.addValidation(
										"editvruleargument", "maxlen=1000",
										"*Text exceeds given character limit");
							</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit Validation Rule ************************ -->
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

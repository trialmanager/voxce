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
<script type="text/javascript" src="../js/discrepancytexts.js"></script>
<script type="text/javascript" src="../js/ajax.js"></script>


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
		defaultexpanded : [ 13 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start add discrepancy text ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if
					test="${tl:rightsofView(resourceList,'Add Discrepency Text')==1}">
					<div class="body_inner" id="add_discrepancytext_form">
						<div class="body_inner_header">
							<!-- ************************Navigation***************************************** -->
							<div class="crumb_left"></div>
							<div class="crumb_mid">
								<div class="crumbs-user">
									<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
								</div>
								<div class="crumbs-link">
									<a
										href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
								</div>
								<div class="crumbs-link">
									<a href="javascript://">Add Discrepancy Text </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div id="" class="myform library">

								<form id="formAddDiscrepancyText" name="formAddDiscrepancyText"
									method="POST" action="addDiscrepancyText.discrepancytexts">


									<label>Code: </label> <input id="adddtcode" name="adddtcode"
										type="text" value="${dtAdd.CODE}" class="input_txt" /> <span
										id="formAddDiscrepancyText_adddtcode_errorloc"
										class="error_label"></span> <label>Name :</label> <input
										id="adddtname" name="adddtname" type="text"
										value="${dtAdd.NAME}" class="input_txt" /> <span
										id="formAddDiscrepancyText_adddtname_errorloc"
										class="error_label"></span> <label>Text :</label>
									<textarea id="adddttext" name="adddttext" cols="" rows="">${dtAdd.TEXT}</textarea>
									<span id="formAddDiscrepancyText_adddttext_errorloc"
										class="error_label"></span>

									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type="submit" class="blue-pill">Save</button>
										<button type="reset" class="grey-pill">Clear</button>
									</div>

								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddDiscrepancyText");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation("adddtcode",
											"req", "*required field");
									addfrmvalidator
											.addValidation("adddtcode",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("adddtcode",
													"maxlen=100",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation("adddtname",
											"req", "*required field");
									addfrmvalidator
											.addValidation("adddtname",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("adddtname",
													"maxlen=100",
													"*Text exceeds given character limit");
									addfrmvalidator
											.addValidation("adddttext",
													"maxlen=255",
													"*Text exceeds given character limit");
								</script>

							</div>
						</div>

					</div>
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add Discrepancy text ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view Discrepancy texts ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if
					test="${tl:rightsofView(resourceList,'View Discrepency Texts')==1}">
					<div class="body_inner" id="list_discrepancytexts_form">
						<div class="body_inner_header">
							<!-- ************************Navigation***************************************** -->
							<div class="crumb_left"></div>
							<div class="crumb_mid">
								<div class="crumbs-user">
									<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
								</div>
								<div class="crumbs-link">
									<a
										href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
								</div>
								<div class="crumbs-link">
									<a href="javascript://">View Discrepancy Texts </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Discrepancy Text
								:</div>
							<div class="field_set">
								<input id="View_DiscrepancyTexts_Search_Bar"
									name="View_DiscrepancyTexts_Search_Bar" type="text"
									class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										src="../images/search.png" alt="search" title="search"
										border="0" /></a></span>
							</div>
							<span id="AddDTGreenMessage" class="chk_avail_yes"
								style="display: none;"></span> <span id="AddDTErrorMessage"
								class="error_label" style="display: none;"></span>
							<div class="show_hide_form">
								<div class="field_txt_view_list">

									<form id="view_edit_form">

										<table width="60%" border="0" cellspacing="1" cellpadding="0"
											class="table_border_view_list">


											<tr class="rights_header_view_list">
												<td width="15%" align="left" valign="middle">&nbsp;Code</td>
												<td width="25%" align="left" valign="middle">&nbsp;Name</td>
												<td width="51%" align="left" valign="middle">&nbsp;Text</td>
												<c:if
													test="${tl:rightsofView(resourceList,'Edit Discrepency Texts')==1}">
													<td width="9%" align="center" valign="middle">Edit</td>
												</c:if>
											</tr>

											<c:if test="${fn:length(discrepancyTextsList) > 0}">
												<tbody id="fbody">
													<c:forEach items="${discrepancyTextsList}" var="aText"
														varStatus="status">

														<c:if test="${status.index % 2 == 0}">
															<tr class="white_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aText.CODE}</td>
																<td valign="top" align="left" class="set_padding">${aText.NAME}</td>
																<td valign="top" align="left" class="set_padding">${aText.TEXT}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'Edit Discrepency Texts')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aText.DISCREPANCY_TEXT_ID}','${aText.CODE}','${aText.NAME}','${aText.TEXT}','edit_form','edit_discrepancytext_form')" /></a></td>
																</c:if>
															</tr>
														</c:if>
														<c:if test="${status.index % 2 != 0}">
															<tr class="grey_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aText.CODE}</td>
																<td valign="top" align="left" class="set_padding">${aText.NAME}</td>
																<td valign="top" align="left" class="set_padding">${aText.TEXT}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'Edit Discrepency Texts')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aText.DISCREPANCY_TEXT_ID}','${aText.CODE}','${aText.NAME}','${aText.TEXT}','edit_form','edit_discrepancytext_form')" /></a></td>
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
				<!-- ************************ end view discrepancy texts ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit discrepancy text ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_discrepancytext_form">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />">Library</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/disc_txt/showDiscrepancyTextsIndex.discrepancytexts?FormCalled=list_discrepancytexts_form' />">View
									Discrepancy Texts</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Discrepancy Text </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditDiscrepancyText" name="formEditDiscrepancyText"
								method="POST" action="editDiscrepancyText.discrepancytexts"
								class="library">

								<input type="hidden" id="editdtid" name="editdtid"
									value="${dtEdit.DISCREPANCY_TEXT_ID}" /> <span
									id="EditDTGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditDTErrorMessage"
									class="error_label" style="display: none;"></span> <label>Code:
								</label> <input id="editdtcode" name="editdtcode" type="text"
									value="${dtEdit.CODE}" class="input_txt" /> <span
									id="formEditDiscrepancyText_editdtcode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="editdtname" name="editdtname" type="text"
									value="${dtEdit.NAME}" class="input_txt" /> <span
									id="formEditDiscrepancyText_editdtname_errorloc"
									class="error_label"></span> <label>Text :</label>
								<textarea id="editdttext" name="editdttext" cols="" rows="">${dtEdit.TEXT}</textarea>
								<span id="formEditDiscrepancyText_editdttext_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditDiscrepancyText");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editdtcode","req","*required field");
 editfrmvalidator.addValidation("editdtcode","alnum_s","*Please enter only alphabets and numbers");
 editfrmvalidator.addValidation("editdtcode","maxlen=100","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdtname","req","*required field");
 editfrmvalidator.addValidation("editdtname","alnum_s","*Please enter only alphabets and numbers");
 editfrmvalidator.addValidation("editdtname","maxlen=100","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdttext","maxlen=255","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit discrepancy text ************************ -->
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

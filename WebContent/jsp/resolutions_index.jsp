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
<script type="text/javascript" src="../js/resolutions.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>

<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<link href="../css/library.css" rel="stylesheet" type="text/css" />
<link href="../css/accordion.css" rel="stylesheet" type="text/css" />
<link href="../css/buttons.css" rel="stylesheet" type="text/css" />
<link href="../css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="../css/view_list.css" rel="stylesheet" type="text/css" />
<link href="../css/crumbs.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/gen_validatorv4.js"></script>
<script type="text/javascript" src="../JQuery/ddaccordion.js"></script>
<script type="text/javascript">
	ddaccordion.init({
		headerclass : "expandable", //Shared CSS class name of headers group that are expandable
		contentclass : "categoryitems", //Shared CSS class name of contents group
		revealtype : "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay : 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev : true, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded : [ 8 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start add resolution ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'Add Resolution')==1}">
					<div class="body_inner" id="add_resolution_form">
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
									<a href="javascript://">Add Resolution</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div id="" class="myform library">
								<form id="formAddResolution" name="formAddResolution"
									method="POST" action="addResolution.resolutions"
									class="library">

									<span id="AddResGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span id="AddResErrorMessage"
										class="error_label" style="display: none;"></span> <label>Code
										:</label> <input id="addrescode" name="addrescode" type="text"
										value="${resAdd.code}" class="input_txt" /> <span
										id="formAddResolution_addrescode_errorloc" class="error_label"></span>

									<label>Name :</label> <input id="addresname" name="addresname"
										type="text" value="${resAdd.name}" class="input_txt" /> <span
										id="formAddResolution_addresname_errorloc" class="error_label"></span>
									<div style="clear: both;"></div>

									<label>Description :</label>
									<textarea id="addresdescription" name="addresdescription"
										cols="" rows="">${resAdd.description}</textarea>
									<span id="formAddResolution_addresdescription_errorloc"
										class="error_label"></span>

									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button class="blue-pill" type="submit">Save</button>
										<button class="grey-pill" type="reset">Clear</button>
									</div>
								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddResolution");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation("addrescode",
											"req", "*required field");
									addfrmvalidator
											.addValidation("addrescode",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addrescode",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation("addresname",
											"req", "*required field");
									addfrmvalidator
											.addValidation("addresname",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addresname",
													"maxlen=255",
													"*Text exceeds given character limit");
								</script>

							</div>
						</div>

					</div>

				</c:if>


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add resolution ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view resolutions ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'View Resolutions')==1}">
					<div class="body_inner" id="list_resolutions_form">
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
									<a href="javascript://">View Resolutions</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Resolutions :</div>
							<div class="field_set">
								<input id="View_Resolutions_Search_Bar"
									name="View_Resolutions_Search_Bar" type="text"
									class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										src="../images/search.png" alt="search" title="search"
										border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">

									<form id="view_edit_form">

										<table width="60%" border="0" cellspacing="1" cellpadding="0"
											class="table_border_view_list">

											<c:if test="${fn:length(resolutionsList) > 0}">
												<tr class="rights_header_view_list">
													<td width="15%" align="left" valign="middle">&nbsp;Code</td>
													<td width="25%" align="left" valign="middle">&nbsp;Name</td>
													<td width="51%" align="left" valign="middle">&nbsp;Description</td>
													<c:if
														test="${tl:rightsofView(resourceList,'View Resolutions')==1}">
														<td width="9%" align="center" valign="middle">Edit</td>
													</c:if>
												</tr>

												<tbody id="fbody">
													<c:forEach items="${resolutionsList}" var="aRes"
														varStatus="status">

														<c:if test="${status.index % 2 == 0}">
															<tr class="white_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aRes.code}</td>
																<td valign="top" align="left" class="set_padding">${aRes.name}</td>
																<td valign="top" align="left" class="set_padding">${aRes.description}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'View Resolutions')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aRes.resolution_id}','${aRes.code}','${aRes.name}','${aRes.description}','edit_form','edit_resolution_form')" /></a></td>
																</c:if>
															</tr>
														</c:if>
														<c:if test="${status.index % 2 != 0}">
															<tr class="grey_row_view_list" id="${status.index}">
																<td valign="top" align="left" class="set_padding">${aRes.code}</td>
																<td valign="top" align="left" class="set_padding">${aRes.name}</td>
																<td valign="top" align="left" class="set_padding">${aRes.description}</td>
																<c:if
																	test="${tl:rightsofView(resourceList,'View Resolutions')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aRes.resolution_id}','${aRes.code}','${aRes.name}','${aRes.description}','edit_form','edit_resolution_form')" /></a></td>
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
				<!-- ************************ end view query statuses ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit query status ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<div class="body_inner" id="edit_resolution_form">
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
									href="<c:url value='/resolution/showResolutionsIndex.resolutions?FormCalled=list_resolutions_form' />">View
									Resolutions</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Resolutions</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">
							<form id="formEditResolution" name="formEditResolution"
								method="POST" action="editResolution.resolutions"
								class="library">

								<input type="hidden" id="editresid" name="editresid"
									value="${resEdit.resolution_id }" /> <span
									id="EditResGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditResErrorMessage"
									class="error_label" style="display: none;"></span> <label>Code
									:</label> <input id="editrescode" name="editrescode" type="text"
									value="${resEdit.code}" class="input_txt" /> <span
									id="formEditResolution_editrescode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="editresname" name="editresname" type="text"
									value="${resEdit.name}" class="input_txt" /> <span
									id="formEditResolution_editresname_errorloc"
									class="error_label"></span>
								<div style="clear: both;"></div>

								<label>Description :</label>
								<textarea id="editresdescription" name="editresdescription"
									cols="" rows="">${resEdit.description}</textarea>
								<span id="formEditResolution_editresdescription_errorloc"
									class="error_label"></span>

								<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditResolution");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editrescode","req","*required field");
 editfrmvalidator.addValidation("editrescode","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editrescode","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editresname","req","*required field");
 editfrmvalidator.addValidation("editresname","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editresname","maxlen=255","*Text exceeds given character limit");
 
</script>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button class="blue-pill" type="submit">Save</button>
									<button class="grey-pill" type="reset">Clear</button>
								</div>
							</form>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit Resolution ************************ -->
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

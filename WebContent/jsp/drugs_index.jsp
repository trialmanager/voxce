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

<script type="text/javascript" src="../js/drugs.js"></script>

<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<link href="../css/library.css" rel="stylesheet" type="text/css" />
<link href="../css/accordion.css" rel="stylesheet" type="text/css" />
<link href="../css/buttons.css" rel="stylesheet" type="text/css" />
<link href="../css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="../css/view_list.css" rel="stylesheet" type="text/css" />
<link href="../css/site.css" rel="stylesheet" type="text/css" />
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
		defaultexpanded : [ 0 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
		<%@include file="libheader.jsp"%>


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
				<!-- ************************ start add drug ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'Add Drugs')==1}">
					<div class="body_inner" id="add_drug_form" style="display: none;">
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
									<a href="javascript://">Add Drug </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">

							<div id="" class="myform library">

								<form id="formAddDrug" name="formAddDrug" method="POST"
									action="addDrug.drugs" class="library">

									<span id="AddDrugGreenMessage" class="chk_avail_yes"
										style="display: none;"> Success</span> <span
										id="AddDrugErrorMessage" class="error_label"
										style="display: none;">Error</span> <label>Drug Code :</label>
									<input id="adddrugcode" name="adddrugcode" type="text"
										value="${drugAdd.code}" class="input_txt" /> <span
										id="formAddDrug_adddrugcode_errorloc" class="error_label"></span>

									<label>Drug Name :</label> <input id="adddrugname"
										name="adddrugname" type="text" value="${drugAdd.name}"
										class="input_txt" /> <span
										id="formAddDrug_adddrugname_errorloc" class="error_label"></span>

									<!-- style="clear:both;  float:left; margin-bottom:8px; padding-bottom:5px; width:540px;" -->

									<div
										style="clear: both; float: left; margin-bottom: 8px; padding-bottom: 5px; width: 540px;">
										<label>Drug Type :</label><br /> <input type="radio"
											name="adddrugtype" value="Capsule" checked /> <span
											class="txt_norm">Capsule</span> <input type="radio"
											name="adddrugtype" value="Tablet" /> <span class="txt_norm">Tablets</span>
										<input type="radio" name="adddrugtype" value="Syrup" /> <span
											class="txt_norm">Syrup</span> <input type="radio"
											name="adddrugtype" value="Solution" /> <span
											class="txt_norm">Solution</span> <input type="radio"
											name="adddrugtype" value="Support" /> <span class="txt_norm">Suppositories</span>
										<span id="formAddDrug_adddrugtype_errorloc"
											class="error_label"></span>
									</div>


									<br /> <label>Enter Dose :</label> <input id="adddrugdose"
										name="adddrugdose" type="text" value="${drugAdd.dose}"
										class="input_txt" /> <span
										id="formAddDrug_adddrugdose_errorloc" class="error_label"></span>

									<label>Dose Normal Values :</label> <input
										id="adddrugnormalvalue" name="adddrugnormalvalue" type="text"
										value="${drugAdd.normal_value}" class="small" /> <span
										class="txt_normal">/</span> <input id="adddrugpernormalvalue"
										name="adddrugpernormalvalue" type="text"
										value="${drugAdd.per_normal_value}" class="small" /> <span
										id="formAddDrug_adddrugnormalvalue_errorloc"
										class="error_label"></span> <span
										id="formAddDrug_adddrugpernormalvalue_errorloc"
										class="error_label"></span>

									<div
										style="clear: both; margin-bottom: 8px; padding-bottom: 5px; padding-bottom: 5px; width: 540px;">
										<label>Refillable :</label><br /> <input type="radio"
											name="adddrugrefillable" value="true" /> <span
											class="txt_norm">Yes</span> <input type="radio"
											name="adddrugrefillable" value="false" checked /> <span
											class="txt_norm">No</span>
									</div>

									<label>Description :</label>
									<textarea id="adddrugdescription" name="adddrugdescription"
										cols="" rows="">${drugAdd.description}</textarea>
									<span id="formAddDrug_adddrugdescription_errorloc"
										class="error_label"></span> <label>Instructions :</label>
									<textarea id="adddruginstructions" name="adddruginstructions"
										cols="" rows="">${drugAdd.instructions}</textarea>
									<span id="formAddDrug_adddruginstructions_errorloc"
										class="error_label"></span>

									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type=submit class="blue-pill">Save</button>
										<button type=reset class="grey-pill">Clear</button>
									</div>
								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddDrug");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation(
											"adddrugcode", "req",
											"*required field");
									addfrmvalidator
											.addValidation("adddrugcode",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("adddrugcode",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"adddrugname", "req",
											"*required field");
									addfrmvalidator
											.addValidation("adddrugname",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("adddrugname",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"adddrugtype", "selone",
											"*select one");
									addfrmvalidator
											.addValidation("adddrugdose",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"adddrugrefillable", "selone",
											"*select one");
									addfrmvalidator.addValidation(
											"adddrugnormalvalue", "req",
											"*required field");
									addfrmvalidator.addValidation(
											"adddrugpernormalvalue", "req",
											"*required field");
									addfrmvalidator.addValidation(
											"adddrugnormalvalue", "num",
											"*numeric only");
									addfrmvalidator.addValidation(
											"adddrugpernormalvalue", "num",
											"*numeric only");
									addfrmvalidator.addValidation(
											"adddrugnormalvalue", "maxlen=10",
											"*Enter small number");
									addfrmvalidator.addValidation(
											"adddrugpernormalvalue",
											"maxlen=10", "*Enter small number");
									addfrmvalidator
											.addValidation(
													"adddrugdescription",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator
											.addValidation(
													"adddruginstructions",
													"maxlen=255",
													"*Text exceeds given character limit");
								</script>

							</div>
						</div>

					</div>
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add drug ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view drugs ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'View Drugs')==1}">
					<div class="body_inner" id="list_drugs_form">
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
									<a href="javascript://">View Drugs </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Drug Name :</div>
							<div class="field_set">
								<input id="View_Drugs_Search_Bar" name="View_Drugs_Search_Bar"
									type="text" class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										onclick="searchDrug()" src="../images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">
									<span id="AddDrugGreenMessage" class="chk_avail_yes"
										style="display: none;"> Success</span> <span
										id="AddDrugErrorMessage" class="error_label"
										style="display: none;">Error</span>
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">

										<tr class="rights_header_view_list">
											<td width="10%" align="left" valign="middle">&nbsp;Drug
												Code</td>
											<td width="10%" align="left" valign="middle">&nbsp;Drug
												Name</td>
											<td width="10%" align="left" valign="middle">&nbsp;Drug
												Type</td>
											<td width="14%" align="left" valign="middle">&nbsp;Dose</td>
											<td width="13%" align="left" valign="middle">&nbsp;Dose
												Norm. Values</td>
											<td width="7%" align="left" valign="middle">&nbsp;Refillable</td>
											<td width="15%" align="left" valign="middle">&nbsp;Description</td>
											<td width="17%" align="left" valign="middle">&nbsp;Instruction</td>
											<c:if test="${tl:rightsofView(resourceList,'Edit Drugs')==1}">
												<td width="4%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>

										<c:if test="${fn:length(drugsList) > 0}">

											<tbody id="fbody">

												<c:forEach items="${drugsList}" var="aDrug"
													varStatus="status">
													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list">
															<td valign="top" align="left" class="set_padding">${aDrug.code}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.name}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.type}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.dose}</td>
															<td valign="top" align="center" class="set_padding">${aDrug.normal_value}/${aDrug.per_normal_value}</td>

															<c:set var="refill" value="0"></c:set>
															<c:choose>
																<c:when test="${aDrug.refillable == refill}">
																	<td valign="top" align="center" class="set_padding">No</td>
																</c:when>
																<c:otherwise>
																	<td valign="top" align="center" class="set_padding">Yes</td>
																</c:otherwise>
															</c:choose>

															<td valign="top" align="left" class="set_padding">${aDrug.description}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.instructions}</td>
															<c:if
																test="${tl:rightsofView(resourceList,'Edit Drugs')==1}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"> <img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${aDrug.drug_id}','${aDrug.code}','${aDrug.name}','${aDrug.type}','${aDrug.dose}','${aDrug.normal_value}','${aDrug.per_normal_value}','${aDrug.refillable}','${aDrug.description}','${aDrug.instructions}','edit_form','edit_drug_form')" /></a></td>
															</c:if>
														</tr>
													</c:if>

													<c:if test="${status.index % 2 != 0}">
														<tr class="grey_row_view_list">
															<td valign="top" align="left" class="set_padding">${aDrug.code}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.name}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.type}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.dose}</td>
															<td valign="top" align="center" class="set_padding">${aDrug.normal_value}/${aDrug.per_normal_value}</td>
															<c:set var="refill" value="0"></c:set>

															<c:choose>
																<c:when test="${aDrug.refillable == refill}">
																	<td valign="top" align="center" class="set_padding">No</td>
																</c:when>
																<c:otherwise>
																	<td valign="top" align="center" class="set_padding">Yes</td>
																</c:otherwise>
															</c:choose>

															<td valign="top" align="left" class="set_padding">${aDrug.description}</td>
															<td valign="top" align="left" class="set_padding">${aDrug.instructions}</td>
															<c:if
																test="${tl:rightsofView(resourceList,'Edit Drugs')==1}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"> <img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${aDrug.drug_id}','${aDrug.code}','${aDrug.name}',
		    																'${aDrug.type}','${aDrug.dose}','${aDrug.normal_value}','${aDrug.per_normal_value}',
		    																'${aDrug.refillable}','${aDrug.description}','${aDrug.instructions}','edit_form','edit_drug_form')" /></a></td>
															</c:if>

														</tr>
													</c:if>

												</c:forEach>
											</tbody>
										</c:if>
									</table>

								</div>
							</div>
						</div>
					</div>
				</c:if>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit drugs ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_drug_form" style="display: none">
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
									href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=list_drugs_form' />">View
									Drugs</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Drug </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">


							<form id="formEditDrug" name="formEditDrug" method="POST"
								action="editDrug.drugs" class="library">

								<input type="hidden" id="editdrugid" name="editdrugid"
									value="${drugEdit.drug_id }" /> <span
									id="EditDrugGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="EditDrugErrorMessage"
									class="error_label" style="display: none;"></span> <label>Drug
									Code :</label> <input id="editdrugcode" name="editdrugcode" type="text"
									value="${drugEdit.code}" class="input_txt" /> <span
									id="formEditDrug_editdrugcode_errorloc" class="error_label"></span>

								<label>Drug Name :</label> <input id="editdrugname"
									name="editdrugname" type="text" value="${drugEdit.name}"
									class="input_txt" /> <span
									id="formEditDrug_editdrugname_errorloc" class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px; width: 540px; float: left">
									<label>Drug Type :</label><br /> <input type="radio"
										name="editdrugtype" value="Capsule" /> <span class="txt_norm">Capsule</span>
									<input type="radio" name="editdrugtype" value="Tablet" /> <span
										class="txt_norm">Tablets</span> <input type="radio"
										name="editdrugtype" value="Syrup" /> <span class="txt_norm">Syrup</span>
									<input type="radio" name="editdrugtype" value="Solution" /> <span
										class="txt_norm">Solution</span> <input type="radio"
										name="editdrugtype" value="Suppositories" /> <span
										class="txt_norm">Suppositories</span>
								</div>
								<span id="formEditDrug_editdrugtype_errorloc"
									class="error_label"></span> <label>Enter Dose :</label> <input
									id="editdrugdose" name="editdrugdose" type="text"
									value="${drugEdit.dose}" class="input_txt" /> <span
									id="formEditDrug_editdrugdose_errorloc" class="error_label"></span>

								<label>Dose Normal Values :</label> <input
									id="editdrugnormalvalue" name="editdrugnormalvalue" type="text"
									value="${drugEdit.normal_value}" class="small" /> <span
									class="txt_normal">/</span> <input id="editdrugpernormalvalue"
									name="editdrugpernormalvalue" type="text"
									value="${drugEdit.per_normal_value}" class="small" /> <br>

								<span id="formEditDrug_editdrugnormalvalue_errorloc"
									class="error_label"></span> <span
									id="formEditDrug_editdrugpernormalvalue_errorloc"
									class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px; padding-bottom: 5px; width: 540px;">
									<label>Refillable :</label><br /> <input type="radio"
										name="editdrugrefillable" value="true" /> <span
										class="txt_norm">Yes</span> <input type="radio"
										name="editdrugrefillable" value="false" /> <span
										class="txt_norm">No</span>
								</div>
								<span id="formEditDrug_editdrugrefillable_errorloc"
									class="error_label"></span> <label>Description :</label>
								<textarea id="editdrugdescription" name="editdrugdescription"
									cols="" rows="">${drugEdit.description}</textarea>
								<span id="formEditDrug_editdrugdescription_errorloc"
									class="error_label"></span> <label>Instructions :</label>
								<textarea id="editdruginstructions" name="editdruginstructions"
									cols="" rows="">${drugEdit.instructions}</textarea>
								<span id="formEditDrug_editdruginstructions_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type=submit class="blue-pill">Save</button>
									<button type=reset class="grey-pill">Clear</button>
								</div>
							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditDrug");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editdrugcode","req","*required field");
 editfrmvalidator.addValidation("editdrugcode","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editdrugcode","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdrugname","req","*required field");
 editfrmvalidator.addValidation("editdrugname","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editdrugname","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdrugtype","selone","*select one");
 editfrmvalidator.addValidation("editdrugdose","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdrugrefillable","selone","*select one");
 editfrmvalidator.addValidation("editdrugnormalvalue","req","*required field");
 editfrmvalidator.addValidation("editdrugpernormalvalue","req","*required field");
 editfrmvalidator.addValidation("editdrugnormalvalue","num","*numeric only");
 editfrmvalidator.addValidation("editdrugpernormalvalue","num","*numeric only");
 editfrmvalidator.addValidation("editdrugnormalvalue","maxlen=10","*Enter small number");
 editfrmvalidator.addValidation("editdrugpernormalvalue","maxlen=10","*Enter small number");
 editfrmvalidator.addValidation("editdrugdescription","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editdruginstructions","maxlen=255","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end edit drug ************************* -->
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

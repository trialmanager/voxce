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
<script type="text/javascript" src="../js/labdata.js"></script>
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
		defaultexpanded : [ 3 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start view labdata ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="list_labdata_form">
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
									href="<c:url value='/laboratory/showLaboratoryIndex.laboratory?FormCalled=list_laboratories_form' />">View
									Laboratories</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">"${currentlaboratory.lab_name}"
									Normals </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div class="field_label_view_list">Search Labs :</div>
						<div class="field_set">
							<input id="View_LabData_Search_Bar"
								name="View_LabData_Search_Bar" type="text" class="input_txt"
								value="Search..." /> <span class="search_btn"><a
								href="#"><img src="../images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">

								<form id="view_edit_form">

									<table width="90%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">

										<tr class="rights_header_view_list">
											<td width="24%" height="20" align="left" valign="middle">&nbsp;Lab
												Name</td>
											<td width="16%" align="left" valign="middle">&nbsp;Default
												Unit</td>
											<td width="13%" align="left" valign="middle">&nbsp;Normal
												Low</td>
											<td width="8%" align="left" valign="middle">&nbsp;Unit</td>
											<td width="10%" align="center" valign="middle">Normal
												High</td>
											<td width="10%" align="center" valign="middle">Unit</td>
											<td width="6%" align="center" valign="middle">Edit</td>
										</tr>

										<c:if test="${fn:length(labdataList) > 0}">

											<tbody id="fbody">
												<c:forEach items="${labdataList}" var="aData"
													varStatus="status">

													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list">

															<c:forEach items="${labsList}" var="aLab"
																varStatus="labStatus">
																<c:if test="${aLab.lab_id == aData.lab_id }">
																	<c:set var="lab_name" value="${aLab.lab_id}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${lab_name}</td>

															<c:forEach items="${UoMList}" var="dUoM"
																varStatus="uomStatus">
																<c:if
																	test="${dUoM.unit_of_measure_id == aData.unit_id }">
																	<c:set var="default_unit" value="${dUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${default_unit}</td>

															<td valign="top" align="left" class="set_padding">${aData.normal_low}</td>

															<c:forEach items="${UoMList}" var="lUoM"
																varStatus="uomStatus">
																<c:if
																	test="${lUoM.unit_of_measure_id == aData.normal_low_unit }">
																	<c:set var="low_unit" value="${lUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${low_unit}</td>

															<td valign="top" align="center" class="set_padding">${aData.normal_high}</td>

															<c:forEach items="${UoMList}" var="hUoM"
																varStatus="uomStatus">
																<c:if
																	test="${hUoM.unit_of_measure_id == aData.normal_high_unit }">
																	<c:set var="high_unit" value="${hUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="center" class="set_padding2">${high_unit}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aData.lab_normal_id}','${aData.labratory_id}','${aData.lab_id}','${aData.unit_id}','${aData.normal_low}','${aData.normal_low_unit}','${aData.normal_high}','${aData.normal_high_unit}','edit_form','edit_labdata_form')" /></a></td>
														</tr>
													</c:if>

													<c:if test="${status.index % 2 != 0}">
														<tr class="grey_row_view_list">

															<c:forEach items="${labsList}" var="aLab"
																varStatus="labStatus">
																<c:if test="${aLab.lab_id == aData.lab_id }">
																	<c:set var="lab_name" value="${aLab.lab_id}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${lab_name}</td>

															<c:forEach items="${UoMList}" var="dUoM"
																varStatus="uomStatus">
																<c:if
																	test="${dUoM.unit_of_measure_id == aData.unit_id }">
																	<c:set var="default_unit" value="${dUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${default_unit}</td>

															<td valign="top" align="left" class="set_padding">${aData.normal_low}</td>

															<c:forEach items="${UoMList}" var="lUoM"
																varStatus="uomStatus">
																<c:if
																	test="${lUoM.unit_of_measure_id == aData.normal_low_unit }">
																	<c:set var="low_unit" value="${lUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="left" class="set_padding">${low_unit}</td>

															<td valign="top" align="center" class="set_padding">${aData.normal_high}</td>

															<c:forEach items="${UoMList}" var="hUoM"
																varStatus="uomStatus">
																<c:if
																	test="${hUoM.unit_of_measure_id == aData.normal_high_unit }">
																	<c:set var="high_unit" value="${hUoM.name}" />
																</c:if>
															</c:forEach>
															<td valign="top" align="center" class="set_padding2">${high_unit}</td>
															<td valign="top" align="center" class="set_padding2"><a
																href="#"><img src="../images/edit.png" alt="Edit"
																	title="Edit" border="0"
																	onclick="passEditValues('${aData.lab_normal_id}','${aData.labratory_id}','${aData.lab_id}','${aData.unit_id}','${aData.normal_low}','${aData.normal_low_unit}','${aData.normal_high}','${aData.normal_high_unit}','edit_form','edit_labdata_form')" /></a></td>
														</tr>

													</c:if>

												</c:forEach>
												<!-- for each item in list -->
											</tbody>

										</c:if>
										<!-- If the List is empty -->
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end view labs ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit lab ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_labdata_form">
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
									href="<c:url value='/laboratory/showLabData.laboratory?labr=${labdataEdit.laboratory_id }' />">View
									Lab data</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit "${currentlaboratory.lab_name
									}" Normal Units</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditLabData" name="formEditLabData" method="POST"
								action="editLabData.laboratory">

								<input type="hidden" id="editlabdataid" name="editlabdataid"
									value="${labdataEdit.lab_normal_id}" /> <input type="hidden"
									id="editlabdatacurrentlaboratoryid"
									name="editlabdatacurrentlaboratoryid"
									value="${labdataEdit.laboratory_id}" /> <span
									id="EditLabDataGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span
									id="EditLabDataErrorMessage" class="error_label"
									style="display: none;"></span> <label>Lab Name :</label> <select
									id="editlabdatalabname" name="editlabdatalabname"
									class="drop_txt">
									<c:forEach items="${labsList}" var="lab" varStatus="status">
										<option id="${lab.lab_id}" value="${lab.lab_id}" onclick="">
											${lab.name}</option>
									</c:forEach>
								</select> <span id="formEditLabData_editlabdatalabname_errorloc"
									class="error_label"></span> <label>Default Unit :</label> <select
									id="editlabdatadefaultunit" name="editlabdatadefaultunit"
									class="drop_txt">
									<c:forEach items="${UoMList}" var="dUnit" varStatus="status">
										<option id="${dUnit.unit_of_measure_id}"
											value="${dUnit.unit_of_measure_id}" onclick="">
											${dUnit.name}</option>
									</c:forEach>
								</select> <span id="formEditLabData_editlabdatadefaultunit_errorloc"
									class="error_label"></span> <label>Normal Low :</label> <input
									id="editlabdatanormallow" name="editlabdatanormallow"
									type="text" value="${labDataEdit.normal_low}" class="input_txt" />
								<span id="formEditLabData_editlabdatanormallow_errorloc"
									class="error_label"></span> <label>Unit :</label> <select
									id="editlabdatalowunit" name="editlabdatalowunit"
									class="drop_txt">
									<c:forEach items="${UoMList}" var="lUnit" varStatus="status">
										<option id="${lUnit.unit_of_measure_id}"
											value="${lUnit.unit_of_measure_id}" onclick="">
											${lUnit.name}</option>
									</c:forEach>
								</select> <span id="formEditLabData_editlabdatalowunit_errorloc"
									class="error_label"></span> <label>Normal High :</label> <input
									id="editlabdatanormalhigh" name="editlabdatanormalhigh"
									type="text" value="${labDataEdit.normal_high}"
									class="input_txt" /> <span
									id="formEditLabData_editlabdatanormalhigh_errorloc"
									class="error_label"></span> <label>Unit :</label> <select
									id="editlabdatahighunit" name="editlabdatahighunit"
									class="drop_txt">
									<c:forEach items="${UoMList}" var="hUnit" varStatus="status">
										<option id="${hUnit.unit_of_measure_id}"
											value="${hUnit.unit_of_measure_id}" onclick="">
											${hUnit.name}</option>
									</c:forEach>
								</select> <span id="formEditLabData_editlabdatahighunit_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditLabData");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editlabdatanormallow","req","*required field");
 editfrmvalidator.addValidation("editlabdatanormallow","maxlen=10","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlabdatanormalhigh","req","*required field");
 editfrmvalidator.addValidation("editlabdatanormalhigh","maxlen=10","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit lab ************************ -->
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

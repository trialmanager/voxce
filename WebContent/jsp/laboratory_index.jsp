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
<script type="text/javascript" src="../js/laboratory.js"></script>
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
				<!-- ************************ start add laboratory ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'Add Laboratory')==1}">
					<div class="body_inner" id="add_laboratory_form">
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
									<a href="javascript://">Add Laboratory </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div id="" class="myform library">

								<form id="formAddLaboratory" name="formAddLaboratory"
									method="post" action="addLaboratory.laboratory" class="library">

									<span id="AddLaboratoryGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span
										id="AddLaboratoryErrorMessage" class="error_label"
										style="display: none;"></span> <label>Name :</label> <input
										id="addlaboratoryname" name="addlaboratoryname" type="text"
										value="${laboratoryAdd.lab_name}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratoryname_errorloc"
										class="error_label"></span> <label>E-mail :</label> <input
										id="addlaboratoryemail" name="addlaboratoryemail" type="text"
										value="${laboratoryAdd.email}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratoryemail_errorloc"
										class="error_label"></span> <label>Address :</label> <input
										id="addlaboratoryaddress1" name="addlaboratoryaddress1"
										type="text" value="${laboratoryAdd.address1}"
										class="input_txt" /> <span
										id="formAddLaboratory_addlaboratoryaddress1_errorloc"
										class="error_label"></span> <input id="addlaboratoryaddress2"
										name="addlaboratoryaddress2" type="text"
										value="${laboratoryAdd.address2}" class="input_txt2" /> <input
										id="addlaboratoryaddress3" name="addlaboratoryaddress3"
										type="text" value="${laboratoryAdd.address3}"
										class="input_txt2" /> <label>City :</label> <input
										id="addlaboratorycity" name="addlaboratorycity" type="text"
										value="${laboratoryAdd.city}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratorycity_errorloc"
										class="error_label"></span> <label>State :</label> <input
										id="addlaboratorystate" name="addlaboratorystate" type="text"
										value="${laboratoryAdd.state}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratorystate_errorloc"
										class="error_label"></span> <label>Country :</label> <select
										id="addlaboratorycountry" name="addlaboratorycountry"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Country]</option>
										<c:forEach items="${countriesList}" var="country"
											varStatus="status">
											<option id="${country.COUNTRY_ID }"
												value="${country.COUNTRY_ID }" onclick="">${country.COUNTRY_NAME
												}</option>
										</c:forEach>
									</select> <span id="formAddLaboratory_addlaboratorycountry_errorloc"
										class="error_label"></span> <label>Postal Code :</label> <input
										id="addlaboratorypostalcode" name="addlaboratorypostalcode"
										type="text" value="${laboratoryAdd.postal_code}"
										class="input_txt" /> <span
										id="formAddLaboratory_addlaboratorypostalcode_errorloc"
										class="error_label"></span> <label>Phone :</label> <input
										id="addlaboratoryphone" name="addlaboratoryphone" type="text"
										value="${laboratoryAdd.phone}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratoryphone_errorloc"
										class="error_label"></span> <label>Cell :</label> <input
										id="addlaboratorycell" name="addlaboratorycell" type="text"
										value="${laboratoryAdd.cell}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratorycell_errorloc"
										class="error_label"></span> <label>Fax :</label> <input
										id="addlaboratoryfax" name="addlaboratoryfax" type="text"
										value="${laboratoryAdd.fax}" class="input_txt" /> <span
										id="formAddLaboratory_addlaboratoryfax_errorloc"
										class="error_label"></span>


									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type="submit" class="blue-pill">Submit</button>
										<button type="reset" class="grey-pill">Clear</button>
										<br />
									</div>

								</form>

								<!-- ******  VALIDATION ****** -->
								<script type="text/javascript" language="JavaScript">
									/* **** ADD LABORATORY FORM VALIDATOR *****/
									var addfrmvalidator = new Validator(
											"formAddLaboratory");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation(
											"addlaboratoryname", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addlaboratoryname",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addlaboratoryname",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryemail", "email",
											"*Invalid email format");
									addfrmvalidator
											.addValidation(
													"addlaboratoryemail",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryaddress1", "req",
											"*required field");
									addfrmvalidator
											.addValidation(
													"addlaboratoryaddress1",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryaddress2", "req",
											"*required field");
									addfrmvalidator
											.addValidation(
													"addlaboratoryaddress2",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryaddress3", "req",
											"*required field");
									addfrmvalidator
											.addValidation(
													"addlaboratoryaddress3",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratorycity", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addlaboratorycity",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratorypostalcode", "req",
											"*required field");
									addfrmvalidator.addValidation(
											"addlaboratorypostalcode", "num",
											"*numeric only");
									addfrmvalidator
											.addValidation(
													"addlaboratorypostalcode",
													"maxlen=10",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryphone", "num",
											"*numeric only");
									addfrmvalidator
											.addValidation(
													"addlaboratoryphone",
													"maxlen=10",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratorycell", "num",
											"*numeric only");
									addfrmvalidator
											.addValidation("addlaboratorycell",
													"maxlen=10",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratoryfax", "num",
											"*numeric only");
									addfrmvalidator
											.addValidation("addlaboratoryfax",
													"maxlen=10",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addlaboratorycountry",
											"dontselect=000",
											"*Please, select a country");
								</script>

								<!-- ************* END ADD LABORATORY BASIC INFO *****  -->
								<!-- ************* START ADD LABORATORY DATA *****  -->

								<div class="body_inner_header">Add Lab Data</div>
								<br />

								<form id="formAddLabData" name="formAddLabData" method="post"
									action="addLabData.laboratory" class="library">

									<label>Select Laboratory :</label> <select
										id="addlabdatacurrentlaboratory"
										name="addlabdatacurrentlaboratory" class="drop_txt">
										<option id="101" value="101" onclick="" selected="selected">[Select
											Laboratory...]</option>
										<c:forEach items="${laboratoriesList}" var="currentLaboratory"
											varStatus="status">
											<option id="${currentLaboratory.labratory_id}"
												value="${currentLaboratory.labratory_id}" onclick="">
												${currentLaboratory.lab_name}</option>
										</c:forEach>
									</select> <span id="formAddLabData_addlabdatacurrentlaboratory_errorloc"
										class="error_label"></span> <br /> <label>Lab Name :</label>
									<select id="addlabdatalabname" name="addlabdatalabname"
										class="drop_txt">
										<option id="00" value="00" onclick="" selected="selected">[Select
											Lab...]</option>
										<c:forEach items="${labsList}" var="lab" varStatus="status">
											<option id="${lab.lab_id}" value="${lab.lab_id}" onclick="">
												${lab.name}</option>
										</c:forEach>
									</select> <span id="formAddLabData_addlabdatalabname_errorloc"
										class="error_label"></span> <label>Default Unit :</label> <select
										id="addlabdatadefaultunit" name="addlabdatadefaultunit"
										class="drop_txt">
										<option id="10" value="10" onclick="" selected="selected">[Select
											Default Unit...]</option>
										<c:forEach items="${UoMList}" var="dUnit" varStatus="status">
											<option id="${dUnit.unit_of_measure_id}"
												value="${dUnit.unit_of_measure_id}" onclick="">
												${dUnit.name}</option>
										</c:forEach>
									</select> <span id="formAddLabData_addlabdatadefaultunit_errorloc"
										class="error_label"></span> <label>Normal Low :</label> <input
										id="addlabdatanormallow" name="addlabdatanormallow"
										type="text" value="${labDataAdd.normal_low}" class="input_txt" />
									<span id="formAddLabData_addlabdatanormallow_errorloc"
										class="error_label"></span> <label>Unit :</label> <select
										id="addlabdatalowunit" name="addlabdatalowunit"
										class="drop_txt">
										<option id="01" value="01" onclick="" selected="selected">[Select
											Unit...]</option>
										<c:forEach items="${UoMList}" var="lUnit" varStatus="status">
											<option id="${lUnit.unit_of_measure_id}"
												value="${lUnit.unit_of_measure_id}" onclick="">
												${lUnit.name}</option>
										</c:forEach>
									</select> <span id="formAddLabData_addlabdatalowunit_errorloc"
										class="error_label"></span> <label>Normal High :</label> <input
										id="addlabdatanormalhigh" name="addlabdatanormalhigh"
										type="text" value="${labDataAdd.normal_high}"
										class="input_txt" /> <span
										id="formAddLabData_addlabdatanormalhigh_errorloc"
										class="error_label"></span> <label>Unit :</label> <select
										id="addlabdatahighunit" name="addlabdatahighunit"
										class="drop_txt">
										<option id="11" value="11" onclick="" selected="selected">[Select
											Unit...]</option>
										<c:forEach items="${UoMList}" var="hUnit" varStatus="status">
											<option id="${hUnit.unit_of_measure_id}"
												value="${hUnit.unit_of_measure_id}" onclick="">
												${hUnit.name}</option>
										</c:forEach>
									</select> <span id="formAddLabData_addlabdatahighunit_errorloc"
										class="error_label"></span>


									<div style="clear: both; padding-left: 135px;">
										<button class="blue-pill">Add</button>
										<br />
									</div>
									<br />
								</form>

								<script type="text/javascript" language="JavaScript">
									/* **** ADD LAB DATA FORM VALIDATOR *****/
									var addlabdatavalidator = new Validator(
											"formAddLabData");
									addlabdatavalidator
											.EnableOnPageErrorDisplay();
									addlabdatavalidator.EnableMsgsTogether();

									addlabdatavalidator.addValidation(
											"addlabdatanormallow", "req",
											"*required field");
									addlabdatavalidator
											.addValidation(
													"addlabdatanormallow",
													"maxlen=10",
													"*Text exceeds given character limit");
									addlabdatavalidator.addValidation(
											"addlabdatanormalhigh", "req",
											"*required field");
									addlabdatavalidator
											.addValidation(
													"addlabdatanormalhigh",
													"maxlen=10",
													"*Text exceeds given character limit");
									addlabdatavalidator.addValidation(
											"addlabdatacurrentlaboratory",
											"dontselect=101",
											"*Please, select laboratory");
									addlabdatavalidator.addValidation(
											"addlabdatalabname",
											"dontselect=00",
											"*Please, select a lab");
									addlabdatavalidator.addValidation(
											"addlabdatalowunit",
											"dontselect=01",
											"*Please, select a low unit");
									addlabdatavalidator.addValidation(
											"addlabdatadefaultunit",
											"dontselect=10",
											"*Please, select a default unit");
									addlabdatavalidator.addValidation(
											"addlabdatahighunit",
											"dontselect=11",
											"*Please, select a high unit");
								</script>
								<!-- ************* END ADD LABORATORY DATA *****  -->
							</div>
						</div>

					</div>
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add laboratory ************************* -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view laboratories ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'View Laboratory')==1}">
					<div class="body_inner" id="list_laboratories_form">
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
									<a href="javascript://">View Laboratories </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Laboratory :</div>
							<div class="field_set">
								<input id="View_Laboratory_Search_Bar"
									name="View_Laboratory_Search_Bar" type="text" class="input_txt"
									value="Search..." /> <span class="search_btn"><a
									href="#"><img src="../images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">
									<span id="AddLaboratoryGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span
										id="AddLaboratoryErrorMessage" class="error_label"
										style="display: none;"></span>

									<form id="view_edit_form">

										<!-- ID VALUE TO PASS TO VIEW LAB DATA -->
										<!-- <input type="hidden" id="labr_id" name="labr_id" value="labr" /> -->

										<table width="90%" border="0" cellspacing="1" cellpadding="0"
											class="table_border_view_list">
											<tr class="rights_header_view_list">
												<td width="19%" height="20" align="left" valign="middle">&nbsp;Name</td>
												<td width="22%" align="left" valign="middle">&nbsp;E-mail</td>
												<td width="26%" align="left" valign="middle">&nbsp;Address</td>
												<td width="17%" align="left" valign="middle">&nbsp;Contact
													Numbers</td>
												<c:if
													test="${tl:rightsofView(resourceList,'Add Laboratory')==1}">
													<td width="4%" align="center" valign="middle">Edit</td>
												</c:if>
												<td width="12%" align="center" valign="middle">View Lab
													Data</td>
											</tr>

											<c:if test="${fn:length(laboratoriesList) > 0}">

												<tbody id="fbody">
													<c:forEach items="${laboratoriesList}" var="aLab"
														varStatus="status">
														<!--*** make empty variable with no default value-->
														<c:set var="aCountry_name" value="" />

														<!--*** Row with white background -->
														<c:if test="${status.index % 2 == 0}">
															<tr class="white_row_view_list">
																<td valign="top" align="left" class="set_padding">${aLab.lab_name}</td>
																<td valign="top" align="left" class="set_padding">${aLab.email}</td>
																<!-- *Iterate Category List to find name of country against ID -->
																<c:forEach items="${countriesList}" var="aCount"
																	varStatus="countryStatus">
																	<c:if test="${aCount.COUNTRY_ID == aLab.country_id }">
																		<c:set var="aCountry_name"
																			value="${aCount.COUNTRY_NAME}" />
																	</c:if>
																</c:forEach>
																<td valign="top" align="left" class="set_padding">${aLab.address1},
																	${aLab.address2}, ${aLab.city}, ${aLab.state},
																	${aCountry_name},${aLab.postal_code}</td>
																<td valign="top" align="left" class="set_padding">
																	<strong>Phone:</strong><br /> ${aLab.phone}<br /> <strong>Cell:</strong><br />
																	${aLab.cell}<br /> <strong>Fax:</strong><br />
																	${aLab.fax}<br />
																</td>
																<!-- *** Edit Button with Action to transfer values -->
																<c:if
																	test="${tl:rightsofView(resourceList,'Add Laboratory')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aLab.labratory_id}','${aLab.lab_name}','${aLab.email}','${aLab.address1}','${aLab.address2}','${aLab.address3}','${aLab.city}','${aLab.state}','${aLab.country_id}','${aLab.postal_code}','${aLab.phone}','${aLab.cell}','${aLab.fax}','edit_form','edit_laboratory_form')" /></a></td>
																</c:if>
																<%-- <td valign="top" align="center" class="set_padding2"><a href="#"><img src="../images/edit.png" alt="Edit" title="Edit" border="0" onclick="editTest()"/></a></td>--%>

																<td valign="top" align="center" class="set_padding2"><a
																	href="<c:url value='/laboratory/showLabData.laboratory?labr=${aLab.labratory_id }'/>"><img
																		src="../images/view.png" alt="View" title="View"
																		border="0" /></a></td>
															</tr>
														</c:if>

														<!--*** Row with grey background -->
														<c:if test="${status.index % 2 != 0}">
															<tr class="grey_row_view_list">
																<td valign="top" align="left" class="set_padding">${aLab.lab_name}</td>
																<td valign="top" align="left" class="set_padding">${aLab.email}</td>
																<!-- *Iterate Category List to find name of country against ID -->
																<c:forEach items="${countriesList}" var="aCount"
																	varStatus="countryStatus">
																	<c:if test="${aCount.COUNTRY_ID == aLab.country_id }">
																		<c:set var="aCountry_name"
																			value="${aCount.COUNTRY_NAME}" />
																	</c:if>
																</c:forEach>
																<td valign="top" align="left" class="set_padding">${aLab.address1},
																	${aLab.address2}, ${aLab.city}, ${aLab.state},
																	${aCountry_name},${aLab.postal_code}</td>
																<td valign="top" align="left" class="set_padding">
																	<strong>Phone:</strong><br /> ${aLab.phone}<br /> <strong>Cell:</strong><br />
																	${aLab.cell}<br /> <strong>Fax:</strong><br />
																	${aLab.fax}<br />
																</td>
																<!-- *** Edit Button with Action to transfer values -->
																<c:if
																	test="${tl:rightsofView(resourceList,'View Laboratory')==1}">
																	<td valign="top" align="center" class="set_padding2"><a
																		href="#"><img src="../images/edit.png" alt="Edit"
																			title="Edit" border="0"
																			onclick="passEditValues('${aLab.labratory_id}','${aLab.lab_name}','${aLab.email}','${aLab.address1}','${aLab.address2}','${aLab.address3}','${aLab.city}','${aLab.state}','${aLab.country_id}','${aLab.postal_code}','${aLab.phone}','${aLab.cell}','${aLab.fax}','edit_form','edit_laboratory_form')" /></a></td>
																</c:if>
																<td valign="top" align="center" class="set_padding2"><a
																	href="<c:url value='/laboratory/showLabData.laboratory?labr=${aLab.labratory_id }'/>"><img
																		src="../images/view.png" alt="View" title="View"
																		border="0" /></a></td>
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
				<!-- ************************ end view labs ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit lab ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_laboratory_form">
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
								<a href="javascript://">Edit Laboratory </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditLaboratory" name="formEditLaboratory"
								method="POST" action="editLaboratory.laboratory">

								<input type="hidden" id="editlaboratoryid"
									name="editlaboratoryid" value="${laboratoryEdit.labratory_id}" />

								<span id="EditLaboratoryGreenMessage" class="chk_avail_yes"
									style="display: none;">green</span> <span
									id="EditLaboratoryErrorMessage" class="error_label"
									style="display: none;">error</span> <label>Name :</label> <input
									id="editlaboratoryname" name="editlaboratoryname" type="text"
									value="${laboratoryEdit.lab_name}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratoryname_errorloc"
									class="error_label"></span> <label>E-mail :</label> <input
									id="editlaboratoryemail" name="editlaboratoryemail" type="text"
									value="${laboratoryEdit.email}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratoryemail_errorloc"
									class="error_label"></span> <label>Address :</label> <input
									id="editlaboratoryaddress1" name="editlaboratoryaddress1"
									type="text" value="${laboratoryEdit.address1}"
									class="input_txt" /> <span
									id="formEditLaboratory_editlaboratoryaddress1_errorloc"
									class="error_label"></span> <input id="editlaboratoryaddress2"
									name="editlaboratoryaddress2" type="text"
									value="${laboratoryEdit.address2}" class="input_txt2" /> <input
									id="editlaboratoryaddress3" name="editlaboratoryaddress3"
									type="text" value="${laboratoryEdit.address3}"
									class="input_txt2" /> <label>City :</label> <input
									id="editlaboratorycity" name="editlaboratorycity" type="text"
									value="${laboratoryEdit.city}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratorycity_errorloc"
									class="error_label"></span> <label>State :</label> <input
									id="editlaboratorystate" name="editlaboratorystate" type="text"
									value="${laboratoryEdit.state}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratorystate_errorloc"
									class="error_label"></span> <label>Country :</label> <select
									id="editlaboratorycountry" name="editlaboratorycountry"
									class="drop_txt">
									<c:forEach items="${countriesList}" var="country"
										varStatus="status">
										<option id="${country.COUNTRY_ID }"
											value="${country.COUNTRY_ID }" onclick="">${country.COUNTRY_NAME
											}</option>
									</c:forEach>
								</select> <span id="formEditLaboratory_editlaboratorycountry_errorloc"
									class="error_label"></span> <label>Postal Code :</label> <input
									id="editlaboratorypostalcode" name="editlaboratorypostalcode"
									type="text" value="${laboratoryEdit.postal_code}"
									class="input_txt" /> <span
									id="formEditLaboratory_editlaboratorypostalcode_errorloc"
									class="error_label"></span> <label>Phone :</label> <input
									id="editlaboratoryphone" name="editlaboratoryphone" type="text"
									value="${laboratoryEdit.phone}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratoryphone_errorloc"
									class="error_label"></span> <label>Cell :</label> <input
									id="editlaboratorycell" name="editlaboratorycell" type="text"
									value="${laboratoryEdit.cell}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratorycell_errorloc"
									class="error_label"></span> <label>Fax :</label> <input
									id="editlaboratoryfax" name="editlaboratoryfax" type="text"
									value="${laboratoryEdit.fax}" class="input_txt" /> <span
									id="formEditLaboratory_editlaboratoryfax_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditLaboratory");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editlaboratoryname","req","*required field");
 editfrmvalidator.addValidation("editlaboratoryname","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editlaboratoryname","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratoryemail","email","*Invalid email format");
 editfrmvalidator.addValidation("editlaboratoryemail","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratoryaddress1","req","*required field");
 editfrmvalidator.addValidation("editlaboratoryaddress1","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratoryaddress2","req","*required field");
 editfrmvalidator.addValidation("editlaboratoryaddress2","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratoryaddress3","req","*required field");
 editfrmvalidator.addValidation("editlaboratoryaddress3","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratorycity","req","*required field");
 editfrmvalidator.addValidation("editlaboratorycity","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratorypostalcode","req","*required field");
 editfrmvalidator.addValidation("editlaboratorypostalcode","num","*numeric only");
 editfrmvalidator.addValidation("editlaboratorypostalcode","maxlen=10","*Text exceeds given character limit");
 
 editfrmvalidator.addValidation("editlaboratoryphone","num","*numeric only");
 editfrmvalidator.addValidation("editlaboratoryphone","maxlen=10","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratorycell","num","*numeric only");
 editfrmvalidator.addValidation("editlaboratorycell","maxlen=10","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editlaboratoryfax","num","*numeric only");
 editfrmvalidator.addValidation("editlaboratoryfax","maxlen=10","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit laboratory ************************ -->
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

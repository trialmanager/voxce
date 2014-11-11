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
<script type="text/javascript" src="../js/countries.js"></script>
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
		defaultexpanded : [ 1 ], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
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
				<!-- ************************ start add country ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'Add Countries')==1}">
					<div class="body_inner" id="add_country_form">
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
									<a href="javascript://">Add Country </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div id="" class="myform library">

								<form id="formAddCountry" name="formAddCountry" method="POST"
									action="addCountry.countries" class="library">

									<span id="AddCountryGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span
										id="AddCountryErrorMessage" class="error_label"
										style="display: none;"></span> <label>Code: </label> <input
										id="addcountrycode" name="addcountrycode" type="text"
										value="${countryAdd.COUNTRY_CODE}" class="input_txt" /> <span
										id="formAddCountry_addcountrycode_errorloc"
										class="error_label"></span> <label>Name :</label> <input
										id="addcountryname" name="addcountryname" type="text"
										value="${countryAdd.COUNTRY_NAME}" class="input_txt" /> <span
										id="formAddCountry_addcountryname_errorloc"
										class="error_label"></span> <label>Description :</label>
									<textarea id="addcountrydescription"
										name="addcountrydescription" cols="" rows="">${countryAdd.DESCRIPTION}</textarea>
									<span id="formAddCountry_addcountrydescription_errorloc"
										class="error_label"></span>


									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type="submit" class="blue-pill">Save</button>
										<button type="reset" class="grey-pill">Clear</button>
									</div>
								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddCountry");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation(
											"addcountrycode", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addcountrycode",
													"alnum_s",
													"*Please enter only alphabets and numbers");
									addfrmvalidator.addValidation(
											"addcountrycode", "maxlen=255",
											"*too long");
									addfrmvalidator.addValidation(
											"addcountryname", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addcountryname",
													"alnum_s",
													"*Please enter only alphabets and numbers");
									addfrmvalidator.addValidation(
											"addcountryname", "maxlen=255",
											"*too long");
									addfrmvalidator.addValidation(
											"addcountrydescription",
											"maxlen=255", "*too long");
								</script>

							</div>
						</div>

					</div>
				</c:if>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add country ************************* -->
				<!-- ------------------------------------------------------------------- -->

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view country ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'View Countries')==1}">
					<div class="body_inner" id="list_countries_form">
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
									<a href="javascript://">View Countries </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Country :</div>
							<div class="field_set">
								<input id="View_Countries_Search_Bar"
									name="View_Countries_Search_Bar" type="text" class="input_txt"
									value="Search..." /> <span class="search_btn"><a
									href="#"><img src="../images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">

									<span id="AddCountryGreenMessage" class="chk_avail_yes"
										style="display: none;"></span> <span
										id="AddCountryErrorMessage" class="error_label"
										style="display: none;"></span>

									<table width="60%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">

										<c:if test="${fn:length(countriesList) > 0}">
											<tr class="rights_header_view_list">
												<td width="15%" align="left" valign="middle">&nbsp;Code</td>
												<td width="25%" align="left" valign="middle">&nbsp;Name</td>
												<td width="51%" align="left" valign="middle">&nbsp;Description</td>
												<c:if
													test="${tl:rightsofView(resourceList,'Edit Countries')==1}">
													<td width="9%" align="center" valign="middle">Edit</td>
												</c:if>
											</tr>

											<tbody id="fbody">
												<c:forEach items="${countriesList}" var="country"
													varStatus="status">

													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list">
															<td valign="top" align="left" class="set_padding">${country.COUNTRY_CODE}</td>
															<td valign="top" align="left" class="set_padding">${country.COUNTRY_NAME}</td>
															<td valign="top" align="left" class="set_padding">${country.DESCRIPTION}</td>
															<c:if
																test="${tl:rightsofView(resourceList,'Edit Countries')==1}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"><img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${country.COUNTRY_ID}','${country.COUNTRY_CODE}','${country.COUNTRY_NAME}','${country.DESCRIPTION}','edit_form','edit_country_form')" /></a></td>
															</c:if>
														</tr>
													</c:if>
													<c:if test="${status.index % 2 != 0}">
														<tr class="grey_row_view_list">
															<td valign="top" align="left" class="set_padding">${country.COUNTRY_CODE}</td>
															<td valign="top" align="left" class="set_padding">${country.COUNTRY_NAME}</td>
															<td valign="top" align="left" class="set_padding">${country.DESCRIPTION}</td>
															<c:if
																test="${tl:rightsofView(resourceList,'Edit Countries')==1}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"><img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${country.COUNTRY_ID}','${country.COUNTRY_CODE}','${country.COUNTRY_NAME}','${country.DESCRIPTION}','edit_form','edit_country_form')" /></a></td>
															</c:if>
														</tr>
													</c:if>

												</c:forEach>
											</tbody>
										</c:if>
									</table>
								</div>
							</div>
							<!-- ------------------------------------------------------------------- -->
						</div>
					</div>
				</c:if>
				<!-- ************************ end view country ************************ -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start edit country ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_country_form">
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
									href="<c:url value='/country/showCountriesIndex.countries?FormCalled=list_countries_form' />">View
									Countries</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Country </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">

							<form id="formEditCountry" name="formEditCountry" method="POST"
								action="editCountry.countries">

								<input type="hidden" id="editcountryid" name="editcountryid"
									value="${countryEdit.COUNTRY_ID}" /> <span
									id="EditCountryGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span
									id="EditCountryErrorMessage" class="error_label"
									style="display: none;"></span> <label>Code: </label> <input
									id="editcountrycode" name="editcountrycode" type="text"
									value="${countryEdit.COUNTRY_CODE}" class="input_txt" /> <span
									id="formEditCountry_editcountrycode_errorloc"
									class="error_label"></span> <label>Name :</label> <input
									id="editcountryname" name="editcountryname" type="text"
									value="${countryEdit.COUNTRY_NAME}" class="input_txt" /> <span
									id="formEditCountry_editcountryname_errorloc"
									class="error_label"></span> <label>Description :</label>
								<textarea id="editcountrydescription"
									name="editcountrydescription" cols="" rows="">${countryEdit.DESCRIPTION}</textarea>
								<span id="formEditCountry_editcountrydescription_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type="submit" class="blue-pill">Save</button>
									<button type="reset" class="grey-pill">Clear</button>
								</div>

							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formEditCountry");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editcountrycode","req","*required field");
 editfrmvalidator.addValidation("editcountrycode","alnum_s","*Please enter only alphabets and numbers");
 editfrmvalidator.addValidation("editcountrycode","maxlen=255","*too long");
 editfrmvalidator.addValidation("editcountryname","req","*required field");
 editfrmvalidator.addValidation("editcountryname","alnum_s","*Please enter only alphabets and numbers");
 editfrmvalidator.addValidation("editcountryname","maxlen=255","*too long");
 editfrmvalidator.addValidation("editcountrydescription","maxlen=255","*too long");
 
</script>

						</div>
					</div>

				</div>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ end edit country ************************ -->
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

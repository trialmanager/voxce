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

<script type="text/javascript" src="../js/inventory.js"></script>

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
				<!-- ************************ start add inventory ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'Add Inventory')==0}">
					<div class="body_inner" id="add_inventory_form" style="display: none;">
						<div class="body_inner_header">
							<!-- ************************Navigation***************************************** -->
							<div class="crumb_left"></div>
							<div class="crumb_mid">
								<div class="crumbs-user">
									<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
								</div>
								<div class="crumbs-link">
									<a
										href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=add_inventory_form' />">Library</a>
								</div>
								<div class="crumbs-link">
									<a href="javascript://">Add Inventory </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">

							<div id="" class="myform library">

								<form id="formAddInventory" name="formAddInventory" method="POST"
									action="addInventory.inventory" class="library">

									<span id="AddInventoryGreenMessage" class="chk_avail_yes"
										style="display: none;"> Success</span> <span
										id="AddInventoryErrorMessage" class="error_label"
										style="display: none;">Error</span> 
									<label>Code :</label>
									<input id="addinventorycode" name="addinventorycode" type="text"
										value="${inventoryAdd.code}" class="input_txt" /> <span
										id="formAddInventory_addinventorycode_errorloc" class="error_label"></span>

									<label>Name :</label> <input id="addinventoryname"
										name="addinventoryname" type="text" value="${inventoryAdd.name}"
										class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
									<div
										style="clear: both; float: left; margin-bottom: 8px; padding-bottom: 5px; width: 540px;">
										<label>Type :</label><br /> <input type="radio"
											name="addinventorytype" value="Object" checked /> <span
											class="txt_norm">Object</span> 
											<input type="radio"
											name="addinventorytype" value="Container" /> <span class="txt_norm">Container</span>
									</div>
										
									<label>Mass :</label> 
									<input id="addinventorymass" name="addinventorymass" type="text" 
										value="${inventoryAdd.mass}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"> 
										<select
										id="addinventorymassunit" name="addinventorymassunit"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Unit]</option>
											<option id="pg"
												value="pg" onclick="">pg
												</option>
											<option id="ng"
												value="ng" onclick="">ng
												</option>
											<option id="ug"
												value="ug" onclick="">ug
												</option>
											<option id="mg"
												value="mg" onclick="">mg
												</option>
											<option id="g"
												value="g" onclick="">g
												</option>
											<option id="kg"
												value="kg" onclick="">kg
												</option>
											
									</select> 
									</span>
										
									<label>Volume :</label> 
									<input id="addinventoryvolume" name="addinventoryvolume" type="text" 
										value="${inventoryAdd.volume}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label">
										
										<select
										id="addinventoryvolumeu" name="addinventoryvolumeu"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Unit]</option>
											<option id="ul"
												value="ul" onclick="">ul
												</option>
											<option id="ml"
												value="ml" onclick="">ml
												</option>
											<option id="l"
												value="l" onclick="">l
												</option>
										</select> 
									</span>
										
									<label>Concentration :</label> 
									<input id="addinventoryconcentration" name="addinventoryconcentration" type="text" 
										value="${inventoryAdd.concentration}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label">
										
										<select
										id="addinventoryconcentrationu" name="addinventoryconcentrationu"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Unit]</option>
											<option id="nM"
												value="nM" onclick="">nM
												</option>
											<option id="uM"
												value="uM" onclick="">uM
												</option>
											<option id="mM"
												value="mM" onclick="">mM
												</option>
											<option id="M"
												value="M" onclick="">M
												</option>
											<option id="%(v/v)"
												value="%(v/v)" onclick="">%(v/v)
												</option>
											<option id="%(w/v)"
												value="%(w/v)" onclick="">%(w/v)
												</option>
											<option id="ng/ul"
												value="ng/ul" onclick="">ng/ul
												</option>
											<option id="ug/ul"
												value="ug/ul" onclick="">ug/ul
												</option>
											<option id="mg/ml"
												value="mg/ml" onclick="">mg/ml
												</option>
											<option id="g/ml"
												value="g/ml" onclick="">g/ml
												</option>
											<option id="CFU/ml"
												value="CFU/ml" onclick="">CFU/ml
												</option>
											<option id="PFU/ml"
												value="PFU/ml" onclick="">PFU/ml
												</option>
											<option id="FFU/ml"
												value="FFU/ml" onclick="">FFU/ml
												</option>
											<option id="units/ml"
												value="unit/ml" onclick="">units/ml
												</option>
										</select> 
										</span>
																				
									<label>Storage Temp :</label> 
									<input id="addinventorytemp" name="addinventorytemp" type="text" 
										value="${inventoryAdd.temp}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									 <label>Condition :</label> <select
										id="addinventorycondition" name="addinventorycondition"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Condition]</option>
											<option id="Acceptable"
												value="Acceptable" onclick="">Acceptable
												</option>
											<option id="InssuficientAmount"
												value="Inssuficient Amount" onclick="">Inssuficient Amount
												</option>
											<option id="Contaminated"
												value="Contaminated" onclick="">Contaminated
												</option>
											<option id="Damaged"
												value="Damaged" onclick="">Damaged
												</option>
									</select> 
									
									<label>Status :</label> 
									<select
										id="addinventorystatus" name="addinventorystatus"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Status]</option>
											<option id="Pending"
												value="Pending" onclick="">Pending
												</option>
											<option id="Stored"
												value="Stored" onclick="">Stored
												</option>
											<option id="ToBeShipped"
												value="To Be Shipped" onclick="">To Be Shipped
												</option>
											<option id="InTransit"
												value="In Transit" onclick="">In Transit
												</option>
											<option id="Stored"
												value="Stored" onclick="">Stored
												</option>
											<option id="ToBeShipped"
												value="To Be Shipped" onclick="">To Be Shipped
												</option>
											<option id="ShippedOut"
												value="Shipped Out" onclick="">Shipped Out
												</option>
											<option id="Missing"
												value="Missing" onclick="">Missing
												</option>
											<option id="Discarded"
												value="Discarded" onclick="">Discarded
												</option>
											<option id="Consumed"
												value="Consumed" onclick="">Consumed
												</option>
									</select> 
										
									<label>Category :</label> 
									<select
										id="addinventorycategory" name="addinventorycategory"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Category]</option>
											<option id="Reagent"
												value="Reagent" onclick="">Reagent
											</option>
											<option id="Drug"
												value="Drug" onclick="">Drug
												</option>
											<option id="Device"
												value="Device" onclick="">Device
												</option>
											<option id="CellProduct"
												value="Cell Product" onclick="">Cell Product
												</option>
											<option id="Biologic"
												value="Biologic" onclick="">Biologic
												</option>
									</select> 
									<label>Origin :</label> 
									<input id="addinventoryorigin" name="addinventoryorigin" type="text" 
										value="${inventoryAdd.origin}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Category Number :</label> 
									<input id="addinventorycategorynumber" name="addinventorycategorynumber" type="text" 
										value="${inventoryAdd.categorynumber}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Lot Number :</label> 
									<input id="addinventorylotnumber" name="addinventorylotnumber" type="text" 
										value="${inventoryAdd.lotnumber}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Serial Number :</label> 
									<input id="addinventoryserialnumber" name="addinventoryserialnumber" type="text" 
										value="${inventoryAdd.serialnumber}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Issue Date :</label> 
									<input id="addinventoryissuedate" name="addinventoryissuedate" type="text" 
										value="${inventoryAdd.issuedate}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Expiration Date :</label> 
									<input id="addinventoryexpirationdate" name="addinventoryexpirationdate" type="text" 
										value="${inventoryAdd.expirationdate}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Good Until Date :</label> 
									<input id="addinventorygooduntildate" name="addinventorygooduntildate" type="text" 
										value="${inventoryAdd.gooduntildate}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Batch Number :</label> 
									<input id="addinventorybatchnumber" name="addinventorybatchnumber" type="text" 
										value="${inventoryAdd.batchnumber}" class="input_txt" /> <span
										id="formAddInventory_addinventoryname_errorloc" class="error_label"></span>
										
									<label>Hazard </label> 
									<select
										id="addinventoryhazard" name="addinventoryhazard"
										class="drop_txt">
										<option id="000" value="000" selected>[Select
											Status]</option>
											<option id="Health"
												value="Health" onclick="">Health
												</option>
											<option id="Flammable"
												value="Flammable" onclick="">Flammable
												</option>
											<option id="Reactive"
												value="Reactive" onclick="">Reactive
												</option>
											<option id="Oxidizer"
												value="Oxidizer" onclick="">Oxidizer
												</option>
											<option id="WaterReactive"
												value="Water Reactive" onclick="">Water Reactive
												</option>
											<option id="AsphyxiantGas"
												value="Asphyxiant Gas" onclick="">Asphyxiant Gas
												</option>
											<option id="Corrosive"
												value="Corrosive" onclick="">Corrosive
												</option>
											<option id="Poisonous"
												value="Poisonous" onclick="">Poisonous
												</option>
											<option id="Radioactive"
												value="Radioactive" onclick="">Radioactive
												</option>
											<option id="Cryogenic"
												value="Cryogenic" onclick="">Cryogenic
												</option>
											<option id="None"
												value="None" onclick="">None
												</option>
									</select> 
									<!-- style="clear:both;  float:left; margin-bottom:8px; padding-bottom:5px; width:540px;" -->

									
									<br /> <label>Part Number :</label> <input id="addpartno"
										name="addpartno" type="text" value="${inventoryAdd.partno}"
										class="input_txt" /> <span
										id="formAddInventory_addpartno_errorloc" class="error_label"></span>

									
									<div class="spacer"></div>
									<div style="clear: both; padding-left: 135px;">
										<button type=submit class="blue-pill">Save</button>
										<button type=reset class="grey-pill">Clear</button>
									</div>
								</form>

								<script type="text/javascript" language="JavaScript">
									var addfrmvalidator = new Validator(
											"formAddInventory");
									addfrmvalidator.EnableOnPageErrorDisplay();
									addfrmvalidator.EnableMsgsTogether();

									addfrmvalidator.addValidation(
											"addinventorycode", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addinventorycode",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addinventorycode",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addinventoryname", "req",
											"*required field");
									addfrmvalidator
											.addValidation("addinventoryname",
													"regexp=[0-9a-zA-Z_]",
													"*Please enter only alphabets, numbers, space and _");
									addfrmvalidator
											.addValidation("addinventoryname",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addinventorytype", "selone",
											"*select one");
									addfrmvalidator
											.addValidation("addinventorydose",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator.addValidation(
											"addinventoryrefillable", "selone",
											"*select one");
									addfrmvalidator.addValidation(
											"addinventorynormalvalue", "req",
											"*required field");
									addfrmvalidator.addValidation(
											"addinventorypernormalvalue", "req",
											"*required field");
									addfrmvalidator.addValidation(
											"addinventorynormalvalue", "num",
											"*numeric only");
									addfrmvalidator.addValidation(
											"addinventorypernormalvalue", "num",
											"*numeric only");
									addfrmvalidator.addValidation(
											"addinventorynormalvalue", "maxlen=10",
											"*Enter small number");
									addfrmvalidator.addValidation(
											"addinventorypernormalvalue",
											"maxlen=10", "*Enter small number");
									addfrmvalidator
											.addValidation(
													"addinventorydescription",
													"maxlen=255",
													"*Text exceeds given character limit");
									addfrmvalidator
											.addValidation(
													"addinventoryinstructions",
													"maxlen=255",
													"*Text exceeds given character limit");
								</script>

							</div>
						</div>

					</div>
				</c:if>
				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end add inventory ************************* -->
				<!-- ------------------------------------------------------------------- -->


				<!-- ------------------------------------------------------------------- -->
				<!-- ************************ start view inventory ************************ -->
				<!-- ------------------------------------------------------------------- -->
				<c:if test="${tl:rightsofView(resourceList,'View Inventory')==0}">
					<div class="body_inner" id="list_inventory_form">
						<div class="body_inner_header">
							<!-- ************************Navigation***************************************** -->
							<div class="crumb_left"></div>
							<div class="crumb_mid">
								<div class="crumbs-user">
									<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
								</div>
								<div class="crumbs-link">
									<a
										href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=add_inventory_form' />">Library</a>
								</div>
								<div class="crumbs-link">
									<a href="javascript://">View Inventory </a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">
							<div class="field_label_view_list">Search Inventory Name :</div>
							<div class="field_set">
								<input id="View_Inventory_Search_Bar" name="View_Inventory_Search_Bar"
									type="text" class="input_txt" value="Search..." /> <span
									class="search_btn"><a href="#"><img
										onclick="searchInventory()" src="../images/search.png" alt="search"
										title="search" border="0" /></a></span>
							</div>
							<div class="show_hide_form">
								<div class="field_txt_view_list">
									<span id="AddInventoryGreenMessage" class="chk_avail_yes"
										style="display: none;"> Success</span> <span
										id="AddInventoryErrorMessage" class="error_label"
										style="display: none;">Error</span>
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										class="table_border_view_list">

										<tr class="rights_header_view_list">
											<td width="10%" align="left" valign="middle">&nbsp;
												Part No</td>
											<td width="10%" align="left" valign="middle">&nbsp;
												Name</td>
											<td width="10%" align="left" valign="middle">&nbsp;
												Type</td>
											<td width="10%" align="left" valign="middle">&nbsp;
												Status</td>
											<td width="10%" align="left" valign="middle">&nbsp;Lot
												Number</td>
											<td width="10%" align="left" valign="middle">&nbsp;Serial 
												Number</td>
												<td width="10%" align="left" valign="middle">&nbsp;Issue Date
												</td>
											<td width="10%" align="left" valign="middle">&nbsp;Expiration Date 
												</td>
											<c:if test="${tl:rightsofView(resourceList,'Edit Inventory')==0}">
												<td width="4%" align="center" valign="middle">Edit</td>
											</c:if>
										</tr>

										<c:if test="${fn:length(inventoryList) > 0}">

											<tbody id="fbody">

												<c:forEach items="${inventoryList}" var="aInventory"
													varStatus="status">
													<c:if test="${status.index % 2 == 0}">
														<tr class="white_row_view_list">
															<td valign="top" align="left" class="set_padding">${aInventory.partno}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.name}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.objecttype}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.status}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.lotnbr}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.serialnbr}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.issuedate}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.expirationdate}</td>
															<c:if
																test="${tl:rightsofView(resourceList,'Edit Inventory')==0}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"> <img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${aInventory.inventory_id}','${aInventory.code}','${aInventory.name}','${aInventory.type}','${aInventory.dose}','${aInventory.normal_value}','${aInventory.per_normal_value}','${aInventory.refillable}','${aInventory.description}','${aInventory.instructions}','edit_form','edit_inventory_form')" /></a></td>
															</c:if>
														</tr>
													</c:if>

													<c:if test="${status.index % 2 != 0}">
														<tr class="grey_row_view_list">
															<td valign="top" align="left" class="set_padding">${aInventory.code}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.name}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.type}</td>
															<td valign="top" align="left" class="set_padding">${aInventory.dose}</td>
															<td valign="top" align="center" class="set_padding">${aInventory.normal_value}/${aInventory.per_normal_value}</td>
															<c:set var="refill" value="0"></c:set>

															<c:choose>
																<c:when test="${aInventory.refillable == refill}">
																	<td valign="top" align="center" class="set_padding">No</td>
																</c:when>
																<c:otherwise>
																	<td valign="top" align="center" class="set_padding">Yes</td>
																</c:otherwise>
															</c:choose>

															<c:if
																test="${tl:rightsofView(resourceList,'Edit Inventory')==1}">
																<td valign="top" align="center" class="set_padding2"><a
																	href="#"> <img src="../images/edit.png" alt="Edit"
																		title="Edit" border="0"
																		onclick="passEditValues('${aInventory.drug_id}','${aInventory.code}','${aInventory.name}',
		    																'${aInventory.type}','${aInventory.dose}','${aInventory.normal_value}','${aInventory.per_normal_value}',
		    																'${aInventory.refillable}','${aInventory.description}','${aInventory.instructions}','edit_form','edit_inventory_form')" /></a></td>
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
				<!-- ************************ start edit inventory ************************ -->
				<!-- ------------------------------------------------------------------- -->

				<div class="body_inner" id="edit_inventory_form" style="display: none">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='../ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=add_inventory_form' />">Library</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='/inventory/showInventoryIndex.inventory?FormCalled=list_inventory_form' />">View
									Inventory</a>
							</div>
							<div class="crumbs-link">
								<a href="javascript://">Edit Inventory </a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform library">
							<form id="formEditInventory" name="formEditInventory" method="POST"
								action="editInventory.inventory" class="library">

								<input type="hidden" id="editinventoryid" name="editinventoryid"
									value="${inventoryEdit.inventory_id }" /> <span
									id="editinventoryGreenMessage" class="chk_avail_yes"
									style="display: none;"></span> <span id="editinventoryErrorMessage"
									class="error_label" style="display: none;"></span> <label>
									Code :</label> <input id="editinventorycode" name="editinventorycode" type="text"
									value="${inventoryEdit.code}" class="input_txt" /> <span
									id="formeditinventory_editinventorycode_errorloc" class="error_label"></span>

								<label> Name :</label> <input id="editinventoryname"
									name="editinventoryname" type="text" value="${inventoryEdit.name}"
									class="input_txt" /> <span
									id="formeditinventory_editinventoryname_errorloc" class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px; width: 540px; float: left">
									<label> Type :</label><br /> <input type="radio"
										name="editinventorytype" value="Capsule" /> <span class="txt_norm">Capsule</span>
									<input type="radio" name="editinventorytype" value="Tablet" /> <span
										class="txt_norm">Tablets</span> <input type="radio"
										name="editinventorytype" value="Syrup" /> <span class="txt_norm">Syrup</span>
									<input type="radio" name="editinventorytype" value="Solution" /> <span
										class="txt_norm">Solution</span> <input type="radio"
										name="editinventorytype" value="Suppositories" /> <span
										class="txt_norm">Suppositories</span>
								</div>
								<span id="formeditinventory_editinventorytype_errorloc"
									class="error_label"></span> <label>Enter Dose :</label> <input
									id="editinventorydose" name="editinventorydose" type="text"
									value="${inventoryEdit.dose}" class="input_txt" /> <span
									id="formeditinventory_editinventorydose_errorloc" class="error_label"></span>

								<label>Dose Normal Values :</label> <input
									id="editinventorynormalvalue" name="editinventorynormalvalue" type="text"
									value="${inventoryEdit.normal_value}" class="small" /> <span
									class="txt_normal">/</span> <input id="editinventorypernormalvalue"
									name="editinventorypernormalvalue" type="text"
									value="${inventoryEdit.per_normal_value}" class="small" /> <br>

								<span id="formeditinventory_editinventorynormalvalue_errorloc"
									class="error_label"></span> <span
									id="formeditinventory_editinventorypernormalvalue_errorloc"
									class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px; padding-bottom: 5px; width: 540px;">
									<label>Refillable :</label><br /> <input type="radio"
										name="editinventoryrefillable" value="true" /> <span
										class="txt_norm">Yes</span> <input type="radio"
										name="editinventoryrefillable" value="false" /> <span
										class="txt_norm">No</span>
								</div>
								<span id="formeditinventory_editinventoryrefillable_errorloc"
									class="error_label"></span> <label>Description :</label>
								<textarea id="editinventorydescription" name="editinventorydescription"
									cols="" rows="">${inventoryEdit.description}</textarea>
								<span id="formeditinventory_editinventorydescription_errorloc"
									class="error_label"></span> <label>Instructions :</label>
								<textarea id="editinventoryinstructions" name="editinventoryinstructions"
									cols="" rows="">${inventoryEdit.instructions}</textarea>
								<span id="formeditinventory_editinventoryinstructions_errorloc"
									class="error_label"></span>

								<div class="spacer"></div>
								<div style="clear: both; padding-left: 135px;">
									<button type=submit class="blue-pill">Save</button>
									<button type=reset class="grey-pill">Clear</button>
								</div>
							</form>

							<script type="text/javascript" language="JavaScript">
 var editfrmvalidator  = new Validator("formeditinventory");
 editfrmvalidator.EnableOnPageErrorDisplay();
 editfrmvalidator.EnableMsgsTogether();
 
 editfrmvalidator.addValidation("editinventorycode","req","*required field");
 editfrmvalidator.addValidation("editinventorycode","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editinventorycode","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editinventoryname","req","*required field");
 editfrmvalidator.addValidation("editinventoryname","regexp=[0-9a-zA-Z_]", "*Please enter only alphabets, numbers, space and _");
 editfrmvalidator.addValidation("editinventoryname","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editinventorytype","selone","*select one");
 editfrmvalidator.addValidation("editinventorydose","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editinventoryrefillable","selone","*select one");
 editfrmvalidator.addValidation("editinventorynormalvalue","req","*required field");
 editfrmvalidator.addValidation("editinventorypernormalvalue","req","*required field");
 editfrmvalidator.addValidation("editinventorynormalvalue","num","*numeric only");
 editfrmvalidator.addValidation("editinventorypernormalvalue","num","*numeric only");
 editfrmvalidator.addValidation("editinventorynormalvalue","maxlen=10","*Enter small number");
 editfrmvalidator.addValidation("editinventorypernormalvalue","maxlen=10","*Enter small number");
 editfrmvalidator.addValidation("editinventorydescription","maxlen=255","*Text exceeds given character limit");
 editfrmvalidator.addValidation("editinventoryinstructions","maxlen=255","*Text exceeds given character limit");
 
</script>

						</div>
					</div>

				</div>

				<!-- ------------------------------------------------------------------- -->
				<!-- ************************* end edit inventory ************************* -->
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

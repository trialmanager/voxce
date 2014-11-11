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

<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/groups.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript">
	
</script>
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/groupsjquery.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">
	<input type="hidden" name="PreSelectedGroup" id="PreSelectedGroup"
		value="${CurrentGroup}">

	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">

				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<c:if test="${tl:rightsofView(resourceList,'Create Group')==1}">
							<a href="#" class="nav_l" name="hrefcreate_groupForm"
								onClick="ChangeGroupForm('create_groupForm')">Create Group</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'Edit Group')==1}">
							<a href="#" class="nav_l" name="hrefedit_groupForm"
								onClick="ChangeGroupForm('edit_groupForm')">Edit Group</a>
						</c:if>
						<a href="#" class="nav_l" name="hrefGroupRights_groupForm"
							onClick="ChangeGroupForm('GroupRights_groupForm')">Set Group
							Rights</a>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>

			</div>
			<!-- left navigation ends here -->
			<c:set var="zero" value="0"></c:set>
			<c:set var="one" value="1"></c:set>
			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<!-- --------------------------------- Start Create Group------------------------------------------------------ -->
				<!-- --------------------------------- Start Create Group------------------------------------------------------ -->
				<c:if test="${tl:rightsofView(resourceList,'Create Group')==1}">

					<div class="body_inner" id="create_groupForm"
						style="display: none;">
						<div class="body_inner_header">
							<!-- ************************Navigation***************************************** -->
							<div class="crumb_left"></div>
							<div class="crumb_mid">
								<div class="crumbs-user">
									<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
								</div>
								<div class="crumbs-link">
									<a href="<c:url value='showGroupsindex.groups' />">Group
										Management</a>
								</div>
								<div class="crumbs-link">
									<a href="#">Create Group</a>
								</div>
							</div>
							<div class="crumb_right"></div>
							<!-- ************************Navigation******************************* -->
						</div>
						<div class="create_group_container">

							<div id="creategroup" class="myform user">

								<span id="Add_Site_Main_Error" class="error_label_grp"
									style="display: none;">${AddGroupMessageU}</span> <span
									id="Add_Site_Main_Success" class="chk_avail_yes"
									style="display: none;">${AddGroupMessageS}</span>

								<form name="Create_Group_Form" id="Create_Group_Form"
									method="post" action="savegroup.groups">


									<label>Group Name:</label> <input maxlength="99"
										name="Group_Name" id="Group_Name" class="input_txt" /> <span
										id="Name_Error" class="error_label_grp" style="display: none;">Group
										Name can not be empty.</span> <label>Description:</label>
									<textarea name="Group_Description" id="Group_Description"
										cols="" rows=""
										onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)"></textarea>

									<div class="spacer"></div>

									<div class="spacer"></div>
									<div style="clear: both; margin-top: 20px;">
										<button class="blue-pill" type="sumbit">Save</button>
										<button type="reset" class="grey-pill">Reset</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</c:if>
				<!-- --------------------------------- End Create Group------------------------------------------------------ -->
				<!-- --------------------------------- End Create Group------------------------------------------------------ -->




				<!-- --------------------------------- Start Edit Group------------------------------------------------------ -->
				<!-- --------------------------------- Start Edit Group------------------------------------------------------ -->
				<c:if test="${tl:rightsofView(resourceList,'Edit Group')==1}">
					<c:choose>
						<c:when test="${tl:rightsofView(resourceList,'Create Group')==0}">
							<div class="body_inner" id="edit_groupForm"
								style="display: block;">
						</c:when>
						<c:otherwise>
							<div class="body_inner" id="edit_groupForm"
								style="display: none;">
						</c:otherwise>
					</c:choose>

					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='showGroupsindex.groups' />">Group
									Management</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Edit Group</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div id="creategroup" class="myform user">

							<form id="edit_group_form" name="edit_group_form" method="post"
								action="editgroup.groups">

								<span id="Edit_Groups_Submission_Error" class="error_label_grp"
									style="display: none;">${MessageE}</span> <span
									id="Edit_Groups_Submission_Success" class="chk_avail_yes"
									style="display: none;">${MessageS}</span> <label>Select
									Group Name :</label> <select name="Groups_Edit_Select_tag"
									id="Groups_Edit_Select_tag" class="drop_txt"
									onchange="Groups_Edit_Select_tag_selection()">
									<c:forEach items="${GroupList}" var="role" varStatus="status">
										<option id="${role.name}@1@1@1${role.description}"
											value="${role.id}">${role.name}</option>
									</c:forEach>
								</select>

								<div id="edit_groupForm_fields_div" style="margin-top: 25px;">

									<label>Group Name :</label> <input maxlength="99"
										name="Edit_Groups_Group_Name" id="Edit_Groups_Group_Name"
										type="text" class="input_txt" value="${groupObj.name}" /> <span
										id="Edit_Groups_Group_Name_Error" class="error_label_grp"
										style="display: none;">Group Name can not be empty.</span> <label>Description:</label>
									<textarea name="Edit_Groups_Group_Description"
										id="Edit_Groups_Group_Description" cols="" rows=""
										onkeyup="if (this.value.length > 2000)this.value = this.value.substring(0, 2000)">${groupObj.description}</textarea>
									<span class="error_label_grp"></span>

									<div class="spacer"></div>
									<button type="submit" class="blue-pill"
										onClick="Set_Hidden_Field_For_Add_Update('Updated')">Save</button>
									<input type="button" class="grey-pill"
										onClick="Set_Hidden_Field_For_Add_Update('Deleted')" value="Reset" />

									<input name="Groups_Hidden_Field_For_Add_Update"
										id="Groups_Hidden_Field_For_Add_Update" type="hidden"
										class="input_txt" />
								</div>
							</form>
						</div>

					</div>
			</div>
			</c:if>

			<!-- --------------------------------- End Edit Group------------------------------------------------------ -->
			<!-- --------------------------------- End Edit Group------------------------------------------------------ -->


			<!-- --------------------------------- Start Permission Group------------------------------------------------------ -->
			<!-- --------------------------------- Start Permission Group------------------------------------------------------ -->


			<div class="body_inner" id="GroupRights_groupForm"
				style="display: none;">
				<div class="body_inner_header">
					<!-- ************************Navigation***************************************** -->
					<div class="crumb_left"></div>
					<div class="crumb_mid">
						<div class="crumbs-user">
							<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
						</div>
						<div class="crumbs-link">
							<a href="<c:url value='showGroupsindex.groups' />">Group
								Management</a>
						</div>
						<div class="crumbs-link">
							<a href="#">Group Rights</a>
						</div>
					</div>
					<div class="crumb_right"></div>
					<!-- ************************Navigation******************************* -->
				</div>
				<div class="create_group_container">

					<form id="GroupRightform" name="GroupRightform" method="post"
						action="SaveGroupRights.groups" class="user">
						<div class="field_label_view_list">Select Group Name :</div>
						<input type="hidden" id="rights" name="rights" length="1000"
							val="" />


						<div class="field_set">

							<select name="GroupSelection" id="GroupSelection"
								class="drop_txt">
								<c:forEach items="${GroupList}" var="role" varStatus="status">
									<option id="${role.id}" value="${role.id}"
										onclick="GetRights()">${role.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="show_hide_form">
							<span id="RightsError" class="error_label_grp"
								style="display: none;">${Error}</span> <span id="RightsSuccess"
								class="chk_avail_yes" style="display: none;">${Success}</span>
							<div class="field_txt_view_list">
								<table width="700" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="347" align="left" valign="middle">&nbsp;&nbsp;Resources</td>
										<td width="81" align="center" valign="middle">View</td>
										<td width="88" align="center" valign="middle"
											style="display: none">Update</td>
										<td width="85" align="center" valign="middle"
											style="display: none">Insert</td>
										<td width="91" align="center" valign="middle"
											style="display: none">Delete</td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="left" class="set_padding">&nbsp;&nbsp;&nbsp;<span
											style="color: maroon;">Select All</span></td>
										<td valign="middle" align="center"><input id="U1"
											name="U1" type="checkbox"
											class="all-values view-all view-all-select" value="" /></td>
										<td valign="middle" align="center"><input id="U2"
											name="U2" type="checkbox"
											class="all-values update-all all update-all-select" value=""
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U3"
											name="U3" type="checkbox"
											class="all-values insert-all all insert-all-select" value=""
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U4"
											name="U4" type="checkbox"
											class="all-values delete-all all delete-all-select" value=""
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="center" class="set_padding"
											colspan="5"><span class="left_l1">Home</span></td>
									</tr>

									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">STUDY</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Study List</span></td>
										<td valign="middle" align="center"><input id="U5"
											name="U5" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Study List')}" /></td>
										<td valign="middle" align="center"><input id="U6"
											name="U6" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Study List')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U7"
											name="U7" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Study List')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U8"
											name="U8" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Study List')}"
											style="display: none" /></td>

									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="left" class="set_padding"><span
											class="left_l2">Create Study</span></td>
										<td valign="middle" align="center"><input id="U9"
											name="U9" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create Study')}" /></td>
										<td valign="middle" align="center"><input id="U10"
											name="U10" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U11"
											name="U11" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U12"
											name="U12" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Study')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="left" class="set_padding"><span
											class="left_l2">View Study</span></td>
										<td valign="middle" align="center"><input id="U17"
											name="U17" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Study')}" /></td>
										<td valign="middle" align="center"><input id="U18"
											name="U18" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U19"
											name="U19" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U20"
											name="U20" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list" style="display: none;">
										<td valign="middle" align="left" class="set_padding"><span
											class="left_l2">Edit Study</span></td>
										<td valign="middle" align="center"><input id="U21"
											name="U21" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U22"
											name="U22" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U23"
											name="U23" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U24"
											name="U24" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l3">View Study Sites</span></td>
										<td valign="middle" align="center"><input id="U25"
											name="U25" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Study Sites')}" /></td>
										<td valign="middle" align="center"><input id="U26"
											name="U26" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U27"
											name="U27" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U28"
											name="U28" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>

									</tr>

									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Enrollment Schedule</span></td>
										<td valign="middle" align="center"><input id="U29"
											name="U29" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Enrollment Schedule')}" /></td>
										<td valign="middle" align="center"><input id="U30"
											name="U30" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Enrollment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U31"
											name="U31" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Enrollment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U32"
											name="U32" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Enrollment Schedule')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Detail</span></td>
										<td valign="middle" align="center"><input id="U33"
											name="U33" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Detail')}" /></td>
										<td valign="middle" align="center"><input id="U34"
											name="U34" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Detail')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U35"
											name="U35" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Detail')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U36"
											name="U36" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Detail')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Investigators</span></td>
										<td valign="middle" align="center"><input id="U37"
											name="U37" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Investigators')}" /></td>
										<td valign="middle" align="center"><input id="U38"
											name="U38" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Investigators')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U39"
											name="U39" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Investigators')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U40"
											name="U40" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Investigators')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Users</span></td>
										<td valign="middle" align="center"><input id="U41"
											name="U41" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Users')}" /></td>
										<td valign="middle" align="center"><input id="U42"
											name="U42" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U43"
											name="U43" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U44"
											name="U44" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Users')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Laboratory</span></td>
										<td valign="middle" align="center"><input id="U45"
											name="U45" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Laboratory')}" /></td>
										<td valign="middle" align="center"><input id="U46"
											name="U46" type="checkbox"
											class="all-values update-all User all hierarchy"
											value="${tl:rightsofView(grlist,'View Study Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U47"
											name="U47" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U48"
											name="U48" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Laboratory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Site Details</span></td>
										<td valign="middle" align="center"><input id="U49"
											name="U49" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Site Details')}" /></td>
										<td valign="middle" align="center"><input id="U50"
											name="U50" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Site Details')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U51"
											name="U51" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Site Details')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U52"
											name="U52" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Site Details')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Document</span></td>
										<td valign="middle" align="center"><input id="U53"
											name="U53" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Document')}" /></td>
										<td valign="middle" align="center"><input id="U54"
											name="U54" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U55"
											name="U55" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U56"
											name="U56" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Document')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Document</span></td>
										<td valign="middle" align="center"><input id="U57"
											name="U57" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Document')}" /></td>
										<td valign="middle" align="center"><input id="U58"
											name="U58" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U59"
											name="U59" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U60"
											name="U60" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Document')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Document</span></td>
										<td valign="middle" align="center"><input id="U61"
											name="U61" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Delete Document')}" /></td>
										<td valign="middle" align="center"><input id="U62"
											name="U62" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U63"
											name="U63" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Document')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U64"
											name="U64" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Document')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Site Investigators</span></td>
										<td valign="middle" align="center"><input id="U65"
											name="U65" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Site Investigators')}" /></td>
										<td valign="middle" align="center"><input id="U66"
											name="U66" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Investigators')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U67"
											name="U67" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Investigators')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U68"
											name="U68" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Investigators')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Site Users</span></td>
										<td valign="middle" align="center"><input id="U69"
											name="U69" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Site Users')}" /></td>
										<td valign="middle" align="center"><input id="U70"
											name="U70" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U71"
											name="U71" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U72"
											name="U72" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Site Laboratories</span></td>
										<td valign="middle" align="center"><input id="U73"
											name="U73" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Study Site Laboratories')}" /></td>
										<td valign="middle" align="center"><input id="U74"
											name="U74" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Laboratories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U75"
											name="U75" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Laboratories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U76"
											name="U76" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Laboratories')}"
											style="display: none" style="display:none" /></td>
									</tr>

									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Discripency in Study</span></td>
										<td valign="middle" align="center"><input id="U77"
											name="U77" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Discripency in Study')}" /></td>
										<td valign="middle" align="center"><input id="U78"
											name="U78" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Discripency in Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U79"
											name="U79" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Discripency in Study')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U80"
											name="U80" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Discripency in Study')}"
											style="display: none" /></td>
									</tr>

									<tr class="grey_row_view_list">
										<td valign="middle" align="left" colspan="5"
											class="set_padding"><span class="left_l1">Payment</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Payments</span></td>
										<td valign="middle" align="center"><input id="U81"
											name="U81" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Payments')}" /></td>
										<td valign="middle" align="center"><input id="U82"
											name="U82" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U83"
											name="U83" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U84"
											name="U84" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Payments')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Payments</span></td>
										<td valign="middle" align="center"><input id="U85"
											name="U85" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Payments')}" /></td>
										<td valign="middle" align="center"><input id="U86"
											name="U86" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U87"
											name="U87" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U88"
											name="U88" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Payments')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Payments</span></td>
										<td valign="middle" align="center"><input id="U89"
											name="U89" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Add Payments')}" /></td>
										<td valign="middle" align="center"><input id="U90"
											name="U90" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U91"
											name="U91" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Payments')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U92"
											name="U92" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Payments')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Study Payment</span></td>
										<td valign="middle" align="center"><input id="U93"
											name="U93" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Study Payment')}" /></td>
										<td valign="middle" align="center"><input id="U94"
											name="U94" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Study Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U95"
											name="U95" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Study Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U96"
											name="U96" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Study Payment')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Site Payment</span></td>
										<td valign="middle" align="center"><input id="U97"
											name="U97" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Site Payment')}" /></td>
										<td valign="middle" align="center"><input id="U98"
											name="U98" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Site Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U99"
											name="U99" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Site Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U100"
											name="U100" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Site Payment')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Visit CRF Payment</span></td>
										<td valign="middle" align="center"><input id="U101"
											name="U101" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Visit CRF Payment')}" /></td>
										<td valign="middle" align="center"><input id="U102"
											name="U102" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Visit CRF Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U103"
											name="U103" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Visit CRF Payment')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U104"
											name="U104" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Visit CRF Payment')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Payment Code</span></td>
										<td valign="middle" align="center"><input id="U105"
											name="U105" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Payment Code')}" /></td>
										<td valign="middle" align="center"><input id="U106"
											name="U106" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U107"
											name="U107" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U108"
											name="U108" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Payment Code')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Payment Code</span></td>
										<td valign="middle" align="center"><input id="U109"
											name="U109" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Payment Code')}" /></td>
										<td valign="middle" align="center"><input id="U110"
											name="U110" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U111"
											name="U111" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U112"
											name="U112" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Code')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Payment Code</span></td>
										<td valign="middle" align="center"><input id="U113"
											name="U113" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Payment Code')}" /></td>
										<td valign="middle" align="center"><input id="U114"
											name="U114" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U115"
											name="U115" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Code')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U116"
											name="U116" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Code')}"
											style="display: none" /></td>
									</tr>

									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Payment Schedule</span></td>
										<td valign="middle" align="center"><input id="U117"
											name="U117" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Payment Schedule')}" /></td>
										<td valign="middle" align="center"><input id="U118"
											name="U118" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U119"
											name="U119" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U120"
											name="U120" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Payment Schedule')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Payment Schedule</span></td>
										<td valign="middle" align="center"><input id="U121"
											name="U121" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Payment Schedule')}" /></td>
										<td valign="middle" align="center"><input id="U122"
											name="U122" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U123"
											name="U123" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U124"
											name="U124" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Payment Schedule')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Payment Schedule</span></td>
										<td valign="middle" align="center"><input id="U125"
											name="U125" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Payment Schedule')}" /></td>
										<td valign="middle" align="center"><input id="U126"
											name="U126" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U127"
											name="U127" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Schedule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U128"
											name="U128" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Payment Schedule')}"
											style="display: none" /></td>
									</tr>

									<tr class="grey_row_view_list">
										<td valign="middle" align="left" colspan="5"
											class="set_padding"><span class="left_l1">Trail
												Managment</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Approval Status Type</span></td>
										<td valign="middle" align="center"><input id="U129"
											name="U129" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Approval Status Type')}" /></td>
										<td valign="middle" align="center"><input id="U130"
											name="U130" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U131"
											name="U131" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U132"
											name="U132" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Approval Status Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Approval Status Type</span></td>
										<td valign="middle" align="center"><input id="U133"
											name="U133" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Add Approval Status Type')}" /></td>
										<td valign="middle" align="center"><input id="U134"
											name="U134" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U135"
											name="U135" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U136"
											name="U136" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Approval Status Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Approval Status Type</span></td>
										<td valign="middle" align="center"><input id="U137"
											name="U137" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Approval Status Type')}" /></td>
										<td valign="middle" align="center"><input id="U138"
											name="U138" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U139"
											name="U139" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Approval Status Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U140"
											name="U140" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Approval Status Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Training Type</span></td>
										<td valign="middle" align="center"><input id="U141"
											name="U141" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Training Type')}" /></td>
										<td valign="middle" align="center"><input id="U142"
											name="U142" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U143"
											name="U143" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U144"
											name="U144" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Training Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Training Type</span></td>
										<td valign="middle" align="center"><input id="U145"
											name="U145" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Training Type')}" /></td>
										<td valign="middle" align="center"><input id="U146"
											name="U146" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U147"
											name="U147" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U148"
											name="U148" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Training Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Training Type</span></td>
										<td valign="middle" align="center"><input id="U149"
											name="U149" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Training Type')}" /></td>
										<td valign="middle" align="center"><input id="U150"
											name="U150" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U151"
											name="U151" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U152"
											name="U152" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Training Type')}"
											style="display: none" style="display:none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Training Type</span></td>
										<td valign="middle" align="center"><input id="U153"
											name="U153" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Add Training Type')}" /></td>
										<td valign="middle" align="center"><input id="U154"
											name="U154" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U155"
											name="U155" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Training Type')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U156"
											name="U156" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Training Type')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View User CV</span></td>
										<td valign="middle" align="center"><input id="U157"
											name="U157" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View User CV')}" /></td>
										<td valign="middle" align="center"><input id="U158"
											name="U158" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U159"
											name="U159" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U160"
											name="U160" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View User CV')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download User CV</span></td>
										<td valign="middle" align="center"><input id="U161"
											name="U161" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download User CV')}" /></td>
										<td valign="middle" align="center"><input id="U162"
											name="U162" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U163"
											name="U163" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U164"
											name="U164" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download User CV')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit User CV</span></td>
										<td valign="middle" align="center"><input id="U165"
											name="U165" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit User CV')}" /></td>
										<td valign="middle" align="center"><input id="U166"
											name="U166" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U167"
											name="U167" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U168"
											name="U168" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit User CV')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create User CV</span></td>
										<td valign="middle" align="center"><input id="U169"
											name="U169" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create User CV')}" /></td>
										<td valign="middle" align="center"><input id="U170"
											name="U170" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U171"
											name="U171" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create User CV')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U172"
											name="U172" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create User CV')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View User Training</span></td>
										<td valign="middle" align="center"><input id="U173"
											name="U173" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View User Training')}" /></td>
										<td valign="middle" align="center"><input id="U174"
											name="U174" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U175"
											name="U175" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U176"
											name="U176" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View User Training')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit User Training</span></td>
										<td valign="middle" align="center"><input id="U177"
											name="U177" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit User Training')}" /></td>
										<td valign="middle" align="center"><input id="U178"
											name="U178" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U179"
											name="U179" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U180"
											name="U180" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit User Training')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create User Training</span></td>
										<td valign="middle" align="center"><input id="U181"
											name="U181" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create User Training')}" /></td>
										<td valign="middle" align="center"><input id="U182"
											name="U182" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U183"
											name="U183" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create User Training')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U184"
											name="U184" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create User Training')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Submissions</span></td>
										<td valign="middle" align="center"><input id="U185"
											name="U185" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Submissions')}" /></td>
										<td valign="middle" align="center"><input id="U186"
											name="U186" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U187"
											name="U187" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U188"
											name="U188" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Submissions')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Submissions</span></td>
										<td valign="middle" align="center"><input id="U189"
											name="U189" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Submissions')}" /></td>
										<td valign="middle" align="center"><input id="U190"
											name="U190" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U191"
											name="U191" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U192"
											name="U192" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Submissions')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Submissions</span></td>
										<td valign="middle" align="center"><input id="U193"
											name="U193" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Add Submissions')}" /></td>
										<td valign="middle" align="center"><input id="U194"
											name="U194" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U195"
											name="U195" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U196"
											name="U196" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Submissions')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Submissions</span></td>
										<td valign="middle" align="center"><input id="U197"
											name="U197" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Submissions')}" /></td>
										<td valign="middle" align="center"><input id="U198"
											name="U198" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U199"
											name="U199" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Submissions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U200"
											name="U200" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Submissions')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Medical License</span></td>
										<td valign="middle" align="center"><input id="U201"
											name="U201" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Medical License')}" /></td>
										<td valign="middle" align="center"><input id="U202"
											name="U202" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U203"
											name="U203" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U204"
											name="U204" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Medical License')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Medical License</span></td>
										<td valign="middle" align="center"><input id="U205"
											name="U205" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Medical License')}" /></td>
										<td valign="middle" align="center"><input id="U206"
											name="U206" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U207"
											name="U207" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U208"
											name="U208" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Medical License')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Medical License</span></td>
										<td valign="middle" align="center"><input id="U209"
											name="U209" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Medical License')}" /></td>
										<td valign="middle" align="center"><input id="U210"
											name="U210" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U211"
											name="U211" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U212"
											name="U212" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Medical License')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Medical License</span></td>
										<td valign="middle" align="center"><input id="U213"
											name="U213" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Medical License')}" /></td>
										<td valign="middle" align="center"><input id="U214"
											name="U214" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U215"
											name="U215" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Medical License')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U216"
											name="U216" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Medical License')}"
											style="display: none" /></td>
									</tr>

									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Financial Disclosure</span></td>
										<td valign="middle" align="center"><input id="U217"
											name="U217" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Financial Disclosure')}" /></td>
										<td valign="middle" align="center"><input id="U218"
											name="U218" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U219"
											name="U219" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U220"
											name="U220" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Financial Disclosure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Financial Disclosure</span></td>
										<td valign="middle" align="center"><input id="U221"
											name="U221" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Financial Disclosure')}" /></td>
										<td valign="middle" align="center"><input id="U222"
											name="U222" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U223"
											name="U223" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U224"
											name="U224" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Financial Disclosure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Financial Disclosure</span></td>
										<td valign="middle" align="center"><input id="U225"
											name="U225" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Financial Disclosure')}" /></td>
										<td valign="middle" align="center"><input id="U226"
											name="U226" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U227"
											name="U227" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U228"
											name="U228" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Financial Disclosure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Financial Disclosure</span></td>
										<td valign="middle" align="center"><input id="U229"
											name="U229" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Financial Disclosure')}" /></td>
										<td valign="middle" align="center"><input id="U230"
											name="U230" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U231"
											name="U231" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Financial Disclosure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U232"
											name="U232" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Financial Disclosure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Contracts</span></td>
										<td valign="middle" align="center"><input id="U233"
											name="U233" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Contracts')}" /></td>
										<td valign="middle" align="center"><input id="U234"
											name="U234" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U235"
											name="U235" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U236"
											name="U236" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Contracts</span></td>
										<td valign="middle" align="center"><input id="U237"
											name="U237" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Contracts')}" /></td>
										<td valign="middle" align="center"><input id="U238"
											name="U238" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U239"
											name="U239" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U240"
											name="U240" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Contracts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Contracts</span></td>
										<td valign="middle" align="center"><input id="U241"
											name="U241" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Create Contracts')}" /></td>
										<td valign="middle" align="center"><input id="U242"
											name="U242" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U243"
											name="U243" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U244"
											name="U244" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Contracts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Contracts</span></td>
										<td valign="middle" align="center"><input id="U245"
											name="U245" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Contracts')}" /></td>
										<td valign="middle" align="center"><input id="U246"
											name="U246" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U247"
											name="U247" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U248"
											name="U248" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Contracts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Download Contracts</span></td>
										<td valign="middle" align="center"><input id="U249"
											name="U249" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Download Contracts')}" /></td>
										<td valign="middle" align="center"><input id="U250"
											name="U250" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Download Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U251"
											name="U251" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Download Contracts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U252"
											name="U252" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Download Contracts')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" colspan="5"
											class="set_padding"><span class="left_l1">Patients</span></td>

									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Patients</span></td>
										<td valign="middle" align="center"><input id="U253"
											name="U253" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'View Patients')}" /></td>
										<td valign="middle" align="center"><input id="U254"
											name="U254" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Patients')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U255"
											name="U255" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Patients')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U256"
											name="U256" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Patients')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Patient</span></td>
										<td valign="middle" align="center"><input id="U257"
											name="U257" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Add Patient')}" /></td>
										<td valign="middle" align="center"><input id="U258"
											name="U258" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Patient')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U259"
											name="U259" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Patient')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U260"
											name="U260" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Patient')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Patient</span></td>
										<td valign="middle" align="center"><input id="U261"
											name="U261" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Edit Patient')}" /></td>
										<td valign="middle" align="center"><input id="U262"
											name="U262" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Patient')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U263"
											name="U263" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Patient')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U264"
											name="U264" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Patient')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Patient Visits History</span></td>
										<td valign="middle" align="center"><input id="U265"
											name="U265" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Patient Visits History')}" /></td>
										<td valign="middle" align="center"><input id="U266"
											name="U266" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Patient Visits History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U267"
											name="U267" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Patient Visits History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U268"
											name="U268" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Patient Visits History')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Patient Advers Event Visit History</span></td>
										<td valign="middle" align="center"><input id="U269"
											name="U269" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Patient Advers Event Visit History')}" /></td>
										<td valign="middle" align="center"><input id="U270"
											name="U270" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Patient Advers Event Visit History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U271"
											name="U271" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Patient Advers Event Visit History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U272"
											name="U272" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Patient Advers Event Visit History')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Patient Monitor Visit History</span></td>
										<td valign="middle" align="center"><input id="U273"
											name="U273" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Patient Monitor Visit History')}" /></td>
										<td valign="middle" align="center"><input id="U274"
											name="U274" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Patient Monitor Visit History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U275"
											name="U275" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Patient Monitor Visit History')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U276"
											name="U276" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Patient Monitor Visit History')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Patient Case Report Forms</span></td>
										<td valign="middle" align="center"><input id="U277"
											name="U277" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Patient Case Report Forms')}" /></td>
										<td valign="middle" align="center"><input id="U278"
											name="U278" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Patient Case Report Forms')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U279"
											name="U279" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Patient Case Report Forms')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U280"
											name="U280" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Patient Case Report Forms')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Fill Patient Case Report Forms</span></td>
										<td valign="middle" align="center"><input id="U281"
											name="U281" type="checkbox"
											class="all-values view-all view-User hierarchy"
											value="${tl:rightsofView(grlist,'Fill Patient Case Report Forms')}" /></td>
										<td valign="middle" align="center"><input id="U282"
											name="U282" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Fill Patient Case Report Forms')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U283"
											name="U283" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Fill Patient Case Report Forms')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U284"
											name="U284" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Fill Patient Case Report Forms')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="center" class="set_padding"
											colspan="5"><span class="left_l1">User Management</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create User</span></td>
										<td valign="middle" align="center"><input id="U285"
											name="U285" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create User')}" /></td>
										<td valign="middle" align="center"><input id="U286"
											name="U286" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U287"
											name="U287" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U288"
											name="U288" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create User')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="left" class="set_padding"><span
											class="left_l2">View User</span></td>
										<td valign="middle" align="center"><input id="U289"
											name="U289" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View User')}" /></td>
										<td valign="middle" align="center"><input id="U290"
											name="U290" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U291"
											name="U291" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U292"
											name="U292" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View User')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit User</span></td>
										<td valign="middle" align="center"><input id="U293"
											name="U293" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit User')}" /></td>
										<td valign="middle" align="center"><input id="U294"
											name="U294" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U295"
											name="U295" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U296"
											name="U296" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit User')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Avtive/Inaactive User</span></td>
										<td valign="middle" align="center"><input id="U297"
											name="U297" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Avtive/Inaactive User')}" /></td>
										<td valign="middle" align="center"><input id="U298"
											name="U298" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Avtive/Inaactive User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U299"
											name="U299" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Avtive/Inaactive User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U300"
											name="U300" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Avtive/Inaactive User')}"
											style="display: none" /></td>
									</tr>

									<tr class="white_row_view_list">
										<td valign="middle" align="left" class="set_padding"><span
											class="left_l2">User Groups</span></td>
										<td valign="middle" align="center"><input id="U301"
											name="U301" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'User Groups')}" /></td>
										<td valign="middle" align="center"><input id="U302"
											name="U302" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'User Groups')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U303"
											name="U303" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'User Groups')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U304"
											name="U304" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'User Groups')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="center" class="set_padding"
											colspan="5"><span class="left_l1">Group
												Management</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Group</span></td>
										<td valign="middle" align="center"><input id="U305"
											name="U305" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create Group')}" /></td>
										<td valign="middle" align="center"><input id="U306"
											name="U306" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Group')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U307"
											name="U307" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Group')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U308"
											name="U308" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Group')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Group</span></td>
										<td valign="middle" align="center"><input id="U309"
											name="U309" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Group')}" /></td>
										<td valign="middle" align="center"><input id="U310"
											name="U310" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Group')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U311"
											name="U311" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Group')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U312"
											name="U312" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Group')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Set Group Rights</span></td>
										<td valign="middle" align="center"><input id="U313"
											name="U313" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Set Group Rights')}" /></td>
										<td valign="middle" align="center"><input id="U314"
											name="U314" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Set Group Rights')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U315"
											name="U315" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Set Group Rights')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U316"
											name="U316" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Set Group Rights')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="Center" class="set_padding"
											colspan="5"><span class="left_l1">Library</span></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Drugs</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Drugs</span></td>
										<td valign="middle" align="center"><input id="U317"
											name="U317" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Drug')}" /></td>
										<td valign="middle" align="center"><input id="U318"
											name="U318" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Drug')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U319"
											name="U319" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Drug')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U320"
											name="U320" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Drug')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Drugs</span></td>
										<td valign="middle" align="center"><input id="U321"
											name="U321" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Drugs')}" /></td>
										<td valign="middle" align="center"><input id="U322"
											name="U322" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Drugs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U323"
											name="U323" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Drugs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U324"
											name="U324" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Drugs')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Drugs</span></td>
										<td valign="middle" align="center"><input id="U325"
											name="U325" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Drugs')}" /></td>
										<td valign="middle" align="center"><input id="U326"
											name="U326" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Drugs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U327"
											name="U327" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Drugs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U328"
											name="U328" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Drugs')}"
											style="display: none" /></td>
									</tr>
									
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Inventory</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Inventory</span></td>
										<td valign="middle" align="center"><input id="U317"
											name="U317" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Inventory')}" /></td>
										<td valign="middle" align="center"><input id="U318"
											name="U318" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U319"
											name="U319" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U320"
											name="U320" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Inventory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Inventory</span></td>
										<td valign="middle" align="center"><input id="U321"
											name="U321" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Inventory')}" /></td>
										<td valign="middle" align="center"><input id="U322"
											name="U322" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U323"
											name="U323" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U324"
											name="U324" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Inventory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Inventory</span></td>
										<td valign="middle" align="center"><input id="U325"
											name="U325" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Inventory')}" /></td>
										<td valign="middle" align="center"><input id="U326"
											name="U326" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U327"
											name="U327" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Inventory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U328"
											name="U328" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Inventory')}"
											style="display: none" /></td>
									</tr>
									
									
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Countries</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Countries</span></td>
										<td valign="middle" align="center"><input id="U329"
											name="U329" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Countries')}" /></td>
										<td valign="middle" align="center"><input id="U330"
											name="U330" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U331"
											name="U331" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U332"
											name="U332" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Country')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Countries</span></td>
										<td valign="middle" align="center"><input id="U333"
											name="U333" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Countries')}" /></td>
										<td valign="middle" align="center"><input id="U334"
											name="U334" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U335"
											name="U335" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U336"
											name="U336" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Country')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Countries</span></td>
										<td valign="middle" align="center"><input id="U337"
											name="U337" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Countries')}" /></td>
										<td valign="middle" align="center"><input id="U338"
											name="U338" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U339"
											name="U339" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Country')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U340"
											name="U340" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Country')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Labs</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Labs</span></td>
										<td valign="middle" align="center"><input id="U341"
											name="U341" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Lab')}" /></td>
										<td valign="middle" align="center"><input id="U342"
											name="U342" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Lab')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U343"
											name="U343" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Lab')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U344"
											name="U344" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Lab')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Labs</span></td>
										<td valign="middle" align="center"><input id="U345"
											name="U345" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Labs')}" /></td>
										<td valign="middle" align="center"><input id="U346"
											name="U346" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Labs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U347"
											name="U347" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Labs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U348"
											name="U348" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Labs')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Labs</span></td>
										<td valign="middle" align="center"><input id="U349"
											name="U349" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Labs')}" /></td>
										<td valign="middle" align="center"><input id="U350"
											name="U350" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Labs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U351"
											name="U351" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Labs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U352"
											name="U352" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Labs')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Laboratory</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Laboratory</span></td>
										<td valign="middle" align="center"><input id="U353"
											name="U353" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Laboratory')}" /></td>
										<td valign="middle" align="center"><input id="U354"
											name="U354" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U355"
											name="U355" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U356"
											name="U356" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Laboratory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Laboratory</span></td>
										<td valign="middle" align="center"><input id="U357"
											name="U357" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Laboratory')}" /></td>
										<td valign="middle" align="center"><input id="U358"
											name="U358" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U359"
											name="U359" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U360"
											name="U360" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Laboratory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Laboratory</span></td>
										<td valign="middle" align="center"><input id="U361"
											name="U361" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Laboratory')}" /></td>
										<td valign="middle" align="center"><input id="U362"
											name="U362" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U363"
											name="U363" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U364"
											name="U364" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Laboratory')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Units of
												Measures</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Units of Measure</span></td>
										<td valign="middle" align="center"><input id="U365"
											name="U365" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Units of Measure')}" /></td>
										<td valign="middle" align="center"><input id="U366"
											name="U366" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U367"
											name="U367" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U368"
											name="U368" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Units of Measure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Units of Measure</span></td>
										<td valign="middle" align="center"><input id="U369"
											name="U369" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Units of Measure')}" /></td>
										<td valign="middle" align="center"><input id="U370"
											name="U370" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U371"
											name="U371" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U372"
											name="U372" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Units of Measure')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Units of Measure</span></td>
										<td valign="middle" align="center"><input id="U373"
											name="U373" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Units of Measure')}" /></td>
										<td valign="middle" align="center"><input id="U374"
											name="U374" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U375"
											name="U375" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Units of Measure')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U376"
											name="U376" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Units of Measure')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Action Texts</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Action Texts</span></td>
										<td valign="middle" align="center"><input id="U377"
											name="U377" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Action Texts')}" /></td>
										<td valign="middle" align="center"><input id="U378"
											name="U378" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U379"
											name="U379" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U380"
											name="U380" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Action Texts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Action Texts</span></td>
										<td valign="middle" align="center"><input id="U381"
											name="U381" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Action Texts')}" /></td>
										<td valign="middle" align="center"><input id="U382"
											name="U382" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U383"
											name="U383" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U384"
											name="U384" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Action Texts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Action Texts</span></td>
										<td valign="middle" align="center"><input id="U385"
											name="U385" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Action Texts')}" /></td>
										<td valign="middle" align="center"><input id="U386"
											name="U386" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U387"
											name="U387" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Action Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U388"
											name="U388" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Action Texts')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Categories</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Categories</span></td>
										<td valign="middle" align="center"><input id="U389"
											name="U389" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Categories')}" /></td>
										<td valign="middle" align="center"><input id="U390"
											name="U390" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Catagory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U391"
											name="U391" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Catagory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U392"
											name="U392" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Catagory')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Categories</span></td>
										<td valign="middle" align="center"><input id="U393"
											name="U393" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Categories')}" /></td>
										<td valign="middle" align="center"><input id="U394"
											name="U394" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Categories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U395"
											name="U395" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Categories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U396"
											name="U396" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Categories')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Categories</span></td>
										<td valign="middle" align="center"><input id="U397"
											name="U397" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Categories')}" /></td>
										<td valign="middle" align="center"><input id="U398"
											name="U398" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Categories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U399"
											name="U399" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Categories')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U400"
											name="U400" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Categories')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Query Statuses</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Query Status</span></td>
										<td valign="middle" align="center"><input id="U401"
											name="U401" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Query Status')}" /></td>
										<td valign="middle" align="center"><input id="U402"
											name="U402" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Query Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U403"
											name="U403" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Query Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U404"
											name="U404" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Query Status')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Query Statuses</span></td>
										<td valign="middle" align="center"><input id="U405"
											name="U405" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Query Statuses')}" /></td>
										<td valign="middle" align="center"><input id="U406"
											name="U406" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Query Statuses')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U407"
											name="U407" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Query Statuses')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U408"
											name="U408" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Query Statuses')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Query Statuses</span></td>
										<td valign="middle" align="center"><input id="U409"
											name="U409" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Query Statuses')}" /></td>
										<td valign="middle" align="center"><input id="U410"
											name="U410" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Query Statuses')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U411"
											name="U411" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Query Statuses')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U412"
											name="U412" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Query Statuses')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Resolutions</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Resolution</span></td>
										<td valign="middle" align="center"><input id="U413"
											name="U413" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Resolution')}" /></td>
										<td valign="middle" align="center"><input id="U414"
											name="U414" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Resolution')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U415"
											name="U415" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Resolution')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U416"
											name="U416" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Resolution')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Resolutions</span></td>
										<td valign="middle" align="center"><input id="U417"
											name="U417" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Resolutions')}" /></td>
										<td valign="middle" align="center"><input id="U418"
											name="U418" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Resolutions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U419"
											name="U419" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Resolutions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U420"
											name="U420" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Resolutions')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Resolutions</span></td>
										<td valign="middle" align="center"><input id="U421"
											name="U421" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Resolutions')}" /></td>
										<td valign="middle" align="center"><input id="U422"
											name="U422" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Resolutions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U423"
											name="U423" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Resolutions')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U424"
											name="U424" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Resolutions')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Discrepency
												Texts</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Discrepency Text</span></td>
										<td valign="middle" align="center"><input id="U425"
											name="U425" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Discrepency Text')}" /></td>
										<td valign="middle" align="center"><input id="U426"
											name="U426" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Discrepency Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U427"
											name="U427" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Discrepency Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U428"
											name="U428" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Discrepency Text')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Discrepency Texts</span></td>
										<td valign="middle" align="center"><input id="U429"
											name="U429" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Discrepency Texts')}" /></td>
										<td valign="middle" align="center"><input id="U430"
											name="U430" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Discrepency Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U431"
											name="U431" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Discrepency Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U432"
											name="U432" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Discrepency Texts')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Discrepency Texts</span></td>
										<td valign="middle" align="center"><input id="U433"
											name="U433" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Discrepency Texts')}" /></td>
										<td valign="middle" align="center"><input id="U434"
											name="U434" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Discrepency Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U435"
											name="U435" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Discrepency Texts')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U436"
											name="U436" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Discrepency Texts')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Recieved CRF
												Statuses</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Recieved CRF Statuses</span></td>
										<td valign="middle" align="center"><input id="U437"
											name="U437" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Recieved CRF Status')}" /></td>
										<td valign="middle" align="center"><input id="U438"
											name="U438" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U439"
											name="U439" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U440"
											name="U440" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Recieved CRF Status')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Recieved CRF Statuses</span></td>
										<td valign="middle" align="center"><input id="U441"
											name="U441" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Recieved CRF Status')}" /></td>
										<td valign="middle" align="center"><input id="U442"
											name="U442" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U443"
											name="U443" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U444"
											name="U444" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Recieved CRF Status')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Recieved CRF Statuses</span></td>
										<td valign="middle" align="center"><input id="U445"
											name="U445" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Recieved CRF Status')}" /></td>
										<td valign="middle" align="center"><input id="U446"
											name="U446" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U447"
											name="U447" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Recieved CRF Status')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U448"
											name="U448" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Recieved CRF Status')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Section Name
												Texts</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Section Name Text</span></td>
										<td valign="middle" align="center"><input id="U449"
											name="U449" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Section Name Text')}" /></td>
										<td valign="middle" align="center"><input id="U450"
											name="U450" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U451"
											name="U451" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U452"
											name="U452" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Section Name Text')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Section Name Texts</span></td>
										<td valign="middle" align="center"><input id="U453"
											name="U453" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Section Name Text')}" /></td>
										<td valign="middle" align="center"><input id="U454"
											name="U454" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U455"
											name="U455" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U456"
											name="U456" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Section Name Text')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Section Name Texts</span></td>
										<td valign="middle" align="center"><input id="U457"
											name="U457" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Section Name Text')}" /></td>
										<td valign="middle" align="center"><input id="U458"
											name="U458" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U459"
											name="U459" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Section Name Text')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U460"
											name="U460" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Section Name Text')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Validation
												Rules</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Validation Rule</span></td>
										<td valign="middle" align="center"><input id="U461"
											name="U461" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Validation Rule')}" /></td>
										<td valign="middle" align="center"><input id="U462"
											name="U462" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U463"
											name="U463" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U464"
											name="U464" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Validation Rule')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Validation Rule</span></td>
										<td valign="middle" align="center"><input id="U465"
											name="U465" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Validation Rule')}" /></td>
										<td valign="middle" align="center"><input id="U466"
											name="U466" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U467"
											name="U467" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U468"
											name="U468" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Validation Rule')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Validation Rule</span></td>
										<td valign="middle" align="center"><input id="U469"
											name="U469" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Validation Rule')}" /></td>
										<td valign="middle" align="center"><input id="U470"
											name="U470" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U471"
											name="U471" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Validation Rule')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U472"
											name="U472" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Validation Rule')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="center" class="set_padding"
											colspan="5"><span class="left_l1">Sponsor &
												Division</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Sponsor</span></td>
										<td valign="middle" align="center"><input id="U473"
											name="U473" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Sponsor')}" /></td>
										<td valign="middle" align="center"><input id="U474"
											name="U474" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U475"
											name="U475" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U476"
											name="U476" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Sponsor</span></td>
										<td valign="middle" align="center"><input id="U477"
											name="U477" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Sponsor')}" /></td>
										<td valign="middle" align="center"><input id="U478"
											name="U478" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U479"
											name="U479" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U480"
											name="U480" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Sponsor</span></td>
										<td valign="middle" align="center"><input id="U481"
											name="U481" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Sponsor')}" /></td>
										<td valign="middle" align="center"><input id="U482"
											name="U482" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U483"
											name="U483" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Sponsor')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U484"
											name="U484" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Sponsor')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Division</span></td>
										<td valign="middle" align="center"><input id="U485"
											name="U485" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Division')}" /></td>
										<td valign="middle" align="center"><input id="U486"
											name="U486" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U487"
											name="U487" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U488"
											name="U488" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Division')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Division</span></td>
										<td valign="middle" align="center"><input id="U489"
											name="U489" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Division')}" /></td>
										<td valign="middle" align="center"><input id="U490"
											name="U490" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U491"
											name="U491" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U492"
											name="U492" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Division')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Division</span></td>
										<td valign="middle" align="center"><input id="U493"
											name="U493" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Division')}" /></td>
										<td valign="middle" align="center"><input id="U494"
											name="U494" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U495"
											name="U495" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Division')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U496"
											name="U496" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Division')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Sponsor User</span></td>
										<td valign="middle" align="center"><input id="U497"
											name="U497" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Sponsor User')}" /></td>
										<td valign="middle" align="center"><input id="U498"
											name="U498" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U499"
											name="U499" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U500"
											name="U500" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Sponsor User')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Sponsor Users</span></td>
										<td valign="middle" align="center"><input id="U501"
											name="U501" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Sponsor User')}" /></td>
										<td valign="middle" align="center"><input id="U502"
											name="U502" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U503"
											name="U503" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U504"
											name="U504" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Sponsor User')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Sponsor Users</span></td>
										<td valign="middle" align="center"><input id="U505"
											name="U505" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete Sponsor User')}" /></td>
										<td valign="middle" align="center"><input id="U506"
											name="U506" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U507"
											name="U507" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Sponsor User')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U508"
											name="U508" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Sponsor User')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="center" class="set_padding"
											colspan="5"><span class="left_l1">Sites</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Site</span></td>
										<td valign="middle" align="center"><input id="U509"
											name="U509" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Site')}" /></td>
										<td valign="middle" align="center"><input id="U510"
											name="U510" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Site')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U511"
											name="U511" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Site')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U512"
											name="U512" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Site')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Sites</span></td>
										<td valign="middle" align="center"><input id="U513"
											name="U513" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Sites')}" /></td>
										<td valign="middle" align="center"><input id="U514"
											name="U514" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U515"
											name="U515" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U516"
											name="U516" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Sites')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Sites</span></td>
										<td valign="middle" align="center"><input id="U517"
											name="U517" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Sites')}" /></td>
										<td valign="middle" align="center"><input id="U518"
											name="U518" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U519"
											name="U519" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U520"
											name="U520" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Site')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Add Study Site</span></td>
										<td valign="middle" align="center"><input id="U521"
											name="U521" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Add Study Site')}" /></td>
										<td valign="middle" align="center"><input id="U522"
											name="U522" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Add Study Site')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U523"
											name="U523" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Add Study Site')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U524"
											name="U524" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Add Study Site')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Study Sites</span></td>
										<td valign="middle" align="center"><input id="U525"
											name="U525" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Study Sites')}" /></td>
										<td valign="middle" align="center"><input id="U526"
											name="U526" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U527"
											name="U527" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U528"
											name="U528" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Sites')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Study Sites</span></td>
										<td valign="middle" align="center"><input id="U529"
											name="U529" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete Study Sites')}" /></td>
										<td valign="middle" align="center"><input id="U530"
											name="U530" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U531"
											name="U531" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Study Sites')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U532"
											name="U532" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Study Sites')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Site Users</span></td>
										<td valign="middle" align="center"><input id="U533"
											name="U533" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Site Users')}" /></td>
										<td valign="middle" align="center"><input id="U534"
											name="U534" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U535"
											name="U535" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U536"
											name="U536" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Site Users')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Study Site Users</span></td>
										<td valign="middle" align="center"><input id="U537"
											name="U537" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Study Site Users')}" /></td>
										<td valign="middle" align="center"><input id="U538"
											name="U538" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U539"
											name="U539" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U540"
											name="U540" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Study Site Users')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Site Laboratory</span></td>
										<td valign="middle" align="center"><input id="U541"
											name="U541" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Site Laboratory')}" /></td>
										<td valign="middle" align="center"><input id="U542"
											name="U542" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Site Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U543"
											name="U543" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Site Laboratory')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U544"
											name="U544" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Site Laboratory')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Visits</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Visit</span></td>
										<td valign="middle" align="center"><input id="U545"
											name="U545" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create Visit')}" /></td>
										<td valign="middle" align="center"><input id="U546"
											name="U546" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U547"
											name="U547" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U548"
											name="U548" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Visit')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Visit</span></td>
										<td valign="middle" align="center"><input id="U549"
											name="U549" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Visit')}" /></td>
										<td valign="middle" align="center"><input id="U550"
											name="U550" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U551"
											name="U551" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U552"
											name="U552" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Visit')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Visit</span></td>
										<td valign="middle" align="center"><input id="U553"
											name="U553" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Visit')}" /></td>
										<td valign="middle" align="center"><input id="U554"
											name="U554" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U555"
											name="U555" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U556"
											name="U556" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Visit')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Visit</span></td>
										<td valign="middle" align="center"><input id="U557"
											name="U557" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete Visit')}" /></td>
										<td valign="middle" align="center"><input id="U558"
											name="U558" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U559"
											name="U559" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Visit')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U560"
											name="U560" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Visit')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="Center" class="set_padding"
											colspan="5"><span class="left_l1">CRF's</span></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Question</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Question</span></td>
										<td valign="middle" align="center"><input id="U561"
											name="U561" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create Question')}" /></td>
										<td valign="middle" align="center"><input id="U562"
											name="U562" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U563"
											name="U563" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U564"
											name="U564" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Question')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Questions</span></td>
										<td valign="middle" align="center"><input id="U565"
											name="U565" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Question')}" /></td>
										<td valign="middle" align="center"><input id="U566"
											name="U566" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U567"
											name="U567" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U568"
											name="U568" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Question')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Questions</span></td>
										<td valign="middle" align="center"><input id="U569"
											name="U569" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Question')}" /></td>
										<td valign="middle" align="center"><input id="U570"
											name="U570" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U571"
											name="U571" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U572"
											name="U572" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Question')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Questions</span></td>
										<td valign="middle" align="center"><input id="U573"
											name="U573" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete Question')}" /></td>
										<td valign="middle" align="center"><input id="U574"
											name="U574" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U575"
											name="U575" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Question')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U576"
											name="U576" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Question')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">Section</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create Section</span></td>
										<td valign="middle" align="center"><input id="U577"
											name="U577" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create Section')}" /></td>
										<td valign="middle" align="center"><input id="U578"
											name="U578" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U579"
											name="U579" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U580"
											name="U580" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create Section')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Section</span></td>
										<td valign="middle" align="center"><input id="U581"
											name="U581" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View Section')}" /></td>
										<td valign="middle" align="center"><input id="U582"
											name="U582" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U583"
											name="U583" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U584"
											name="U584" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View Section')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit Section</span></td>
										<td valign="middle" align="center"><input id="U585"
											name="U585" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit Section')}" /></td>
										<td valign="middle" align="center"><input id="U586"
											name="U586" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U587"
											name="U587" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U588"
											name="U588" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit Section')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete Section</span></td>
										<td valign="middle" align="center"><input id="U589"
											name="U589" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete Section')}" /></td>
										<td valign="middle" align="center"><input id="U590"
											name="U590" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U591"
											name="U591" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete Section')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U592"
											name="U592" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete Section')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="left" class="set_padding"
											colspan="5"><span class="left_l1">CRF</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Create CRF</span></td>
										<td valign="middle" align="center"><input id="U593"
											name="U593" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Create CRF')}" /></td>
										<td valign="middle" align="center"><input id="U594"
											name="U594" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Create CRF')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U595"
											name="U595" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Create CRF')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U596"
											name="U596" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Create CRF')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View CRFs</span></td>
										<td valign="middle" align="center"><input id="U597"
											name="U597" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'View CRFs')}" /></td>
										<td valign="middle" align="center"><input id="U598"
											name="U598" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'View CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U599"
											name="U599" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'View CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U600"
											name="U600" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'View CRFs')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Edit CRFs</span></td>
										<td valign="middle" align="center"><input id="U601"
											name="U601" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Edit CRFs')}" /></td>
										<td valign="middle" align="center"><input id="U602"
											name="U602" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Edit CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U603"
											name="U603" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Edit CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U604"
											name="U604" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Edit CRFs')}"
											style="display: none" /></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">Delete CRFs</span></td>
										<td valign="middle" align="center"><input id="U605"
											name="U605" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Delete CRFs')}" /></td>
										<td valign="middle" align="center"><input id="U606"
											name="U606" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Delete CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U607"
											name="U607" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Delete CRFs')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U608"
											name="U608" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Delete CRFs')}"
											style="display: none" /></td>
									</tr>
									<tr class="grey_row_view_list">
										<td valign="middle" align="Center" class="set_padding"
											colspan="5"><span class="left_l1">Reports</span></td>
									</tr>
									<tr class="white_row_view_list">
										<td valign="middle" align="Left" class="set_padding"><span
											class="left_l2">View Reports</span></td>
										<td valign="middle" align="center"><input id="U609"
											name="U609" type="checkbox"
											class="all-values view-all view-User"
											value="${tl:rightsofView(grlist,'Report')}" /></td>
										<td valign="middle" align="center"><input id="U610"
											name="U610" type="checkbox"
											class="all-values update-all User all"
											value="${tl:rightsofView(grlist,'Report')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U611"
											name="U611" type="checkbox"
											class="all-values insert-all User all"
											value="${tl:rightsofView(grlist,'Report')}"
											style="display: none" /></td>
										<td valign="middle" align="center"><input id="U612"
											name="U612" type="checkbox"
											class="all-values delete-all User all"
											value="${tl:rightsofView(grlist,'Report')}"
											style="display: none" /></td>
									</tr>

								</table>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 20px;">
									<input class="blue-pill sub" type="submit" value="save" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- --------------------------------- End Permission Group------------------------------------------------------ -->
			<!-- --------------------------------- End Permission Group------------------------------------------------------ -->

			<form id="GrouphiddenForm" name="GrouphiddenForm" method="post"
				action="OnChangeGroup.groups" class="user">
				<input type="hidden" name="groupid" id="groupid"
					value="${preselectedGroup}" />
			</form>

			<div class="tl_corner"></div>
			<div class="tr_corner"></div>
			<div class="bl_corner"></div>
			<div class="br_corner"></div>

		</div>
		<!-- right body content ends here -->

	</div>
	<!-- content ends here -->

	<!-- footer starts here -->
	<%@include file="footer.jsp"%>
	<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>

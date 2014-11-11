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

<script src="JQuery/jquery-1.7.1.js"></script>

<script src="JQuery/jquery.fileupload.js"></script>
<script src="JQuery/jquery.fileupload-ui.js"></script>

<script type="text/javascript" src="js/home/study/studydocument.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script>
	/*global $ */
	$(function() {
		var initFileUpload = function(suffix) {
			$('#file_upload')
					.fileUploadUI(
							{
								maxNumberOfFiles : 1,
								namespace : 'file_upload_' + suffix,
								fileInputFilter : '#file_' + suffix,
								dropZone : $('#drop_zone_' + suffix),
								uploadTable : $('#files_' + suffix),
								downloadTable : $('#files_' + suffix),
								buildUploadRow : function(files, index) {
									$('#fileUploadError').html("");
									return $("<tr class='grey_row_view_list'><td>"
											+ files[index].name
											+ '<\/td>'
											+ '<td class="file_upload_progress"><div><\/div><\/td>'
											+ '<td class="file_upload_cancel">'
											+ '<button class="ui-state-default ui-corner-all" title="Cancel">'
											+ '<span class="ui-icon ui-icon-cancel">Cancel<\/span>'
											+ '<\/button><\/td><\/tr>');

								},
								buildDownloadRow : function(file) {
									return $("<tr class='grey_row_view_list'> <td>"
											+ file.name
											+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Size          "
											+ file.size + " Bytes<\/td><\/tr>");
								}
							});
		};
		initFileUpload(1);
	});
	
	$(document).ready(function(){
		$("#upload").click(function(){
			location.reload(true);
		});
	});
</script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css"
	id="theme">

<link href="css/jquery.fileupload-ui.css" rel="stylesheet"
	type="text/css">
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">

	<div class="wrapper">
		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->

		<div class="body_content">
			<!-- left navigation starts here -->

			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->

			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">

						<c:if test="${tl:rightsofView(resourceList,'Patients')==1}">
							<a
								href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Patients</a>
						</c:if>
						<a
							href="<c:url value='OpenStudySiteChange.study?siteid=${currentsite.site_id}' />"
							class="nav_l" name="">Site Change</a>

						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='OpenStudySiteInvestigators.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Investigators</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Laboratories')==1}">
							<a
								href="<c:url value='OpenStudySiteLaborotories.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Laboratories</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Document')==1}">
							<a
								href="<c:url value='OpenStudySiteDocuments.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="" id="current">Site Documents</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Users')==1}">
							<a
								href="<c:url value='OpenStudySiteUsers.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Site Details')==1}">
							<a
								href="<c:url value='OpenStudySiteDetail.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Detail</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='discrepenciesInSite.study?stiteId=${currentsite.site_id}' />"
								class="nav_l" name="">Site Discrepancy</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>

			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">


				<!-- **************************************************************************************************************************** -->
				<!-- ********************************************Start Upload Button*********************************************************** -->

				<div class="body_inner" id="uploadDocumentDivButton"
					style="float: left;">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Documents</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container" style="float: left;">
						<div id="" class="myform study" style="float: left;">
							<div class="spacer" style="float: left;"></div>
							<label id="Uploadnewdocumnetbuttontitle"
								style="color: #1090d1; margin-left: 20px;">Upload New
								Document :</label>
							<button class="blue-pill" id="Uploadnewdocumnetbutton" style="">Upload</button>
							<div
								style="clear: both; margin-top: 10px; padding-left: 170px; float: left;">

							</div>
						</div>
					</div>
				</div>

				<!-- *******************************************End Upload Button*********************************************************** -->
				<!-- **************************************************************************************************************************** -->

				<!-- **************************************************************************************************************************** -->
				<!-- ********************************************Start Upload Document*********************************************************** -->
				<div class="body_inner" id="uploadDocumentDiv">
					<div class="body_inner_header">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Documents</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform study">
							<form id="file_upload" enctype="multipart/form-data"
								action="uploadSitedocument.study" method="POST">
								<br />
								<br />
								<br />
								<br />
								<fieldset id="file_upload">

									<label style="font-weight: bold;">Select File</label> <input
										type="file" name="file_1" id="file_1" value="Browse Doc..."
										style="width: 400px; margin-left: 20px;" /> <span
										id="fileUploadError" class="error_label">${UploadErrorMessage}</span>
									<div></div>

									<label></label>
									<table id="files_1" width="100%" border="0" cellspacing="1"
										cellpadding="0" class="table_border_view_list" style="display:none"></table>

								</fieldset>
							</form>
							<div class="spacer"></div>
							<div style="clear: both; margin-top: 20px;">
								<a
									href="<c:url value='OpenStudySiteDocuments.study?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />"
									style="text-decoration: none;"><button id="upload" class="blue-pill"
										type="submit">Done</button></a>
							</div>

						</div>
					</div>
				</div>

				<!-- ********************************************End Upload Document************************************************************* -->
				<!-- **************************************************************************************************************************** -->

				<!-- *************************************************************************************************************************** -->
				<!-- ********************************************Start View Documents*********************************************************** -->
				<div class="body_inner" id="viewStudyDocuments">

					<div class="create_group_container">
						<div class="field_set">

							<input id="viewStudyDocuments_Search_bar"
								name="viewStudyDocuments_Search_bar" type="text"
								class="input_txt" value="Search..." /> <span class="search_btn"><a
								href="#"><img src="images/search.png" alt="search"
									title="search" border="0" /></a></span>
						</div>
						<span id="viewStudyDocuments_error_message"
							class="error_label_grp" style="display: none;">${MessageError}</span>
						<span id="viewStudyDocuments_success_message"
							class="chk_avail_yes" style="display: none;">${MessageSuccess}</span>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="table_border_view_list" id="Home_Study_Viewstudy_table">
									<tr class="rights_header_view_list">
										<td width="30%" align="left" valign="middle">&nbsp;Name</td>
										<td width="30%" align="left" valign="middle">&nbsp;Type</td>
										<td width="23%" align="left" valign="middle">&nbsp;Upload
											Date</td>
										<td width="10%" align="center" valign="middle">Download</td>
										<td width="7%" align="center" valign="middle">Delete</td>
									</tr>
									<tbody id="fbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${doclist}" var="doc" varStatus="status">
											<c:set var="tempRowStyle"
												value="${(status.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

											<tr class="${tempRowStyle}" id="${doc.study_document_id}">
												<td valign="top" align="left" class="set_padding">${doc.document_name}</td>
												<td valign="top" align="left" class="set_padding">${doc.type}</td>
												<td valign="top" align="left" class="set_padding">${doc.date_created}</td>
												<td valign="top" align="center" class="set_padding2"><a
													href="<c:url value='DownloadSiteDocument.study?docid=${doc.study_document_id}'/>"><img
														src="images/download.png" alt="Doc" title="Doc" border="0" /></a></td>
												<td valign="top" align="center" class="set_padding2"><a
													href="<c:url value='DeleteSiteDocument.study?docid=${doc.study_document_id}' />"><img
														src="images/delete.png" alt="Del" title="Delete"
														border="0" /></a></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- ********************************************End View Documents************************************************************* -->
				<!-- *************************************************************************************************************************** -->

			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="../footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>

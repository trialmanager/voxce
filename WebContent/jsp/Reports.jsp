<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js" type="text/javascript"></script>

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/GraphStyles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 180%;
	z-index: 1000;
}

.overlay1 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;
}

.overlay2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 170%;
	z-index: 1000;
}
</style>

<script type="text/javascript">
	function SetReportURL(name) {

		$("#popup").show();
		$("#popup").dialog();
		$('#popup').css('width', 700);
		$('#ReportType').val(name);
		var StudyID = $('#ReportsStudySelection').val();
		var Address = "/VOXCE/frameset?__report=" + name + "&STUDYID="
				+ StudyID;
		$("#GenerateReport").attr("href", Address);
	}

	$(window).resize(function() {
		var width = $(document).width();
		width = width - 280;
		$('.right_body_content').css('width', width);
	});

	$(document).ready(
			function() {

				var width = $(document).width();
				width = width - 280;
				$('.right_body_content').css('width', width);

				$('#ReportsStudySelection').change(
						function() {

							var name = $('#ReportType').val();
							var StudyID = $('#ReportsStudySelection').val();
							var Address = "/VOXCE/frameset?__report=" + name
									+ "&STUDYID=" + StudyID;
							$("#GenerateReport").attr("href", Address);
						});

				
			});
</script>

</head>



<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>

		<!-- logo_area starts here -->


		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">Reports</div>
				<div class="nav_body">
					<div class="nav_menu">

						<a href="#" class="nav_l enme" name="Enrollment">Enrollment
							Metrics</a> <a href="#" class="nav_l exfo" name="Expected">Expected
							Follow Up Visits</a> <a href="#" class="nav_l foco" name="FollowUp">Follow-Up
							Compliance</a>

					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>

			<!-- left navigation ends here -->
			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv"
				style="width: 1400px;">
				<div class="body_inner" id="StudyEnrollmentDiv">
					
					<div class="create_group_container">
					
					<label class="body_inner_header" style="cursor: pointer;" onclick="SetReportURL('EnrollmentMetricsCorrectOne.rptdesign')">Enrollment Metrics</label> 
					<label class="body_inner_header" style="cursor: pointer;" onclick="SetReportURL('ExpectedFollowUpVisitsCorrectOne.rptdesign')">Expected Follow Up Visits</label> 
					<label class="body_inner_header" style="cursor: pointer;" onclick="SetReportURL('FollowUpComplianceReportCorrectOne.rptdesign')">Follow Up Compliance Report</label> 
					

					</div>
					<div class="tl_corner"></div>
					<div class="tr_corner"></div>
					<div class="bl_corner"></div>
					<div class="br_corner"></div>
				</div>

				<div id="popup" class="myform site" style="display: none;">
					<form id="Reports_Form" name="Reports_Form" class="site">
						<label>Select Study :</label> 
						<select id="ReportsStudySelection"
							name="ReportsStudySelection" class="drop_txt">
							<c:forEach items="${studieslist}" var="stlist" varStatus="status">
								<option id="${stlist.study_id}" value="${stlist.study_id}">${stlist.study_name}</option>
							</c:forEach>
						</select> <span id="ReportsStudySelection_error" class="error_label_grp"></span>

						<div class="spacer"
							style="vertical-align: super; margin-top: 0px;"></div>
						<div style="clear: both; margin-top: 20px; padding-left: 130px;">
							<a href="" id="GenerateReport" name="GenerateReport">Generate
								Report</a>
						</div>

						<input type="hidden" id="ReportType" name="ReportType" value="" />
					</form>
				</div>


			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<div class="footer_bar">
			<div class="footer_left">
				<a href="#" class="flinks">Home</a> | <a href="#" class="flinks">About
					Us</a> | <a href="#" class="flinks">FAQ</a> | <a href="#"
					class="flinks">Logout</a> | <a href="#" class="flinks">Contact
					Us</a>
			</div>

			<div class="footer_right">© 2011, Al Rights Reserved.</div>
		</div>
		<!-- footer ends here -->


	</div>
	<!-- wrapper ends here -->


</body>


</html>
<!-- onclick="SetReportURL('EnrollmentMetrics.rptdesign')" -->
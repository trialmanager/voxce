<%@page import="com.TrialManager.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VOXCE :: New Era in Clinical Trial Optimization</title>
<script src="JQuery/jquery-ui.min.js" type="text/javascript"></script>
<script src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
<script type="text/javascript">
	ddaccordion.init({
		headerclass : "expandable",
		contentclass : "categoryitems",
		revealtype : "click",
		mouseoverdelay : 200,
		collapseprev : true,
		defaultexpanded : [ 0 ],
		onemustopen : false,
		animatedefault : false,
		persiststate : true,
		toggleclass : [ "", "openheader" ],
		togglehtml : [ "prefix", "", "" ],
		animatespeed : "fast",
		oninit : function(headers, expandedindices) {
		},
		onopenclose : function(header, index, state, isuseractivated) {
		}
	});
	
	

	
</script>


<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/styles_popups.css" rel="stylesheet" type="text/css" />


</head>

<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>



	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="header.jsp"%>

		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->

			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->

			<div class="left_nav" id="MainDiv">

				<div class="left_nav_header">Administration</div>


				<div class="nav_body">
					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Data Mapping</h3>
						<ul class="categoryitems" id="current">

							<li><a id="" href="#" name="Configure_Data_Mapping"
								id="current">&bull; Configure Data Mapping</a></li>



						</ul>
						<ul class="categoryitems" >



						</ul>
					</div>

				</div>

				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>

				<!-- left navigation ends here -->
				<!-- ********************************** -->
				<!-- ********************************** -->
				<!-- ********************************** -->

			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">
				<div style="width: 700px; margin: 0 auto">
					<a href="#" class="main_btn1"></a> 
					<a href="#" class="main_btn2"></a>
					<a href="#" class="main_btn3"></a>
				</div>
				<div id="popupdiv" style="display:none;">
					
				</div>



				<div class="popup_wrapper" id="db_div" style="display:none;">
					<h1>
						<img src="images/webserv_ico.jpg" class="excell_ico" />Upload Via
						Database:
					</h1>
					<div class="form_section">
						<label>Database URL:</label> <input name="" type="text"
							class="input_txt" /> <label>DB Username:</label> <input name=""
							type="text" class="input_txt" /> <label>DB Password:</label> <input
							name="" type="text" class="input_txt" /> <label>Repitition:</label>
						<input name="" type="text" class="input_txt" /> <a href="#" id="submit"><img
							src="images/connect_btn.png" class="form_btn" alt="" border="0" /></a>
					</div>
				</div>
				
				
				
				<div class="popup_wrapper" id="ex_div" style="display: none; width:auto;">
					<h1>
						<img src="images/excell_ico.jpg" class="excell_ico" />Upload Data
						Via Excell File
					</h1>
					<div class="form_section">
						<label>Upload Excell File:</label> <input name="" type="file"
							size="50" class="floating" /> <a href="#" id="submit"><img
							src="images/upload_btn.png" class="form_btn" alt="" border="0"   /></a>
					</div>
				</div>
				
				
				
				

				<div class="popup_wrapper" id="ws_div" style="display: none;">
					<h1>
						<img src="images/webserv_ico.jpg" class="excell_ico" />Upload Via
						Web Service
					</h1>
					<div class="form_section">
						<label>Web Service URL:</label> <input name="" type="text"
							class="input_txt" /> <label>Username:</label> <input name=""
							type="text" class="input_txt" /> <label>Password:</label> <input
							name="" type="text" class="input_txt" /> <label>Repitition:</label>
						<input name="" type="text" class="input_txt" /> <a href="#" id="submit"><img
							src="images/connect_btn.png" class="form_btn" alt="" border="0"  /></a>
					</div>
				</div>
				
				<div id="table_img" style="display: none;">
					<img src="images/table_with_note.jpg" />
					<img src="images/xml_data.jpg" />
				</div>
				
				



			</div>
			<!-- content ends here -->

			<%@include file="footer.jsp"%>

		</div>
		<!-- wrapper ends here -->
</body>

</html>


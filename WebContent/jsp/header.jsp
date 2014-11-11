
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />

<script src="JQuery/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script src="JQuery/scale.fix.js" type="text/javascript"></script>
<script src="JQuery/jquery.qdemo.js" type="text/javascript"></script>
<script src="JQuery/jquery.ellipsis.js" type="text/javascript"></script>

<script src="js/dataMapping.js" type="text/javascript"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35715043-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript">
	$(document).ready(function() {
		var wid = $(window).width();
		
		//alert(wid);

		/*	var wid = $(".body_content").outerWidth();
		    wid = wid - $(".left_nav").outerWidth()-(.05*wid);
		    $('.right_body_content').css('width',wid);
		 	elipsis();*/
	});
</script>
<div class="marginclass">
	<div class="logo_area">

		<!-- logo placeholder here -->
		<div class="logo">
			<a href="ShowHomeIndex.home"><img src="images/voxce_betalogo.jpg"
				border="0" alt="logo" /> </a>
		</div>
		<!-- logo placehorder ends here -->

		<!-- logoout and welcome placeholder starts here -->
		<div class="logoout_welcome_area">
			<div class="logout_btn">
				<a href="<c:url value='Logout.htm' />"><img
					src="images/logout_btn.jpg" alt="logout" border="0" /></a>
			</div>
			<div class="welcome_area">
				<div class="welcome_corner"></div>
				<span>Welcome:</span> <strong>
					<%
						out.println(obj.getLogin());
					%>
				</strong>| <a href="ShowAccountSetting.users" class="flinks accountSettings">Account
					Settings</a>
			</div>
		</div>
		<!-- logoout and welcome placeholder ends here -->

	</div>
	<!-- logo_area ends here -->

	<!-- menu starts here -->

	<div class="menu_bar">
		<div class="top_menu_set">
			<c:if test="${tl:rightsofView(resourceList,'Home')==1}">
				<a href="<c:url value='ShowHomeIndex.home' />"
					class="${Home} top_btn"><span>Home</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'User Management')==1}">
				<a href="<c:url value='showUsersindex.users' />"
					class="${UserMenagment} top_btn"><span>User Management</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Group Management')==1}">
				<a href="<c:url value='showGroupsindex.groups' />"
					class="${GroupMangement} top_btn"><span>Group Management</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Library')==1}">
				<a
					href="<c:url value='/drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />"
					class="top_btn"><span>Library</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Sponsor & Division')==1}">
				<a href="<c:url value='ShowSponsorDivIndex.spondiv' />"
					class="${SponsorDivision} top_btn"><span>Sponsor &
						Division</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Sites')==1}">
				<a href="<c:url value='ShowSitesIndex.sites' />"
					class="${Site_Head} top_btn"><span>Sites</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Visits')==1}">
				<a href="<c:url value='ShowVisitsIndex.visits' />"
					class="${Visit_Head} top_btn"><span>Visits</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'CRF')==1}">
				<a
					href="<c:url value='ShowCRFIndex.crf?CurrentForm=add_question_form' />"
					class="${CRF_Header} top_btn"><span>Form</span></a>
			</c:if>
			
			<a href="<c:url value='ShowReportsIndex.report' />"
					class="${Report_Header} top_btn"><span>Reports</span></a>
			<!-- <a href="<c:url value='ShowAdminIndex.adm' />"
					class="${admin_header} top_btn"><span>Admin</span></a>
					 -->
		</div>
	</div>

	<style>
span.tooltip-style1 {
	display: none;
	position: absolute;
	z-index: 1000;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 6px;
	border: solid 4px #fff;
	opacity: .9;
	-moz-box-shadow: 2px 2px 1px 1px #333;
	-webkit-box-shadow: 2px 2px 1px 1px #333;
	box-shadow: 2px 2px 1px 1px #333;
}

.tooltips {
	position: auto;
	display: true;
	
}

.arrow {
	position: absolute;
	top: 0px;
	left: 10px;
	width: 16px;
	height: 16px;
	display: block;
	z-index: 1000;
	background-color: #000;
}

.tooltip-style1 {
	background: #1D99D9;
	color: #fff;
	min-height: 30px;
	padding: 10px 10px 10px 10px;
	opacity: .9;
}

.tooltip-style2 {
	background: #fff;
	padding: 3px;
	color: #333;
	text-align: center;
}

.tooltip-style3 {
	background: #e8e8e8;
	color: black;
	padding: 15px;
}

pre {
	font-size: 10px;
}
</style>
	
	
<!-- logo_area starts here -->
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />

<script src="../JQuery/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script src="../JQuery/scale.fix.js" type="text/javascript"></script>
<script src="../JQuery/jquery.qdemo.js" type="text/javascript"></script>
<script src="../JQuery/jquery.ellipsis.js" type="text/javascript"></script>
<script src="../JQuery/jquery.text-overflow.js" type="text/javascript"></script>

<script src="../js/tables.js" type="text/javascript"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
		var wid = $(".body_content").outerWidth();
	    wid = wid - 280;
	 	$('.right_body_content').css('width',wid);
	 	elipsis();
	}); */
</script>
<div class="marginclass">
	<div class="logo_area">


		<!-- logo placeholder here -->
		<div class="logo">
			<a href="../ShowHomeIndex.home"><img src="../images/voxce_betalogo.jpg"
				border="0" alt="logo" /></a>
		</div>
		<!-- logo placehorder ends here -->

		<!-- logoout and welcome placeholder starts here -->
		<div class="logoout_welcome_area">
			<div class="logout_btn">
				<a href="<c:url value='../Logout.htm' />"><img
					src="../images/logout_btn.jpg" alt="logout" border="0" /></a>
			</div>
			<div class="welcome_area">
				<div class="welcome_corner"></div>
				<span>Welcome:</span> <strong>
					<%
						out.println(obj.getLogin());
					%>
				</strong>
			</div>
		</div>
		<!-- logoout and welcome placeholder ends here -->

	</div>
	<!-- logo_area ends here -->
	<!-- menu starts here -->
	<div class="menu_bar">
		<div class="top_menu_set">
			<c:if test="${tl:rightsofView(resourceList,'Home')==1}">
				<a href="<c:url value='../ShowHomeIndex.home' />" class="top_btn"><span>Home</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'User Management')==1}">
				<a href="<c:url value='../showUsersindex.users' />" class="top_btn"><span>User
						Management</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Group Management')==1}">
				<a href="<c:url value='../showGroupsindex.groups' />"
					class="top_btn"><span>Group Management</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Library')==1}">
				<a
					href="<c:url value='../drugs/showDrugsIndex.drugs?FormCalled=add_drug_form' />"
					class="${Library} top_btn"><span>Library</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Sponsor & Division')==1}">
				<a href="<c:url value='../ShowSponsorDivIndex.spondiv' />"
					class="top_btn"><span>Sponsor & Division</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Sites')==1}">
				<a href="<c:url value='../ShowSitesIndex.sites' />" class="top_btn"><span>Sites</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'Visits')==1}">
				<a href="<c:url value='../ShowVisitsIndex.visits' />"
					class="top_btn"><span>Visits</span></a>
			</c:if>
			<c:if test="${tl:rightsofView(resourceList,'CRF')==1}">
				<a
					href="<c:url value='../ShowCRFIndex.crf?CurrentForm=add_question_form' />"
					class="top_btn"><span>Form</span></a>
			</c:if>

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
	border: solid 1px black;
	opacity: .9;
}

.tooltip-style1 {
	background: #5a85a5;
	color: white;
	min-height: 30px;
	padding: 10px 10px 10px 10px;
	opacity: .9;
}

.tooltip-style2 {
	background: #363636;
	padding: 3px;
	color: white;
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

.tooltips {
	display: none;
}
</style>
	<div id="header_wrapper" class="tooltips">
		<pre>
	</pre>
		<span class="tooltip-style1"> </span>
	</div>
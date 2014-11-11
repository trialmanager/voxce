<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The CTMS</title>

<script src="JQuery/jquery-1.7.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".submit-button").click(function(){
				$(".pannel_bg_error").text("");
				if($("#subscription_id").val() == "0"){
						$(".pannel_bg_error").text("Please Select Subscription");
					}else{
						$("#loginAsSubForm").submit();
					}
			});
		var wid = $(".body_content").outerWidth();
	    wid = wid - 280;
	 	$('.right_body_content').css('width',wid);
	 	elipsis();
		});
	</script>


</head>

<body>
	<div class="wrapper">
		<div class="container">
			<div>
				<a href="Logout.htm" class="logout_btn"></a>
			</div>
			<div class="logo_admin">
				<a href="#"><img src="images/ctms_logo.jpg" alt="" border="0" /></a>
			</div>
			<div class="dashboard_pannel">
				<form id="loginAsSubForm" method="post"
					action="AdminLogInASsubcriber.htm">
					<div class="pannel_bg">

						<div class="pannel_bg_field">

							<select id="subscription_id" name="subscription_id"
								class="drop_field">
								<option value="0">Please Choose...</option>
								<c:forEach items="${subList}" var="subList" varStatus="status">
									<option value="${subList.subscriber_id}">${subList.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="pannel_bg_txt">Enter Your Password</div>
						<div class="pannel_bg_field2">
							<input name="Login_User_Form_password" type="password"
								class="login_field" />
						</div>


						<div class="pannel_bg_error">
							<c:out value="${MessageCode}" />
						</div>
						<div style="clear: both; margin-left: 61.6%;">
							<div style="float: left; margin-right: 4px;">
								<input type="button" value="LOGIN"
									class="blue-pill submit-button"
									style="height: 31px; width: 66px;" />
							</div>
							<div style="float: left;">
								<input type="button" value="Cancle" class="grey-pill"
									onclick="window.location.href='ShowControlPanle.adm'"
									style="height: 31px;" />
							</div>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
</body>
</html>

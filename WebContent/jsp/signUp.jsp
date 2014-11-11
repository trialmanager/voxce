<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript" src="js/validation.js"></script>


<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />
<link href="css/subscribe_styles.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#subscription_form")
								.submit(
										function(event) {

											if (Check_isempty(event,
													'first_name_signup',
													'error_field_first_name'))
												CheckAlpha(event,
														'first_name_signup',
														'error_field_first_name');

											Check_isempty(event,
													'address1_signup',
													'error_field_address1');

											if ($("#error_field_email").text() != "Email Already Exists Please Try Another!"
													&& Check_isempty(event,
															'email_signup',
															'error_field_email'))
												validateEmail(event,
														'email_signup',
														'error_field_email');

											if (Check_isempty(event,
													'city_signup',
													'error_field_city'))
												//	 CheckAlphaNumeric(event,'city_signup','error_field_city');
												Check_isempty(event,
														'state_signup',
														'error_field_state');

											Check_isempty(event,
													'posla_code_signup',
													'error_field_pstal_code');

											if (Check_isempty(event,
													'posla_code_signup',
													'error_field_pstal_code'))
												CheckAlphaNumeric(event,
														'posla_code_signup',
														'error_field_pstal_code');

											/*if($.trim($('#cell_signup').val())!="")
											//	Validate_Numeric(event,'cell_signup','error_field_cell');
											else
												$('#error_field_cell').hide();*/

											Check_isempty(event,
													'phone_signup',
													'error_field_phone');
											//Validate_Numeric(event,'phone_signup','error_field_phone');

											/*if($.trim($('#fax_signup').val())!="")
												//Validate_Numeric(event,'fax_signup','error_field_fax');
											else
												$('#error_field_fax').hide();*/

											if ($("#error_field_email").text() == "Email Already Exists Please Try Another!") {

												Prevent_Event(event);
											}

											$(".error_label_grp_sub").each(
													function() {
														if (!$(this).is(
																":visible")) {
															$(this).val("")
																	.show();
														}
													});
										});

						$("#email_signup")
								.focusout(
										function() {
											$
													.post(
															"uniqueEmailSub.users?email="
																	+ $(this)
																			.val(),
															function(data) {
																if (data != "success") {
																	$(
																			"#error_field_email")
																			.text(
																					"Email Already Exists Please Try Another!");
																} else {
																	$(
																			"#error_field_email")
																			.text(
																					"");
																}
															});
										});

					});
</script>


</head>

<body>

	<!-- wrapper starts here -->
	
	<div class="wrapper">
		<div class="marginclass">
		<!-- logo_area starts here -->
		<div class="logo_area">
			<!-- logo placeholder here -->
			<div class="logo">
				<a href="login.htm"><img src="images/logo.jpg" border="0"
					alt="logo" /></a>
			</div>
			<!-- logo placehorder ends here -->

			<!-- logoout and welcome placeholder starts here -->
			<div class="logoout_welcome_area">

				<div class="welcome_area">
					<div class="welcome_corner"></div>
					<span>Welcome:</span> <strong>Guest</strong>
				</div>
			</div>
			<!-- logoout and welcome placeholder ends here -->

		</div>
		<!-- logo_area ends here -->

		<!-- menu starts here -->
		<div class="menu_bar">
			<div class="top_menu_set">


				<a href="javascript://" class="current_btn" style="margin-top: 1px;"><span>Subscribe</span></a>

			</div>
			<!-- menu ends here -->
		</div>
		<!-- content starts here -->
		<div class="body_content">



			<!-- <fieldset title="Personal Information"  style="border: 1px solid silver;margin-left: 3%;margin-top: 2%;clear: both;width:92%;border-radius:10px;">
		 <legend style="color:silver;">Personal Information</legend>

			<form class="field_outer" id="subscription_form" action="applySubscription.adm">
		
				<div class = "field_container">
					<label class = "field_lable">Title:</label>
					<select name = "title_signup" id = "title_signup" class = "drop_txt_sub" >
						<option>Mr.</option>
					    <option>Miss.</option>
					    <option>Mrs.</option>
					    <option>Ms.</option>
					</select>
					<span class = "error_field_title" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">First Name:<em style = "color:red;">*</em></label>
					<input name = "first_name_signup" id = "first_name_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_first_name" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">Middel Name:</label>
					<input name = "midel_name_signup" id = "midel_name_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_midel_name" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">Last Name:</label>
					<input name = "last_name_signup" id = "last_name_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_last_name" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">E-mail:<em style = "color:red;">*</em></label>
					
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">Language:</label>
					
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">Address 1:<em style = "color:red;">*</em></label>
					<input name = "address1_signup" id = "address1_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_address1" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Address 2:</label>
					<input name = "address2_signup" id = "address2_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_address2" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Address 3:</label>
					<input name = "address3_signup" id = "address3_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_address3" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">Country:</label>
					<select name = "country_signup" id ="country_signup"  class = "drop_txt" >
						<c:forEach items="${countrieslist}"  var="count" varStatus="countStatus">
							<option value = "${count.COUNTRY_ID}">${count.COUNTRY_NAME}</option>
						</c:forEach>
						
					</select>
					<span class = "error_field" id = "error_field_country" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">City:<em style = "color:red;">*</em></label>
					<input name = "city_signup" id = "city_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_city" />
				</div>
				
				<div class = "field_container">
					<label class = "field_lable">State:<em style = "color:red;">*</em></label>
					<input name = "state_signup" id = "state_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_state" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Postal Code:<em style = "color:red;">*</em></label>
					<input name = "posla_code_signup" id = "posla_code_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_pstal_code" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Phone #:<em style = "color:red;">*</em></label>
					<input name = "phone_signup" id = "phone_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_phone" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Cell #:</label>
					<input name = "cell_signup" id = "cell_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_cell" />
				</div>
				<div class = "field_container">
					<label class = "field_lable">Fax #:</label>
					<input name = "fax_signup" id = "fax_signup" class = "input_txt" />
					<span class = "error_field" id = "error_field_fax" />
				</div>
				
				<div style = " float: left;width: 100%;">
					<input style = "float:right" type="submit" class = "subscribe blue-pill" value = "Submit" />
				</div>
			</form>
		</fieldset>
-->
			<div class="container">
				<form class="field_outer" id="subscription_form"
					action="applySubscription.adm">

					<div class="container_left">

						<label>Title: </label> <select name="title_signup"
							id="title_signup" class="drop_txt_sub">
							<option>Mr.</option>
							<option>Miss.</option>
							<option>Mrs.</option>
							<option>Ms.</option>
						</select> <span class="error_label_grp_sub error_field_title"></span> <label>First
							Name:<em style="color: red;">*</em>
						</label> <input name="first_name_signup" type="text" class="input_txt_sub"
							id="first_name_signup" value="" maxlength="200" /> <span
							id="error_field_first_name" class="error_label_grp_sub"></span> <label>Middle
							Name: </label> <input name="midel_name_signup" type="text"
							class="input_txt_sub" id="midel_name_signup" value=""
							maxlength="200" /> <span id="error_field_midel_name"
							class="error_label_grp_sub"></span> <label>Last Name: </label> <input
							name="last_name_signup" type="text" class="input_txt_sub"
							id="last_name_signup" value="" maxlength="200" /> <span
							id="error_field_last_name" class="error_label_grp_sub"></span> <label>E-mail:<em
							style="color: red;">*</em>
						</label> <input name="email_signup" type="text" class="input_txt_sub"
							id="email_signup" value="" maxlength="255" /> <span
							id="error_field_email" class="error_label_grp_sub"></span> <label>Language:
						</label> <select name="language_signup" id="language_signup"
							class="drop_txt_sub">
							<c:forEach items="${Languageslist}" var="langu"
								varStatus="langStatus">
								<option value="${langu.language_id}">${langu.name}</option>
							</c:forEach>
						</select> <span class="error_label_grp_sub" id="error_field_language"></span>

						<label>Phone:<em style="color: red;">*</em>
						</label> <input name="phone_signup" id="phone_signup" type="text"
							class="input_txt_sub" id="" value="" maxlength="20" /> <span
							class="error_label_grp_sub" id="error_field_phone"></span> <label>Cell:
						</label> <input name="cell_signup" type="text" class="input_txt_sub"
							id="cell_signup" value="" maxlength="16" /> <span
							id="error_field_cell" class="error_label_grp_sub"></span> <label>Fax:
						</label> <input name="fax_signup" type="text" class="input_txt_sub"
							id="fax_signup" value="" maxlength="16" /> <span
							id="error_field_fax" class="error_label_grp_sub"></span>

					</div>

					<div class="container_left">
						<label>Address 1:<em style="color: red;">*</em>
						</label> <input name="address1_signup" type="text" class="input_txt_sub"
							id="address1_signup" value="" maxlength="255" /> <span
							class="error_label_grp_sub" id="error_field_address1"></span> <label>Address
							2: </label> <input name="address2_signup" type="text"
							class="input_txt_sub" id="address2_signup" value=""
							maxlength="255" /> <span class="error_label_grp_sub"
							id="error_field_address2"></span> <label>Address 3: </label> <input
							name="address3_signup" type="text" class="input_txt_sub"
							id="address3_signup" value="" maxlength="255" /> <span
							class="error_label_grp_sub" id="error_field_address3"></span> <label>City:<em
							style="color: red;">*</em>
						</label> <input name="city_signup" type="text" class="input_txt_sub"
							id="city_signup" value="" maxlength="255" /><span
							class="error_label_grp_sub" id="error_field_city"></span> <label>State:</label>
						<input name="state_signup" type="text" class="input_txt_sub"
							id="state_signup" value="" maxlength="255" /> <span
							class="error_label_grp_sub" id="error_field_state"></span> <label>Country:
						</label> <select name="country_signup" id="country_signup"
							class="drop_txt_sub">
							<c:forEach items="${countrieslist}" var="count"
								varStatus="countStatus">
								<option value="${count.COUNTRY_ID}">${count.COUNTRY_NAME}</option>
							</c:forEach>

						</select> <span class="error_label_grp_sub" id="error_field_country"></span>



						<label>Postal Code:<em style="color: red;">*</em></label> <input
							name="posla_code_signup" type="text" class="input_txt_sub"
							id="posla_code_signup" value="" maxlength="20" /> <span
							id="error_field_pstal_code" class="error_label_grp_sub"></span>
					</div>

					<div class="sub_buttons">
						<button class="blue-pill">Save</button>
						<button type="reset" class="grey-pill">Clear</button>
					</div>
				</form>
			</div>

			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="footer.jsp"%>
		<!-- footer ends here -->

	</div>
</body>
</html>
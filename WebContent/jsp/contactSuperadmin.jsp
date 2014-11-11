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

						$("#contactRequest_form").submit(
								function(event) {
									if (Check_isempty(event,
											'firstName_contact',
											'error_label_firstName'))
										CheckAlpha(event, 'firstName_contact',
												'error_label_firstName');

									if (Check_isempty(event,
											'lastName_contact',
											'error_label_lastname'))
										CheckAlpha(event, 'lastName_contact',
												'error_label_lastname');

									if (Check_isempty(event, 'company_contact',
											'error_label_company'))
										CheckAlpha(event, 'company_contact',
												'error_label_company');

									if (Check_isempty(event, 'email_contact',
											'error_label_email'))
										validateEmail(event, 'email_contact',
												'error_label_email');

									Check_isempty(event, 'address_contact',
											'error_label_address');

									if (Check_isempty(event, 'state_contact',
											'error_label_state'))
										CheckAlpha(event, 'state_contact',
												'error_label_state');

									if (Check_isempty(event, 'zip_contact',
											'error_label_zip'))
										Validate_Numeric(event, 'zip_contact',
												'error_label_zip');

									Check_isempty(event, 'comments_contact',
											'error_label_comments');

									$(".error_label_grp_sub").each(function() {
										if (!$(this).is(":visible")) {
											$(this).val("").show();
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
						$(".grey-pill").click(function() {

						});

					});
</script>


</head>

<body>

	<!-- wrapper starts here -->
	<div class="wrapper">

		<!-- logo_area starts here -->
		<div class="logo_area">
			<!-- logo placeholder here -->
			<div class="logo">
				<a href="ShowHomeIndex.home"><img src="images/logo.jpg"
					border="0" alt="logo" /></a>
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


				<a href="javascript://" class="current_btn" style="margin-top: 1px;"><span>Contact
						Us</span></a>

			</div>
			<!-- menu ends here -->
		</div>
		<!-- content starts here -->
		<div class="body_content">
			<div class="container">

				<div class="container_contact">

					<div class="contact_header">CONTACT US</div>
					<div class="contact_nor_txt">
						As the leading eClinical solution provider, Perceptive Informatics
						can help to improve the efficiency and productivity of your
						clinical studies with our comprehensive product portfolio.<br />
						<br /> If you have an upcoming trial, fill out the brief form
						below and we'll be in touch shortly.<br />
						<br /> If you required immediate assistance, please <a href="#"
							class="contactlink">contact Customer Care.</a>
					</div>
					<form id="contactRequest_form" action="saveContactRequest.adm">
						<label>Salutation: </label> <select name="salutation"
							class="drop_txt_sub">
							<option>Mr.</option>
							<option>Mrs.</option>
							<option>Miss.</option>
						</select> <span class="error_label_grp_contact"></span> <label>First
							Name: <span class="imp_field">*</span>
						</label> <input name="first_name" type="text" class="input_txt_sub"
							id="firstName_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact" id="error_label_firstName"></span>

						<label>Last Name: <span class="imp_field">*</span>
						</label> <input name="last_name" type="text" class="input_txt_sub"
							id="lastName_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact" id="error_label_lastname"></span>

						<label>Title: </label> <input name="title" type="text"
							class="input_txt_sub" id="title_contact" value="" maxlength="250" />
						<span class="error_label_grp_contact error_label_title"
							id="error_label_title"></span> <label>Department: </label> <input
							name="department" type="text" class="input_txt_sub"
							id="department_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact error_label_department "
							id="error_label_department"></span> <label>Company: <span
							class="imp_field">*</span>
						</label> <input name="company" type="text" class="input_txt_sub"
							id="company_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact error_label_company"
							id="error_label_company"></span> <label>E-mail Address: <span
							class="imp_field">*</span>
						</label> <input name="email" type="text" class="input_txt_sub"
							id="email_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact" id="error_label_email"></span> <label>Phone
							Number: </label> <input name="phone" type="text" class="input_txt_sub"
							id="phone_contact" value="" maxlength="20" /> <span
							class="error_label_grp_contact" id="error_label_phone"></span> <label>Address
							: <span class="imp_field">*</span>
						</label> <input type="text" name="address" class="input_txt_sub"
							id="address_contact" maxlength="250"></input> <span
							class="error_label_grp_contact" id="error_label_address"></span>

						<label>City: <span class="imp_field">*</span>
						</label> <input name="city" type="text" class="input_txt_sub"
							id="city_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact" id="error_label_city"></span> <label>State/Province:
							<span class="imp_field">*</span>
						</label> <input name="state" type="text" class="input_txt_sub"
							id="state_contact" value="" maxlength="250" /> <span
							class="error_label_grp_contact" id="error_label_state"></span> <label>Zip:
							<span class="imp_field">*</span>
						</label> <input name="zip" type="text" class="input_txt_sub"
							id="zip_contact" value="" maxlength="20" /> <span
							class="error_label_grp_contact" id="error_label_zip"></span> <label>Country:
							<span class="imp_field">*</span>
						</label> <select name="country" class="drop_txt_sub">
							<c:forEach var="country" items="${contries }">
								<option value="${country.COUNTRY_ID }">${country.COUNTRY_NAME}</option>
							</c:forEach>
						</select> <span class="error_label_grp_contact"></span> <label>How
							did you hear about us?</label> <select name="information"
							class="drop_txt_sub">
							<option>Newspaper</option>
							<option>Internet</option>
							<option>Friend</option>
							<option>email</option>
							<option>Other</option>
						</select> <span class="error_label_grp_contact"></span> <label>Referral
							Name:</label> <input name="refferal_name" type="text"
							class="input_txt_sub" id="referralName_contact" value=""
							maxlength="250" /> <span class="error_label_grp_contact"
							id="error_label_referralName"></span> <label>Comments : <span
							class="imp_field">*</span>
						</label>
						<textarea name="comments" cols="" rows="" id="comments_contact"
							class="input_txt_area"></textarea>
						<span class="error_label_grp_contact" id="error_label_comments"></span>

						<label><span class="imp_field">* </span> Required Fields</label>
						<div class="contact_buttons">
							<button class="blue-pill">Submit</button>
							<button type="reset" class="grey-pill">Clear</button>
						</div>
					</form>
				</div>



			</div>

			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<div class="footer_bar">
			<div class="footer_left">
				<a href="javascript://" class="flinks">Home</a> | <a
					href="javascript://" class="flinks">About Us</a> | <a
					href="javascript://" class="flinks">FAQ</a> | <a
					href="javascript://" class="flinks">Logout</a> | <a
					href="javascript://" class="flinks">Contact Us</a>
			</div>

			<div class="footer_right">© 2011, Al Rights Reserved.</div>
		</div>
		<!-- footer ends here -->

	</div>
</body>
</html>
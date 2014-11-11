//JavaScript Document

//---------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------Login Jquery-----------------------------------------------------------------
//----------------------------------------------Login JQuery-----------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------

$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});


$(document).ready(function() {

	
	var state=$("input#LoginMessageCode").val();
	
	if(state== '0')
	{
		$("#Login_User_Form_username_Error").show().text('Invalid Username/Password !');
	}
	
	$('#Login_User_Form').submit(function(event) {
		
		$("#Login_User_Form_password_Error").text("");
		
		$("#Login_User_Form_username_Error").text('Username Cannot be Empty !');
		var username=$.trim($("#Login_User_Form_username").val());
		var password=$.trim($("#Login_User_Form_password").val());
		
		if(username!="" && password!="")
		{
		}
		else if(username=="" && password=="")
		{			
			$("#Login_User_Form_username_Error").show();
			$("#Login_User_Form_password_Error").show();
			 event.preventDefault();
			 return;
		}
		else if(username=="" && password !="")
		{
			$("#Login_User_Form_username_Error").show();
			$("#Login_User_Form_password_Error").hide();
			 event.preventDefault();
			 return;
		}
		else if(username!="" && password =="")
		{
			$("#Login_User_Form_username_Error").hide();
			$("#Login_User_Form_password_Error").show();
			 event.preventDefault();
			 return;
		}
		
	});
	
	$(".forgetPasswords").click(function(){
		$(".forget_dialog").remove();
		var dialog =$("<div />").addClass("forget_dialog");
		dialog.append($("<span />").text("Enter your Registered Email Address!")).append($("<input />").addClass("image_bg_email").attr("id","email").css("width","400px"));
		$("body").append(dialog);
		dialog.dialog({
			modal:true,
			maxWidth:500,
			minWidth:500,
			 title: "Forget Password",
			 closeOnEscape: true,
			 maxHeight: 210,
			 minHeight: 210,
	         buttons: {
	             "Submit": function () {
	            	 $.post("forgetPassword.users?email="+$("#email").val(),function(data){
	            		$(".result").remove();
	            		 
	            		 var result = $("<div />").addClass("result");
	            		 result.append($("<span />").addClass("result_text"));
	            		 $("body").append(result);
	            		 result.dialog({
	            			 modal:true,
	            				width:450,
	            				 title: "Response",
	            				 closeOnEscape: true,
	            				 maxHeight: 100 
	            		 });
	            		if(data == "success"){
	            			result.find(".result_text").html("Your password has been sent to your Email Address.");
	            		}else{
	            			result.find(".result_text").html("Email sending fail! <br> please contact to the Admistrator");
	            		}
	
	            	 });
	            	 
	            	  $(this).dialog("close");
	              },
	             Cancel: function () {
	                 $(this).dialog("close");
	             }
	         }
		});
	});
	

	
 });




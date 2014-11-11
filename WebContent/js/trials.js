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
	
	
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	var state=$("input#InterfaceState").val();
	var msg=$("input#ApprovalStatusMessage").val();
	if(msg=='0' || msg=='1')
	{
		CreateApprovalstatusMessage(msg); 
	}

	var approvalform = $("input#InterfaceState").val(); 
	 $("#"+approvalform).show("slow").siblings().hide("slow");
	var submissionform = $("input#currentform").val(); 
	 $("#"+submissionform).show("slow").siblings().hide("slow");
	 var train_type_form = $("input#train_type_form").val(); 
	 $("#"+train_type_form).show("slow").siblings().hide("slow");
	 var usercv_form = $("input#usercv_form").val(); 
	 $("#"+usercv_form).show("slow").siblings().hide("slow"); 
	 var train_user_form = $("input#current_train_user_form").val(); 
	 $("#"+train_user_form).show("slow").siblings().hide("slow");
	 var current_submission_form = $("input#current_submission_form").val(); 
	 $("#"+current_submission_form).show("slow").siblings().hide("slow");
	 var current_medical_form = $("input#current_medical_form").val(); 
	 $("#"+current_medical_form).show("slow").siblings().hide("slow");
	 var current_contract_form = $("input#current_contract_form").val(); 
	 $("#"+current_contract_form).show("slow").siblings().hide("slow");
	 var current_financial_form = $("input#current_financial_form").val(); 
	 $("#"+current_financial_form).show("slow").siblings().hide("slow");
	 
	//====================================search bar has been clicked==============================================//
	
	 $("#View_Approval_Status_bar").keyup(function(){
		    $("#fbody").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Submission_Type_bar").keyup(function(){
		    $("#fbody2").find("tr").hide();
		    var data = this.value.split(" ");
	        var jo = $("#fbody2").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Training_bar").keyup(function(){
		    $("#fbody3").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody3").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_User_CV_bar").keyup(function(){
		    $("#fbody4").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody4").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Financial_Disc_bar").keyup(function(){
		    $("#fbody5").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody5").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Medical_License_bar").keyup(function(){
		    $("#fbody6").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody6").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Contract_bar").keyup(function(){
		    $("#fbody7").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody7").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_User_Training_bar").keyup(function(){
		    $("#fbody8").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody8").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 $("#View_Submission_bar").keyup(function(){
		    $("#fbody9").find("tr").hide();
	        var data = this.value.split(" ");
	        var jo = $("#fbody9").find("tr");
	        $.each(data, function(i, v){		
	             //Use the new containsIgnoreCase function instead
	             jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	        });
	        jo.show();
	
	    }).focus(function(){
	        this.value="";
	        $(this).css({"color":"black"});
	        $(this).unbind('focus');
	    }).css({"color":"#C0C0C0"});
	 
	 
	 
	// ====================================Approval atatus form has been submitted==============================================//
	$('#approval_status_type_form').submit(function(event) 
			{
		CheckAlphaNumeric(event,'code','code_error');
		CheckAlphaNumericWithoutSpace(event,'name','name_error');
		Check_isempty(event,'description','description_error');
		
			});
	
	// ====================================Submission Type form has been submitted==============================================//
	$('#submission_type_form').submit(function(event) 
			{
		
		CheckAlphaNumeric(event,'submission_code','submission_code_error');
		CheckAlphaNumericWithoutSpace(event,'submission_name','submission_name_error');
		Check_isempty(event,'submission_description','submission_description_error');
		
			}
	);
	
	// ====================================Training Form has been submitted==============================================//
	$('#training_form').submit(function(event) 
			{
		
		CheckAlphaNumeric(event,'training_code','training_code_error');
		CheckAlphaNumericWithoutSpace(event,'training_name','training_name_error');
		Check_isempty(event,'training_description','training_description_error');
		
			});
	
	// ====================================User CV has been submitted==============================================//
	
	$('#Create_UserCV').submit(function(event) 
			{
		if($("#upload_cv").val() == 0){
			$("#files_1").empty();
			$("#files_1").hide();
		}
		if($('#files_1 tr').length == 0){
			$("#usercvfileUploadError").show().html("Field is blank");
			Prevent_Event(event);
		
			}
	
		Check_isempty(event,'received_date','received_date_error');
		Check_isempty(event,'user_id','user_id_error');
		Check_isempty(event,'cv_file_description','cv_file_description_error');
			});
	// ====================================Training User form has been submitted==============================================//
	
	$('#Training_User_form').submit(function(event) 
			{
		if($("#upload_training").val() == 0){
			$("#files_2").empty();
		}
		
		if($('#files_2 tr').length == 0){
			$("#trainingfileError").html("Field is blank");
			Prevent_Event(event);
			}
		Check_isempty(event,'training_user_file_description','training_user_file_description_error');
		Check_isempty(event,'training_protocol','training_protocol_error');
		Check_isempty(event,'training_user_user','training_user_user_error');
		Check_isempty(event,'training_user_site','training_user_site_error');
		Check_isempty(event,'training_type','training_type_error');
		Check_isempty(event,'training_user_approval','training_user_approval_error');
		Check_isempty(event,'training_user_description','training_user_description_error');
		Check_isempty(event,'training_user_date','training_user_date_error');
		
			});
	
	// ====================================Subission Form has been submitted==============================================//
	
	$('#Submission_form').submit(function(event) 
			{
		if($('#files_3 tr').length != 0){
			Check_isempty(event,'submission_file_description','submission_file_description_error');	
		}
		if($('#files_3 tr').length == 0 && $("#submission_file_description").val()!=""){
			 $("#submission_file_description").val("");
		}
		CheckAlphaNumericWithoutSpace(event,'submission_regulatory_body_name','submission_regulatory_body_name_error');
		Check_isempty(event,'submission_regulatory_body_country','submission_regulatory_body_country_error');
		Check_isempty(event,'submission_protocol','submission_protocol_error');
		Check_isempty(event,'submission_type','submission_type_error');
		CheckAlphaNumericWithoutSpace(event,'create_submission_name','submission_name_Error');
		Check_isempty(event,'submission_date','submission_date_error');
		Check_isempty(event,'submission_approval','submission_approval_error');

			});
	// ====================================Medical License has been submitted==============================================//	
	$('#medical_license_form').submit(function(event) 
			{
		if($("#upload_medical").val() == 0){
			$("#files_4").empty();
		}
		
		if($('#files_4 tr').length == 0){
			
			$("#MedicalfileUploadError").html("Field is blank");
			Prevent_Event(event);
		
			}
		
		Check_isempty(event,'medical_protocol','medical_protocol_error');
		Check_isempty(event,'medical_license_site','medical_license_site_error');
		Check_isempty(event,'medical_license_user','medical_license_user_error');
		Check_isempty(event,'medical_license_date','medical_license_date_error');
		Check_isempty(event,'medical_license_start_date','medical_license_start_date_error');
		Check_isempty(event,'medical_license_expire_date','medical_license_expire_date_error');
		Check_isempty(event,'medical_license_type_id','medical_license_type_id_error');
		Check_isempty(event,'medical_license_description','medical_license_description_error');
		Check_isempty(event,'medical_license_file_description','medical_license_file_description_error');
			});
	
	// ====================================Financial Disclosure has been submitted==============================================//
	
	
	$('#financial_disclosure_form').submit(function(event) 
			{
		if($("#upload_financial_disc").val() == 0){
			$("#files_5").empty();
		}
		
		if($('#files_5 tr').length == 0){
			
			$("#fileUploadError").html("Field is blank");
			Prevent_Event(event);
		
			}
		
		Check_isempty(event,'financial_protocol','financial_protocol_error');
		Check_isempty(event,'financial_disclosure_site','financial_disclosure_site_error');
		Check_isempty(event,'financial_disclosure_user','financial_disclosure_user_error');
		Check_isempty(event,'financial_disclosure_signed_date','financial_disclosure_signed_date_error');
		Check_isempty(event,'financial_disclosure_received_date','financial_disclosure_received_date_error');
		Check_isempty(event,'financial_disclosure_type_id','financial_disclosure_type_id_error');
		Check_isempty(event,'financial_disclosure_description','financial_disclosure_description_error');
		Check_isempty(event,'financial_disclosure_file_description','financial_disclosure_file_description_error');
			});
	
	// ====================================Contracts has been submitted==============================================//
	
	
	$('#contract_form').submit(function(event) 
			{
		if($("#upload_contract").val() == 0){
			$("#files_6").empty();
		}
		
		if($('#files_6 tr').length == 0){
			
			$("#ContractfileUploadError").html("Field is blank");
			Prevent_Event(event);
		
			}
		
		Check_isempty(event,'contract_protocol','contract_protocol_error');
		Check_isempty(event,'contract_site','contract_site_error');
		Check_isempty(event,'contract_user','contract_user_error');
		Check_isempty(event,'contract_signed_date','contract_signed_date_error');
		Check_isempty(event,'contract_returned_date','contract_returned_date_error');
		Check_isempty(event,'contract_type_id','contract_type_id_error');
		Check_isempty(event,'contract_file_description','contract_file_description_error');
		Check_isempty(event,'contract_description','contract_description_error');
		
			});
	
	// Create Approval status type Message
	if($.trim($('#Create_Approval_Status_Type_Error').html())!="")
		$('#Create_Approval_Status_Type_Error').show();			
	else if($.trim($('#Create_Approval_Status_Type_Success').html())!="")
		$('#Create_Approval_Status_Type_Success').show();
		
	if($.trim($('#Edit_Approval_Status_Type_Error').html())!="")
		$('#Edit_Approval_Status_Type_Error').show();			
	else if($.trim($('#Edit_Approval_Status_Type_Success').html())!="")
		$('#Edit_Approval_Status_Type_Success').show();
	
	
	//Traing User Message 
	if($.trim($('#Edit_Training_User_Error').html())!="")
		$('#Edit_Training_User_Error').show();			
	else if($.trim($('#Edit_Training_User_Success').html())!="")
		$('#Edit_Training_User_Success').show();
	
	//Edit UserCV Message 
	if($.trim($('#Edit_UserCV_Error').html())!="")
		$('#Edit_UserCV_Error').show();			
	else if($.trim($('#Edit_UserCV_Success').html())!="")
		$('#Edit_UserCV_Success').show();
	
	//Submission Message 
	if($.trim($('#Edit_Submission_Type_Error').html())!="")
		$('#Edit_Submission_Type_Error').show();			
	else if($.trim($('#Edit_Submission_Type_Success').html())!="")
		$('#Edit_Submission_Type_Success').show();
		
	//Empty User training description
	$("textarea#training_user_file_description").val("");	
	
	// Edit Training Message
	if($.trim($('#Edit_training_Error').html())!="")
		$('#Edit_training_Error').show();			
	else if($.trim($('#Edit_training_Success').html())!="")
		$('#Edit_training_Success').show();
	
	// Edit Submission Message
	if($.trim($('#Edit_Submission_Error').html())!="")
		$('#Edit_Submission_Error').show();			
	else if($.trim($('#Edit_Submission_Success').html())!="")
		$('#Edit_Submission_Success').show();
	
	// Edit Medical License Message
	if($.trim($('#Edit_Medical_License_Error').html())!="")
		$('#Edit_Medical_License_Error').show();			
	else if($.trim($('#Edit_Medical_License_Success').html())!="")
		$('#Edit_Medical_License_Success').show();
	
	// Edit Financial Disclosure Message
	if($.trim($('#Edit_Financial_Disclosure_Error').html())!="")
		$('#Edit_Financial_Disclosure_Error').show();			
	else if($.trim($('#Edit_Financial_Disclosure_Success').html())!="")
		$('#Edit_Financial_Disclosure_Success').show();
	
	// Edit Contract Message
	if($.trim($('#Edit_Contract_Error').html())!="")
		$('#Edit_Contract_Error').show();			
	else if($.trim($('#Edit_Contract_Success').html())!="")
		$('#Edit_Contract_Success').show();
	
 });

function LoadTrialsForm(id){
	$("#"+id).show("slow").siblings().hide("slow");
	RefreshForm(id);
	for(var i = 1;i<6; i++){
	 $('#file_upload_'+i).attr('disabled',false);
	}
	$('#file_upload_'+3).attr('disabled',false);
	 $("#Create_training_Error").hide();
	 $('#Create_training_Success').hide();
     $("#UserCV_Error").hide();
	 $('#UserCV_Success').hide();
	 $("#Create_Approval_Status_Type_Success").hide();
	 $('#Create_Approval_Status_Type_Error').hide();
	 $("#Create_Submission_Type_Success").hide();
	 $('#Create_Submission_Type_Error').hide();
	 $("#Training_User_Error").hide();
	 $('#Training_User_Success').hide();
	 $("#Create_Submission_Error").hide();
	 $('#Create_Submission_Success').hide(); 
	 $("#Create_Contract_Success").hide();
	 $('#Create_Contract_Error').hide();
	 $("#Create_Financial_Disclosure_Success").hide();
	 $('#Create_Financial_Disclosure_Success').hide();
	 $('#Create_Medical_License_Success').hide();
	 $("#Create_Medical_License_Error").hide();
	 
	 $('.error_label_grp').hide();
	 $('.chk_avail_yes').hide();
}

//============================================================Patient Message==========================================================//

function CreateApprovalstatusMessage(val)
{	
	if(val == 0)
	{
		$('#Create_Approval_Status_Type_Error').html("Approval status type already exist");
		$("#Create_Approval_Status_Type_Success").hide();
		$('#Create_Approval_Status_Type_Error').show();
		$('#Create_Submission_Type_Error').html("Submission type already exist");
		$("#Create_Submission_Type_Success").hide();
		$('#Create_Submission_Type_Error').show();
		$('#Create_training_Error').html("Training already exist");
		$("#Create_training_Error").show();
		$('#Create_training_Success').hide();
		$('#UserCV_Error').html("User CV already exist");
		$("#UserCV_Error").show();
		$('#UserCV_Success').hide();
		$('#Training_User_Error').html("User Training already exist");
		$("#Training_User_Error").show();
		$('#Training_User_Success').hide();	
		$('#Create_Submission_Error').html("Submission already exist");
		$("#Create_Submission_Error").show();
		 $('#Create_Submission_Success').hide(); 
		 $("#Create_Contract_Success").hide();
		 $('#Create_Contract_Error').show();
		 $('#Create_Contract_Error').html("Contract already exist");
		 $("#Create_Financial_Disclosure_Success").hide();
		 $('#Create_Financial_Disclosure_Error').show();
		 $('#Create_Financial_Disclosure_Error').html("Financial Disclosure already exist");
		 $('#Create_Medical_License_Success').hide();
		 $("#Create_Medical_License_Error").show();
		 $("#Create_Medical_License_Error").html("Medical License already exist");
	}
	else if(val == 1)
	{
		$('#Create_Approval_Status_Type_Success').html("New approval status type has been created");
		$("#Create_Approval_Status_Type_Success").show();
		$('#Create_Approval_Status_Type_Error').hide();
		$('#Create_Submission_Type_Success').html("Submission type has been created");
		$("#Create_Submission_Type_Success").show();
		$('#Create_Submission_Type_Error').hide();
		$('#Create_training_Success').html("Training has been created");
		$("#Create_training_Error").hide();
		$('#Create_training_Success').show();
		$('#UserCV_Success').html("User CV has been created");
		$("#UserCV_Error").hide();
		$('#UserCV_Success').show();
		$('#Training_User_Success').html("User Training has been created");
		$("#Training_User_Success").show();
		$('#Training_User_Error').hide();	
		$('#Create_Submission_Success').html("Submission has been created");
		$("#Create_Submission_Error").hide();
		 $('#Create_Submission_Success').show();
		 $("#Create_Contract_Success").show();
		 $('#Create_Contract_Error').hide();
		 $('#Create_Contract_Success').html("Contract has been created");
		 $("#Create_Financial_Disclosure_Success").show();
		 $('#Create_Financial_Disclosure_Error').hide();
		 $('#Create_Financial_Disclosure_Success').html("Financial Disclosure has been created");
		 $('#Create_Medical_License_Success').show();
		 $("#Create_Medical_License_Error").hide();
		 $("#Create_Medical_License_Success").html("Medical License has been created");
	}
}

function edit_view_approval_status_type_row(id,code,name,description,date_created,created_by)
{
	//==
	$('#approval_status_type_title').html("Edit Approval Status Type");
	$('#edit_id_approval_status').val(id);
	$('#date_created').val(date_created);
	$('#created_by').val(created_by);
	$('#name').val(name);
	$('#code').val(code);
	$('#description').val(description);
	 $("#Create_Approval_Status_Type_div").show("slow").siblings().hide("slow");
	 $("#Create_Approval_Status_Type_Success").hide();
		$('#Create_Approval_Status_Type_Error').hide();	
		$('#code_error').html("");
		$('#name_error').html("");
		$('#description_error').html("");
	}

		function edit_view_submission_type_row(id,code,name,description,date_created,created_by)
		{
			//==
		
			$('#submission_type_title').html("Edit Submission Type");
			$('#edit_id_submission_type').val(id);
			$('#submission_date_created').val(date_created);
			$('#submission_created_by').val(created_by);
			$('#submission_name').val(name);
			$('#submission_code').val(code);
			$('#submission_name').val(name);
			$('#submission_description').val(description);
			 $("#Create_Submission_Type_div").show("slow").siblings().hide("slow");
			 $("#Create_Submission_Type_Success").hide();
				$('#Create_Submission_Type_Error').hide();	
				$('#submission_name_error').html("");
				$('#submission_code_error').html("");
				$('#submission_description_error').html("");
			}
		function edit_view_training_row(training_id,code,name,description,date_created,created_by){
			//==
			
			$('#training_type_title').html("Edit Training");
			$('#training_edit_id').val(training_id);
			$('#training_code').val(code);
			$('#training_name').val(name);
			$('#training_description').val(description);
			$('#training_date_created').val(date_created);
			$('#training_created_by').val(created_by);
			 $("#Create_Training_div").show("slow").siblings().hide("slow");
			 $("#Create_training_Error").hide();
				$('#Create_training_Success').hide();
				$('#training_code_error').html("");
				$('#training_name_error').html("");
				$('#training_description_error').html("");
			
		}
				function edit_view_usercv_row(user_cv_id,user_id,study_id,received_dt,date_created,created_by,filename,file_desc){
				//==
					
					$('#create_usercv_title').html("Edit User CV");
					$('#editusercv').val(1);
					$('#usercv_edit_id').val(user_cv_id);
					$('#usercv_date_created').val(date_created);
					$('#usercv_created_by').val(created_by);
					$('#user_id').val(user_id);
					$('#study_id').val(study_id);
					$('#cv_file_description').val(file_desc);
					$('#received_date').val(received_dt);
					$('#edit_1').val(1);
					  $("#files_1").append(
							
					                $('<tr class="grey_row_view_list">').append(
					                				$('<td>').text(filename)
					                             	)
					                
					               );
					  $("#files_1").show();
					 $("#UserCV_Error").hide();
						$('#UserCV_Success').hide();
						$("#upload_cv").val(2);
						
						$('#received_date_error').html("");
						$('#user_id_error').html("");
						$('#study_id_error').html("");
						 $("#Create_UserCV_div").show("slow").siblings().hide("slow");
				}
				
function edit_training_user_row(training_user_id,user_id,training_type,approval,training_dt,description,site_id,date_created,created_by,protocol_id,protocol_version,filename,file_desc){
//==
	$('#create_training_user_title').html("Edit Training User");
	$('#edittraininguser').val(1);
	$('#training_user_edit_id').val(training_user_id);
	$('#training_user_date_created').val(date_created);
	$('#training_user_created_by').val(created_by);
	$('#training_user_user').val(user_id);
	$('#training_user_site').val(site_id);
	$('#training_type').val(training_type);
	$('#training_user_approval').val(approval);
	$('#training_user_description').val(description);
	$('#training_user_file_description').val(file_desc);
	var str = protocol_id+"-"+ protocol_version;
	$('#training_protocol').val(str);
	$('#edit_2').val(1);
	  $("#files_2").append(
	                $('<tr class="grey_row_view_list">').append(
	                				$('<td>').text(filename)
	                             	)
	                
	               );
	$('#training_user_date').val(training_dt);
	
	 $("#Training_User_Success").hide();
		$('#Training_User_Error').hide();	
		 $("#upload_training").val(2);
		 
		 $('#training_protocol_error').html("");
			$('#training_user_user_error').html("");
			$('#training_user_site_error').html("");
			$('#training_type_error').html("");
			$('#training_user_approval_error').html("");
			$('#training_user_date_error').html("");
			 $("#Create_Training_User_div").show("slow").siblings().hide("slow");
}

function edit_submission_row(submission_id,name,submission_date,submission_type_id,site_id,description,approval_status_type_id,material_sent_date,sched_review_date,actual_review_date,approval_date,expiration_date,consent_date,created_by,date_created,protocol_id,version,filename,regulatorybody_name,regulatorybody_country,file_desc){
//==
	
	$('#create_submission_title').html("Edit Submission");
	$('#editsubmission').val(1);
	$('#submission_edit_id').val(submission_id);
	$('#submission_created_by').val(created_by);
	$('#create_submission_name').val(name);
	$('#submission_regulatory_body_name').val(regulatorybody_name);
	$('#submission_regulatory_body_country').val(regulatorybody_country);
	
	$('#create_submission_date_created').val(date_created);
	var str = protocol_id+"-"+version;
	$('#submission_protocol').val(str);
	$('#submission_type').val(submission_type_id);
	$('#submission_site').val(site_id);
	$('#submission_date').val(submission_date);
	$('#material_sent_date').val(material_sent_date);
	$('#schedule_review_date').val(sched_review_date);
	$('#actual_review_date').val(actual_review_date);
	$('#approval_date').val(approval_date);	
	$('#expiration_date').val(expiration_date);
	$('#concent_date').val(consent_date);
	$('#edit_3').val(1);
	if(filename != ""){
	  $("#files_3").append(
	                $('<tr class="grey_row_view_list">').append(
	                				$('<td>').text(filename)
	                             	)
	                
	               );
	}
	$('#submission_approval').val(approval_status_type_id);
	$('#submission_description').val(description);
	$('#submission_file_description').val(file_desc);
	 $("#Create_Submission_div").show("slow").siblings().hide("slow");
		$("#upload_submission").val(2);
		
		$('#submission_name_Error').html("");
		$('#submissionfileUploadError').html("");
		$('#submission_protocol_error').html("");
		$('#submission_type_error').html("");
		$('#submission_site_error').html("");
		$('#submission_date_error').html("");
		
		$('#material_sent_date_error').html("");
		$('#schedule_review_date_error').html("");
		$('#actual_review_date_error').html("");
		$('#approval_date_error').html("");
		$('#expiration_date_error').html("");
		$('#concent_date_error').html("");
		$('#submission_approval_error').html("");
}

function edit_medical_license_row(medical_lic_id,user_id,site_id,study_id,begin_dt,start_dt,expire_dt,description,type_id,created_by,date_created,protocol_id,version,filename,file_desc){

	//==
	
	$('#create_medical_license_title').html("Edit Medical License");
	$('#editmedical').val(1);
	$('#medical_license_edit_id').val(medical_lic_id);
	$('#medical_license_date_created').val(date_created);
	$('#medical_license_created_by').val(created_by);
	$('#medical_license_site').val(site_id);
	$('#medical_license_study_id').val(study_id);
	var str = protocol_id+"-"+version;
	$('#medical_protocol').val(str);
	$('#medical_license_user').val(user_id);
	$('#medical_license_date').val(begin_dt);
	$('#medical_license_start_date').val(start_dt);
	$('#medical_license_expire_date').val(expire_dt);
	$('#medical_license_description').val(description);
	$('#medical_license_file_description').val(file_desc);
	$('#edit_4').val(1);
	  $("#files_4").append(
	                $('<tr class="grey_row_view_list">').append(
	                				$('<td>').text(filename)
	                             	)
	                
	               );
	$('#medical_license_type_id').val(type_id);
	 $("#Create_Medical_License_div").show("slow").siblings().hide("slow");
		$("#upload_medical").val(2);
		
		$('#medical_protocol_error').html("");
		$('#medical_license_site_error').html("");
		$('#medical_license_study_id_error').html("");
		$('#medical_license_user_error').html("");
		$('#medical_license_date_error').html("");
		$('#medical_license_start_date_error').html("");
		$('#medical_license_expire_date_error').html("");
		$('#medical_license_type_id_error').html("");
}
function edit_view_financial_disclosure(financial_disc_id,site_id,study_id,user_id,signed_dt,received_dt,type_id,description,created_by,date_created,protocol_id,version,filename,file_desc){
	//==
	
	$('#financial_disclosure_title').html("Edit Financial Disclosure");
	$('#editfinancialdisc').val(1);
	$('#Financial_Disclosure_edit_id').val(financial_disc_id);
	$('#Financial_Disclosure_date_created').val(date_created);
	$('#Financial_Disclosure_created_by').val(created_by);
	$('#financial_disclosure_site').val(site_id);
	$('#financial_disclosure_study_id').val(study_id);	
	$('#financial_disclosure_user').val(user_id);
	$('#financial_disclosure_signed_date').val(signed_dt);
	$('#financial_disclosure_received_date').val(received_dt);
	var str = protocol_id+"-"+version;
	$('#financial_protocol').val(str);
	$('#edit_5').val(1);
	  $("#files_5").append(
	                $('<tr class="grey_row_view_list">').append(
	                				$('<td>').text(filename)
	                             	)
	                
	               );
	$('#financial_disclosure_type_id').val(type_id);
	$('#financial_disclosure_description').val(description);
	$('#financial_disclosure_file_description').val(file_desc);
	 $("#Create_Financial_Disclosure_div").show("slow").siblings().hide("slow");
		$("#upload_financial_disc").val(2);
		
		$('#financial_protocol_error').html("");
		$('#financial_disclosure_site_error').html("");
		$('#financial_disclosure_study_id_error').html("");
		$('#financial_disclosure_user_error').html("");
		$('#financial_disclosure_signed_date_error').html("");
		$('#financial_disclosure_received_date_error').html("");
		$('#financial_disclosure_type_id_error').html("");
}

function edit_contract_row(contract_id,site_id,study_id,user_id,signed_dt,returned_dt,type_id,description,created_by,date_created,protocol_id,version,filename,file_desc){
	
	$('#contracts_title').html("Edit Contracts");
	$('#contract_edit_id').val(contract_id);
	$('#contract_date_created').val(date_created);
	$('#contract_created_by').val(created_by);
	$('#contract_site').val(site_id);
	$('#contract_study_id').val(study_id);	
	$('#contract_user').val(user_id);
	$('#contract_signed_date').val(signed_dt);
	$('#contract_returned_date').val(returned_dt);
	var str = protocol_id+"-"+version;
	$('#contract_protocol').val(str);
	$('#contract_type_id').val(type_id);
	$('#contract_description').val(description);
	$('#contract_file_description').val(file_desc);
	$('#edit_6').val(1);
  $("#files_6").append(
                $('<tr class="grey_row_view_list">').append(
                				$('<td>').text(filename)
                             	)
                
               );
      
	$("#Create_Contract_div").show("slow").siblings().hide("slow");
	 $("#upload_contract").val(2);
	 $('#contract_protocol_error').html("");
		$('#contract_site_error').html("");
		$('#contract_study_id_error').html("");
		$('#contract_user_error').html("");
		$('#contract_signed_date_error').html("");
		$('#contract_returned_date_error').html("");
		$('#contract_type_id_error').html("");
}

function RefreshForm(id){
	$("#files_1").empty();
	$("#files_2").empty();
	$("#files_3").empty();
	$("#files_4").empty();
	$("#files_5").empty();
	 $("#files_6").empty();
	$('#editusercv').val(0);
	$('#editsubmission').val(0);
	$('#editfinancialdisc').val(0);
	$('#editmedical').val(0);
	$('#editcontract').val(0);
	$('#edittraininguser').val(0);
	
	$('#approval_status_type_title').html("Create Approval Status Type");
	$('#submission_type_title').html("Create Submission Type");
	$('#training_type_title').html("Create Training");
	$('#create_usercv_title').html("Create User CV");
	$('#create_training_user_title').html("Create Training User");
	$('#create_submission_title').html("Create Submission");
	$('#create_medical_license_title').html("Create Medical License");
	$('#financial_disclosure_title').html("Create Financial Disclosure");
	$('#contracts_title').html("Create Contracts");
	
	
	 if(id == "Create_Approval_Status_Type_div"){
			$('#edit_id_approval_status').val(0);
			$('#name').val("");
			$('#code').val("");
			$('#description').val("");
			$('#code_error').html("");
			$('#name_error').html("");
			$('#description_error').html("");
	}
	else if(id == "Create_Submission_Type_div"){
		$('#edit_id_submission_type').val(0);
		$('#submission_name').val("");
		$('#submission_code').val("");
		$('#submission_description').val("");
		
		$('#submission_name_error').html("");
		$('#submission_code_error').html("");
		$('#submission_description_error').html("");
	}
	else if(id == "Create_Training_div"){
		$('#training_edit_id').val(0);
		$('#training_code').val("");
		$('#training_name').val("");
		$('#training_description').val("");
		
		$('#training_code_error').html("");
		$('#training_name_error').html("");
		$('#training_description_error').html("");
	}
	else if(id == "Create_UserCV_div"){
		$('#usercv_edit_id').val(0);
		$('#user_id').val("");
		$('#study_id').val("");
		$('#received_date').val("");
		
		$('#received_date_error').html("");
		$('#user_id_error').html("");
		$('#study_id_error').html("");
		$('#cv_file_description_error').html("");
		$("#usercvfileUploadError").hide();
	}
	else if(id == "Create_Training_User_div"){
		$('#training_user_edit_id').val(0);
		$('#training_user_user').val("");
		$('#training_user_site').val("");
		$('#training_type').val("");
		$('#training_user_approval').val("");
		$('#training_user_description').val("");
		
		$('#type_id').val("");
		$('#training_user_date').val("");	
		
		$('#training_protocol_error').html("");
		$('#training_user_user_error').html("");
		$('#training_user_site_error').html("");
		$('#training_type_error').html("");
		$('#training_user_approval_error').html("");
		$('#training_user_date_error').html("");
		$("#trainingfileError").hide();
		$('#training_user_description_error').html("");
		$('#training_user_file_description_error').html("");
		
	}
	else if(id == "Create_Submission_div"){
		
		$('#submission_edit_id').val(0);
	
		$('#submission_regulatory_body_name').val("");
		$('#submission_regulatory_body_country').val("");
		$('#create_submission_name').val("");
		$('#submission_type').val("");
		$('#submission_site').val("");
		$('#submission_date').val("");
		$('#material_sent_date').val("");
		$('#schedule_review_date').val("");
		$('#actual_review_date').val("");
		$('#approval_date').val("");	
		$('#expiration_date').val("");
		$('#concent_date').val("");
		$('#submission_approval').val("");
		$('#submission_description').val("");
		
		$('#submission_name_Error').html("");
		$('#submissionfileUploadError').html("");
		$('#submission_protocol_error').html("");
		$('#submission_type_error').html("");
		$('#submission_site_error').html("");
		$('#submission_date_error').html("");
		
		$('#material_sent_date_error').html("");
		$('#schedule_review_date_error').html("");
		$('#actual_review_date_error').html("");
		$('#approval_date_error').html("");
		$('#expiration_date_error').html("");
		$('#concent_date_error').html("");
		$('#submission_approval_error').html("");
		$('#submission_file_description_error').html("");

	}
	else if(id == "Create_Medical_License_div"){
		$('#medical_license_edit_id').val(0);
		$('#medical_license_site').val("");
		$('#medical_license_study_id').val("");	
		$('#medical_license_user').val("");
		$('#medical_license_date').val("");
		$('#medical_license_start_date').val("");
		$('#medical_license_expire_date').val("");
		$('#medical_license_description').val("");
		$('#medical_license_type_id').val("");
		
		$('#medical_protocol_error').html("");
		$('#medical_license_site_error').html("");
		$('#medical_license_study_id_error').html("");
		$('#medical_license_user_error').html("");
		$('#medical_license_date_error').html("");
		$('#medical_license_start_date_error').html("");
		$('#medical_license_expire_date_error').html("");
		$('#medical_license_type_id_error').html("");
		
		$('#MedicalfileUploadError').hide();
		$('#medical_license_file_description_error').html("");
		$('#medical_license_description_error').html("");
	}
	else if(id == "Create_Financial_Disclosure_div"){
		$('#Financial_Disclosure_edit_id').val(0);
		$('#financial_disclosure_site').val("");
		$('#financial_disclosure_study_id').val("");	
		$('#financial_disclosure_user').val("");
		$('#financial_disclosure_signed_date').val("");
		$('#financial_disclosure_received_date').val("");
		
		$('#financial_disclosure_type_id').val("");
		$('#financial_disclosure_description').val("");
		
		$('#financial_protocol_error').html("");
		$('#financial_disclosure_site_error').html("");
		$('#financial_disclosure_study_id_error').html("");
		$('#financial_disclosure_user_error').html("");
		$('#financial_disclosure_signed_date_error').html("");
		$('#financial_disclosure_received_date_error').html("");
		$('#financial_disclosure_type_id_error').html("");
		
		$('#fileUploadError').hide();
		$('#financial_disclosure_description_error').html("");
		$('#financial_disclosure_file_description_error').html("");
	}
	else if(id == "Create_Contract_div"){
		$('#contract_edit_id').val(0);
		$('#contract_site').val("");
		$('#contract_study_id').val("");	
		$('#contract_user').val("");
		$('#contract_signed_date').val("");
		$('#contract_returned_date').val("");
		
		$('#contract_type_id').val("");
		$('#contract_description').val("");
		
		$('#contract_protocol_error').html("");
		$('#contract_site_error').html("");
		$('#contract_study_id_error').html("");
		$('#contract_user_error').html("");
		$('#contract_signed_date_error').html("");
		$('#contract_returned_date_error').html("");
		$('#contract_type_id_error').html("");
		$("#ContractfileUploadError").hide();
		$('#contract_file_description_error').html("");
		$('#contract_description_error').html("");
	} 


}				
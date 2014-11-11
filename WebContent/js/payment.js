//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
var relatedto = "Site";
$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {
	
	AddNewStudyPaymentMessage();
	AddNewSitePaymentMessage();
	AddNewPatientPaymentMessage();
	
	if($('#HiddenValue13').val()!="" && $('#HiddenValue13').val()!= null){
		Reload_EditPaymentSchedule_Form();
	}
	 
	if($('#typeofaction').val()=="PatientPaymentSiteChange" || $('#typeofaction').val()=="PatientPaymentVisitChange"){
		Patient_payment_OnSiteVisitChange();
	}else if($('#typeofaction').val()=="EditPatientpayment"){
		Patient_payment_OnSiteVisitChange();
	}
	
	
	
	if($('#HiddenValue6').val()!="" || $('#HiddenValue6').val()!= null){
		$('#visit').val($('#HiddenValue6').val());
	}
	
	if($.trim($('#crf').val()) != "" || $.trim($('#visit').val()) != ""){
		$('#enable :input').attr('disabled', false);
	}else{
		$('#enable :input').attr('disabled', true);
	}
	
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
//=====================================which form to show=============================================//	
	var state=$("input#InterfaceState").val();	
	var msg = $("input#PaymentScheduleMessage").val();
	var frm = $("input#secondform").val();
	
	 $("#"+state).show("slow").siblings().hide("slow");
	
	if(msg=='0' || msg=='1' || msg=='2')
	{
		CreatePaymentScheduleMessage(msg); 
	}
	
	if($("option:selected", "#Add_Payment_Type").attr("id") == "Study")
	{
		 $("#payment_schedule_site").attr("disabled", true);	
		 $('#add_pyment_type_display').html("Payment Code is related to Study");
	}
	else if($("option:selected", "#Add_Payment_Type").attr("id") == "Site")
	{
		 $("#payment_schedule_site").attr("disabled", false);
		 $('#add_pyment_type_display').html("Payment Code is related to Site");
	}
	
	
	//==================================== Payment Schedule Form has been submitted==============================================////
	 
	$('#new_payment_schedule_form').submit(function(event) 
	{		
		var b,c,d= true;	
	
		Validate_Decimal_Within_Range(event,'amount','schedule_amount_error');
		//a=Check_isempty(event,'schedule_description','schedule_description_error');
		b=Check_isempty(event,'Add_Payment_Type','add_pyment_type_error');		
		c=Check_isempty(event,'visit','visit_error');
		//e=Check_isempty(event,'crf','crf_error');
		
		if($("#payment_schedule_site").attr("disabled")==false){			
			d=Check_isempty(event,'payment_schedule_site','payment_schedule_site_error');
		}
		else{
			$("#payment_schedule_site_error").hide();
		}
		
		if(b==true && c ==true && d==true){
			$('#enable :input').attr('disabled', false);
		}							
	});
	
	
	
	
	//==================================== Payment Code Form has been submitted==============================================////
	
	$('#new_payment_code_form').submit(function(event) 
			{
		CheckAlphaNumericWithoutSpace(event,'code','code_error');
		CheckAlphaNumericWithoutSpace(event,'name','name_error');
		CheckAlphaNumericWithoutSpace(event,'text','text_error');
		Check_isempty(event,'code_description','code_description_error');
		
			});
	
	//==================================== Create Site Payment Form has been submitted==============================================////
	/*
	if(frm == "1"){
		$('#create_site_payment_form').show();
		$('#chosse_site_form').hide();
	}
	else if(frm == "2"){
		$('#create_patient_payment_form').show();
		$('#chosse_site_form_crf').hide();
	}
	else{
		$('#create_patient_payment_form').hide();
		$('#chosse_site_form_crf').show();
		
		$('#create_site_payment_form').hide();
		$('#chosse_site_form').show();
	}
		*/
	
	
	$('#chosse_site_form_crf').submit(function(event) 
			{
		Check_isempty(event,'patient_site','Patient_site_error');
		$('#chosen_site_crf').val($('#patient_site').val());
		$('#selected_site2').val($('#chosen_site').val());
	
			});
	
	$('#chosse_site_form').submit(function(event) 
			{
		Check_isempty(event,'site','Site_selection_Error');
		$('#chosen_site').val($('#site').val());
		$('#selected_site').val($('#chosen_site').val());
	
			});
		
	$('#create_site_payment_form').submit(function(event) {
		
		if(document.getElementById("payment_status_site2").checked == true){
			$("input[name='payment_status']").val("Paid");
		}
		else if(document.getElementById("payment_status_site1").checked == true){
			$("input[name='payment_status']").val("Sent");
		}
		Check_isempty(event,'site','Site_selection_Error');
		Check_isempty(event,'Site_Payment_Type','Site_Payment_Type_Error');
		
		if(($('#Payment_To_User_name').val() == "User Name" || $('#Payment_To_User_name').val() == "") && ($('#Payment_To_User_address').val() == "User Address" || $('#Payment_To_User_address').val() == "") && $('#Payment_To_User').val() == ""){
			$('#Payment_To_User_name').val('');
			$('#Payment_To_User_address').val('');
			Check_isempty(event,'Payment_To_User_name','Payment_To_name_Error');
			Check_isempty(event,'Payment_To_User_address','Payment_To_address_Error');
			Check_isempty(event,'Payment_To_User','Payment_To_Error');
		}else if($.trim($('#Payment_To_User').val()) != ""){
			Check_isempty(event,'Payment_To_User','Payment_To_Error');
			$('#Payment_To_User_name').val("");
			$('#Payment_To_User_address').val("");
			$('#Payment_To_name_Error').hide();
			$('#Payment_To_address_Error').hide();
		}else if($.trim($('#Payment_To_User').val()) == ""){ 
			Check_isempty(event,'Payment_To_User_name','Payment_To_name_Error');
			Check_isempty(event,'Payment_To_User_address','Payment_To_address_Error');
			$('#Payment_To_Error').hide();
		}
	 
		
			
		Validate_Decimal(event,'payment_amount_site','Payment_Amount_Site_Error');
		Optional_Numeric_Range(event,'overhead','Overhead_Error_Site',0,100);
		if($('#overhead').val() != ""){
			var pay = parseInt($('#payment_amount_site').val());
			var overhead = parseInt($('#overhead').val());
			var per = pay * (overhead/pay);
			$('#total_pay_site').val(pay + per);
		}
		else
			$('#total_pay_site').val($('#payment_amount_site').val());
		Optional_Numeric(event,'cheque_no','Chequeno_error');
		Optional_Numeric(event,'po_no','PoNo_error');
		Optional_Numeric(event,'invoice_no','InvoiceNo_error');
		var cheq_no=$.trim($('#cheque_no').val());
		var date=$.trim($('#chequedate').val());
		
		if(cheq_no !="" && date == "")
		{	
			Check_isempty(event,'chequedate','Chequedate_Error');
		}

	});
	
	//==================================== Create Study Payment Form has been submitted==============================================////
	
	$('#create_study_payment_form').submit(function(event) 
	{
		if(document.getElementById("payment_status_study2").checked == true)
			$("input[name='payment_status']").val("Paid");
		else if(document.getElementById("payment_status_study1").checked == true)
			$("input[name='payment_status']").val("Sent");
		
		Check_isempty(event,'Study_Payment_Type','Study_payment_Type_error');

		if(($('#Study_Payment_To_User_name').val() =="User Name" || $('#Study_Payment_To_User_name').val() == "") && ($('#Study_Payment_To_User_address').val() == "User Address" || $('#Study_Payment_To_User_address').val() == "") && $('#Study_Payment_To_User').val() == ""){
			$('#Study_Payment_To_User_name').val('');
			$('#Study_Payment_To_User_address').val('');
			Check_isempty(event,'Study_Payment_To_User_name','Study_Payment_To_name_Error');
			Check_isempty(event,'Study_Payment_To_User_address','Study_Payment_To_address_Error');
			Check_isempty(event,'Study_Payment_To_User','Study_Payment_To_Error');
		}else if(Check_isempty(event,'Study_Payment_To_User','Study_Payment_To_Error')==true){
			$('#Study_Payment_To_User_name').val("");
			$('#Study_Payment_To_User_address').val("");
			$('#Study_Payment_To_name_Error').hide();
			$('#Study_Payment_To_address_Error').hide();
		}else if(Check_isempty(event,'Study_Payment_To_User','Study_Payment_To_Error')==false){
			Check_isempty(event,'Study_Payment_To_User_name','Study_Payment_To_name_Error');
			Check_isempty(event,'Study_Payment_To_User_address','Study_Payment_To_address_Error');
			$('#Study_Payment_To_Error').hide();
		}
		
		
		Validate_Decimal(event,'payment_amount_study','payment_amount_study_Error');		
		Optional_Numeric_Range(event,'study_overhead','Study_Overhead_Error',0,100);		
		Optional_Numeric(event,'study_cheque_no','study_cheque_no_Error');
		Optional_Numeric(event,'study_po_no','study_po_no_Error');
		Optional_Numeric(event,'study_invoice_no','study_invoice_no_Error');
		
		var cheq_no=$.trim($('#study_cheque_no').val());
		
		if($('#study_overhead').val() != ""){
			var pay = parseInt($('#payment_amount_study').val());
			var overhead = parseInt($('#study_overhead').val());
			var per = pay * (overhead/100);
			$('#total_pay_study').val(pay + per);
		}
		else
			$('#total_pay_study').val($('#payment_amount_study').val());
		
		var date=$.trim($('#study_chequedate').val());
		if(cheq_no !="" && date == "")
		{	
			Check_isempty(event,'study_chequedate','study_chequedate_Error');
		}
	
	});
	
	//==================================== Create Patient/Visit/Crf Payment Form has been submitted==============================================////
	
	$('#create_patient_payment_form').submit(function(event) 
	{
		
		if(document.getElementById("ppayment_status1").checked == true){
			$("input[name='payment_status']").val("Paid");
		}else if(document.getElementById("ppayment_status2").checked == true){
			$("input[name='payment_status']").val("Sent");
		}
		
		Check_isempty(event,'patient_site','Patient_site_error');
		Check_isempty(event,'patient_payment_num','patient_num_Error');
		Check_isempty(event,'Patient_Payment_Type','Patient_Payment_Type_error');
		Check_isempty(event,'patient_visit','patient_visit_Error');
		Check_isempty(event,'patient_payment_crf','patient_payment_crf_Error');
		Check_isempty(event,'Patient_Payment_Type','Patient_Payment_Type_error');
		
		
		if(($('#Patient_Payment_To_User_name').val() == "User Name" || $('#Patient_Payment_To_User_name').val() == "") && ($('#Patient_Payment_To_User_address').val()  == "User Address" ||$('#Patient_Payment_To_User_address').val()  == "") && $('#Patient_Payment_To_User').val() == ""){
			$('#Patient_Payment_To_User_name').val('');
			$('#Patient_Payment_To_User_address').val('');
			Check_isempty(event,'Patient_Payment_To_User_name','Patient_Payment_To_name_Error');
			Check_isempty(event,'Patient_Payment_To_User_address','Patient_Payment_To_address_Error');
			Check_isempty(event,'Patient_Payment_To_User','Patient_Payment_To_Error');
		}else if($('#Patient_Payment_To_User').val()!=""){
			if(Check_isempty(event,'Patient_Payment_To_User','Patient_Payment_To_Error')==true){

				$('#Patient_Payment_To_User_name').val("");
				$('#Patient_Payment_To_User_address').val("");
				$('#Patient_Payment_To_name_Error').hide();
				$('#Patient_Payment_To_address_Error').hide();
			}}else if($('#Patient_Payment_To_User').val()==""){
				Check_isempty(event,'Patient_Payment_To_User_name','Patient_Payment_To_name_Error');
				Check_isempty(event,'Patient_Payment_To_User_address','Patient_Payment_To_address_Error');
				$('#Patient_Payment_To_Error').hide();
		}
		
		Validate_Decimal(event,'payment_amount_patient','patient_amount_error');
		Optional_Numeric_Range(event,'patient_payment_overhead','patient_overhead_error',0,100);
		Optional_Numeric(event,'patient_payment_cheque_no','patient_cheque_no_Error');
		Optional_Numeric(event,'patient_payment_po_no','patient_po_no_Error');
		Optional_Numeric(event,'patient_payment_invoice_no','patient_invoice_no_Error');
		var cheq_no=$.trim($('#patient_payment_cheque_no').val());
		var date=$.trim($('#patient_payment_chequedate').val());
		
		if($('#patient_payment_overhead').val() != ""){
			var pay = parseInt($('#payment_amount_patient').val());
			var overhead = parseInt($('#patient_payment_overhead').val());
			var per = pay * (overhead/100);
			$('#total_pay_crf').val(pay + per);
		}
		else
			$('#total_pay_crf').val($('#payment_amount_patient').val());
		if(cheq_no !="" && date == "")
		{	
			Check_isempty(event,'patient_payment_chequedate','patient_chequedate_error');
		}
		
	});
	
	
	//==============================================================================================================//
	
	 
	
	
	//==============================================================================================================//
	
	 $("#visit").change(function(){
			if($('select#visit option:selected').val()=="" || $('select#visit option:selected').val()==null)
				return;			
			
			$('#typeofaction').val("OnVisitChange");
			
			$('#HiddenValue1').val($('select#visit option:selected').val());
			$('#HiddenValue10').val($('#amount').val());
			$('#HiddenValue11').val($('#schedule_description').val());
			$('#HiddenValue14').val($('select#Add_Payment_Type option:selected').val());
						
			$('form#paymentSchedulehiddenform').submit();		
	  });
	 
	 $("#payment_amount_study").change(function(){
		 if($.trim($('#study_overhead').val()) != ""){
				var pay = parseInt($('#payment_amount_study').val());
				var overhead = parseInt($('#study_overhead').val());
				var per = pay * (overhead/100);
				$('#total_pay_study').val(pay + per);
		}else{
			$('#total_pay_study').val($('#payment_amount_study').val());
		}
	 });
	 
	 $("#payment_amount_site").change(function(){
		 if($.trim($('#siteoverhead').val()) != ""){
				var pay = parseInt($('#payment_amount_site').val());
				var overhead = parseInt($('#siteoverhead').val());
				var per = pay * (overhead/100);
				$('#total_pay_site').val(pay + per);
		}else{
			$('#total_pay_site').val($('#payment_amount_site').val());
		}
	 });
	 
	 $("#payment_amount_patient").change(function(){
		 if($.trim($('#patient_payment_overhead').val()) != ""){
				var pay = parseInt($('#payment_amount_patient').val());
				var overhead = parseInt($('#patient_payment_overhead').val());
				var per = pay * (overhead/100);
				$('#total_pay_crf').val(pay + per);
		}else{
			$('#total_pay_crf').val($('#payment_amount_patient').val());
		}
	 });
	 	
	 
	 $("#crf").change(function(){
			var crf=$.trim($('#crf').val());
			var visit=$.trim($('#visit').val());
			if(crf != "" || visit != ""){
				$('#enable :input').attr('disabled', false);
			}
			else{
				$('#enable :input').attr('disabled', true);
			}			
	  });
	 
	  $("#patient_site").change(function(){
			if($('select#patient_site option:selected').val()=="" || $('select#patient_site option:selected').val()==null)
				return;			
			
			$('#typeofaction').val("PatientPaymentSiteChange");
			
			$('#ppHiddenValue1').val($('select#patient_site option:selected').val());
			$('#ppHiddenValue2').val();
			$('#ppHiddenValue3').val($('select#patient_visit option:selected').val());
			$('#ppHiddenValue4').val($('select#patient_payment_crf option:selected').val());
			$('#ppHiddenValue5').val($('select#Patient_Payment_Type option:selected').val());
			$('#ppHiddenValue6').val($('#payment_amount_patient').val());
			$('#ppHiddenValue7').val($('#patient_payment_overhead').val());
			$('#ppHiddenValue8').val($('#total_pay_crf').val());
			$('#ppHiddenValue9').val($('select#Patient_Payment_To_User option:selected').val());
			$('#ppHiddenValue10').val($('#Patient_Payment_To_User_name').val());
			$('#ppHiddenValue11').val($('#Patient_Payment_To_User_address').val());
			$('#ppHiddenValue12').val($('#patient_payment_cheque_no').val());
			$('#ppHiddenValue13').val($('#patient_payment_po_no').val());
			$('#ppHiddenValue14').val($('#patient_payment_invoice_no').val());
			$('#ppHiddenValue15').val($('#patient_payment_chequedate').val());			
							
			$('form#patientpaymenthiddenform').submit();	
	  });
	  
	  $("#patient_visit").change(function(){
			if($('select#patient_visit option:selected').val()=="" || $('select#patient_visit option:selected').val()==null)
				return;			
			
			$('#typeofaction').val("PatientPaymentVisitChange");
			
			$('#ppHiddenValue1').val($('select#patient_site option:selected').val());
			$('#ppHiddenValue2').val();
			$('#ppHiddenValue3').val($('select#patient_visit option:selected').val());
			$('#ppHiddenValue4').val();
			$('#ppHiddenValue5').val($('select#Patient_Payment_Type option:selected').val());
			$('#ppHiddenValue6').val($('#payment_amount_patient').val());
			$('#ppHiddenValue7').val($('#patient_payment_overhead').val());
			$('#ppHiddenValue8').val($('#total_pay_crf').val());
			$('#ppHiddenValue9').val($('select#Patient_Payment_To_User option:selected').val());
			$('#ppHiddenValue10').val($('#Patient_Payment_To_User_name').val());
			$('#ppHiddenValue11').val($('#Patient_Payment_To_User_address').val());
			$('#ppHiddenValue12').val($('#patient_payment_cheque_no').val());
			$('#ppHiddenValue13').val($('#patient_payment_po_no').val());
			$('#ppHiddenValue14').val($('#patient_payment_invoice_no').val());
			$('#ppHiddenValue15').val($('#patient_payment_chequedate').val());			
							
			$('form#patientpaymenthiddenform').submit();	
	  });
	  
	
	 $("#patient_payment_crf").click(function(){
		 var a = $("#patient_payment_crf option:selected").attr('id');
		    var substr = a.split('@1@1@1');
			$('#crf_status').val(substr[1]);
			var status=$('#crf_status').val();
			if($("#patient_payment_crf").val() != ""){
				if(status != "Filled"){
					document.getElementById("payment_status1").checked = true;
					jQuery("input[name='payment_status']").each(function(i) {
			            jQuery(this).attr('disabled', true);
			        });
				}
				else
				{
					jQuery("input[name='payment_status']").each(function(i) {
			            jQuery(this).attr('disabled', false);
			        });
				}
				
			}
			else{
				
				$('#crf_status').val("");
				jQuery("input[name='payment_status']").each(function(i) {
		            jQuery(this).attr('disabled', false);
		        });
			}
	     });
	 
	 $("#patient_payment_crf").keyup(function(){
		 var a = $("#patient_payment_crf option:selected").attr('id');
		    var substr = a.split('@1@1@1');
			$('#crf_status').val(substr[1]);
			var status=$('#crf_status').val();
			if($("#patient_payment_crf").val() != ""){
				if(status != "Filled"){
					document.getElementById("payment_status1").checked = true;
					
					jQuery("input[name='payment_status']").each(function(i) {
			            jQuery(this).attr('disabled', true);
			        });
				}
				else
				{
					jQuery("input[name='payment_status']").each(function(i) {
			            jQuery(this).attr('disabled', false);
			        });
				}
				
			}
			else{
				
				$('#crf_status').val("");
				jQuery("input[name='payment_status']").each(function(i) {
		            jQuery(this).attr('disabled', false);
		        });
			}
	     });
	 
	 $("#Add_Payment_Type").change(function(){
		 var a=$("#Add_Payment_Type option:selected").attr("id");		
		 
		 if(a == "Study"){
				relatedto = "Study";
				$("#payment_schedule_site").val("");	
				$("#payment_schedule_site").attr('disabled', true);	
				$('#add_pyment_type_display').html("Payment Code is Related to "+relatedto);
		  }
		  else{
				relatedto = "Site";
		        $("#payment_schedule_site").attr('disabled', false);
		        $('#add_pyment_type_display').html("Payment Code is Related to "+relatedto);	 
			}
	     });
	 
	 $("#Study_Payment_Type").click(function(){
			var a=$("#Study_Payment_Type option:selected").val();
		    var substr = a.split('@1@1@1');
			$("#payment_amount_study").val(substr[1]);
			$('#total_pay_study').val(substr[1]);
	     });
	 
	 $("#Study_Payment_Type").keyup(function(){
			var a=$("#Study_Payment_Type option:selected").val();
		    var substr = a.split('@1@1@1');
			$("#payment_amount_study").val(substr[1]);
			$('#total_pay_study').val(substr[1]);
	     });
	 
	 $("#Patient_Payment_Type").click(function(){
			var a=$("#Patient_Payment_Type option:selected").val();
			var substr = a.split('@1@1@1');
			$("#payment_amount_patient").val(substr[1]);
			$('#total_pay_crf').val(substr[1]);
		
	     });
	 
	 $("#Patient_Payment_Type").keyup(function(){
			var a=$("#Patient_Payment_Type option:selected").val();
			var substr = a.split('@1@1@1');
			$("#payment_amount_patient").val(substr[1]);
			$('#total_pay_crf').val(substr[1]);
		
	     });
	 
	 $("#Site_Payment_Type").click(function(){
			var a=$("#Site_Payment_Type option:selected").val();
			var substr = a.split('@1@1@1');
			$("#payment_amount_site").val(substr[1]);
			$('#total_pay_site').val(substr[1]);
	     });
	 
	 $("#Site_Payment_Type").keyup(function(){
			var a=$("#Site_Payment_Type option:selected").val();
			var substr = a.split('@1@1@1');
			$("#payment_amount_site").val(substr[1]);
			$('#total_pay_site').val(substr[1]);
	     });
 
	 $("#Patient_Payment_To_User").click(function(){
		 if($("#Patient_Payment_To_User").val() == ""){
			 $("#Patient_Payment_To_User_name").attr('disabled',false);
			 $("#Patient_Payment_To_User_address").attr('disabled',false);
		 }			 
		 else{
			 $("#Patient_Payment_To_User_name").val("");
			 $("#Patient_Payment_To_User_address").val("");
			 $("#Patient_Payment_To_User_name").attr('disabled',true);
			 $("#Patient_Payment_To_User_address").attr('disabled',true);
		 }
			 
	     });
	 
	 $("#Patient_Payment_To_User").keyup(function(){
		 if($("#Patient_Payment_To_User").val() == ""){
			 $("#Patient_Payment_To_User_name").attr('disabled',false);
			 $("#Patient_Payment_To_User_address").attr('disabled',false);
		 }			 
		 else{
			 $("#Patient_Payment_To_User_name").val("");
			 $("#Patient_Payment_To_User_address").val("");
			 $("#Patient_Payment_To_User_name").attr('disabled',true);
			 $("#Patient_Payment_To_User_address").attr('disabled',true);
		 }
			 
	     });

	 $("#Study_Payment_To_User").click(function(){
		
		 if($("#Study_Payment_To_User").val() == ""){
			 $("#Study_Payment_To_User_name").attr('disabled',false);
			 $("#Study_Payment_To_User_address").attr('disabled',false);
		 }
		 else{
			 $("#Study_Payment_To_User_name").val("");
			 $("#Study_Payment_To_User_address").val("");
			 $("#Study_Payment_To_User_name").attr('disabled',true);
			 $("#Study_Payment_To_User_address").attr('disabled',true);
		 }
	     });
	 
	 $("#Study_Payment_To_User").keyup(function(){
			
		 if($("#Study_Payment_To_User").val() == ""){
			 $("#Study_Payment_To_User_name").attr('disabled',false);
			 $("#Study_Payment_To_User_address").attr('disabled',false);
		 }
		 else{
			 $("#Study_Payment_To_User_name").val("");
			 $("#Study_Payment_To_User_address").val("");
			 $("#Study_Payment_To_User_name").attr('disabled',true);
			 $("#Study_Payment_To_User_address").attr('disabled',true);
		 }
	     });
	 
	 $("#Payment_To_User").click(function(){
		 
		 if($("#Payment_To_User").val() == ""){
			 $("#Payment_To_User_name").attr('disabled',false);
			 $("#Payment_To_User_address").attr('disabled',false);
		 }
		 else{
			 $("#Payment_To_User_name").val("");
			 $("#Payment_To_User_address").val("");
			 $("#Payment_To_User_name").attr('disabled',true);
			 $("#Payment_To_User_address").attr('disabled',true);
		 }
	     });
	 
	 	$("#Payment_To_User").keyup(function(){
		 
			 if($("#Payment_To_User").val() == ""){
				 $("#Payment_To_User_name").attr('disabled',false);
				 $("#Payment_To_User_address").attr('disabled',false);
			 }
			 else{
				 $("#Payment_To_User_name").val("");
				 $("#Payment_To_User_address").val("");
				 $("#Payment_To_User_name").attr('disabled',true);
				 $("#Payment_To_User_address").attr('disabled',true);
			 }
	     });
	 
	 $("#patient_payment_overhead").keyup(function(event){
			if(Optional_Numeric_Range(event,'patient_payment_overhead','patient_overhead_error',0,100)){
				if($('#patient_payment_overhead').val() == "")
					$('#total_pay_crf').val($('#payment_amount_patient').val());
				else{
				var pay = parseInt($('#payment_amount_patient').val());
				var overhead = parseInt($('#patient_payment_overhead').val());
				var per = pay * (overhead/100);
				$('#total_pay_crf').val(pay + per);
				}
			}			
	
	    });
	 
	 $("#study_overhead").keyup(function(event){
		 if(Optional_Numeric_Range(event,'study_overhead','Study_Overhead_Error',0,100)){
			 if($('#study_overhead').val() == "")
				 $('#total_pay_study').val($('#payment_amount_study').val());
			 else{
				var pay = parseInt($('#payment_amount_study').val());
				var overhead = parseInt($('#study_overhead').val());
				var per =  pay * (overhead/100);
				$('#total_pay_study').val(pay + per);
			 }
			}
	
	    });
	 
	 $("#siteoverhead").keyup(function(){
		 if(Optional_Numeric_Range(event,'siteoverhead','Overhead_Error_Site',0,100)){
			 if($('#siteoverhead').val() == "")
				 $('#total_pay_site').val($('#payment_amount_site').val());
			 else{
				var pay = parseInt($('#payment_amount_site').val());
				var overhead = parseInt($('#siteoverhead').val());
				var per =  pay * (overhead/100);
				$('#total_pay_site').val(pay + per);
			 }
			
		 }
	
	    });
	
	//====================================search bar has been clicked==============================================//
	
	 $("#View_Payment_Schedule_Search_bar").keyup(function(){
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
	 
	 $("#View_Payment_Code_Search_bar").keyup(function(){
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
	 
	 
	//====================================search bar has been clicked==============================================//
		
	 $("#View_Payment_Search_bar").keyup(function(){
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
	
	

	// Payment Code Return  Message 
	    if($.trim($('#ViewPatient_Payment_Main_Error').html())!="")
			$('#ViewPatient_Payment_Main_Error').show();			
		else if($.trim($('#ViewPatient_Payment_Main_Success').html())!="")
			$('#ViewPatient_Payment_Main_Success').show();
	 
	    if($.trim($('#Edit_Payment_Code_Main_Error').html())!="")
			$('#Edit_Payment_Code_Main_Error').show();			
		else if($.trim($('#Edit_Payment_Code_Main_Success').html())!="")
			$('#Edit_Payment_Code_Main_Success').show();
	    
	    if($.trim($('#Payment_Code_Main_Error').html())!="")
			$('#Payment_Code_Main_Error').show();			
		else if($.trim($('#Payment_Code_Main_Success').html())!="")
			$('#Payment_Code_Main_Success').show();	
	    
	    if($.trim($('#Edit_Payment_Schedule_Main_Error').html())!="")
			$('#Edit_Payment_Schedule_Main_Error').show();			
		else if($.trim($('#Edit_Payment_Schedule_Main_Success').html())!="")
			$('#Edit_Payment_Schedule_Main_Success').show();	
	 
	 
});
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript


//============================================================Loading Forms==========================================================//

function AddNewPatientPaymentMessage(){
	if($.trim($('#Patient_Payment_Main_Error').html())!="")
		$('#Patient_Payment_Main_Error').show();			
	else if($.trim($('#Patient_Payment_Main_Success').html())!="")
		$('#Patient_Payment_Main_Success').show();
}

function AddNewStudyPaymentMessage()
{
	if($.trim($('#Study_Payment_Main_Error').html())!="")
		$('#Study_Payment_Main_Error').show();			
	else if($.trim($('#Study_Payment_Main_Success').html())!="")
		$('#Study_Payment_Main_Success').show();
}

function AddNewSitePaymentMessage()
{
	if($.trim($('#Site_Payment_Main_Error').html())!="")
		$('#Site_Payment_Main_Error').show();			
	else if($.trim($('#Site_Payment_Main_Success').html())!="")
		$('#Site_Payment_Main_Success').show();
}

function Loadpage(id)
{
	 $('.error_label_grp').hide();
	 $('.chk_avail_yes').hide();
	 $("#"+id).show("slow").siblings().hide();
}

function Patient_payment_OnSiteVisitChange(){
	$("#patient_site").val($.trim($('#ppHiddenValue1').val()));
	$("#patient_visit").val($.trim($('#ppHiddenValue3').val()));
	$("#patient_payment_crf").val($.trim($('#ppHiddenValue4').val()));
	$("#Patient_Payment_Type").val($.trim($('#ppHiddenValue5').val()));
	$("#payment_amount_patient").val($.trim($('#ppHiddenValue6').val()));
	$("#patient_payment_overhead").val($.trim($('#ppHiddenValue7').val()));
	$("#total_pay_crf").val($.trim($('#ppHiddenValue8').val()));
	$("#Patient_Payment_To_User").val($.trim($('#ppHiddenValue9').val()));
	$("#Patient_Payment_To_User_name").val($.trim($('#ppHiddenValue10').val()));
	$("#Patient_Payment_To_User_address").val($.trim($('#ppHiddenValue11').val()));
	$("#patient_payment_cheque_no").val($.trim($('#ppHiddenValue12').val()));
	$("#patient_payment_po_no").val($.trim($('#ppHiddenValue13').val()));
	$("#patient_payment_invoice_no").val($.trim($('#ppHiddenValue14').val()));
	$("#patient_payment_chequedate").val($.trim($('#ppHiddenValue15').val()));
}

/*
function  Refreshforms(id){
	    $("#Payment_Schedule_Main_Success").hide();
		$('#Payment_Schedule_Main_Error').hide();
		$("#Payment_Code_Main_Success").hide();
		$('#Payment_Code_Main_Error').hide();
		$("#Study_Payment_Main_Success").hide();
		$('#Study_Payment_Main_Error').hide();
		$("#Site_Payment_Main_Success").hide();
		$('#Site_Payment_Main_Error').hide();
		$("#Patient_Payment_Main_Error").hide();	
		$("#Patient_Payment_Main_Success").hide();
		    
    if(id=="New_Payment_Code_Div")
	{
    	 
    	 $("#code_description").val("");	
		 $("#related_to_site").attr('checked', false);	
		 $("#code").val("");
		 $("#name").val("");
		 $("#text").val("");
		 		
		 $('#edit_id').val(0);
		 $("#code_error").val("");
		 $("#name_error").val("");
		 $("#text_error").val("");
		 $("#code_description_error").val("");
	 }
	
    if(id=="New_Payment_Schedule_Div")
	{
    	 $("#schedule_description").val("");
    	 $("#payment_schedule_site").attr('disabled', false);	
		 $("#schedule_amount_error").html("");
		 $("#schedule_description_error").html("");
		 $("#add_pyment_type_error").html("");
		 $("#site_error").html("");	
		 
		 $('#edit_id').val(0);
		 $('#site').val("");
		 
		 $('#Add_Payment_Type').val("");
		 $('#visit').val("");
		 $('#crf').val("");
		 $("#amount").val("");
		 $('#visit_error').val("");
		 $('#payment_schedule_date_created').val(0);
		 $("#payment_schedule__createdby").val(0);
		 
		    if($("option:selected", "#Add_Payment_Type").attr("id") == "Study" || $("option:selected", "#Add_Payment_Type").attr("id") == "study")
			{
				 $("#payment_schedule_site").attr("disabled", "disabled");
				
			}
	 }
	
	 else if(id=="Study_Payment_Div")
	 {
		 $("#Study_payment_Type_error").html("");
		 $("#Study_Payment_To_Error").html("");
		 $("#payment_amount_study_Error").html("");
		 $("#Study_Overhead_Error").html("");
		 $("#study_cheque_no_Error").html("");
		 $("#study_po_no_Error").html("");
		 $("#study_invoice_no_Error").html("");
		 $("#study_chequedate_Error").html("");
			
		$('#edit_id_study_payment').val(0);
		$('#Payment_Type').val("");
		$('#edit_id_study_payment').val(0);
		$('#Payment_Type').val("");
		$('#payment_amount_study').val("");
		$('#study_overhead').val("");
		$('#Payment_To_User').val("");
		$('#study_cheque_no').val("");
		$('#study_po_no').val("");
		$('#study_invoice_no').val("");
		$('#study_chequedate').val("");
		$('#total_pay_study').val("");
		
		$('#Study_Payment_To_address_Error').val("");
		$('#Study_Payment_To_name_Error').val("");
		$('#payment_amount_study_Error').val("");
		$('#Study_Overhead_Error').val("");
		$('#study_cheque_no_Error').val("");
		$('#study_po_no_Error').val("");
		$('#study_invoice_no_Error').val("");	
		
		//$('#payment_amount_study').attr('disabled', false);
		$('#Study_Payment_Type').attr('disabled', false);
		$('#study_overhead').attr('disabled', false);
		$('#total_pay_study').attr('disabled', false);
		$('#Study_Payment_To_User').attr('disabled', false);
		$('#study_cheque_no').attr('disabled', false);
		$('#study_po_no').attr('disabled', false);
		$('#study_invoice_no').attr('disabled', false);
		$('#study_chequedate').attr('disabled', false);
		$('#Study_Payment_To_User_name').attr('disabled', false);
		$('#Study_Payment_To_User_address').attr('disabled', false);
		$('#submit11').attr('disabled', false);
		$('#payment_status').attr('disabled', false);
		$("[name=payment_status]").filter("[value=Sent]").attr("checked","checked");
			
	 }
	 else if(id=="Site_Payment_Div")
	 {
		
			$('#site').attr('disabled', false);
			$('#site_ok').attr('disabled', false); 
			
		 $('#create_site_payment_form').hide();
			$('#chosse_site_form').show();
		 $("#Site_selection_Error").html("");
		 $("#Site_Payment_Type_Error").html("");
		 $("#Payment_To_Error").html("");
		 $("#Payment_Amount_Site_Error").html("");
		 $("#Overhead_Error_Site").html("");
		 $("#Chequeno_error").html("");
		 $("#PoNo_error").html("");
		 $("#InvoiceNo_error").html("");
		 $("#Chequedate_Error").html("");	
				
		 $('#site').val(0);
			$('#overhead').val("");
			$('#Payment_To_User').val("");
			$('#cheque_no').val("");
			$('#po_no').val("");
			$('#invoice_no').val("");
			$('#chechequedate').val("");
			$('#payment_amount_site').val("");
			$('#total_pay_site').val("");
			
			$('#Chequedate_Error').val("");
			$('#Chequeno_error').val("");
			$('#PoNo_error').val("");
			$('#InvoiceNo_error').val("");
			$('#Site_selection_Error').val("");
			$('#Site_Payment_Type_Error').val("");
			$('#Payment_To_name_Error').val("");
			$('#Payment_To_address_Error').val("");
			$('#Payment_Amount_Site_Error').val("");
			$('#Overhead_Error_Site').val("");
			
			
			
			$('#site').attr('disabled', false);
			$('#site_payment_date_created').attr('disabled', false);
			$('#site_payment_createdby').attr('disabled', false);
			$('#Site_Payment_Type').attr('disabled', false);
			$('#overhead').attr('disabled', false);
			$('#total_pay_site').attr('disabled', false);
			$('#Payment_To_User').attr('disabled', false);;
			$('#cheque_no').attr('disabled', false);
			$('#po_no').attr('disabled', false);
			$('#invoice_no').attr('disabled', false);
			$('#chechequedate').attr('disabled', false);
			$('#payment_amount_site').attr('disabled', false);
			$('#Payment_To_User_name').attr('disabled', false);
			$('#Payment_To_User_address').attr('disabled', false);
			$('#submit1').attr('disabled', false);
			$('#payment_status').attr('disabled', false);
			$("[name=payment_status]").filter("[value=Sent]").attr("checked","checked");
	 }
	 else if(id=="Visit_Payment_Div")
	 {
		 $('#patient_site').attr('disabled', false);
			$('#crf_ok').attr('disabled', false);
		 $('#create_patient_payment_form').hide();
			$('#chosse_site_form_crf').show();
		 $("#Patient_site_error").html("");
		 $("#patient_num_Error").html("");
		 $("#Patient_Payment_Type_error").html("");
		 $("#Patient_Payment_To_Error").html("");
		 $("#patient_amount_error").html("");
		 $("#patient_overhead_error").html("");
		 $("#patient_cheque_no_Error").html("");
		 $("#patient_po_no_Error").html("");
		 $("#patient_invoice_no_Error").html("");
		 $("#patient_chequedate_error").html("");
		 $("#patient_visit_Error").html("");
		 $("#patient_payment_crf_Error").html("");
		 
		 $('#total_pay_crf').val("");
		 $('#edit_id_patient_payment').val(0);
		$('#patient_site').val("");
		$('#patient_payment_num').val("");
		$('#Patient_Payment_Type').val("");
		$('#patient_visit').val("");
		$('#patient_payment_crf').val("");
		$("#payment_amount_patient").val("");
		$("#patient_payment_overhead").val("");
		$("#patient_payment_po_no").val("");
		$("#patient_payment_invoice_no").val("");
		$("#patient_payment_cheque_no").val("");
		$("#patient_payment_chequedate").val("");
		
		$("#Patient_site_error").val("");
		$("#patient_num_Error").val("");
		$("#Patient_Payment_Type_error").val("");
		$("#Patient_Payment_To_name_Error").val("");
		$("#Patient_Payment_To_address_Error").val("");
		$("#Patient_Payment_To_Error").val("");
		$("#patient_amount_error").val("");
		$("#patient_overhead_error").val("");
		$("#patient_cheque_no_Error").val("");
		$("#patient_po_no_Error").val("");
		$("#patient_invoice_no_Error").val("");
		$("#patient_visit_Error").val("");
		$("#patient_payment_crf_Error").val("");
		$("#patient_chequedate_error").val("");
		
		
		$('#patient_site').attr('disabled', false);
		$('#patient_payment_crf').attr('disabled', false);
		$('#patient_payment_date_created').attr('disabled', false);
		$('#patient_payment_createdby').attr('disabled', false);
		$('#Patient_Payment_To_User').attr('disabled', false);
		$('#patient_payment_num').attr('disabled', false);
		$('#total_pay_crf').attr('disabled', false);
		$('#Patient_Payment_Type').attr('disabled', false);
		$('#patient_visit').attr('disabled', false);
		$("#payment_amount_patient").attr('disabled', false);
		$("#patient_payment_overhead").attr('disabled', false);
		$("#patient_payment_po_no").attr('disabled', false);
		$("#patient_payment_invoice_no").attr('disabled', false);
		$("#patient_payment_cheque_no").attr('disabled', false);
		$("#patient_payment_chequedate").attr('disabled', false);
		$("[name=payment_status]").attr('disabled', false);
		$('#Patient_Payment_To_User_name').attr('disabled', false);
		$('#Patient_Payment_To_User_address').attr('disabled', false);
		$("#submit111").attr('disabled', false);
		$('#payment_status').attr('disabled', false);
		$("[name=payment_status]").filter("[value=Sent]").attr("checked","checked");
	 }
 
 $('.error_label_grp').hide();
 $('.chk_avail_yes').hide();

}*/
function CreatePaymentScheduleMessage(val)
{	
	if(val == 0)
	{
		$('#Payment_Schedule_Main_Error').html("Payment Schedule has already been created");
		$("#Payment_Schedule_Main_Success").hide();
		$('#Payment_Schedule_Main_Error').show();
		$('#Payment_Code_Main_Error').html("Payment Code has already been created");
		$("#Payment_Code_Main_Success").hide();
		$('#Payment_Code_Main_Error').show();
		$('#Study_Payment_Main_Error').html("Payment has already been created");
		$("#Study_Payment_Main_Success").hide();
		$('#Study_Payment_Main_Error').show();
		$('#Site_Payment_Main_Error').html("Payment has already been created");
		$("#Site_Payment_Main_Success").hide();
		$('#Site_Payment_Main_Error').show();
		$('#Patient_Payment_Main_Error').html("Payment has already been created");
		 $("#Patient_Payment_Main_Error").show();	
		    $("#Patient_Payment_Main_Success").hide();

	}
	else if(val == 1)
	{
		 $('#Payment_Schedule_Main_Success').html("New Payment Schedule has been created");
		$("#Payment_Schedule_Main_Success").show();
		$('#Payment_Schedule_Main_Error').hide();	
		$('#Payment_Code_Main_Success').html("Payment Code has been created");
		$("#Payment_Code_Main_Success").show();
		$('#Payment_Code_Main_Error').hide();
		$('#Study_Payment_Main_Success').html("Payment has been created");
		$("#Study_Payment_Main_Success").show();
		$('#Study_Payment_Main_Error').hide();
		$('#Site_Payment_Main_Success').html("Payment has been created");
		$("#Site_Payment_Main_Success").show();
		$('#Site_Payment_Main_Error').hide();
		$('#Patient_Payment_Main_Success').html("Payment has been created");
		 $("#Patient_Payment_Main_Error").hide();	
		    $("#Patient_Payment_Main_Success").show();
	}
	else if(val == 2)
	{
		$('#Payment_Schedule_Main_Error').show();
		$('#Payment_Schedule_Main_Error').html("Sorry Schedule already exists. Please choose different criteria for Schedule !");
	}

}

function Reload_EditPaymentSchedule_Form(){
	$('#edit_id').val($('#HiddenValue13').val());
	$('#payment_schedule_title').html("Edit Payment Schedule");
	
	$('#Add_Payment_Type').val($('#HiddenValue14').val());
	$('#visit').val($('#HiddenValue7').val());
	$('#crf').val($('#HiddenValue8').val());
	$("#amount").val($('#HiddenValue10').val());	
	$("#schedule_description").val($('#HiddenValue11').val());
	$("[name=status]").filter("[value="+$('#HiddenValue9').val()+"]").attr("checked","checked");
	
	$("#Payment_Schedule_Main_Success").hide();
	$('#Payment_Schedule_Main_Error').hide();
	
	$("#New_Payment_Schedule_Div").show("slow").siblings().hide();
	
	$('#enable :input').attr('disabled', false);
	
}

function edit_payment_schedule(payment_schedule_id)
{	
	if(payment_schedule_id == "" || payment_schedule_id==null)
		return;			
	$('#typeofaction').val("EditPaymentSchedule");
	$('#HiddenValue2').val(payment_schedule_id);
	$('form#paymentSchedulehiddenform').submit();	
}

function edit_payment_code(payment_code_id,code,name,text,related_to,description)
{	
	
	$('#payment_code_title').html("Edit Payment Code");
	$('#code_edit_id').val(payment_code_id);
	//$('#code_date_created').val(date_created);
	$('#code').val(code);
	$('#name').val(name);
	$("#text").val(text);	
	$("#code_description").val(description);
	if(related_to == "Site")
		$("#related_to_site").attr("checked","checked");
	else
		$("#related_to_site").attr("checked",false);
	 $("#New_Payment_Code_Div").show("slow").siblings().hide();
	$("#Payment_Code_Main_Error").hide();
	$('#Payment_Code_Main_Success').hide();

}


 
function edit_view_study_payment(study_payment_id,site_id,payment_code_id,pay_amount,total_payment,overhead,pay_to,pay_to_user_name,pay_to_user_address,po_no,cheque_no,cheque_date,invoice_no,payment_status)
{
	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();
	if(site_id !="" && site_id !=null){
		$('#SitePaymentAddEdit').val(1);
		$('#Study_payment_id').val(study_payment_id);
		$('#site').val(site_id);
		$('#Site_Payment_Type').val(payment_code_id);
		$('#payment_amount_site').val(pay_amount);
		$('#siteoverhead').val(overhead);
		$('#total_pay_site').val(total_payment);
		$('#Payment_To_User').val(pay_to);
		$('#Payment_To_User_name').val(pay_to_user_name);
		$('#Payment_To_User_address').val(pay_to_user_address);
		$('#cheque_no').val(cheque_no);
		$('#po_no').val(po_no);
		$('#invoice_no').val(invoice_no);
		$('#chequedate').val(cheque_date);		
		$('input:radio[name="payment_status"]').filter('[value='+payment_status+']').attr('checked', true);	
		$("#Site_Payment_Div").show("slow").siblings().hide();
	}else{
			$('#payment_level').val(1);
			$('#edit_id_study_payment').val(study_payment_id);
			$('#Study_Payment_Type').val(payment_code_id);
			$('#payment_amount_study').val(pay_amount);
			$('#study_overhead').val(overhead);
			$('#total_pay_study').val(total_payment);
			$('#Study_Payment_To_User').val(pay_to);
			$('#Study_Payment_To_User_name').val(pay_to_user_name);
			$('#Study_Payment_To_User_address').val(pay_to_user_address);
			$('#study_cheque_no').val(cheque_no);
			$('#study_po_no').val(po_no);
			$('#study_invoice_no').val(invoice_no);
			$('#study_chequedate').val(cheque_date);
			$('input:radio[name="payment_status"]').filter('[value='+payment_status+']').attr('checked', true);
			$("#Study_Payment_Div").show("slow").siblings().hide();
		}
}

function clear(){
	 $("#Site_selection_Error").html("");
	 $("#Site_Payment_Type_Error").html("");
	 $("#Payment_To_Error").html("");
	 $("#Payment_Amount_Site_Error").html("");
	 $("#Overhead_Error_Site").html("");
	 $("#Chequeno_error").html("");
	 $("#PoNo_error").html("");
	 $("#InvoiceNo_error").html("");
	 $("#Chequedate_Error").html("");	
			
	 $('#site').val(0);
		$('#overhead').val("");
		$('#Payment_To_User').val("");
		$('#cheque_no').val("");
		$('#po_no').val("");
		$('#invoice_no').val("");
		$('#chechequedate').val("");
		$('#payment_amount_site').val("");
}

//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {
	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
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
	 
	    if($('#typeofaction').val()=="EditPatientpayment" || $('#typeofaction').val()=="EditPatientPaymentSiteChange" || $('#typeofaction').val()=="EditPatientPaymentVisitChange"){
	    	Patient_payment_OnSiteVisitChange();
	    	$('#PatientPaymentAddEdit').val(1);
	    	$('#current_patient_payment_id').val($('#ppHiddenValue16').val());
		}
	    
	    $("#patient_site").change(function(){
			if($('select#patient_site option:selected').val()=="" || $('select#patient_site option:selected').val()==null)
				return;			
			
			$('#typeofaction').val("EditPatientPaymentSiteChange");			
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
			$('#ppHiddenValue16').val($('#current_patient_payment_id').val());				
			$('form#patientpaymenthiddenform').submit();	
	  });
	  
	  $("#patient_visit").change(function(){
			if($('select#patient_visit option:selected').val()=="" || $('select#patient_visit option:selected').val()==null)
				return;			
			
			$('#typeofaction').val("EditPatientPaymentVisitChange");
			
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
			$('#ppHiddenValue16').val($('#current_patient_payment_id').val());				
			$('form#patientpaymenthiddenform').submit();	
	  });
	  
	  if($.trim($('#ViewPatient_Payment_Main_Error').html())!="")
			$('#ViewPatient_Payment_Main_Error').show();			
	  else if($.trim($('#ViewPatient_Payment_Main_Success').html())!="")
			$('#ViewPatient_Payment_Main_Success').show();
});

function CancelEditing(){
	 $('form#patientpaymenthiddenform1').submit();
}

function edit_view_patient_payment(patient_payment_id)
{
	if(patient_payment_id == "" || patient_payment_id==null)
		return;
	
	$('#typeofaction').val("EditPatientpayment");
	$('#ppHiddenValue16').val(patient_payment_id);
	$('form#patientpaymenthiddenform').submit();
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

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript


//============================================================Loading Forms==========================================================//

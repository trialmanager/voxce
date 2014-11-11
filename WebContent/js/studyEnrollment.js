//********************************************************************
//********************************************************************
//********************************************************************
//*************************JQuery*********************************
$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {
	

	 
	var protocolversionid=$.trim($('#protocolversion').val());
	$('#protocolselection').val(protocolversionid);
	
	$('#protocolselection').change(function() {
		if($('select#protocolselection option:selected').val()=="" || $('select#protocolselection option:selected').val()==null)
			return;					
		$('#protocol_version_id').val($('select#protocolselection option:selected').val());
		$('form#hiddenform').submit();		 	
	});
	
	
	var total = 0;	
	 $(".input_txt3").each(function(){
		 var val = parseFloat($(this).val());
		 total = total + val;		
	 });
	 $('#maxEnrolled').html(total+" / "+$('#maxenroll1').val());
	 
	$(".input_txt3").keyup(function(){
		
		$('#EnrollmentError').html("");		
		this.value = this.value.replace(/[^0-9\.]/g,'');
		
		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);		
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);
	});
	
	
	$('.input_txt3').blur(function() {
		 var a=parseFloat(0);
		 a=parseFloat($(this).val());
		 
		 var total = 0;	
		 $(".input_txt3").each(function(){
			 var val = parseFloat($(this).val());
			 total = total + val;});
		 
		 if(total>parseFloat($('#maxenroll1').val())){
			 
			 $('#EnrollmentError').html("Maximum allowed Enrollment limit is reached...");			 
			 $('#maxEnrolled').html(total-a+" / "+$('#maxenroll1').val());
			 $(this).val(0);
			 $('#EnrollmentError').show();	
		 }
		 else{
			 $('#maxEnrolled').html(total+" / "+$('#maxenroll1').val());
			 $('#EnrollmentError').hide();	
		 }
	});

	
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	
	
	//-----------------------------Start Site List search------------------------------------------------------------------
	//-----------------------------Start Site List search------------------------------------------------------------------
	//Start Studies List Search
	$("#viewStudyDocuments_Search_bar").keyup(function(){
        $("#fbody").find("tr").hide();
        var data = this.value.split(" ");
        var jo = $("#fbody").find("tr");
        $.each(data, function(iol, v){		
             //Use the new containsIgnoreCase function instead
             jo = jo.filter("*:containsIgnoreCase('"+v+"')");
        });
        jo.show();
    }).focus(function(){
        this.value="";
        $(this).css({"color":"black"});
        $(this).unbind('focus');
    }).css({"color":"#C0C0C0"});
	//End Studies List Search
	//-----------------------------End Site List search------------------------------------------------------------------
	//-----------------------------End Site List search------------------------------------------------------------------

	if($.trim($('#EnrollmentError').html())!="")
		$('#EnrollmentError').show();			
	else if($.trim($('#EnrollmentSuccess').html())!="")
		$('#EnrollmentSuccess').show();	
	
});

//********************************************************************
//********************************************************************
//********************************************************************
//*************************Javascript*********************************

function DocumentDeleteMessages()
{
	
}
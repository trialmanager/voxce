//********************************************************************
//********************************************************************
//********************************************************************
//*************************JQuery*********************************
//$(window).resize(function() {
//var width = $(document).width();
//width = width - 280;
//$('.right_body_content').css('width',width);
//});


$(document).ready(function() {

	var width = $(document).width();
	width = width - 280;
	$('.right_body_content').css('width',width);

	AutoLoadProtocolForm($("input#InterfaceState").val());
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
	$("#ViewProtocolSearch").keyup(function(){
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


	//***********************************Start Create Protocol*********************************************************

	$('#AddProtocolForm').submit(function(event){

		CheckAlphaNumeric(event,"AddProtocolIdentifier","AddProtocolIdentifierError");
		
		if(Check_isempty(event,"AddProtocolVersion","AddProtocolError"));
		//if(Check_isempty(event,"AddProtocolVersion","AddProtocolError")==true)
		//	CheckAlphaNumeric(event,"AddProtocolVersion","AddProtocolError");

		if(Check_isempty(event,"AddProtocolName","AddProtocolNameError"));
			
		//if(Check_isempty(event,"AddProtocolName","AddProtocolNameError")==true)
		//	CheckAlphaNumericWithoutSpace(event,"AddProtocolName","AddProtocolNameError");

		Validate_Numeric(event,"AddProtocolDuration","AddProtocolDurationError");				
		Validate_Numeric(event,"AddProtocolMaxEroll","AddProtocolMaxErollError");

		var AddProtocolStartDate = $.trim($("#AddProtocolStartDate").val());
		var lastprotocoldate = $.trim($("#lastprotocoldate").val());
		var nextprotocoldate =$.trim($("#AddProtocolNextDate").val());
		var previousprotocoldate =$.trim($("#AddProtocolPreviousDate").val());

		if((nextprotocoldate == "") && ((previousprotocoldate == ""))){
			if($("#AddProtocolIdentifier").attr('disabled') != "disabled"){
				if ( Date.parse(AddProtocolStartDate) <= Date.parse(lastprotocoldate) ) {  
					$("#AddProtocolStartDateError").show().html("Start Date Should be greater than last protocol i.e "+lastprotocoldate);
					Prevent_Event(event);
				}else{
					$("#AddProtocolStartDateError").hide();
				}
			}else if($("#AddProtocolIdentifier").attr('disabled') == "disabled"){
				$("#AddProtocolStartDateError").hide();
			}
		}else if((nextprotocoldate != "") && ((previousprotocoldate != ""))){
			if ( Date.parse(AddProtocolStartDate) >= Date.parse(nextprotocoldate) || Date.parse(AddProtocolStartDate) <= Date.parse(previousprotocoldate) ) {    
				$("#AddProtocolStartDateError").show().html("Start Date Should be between previous and next protocol i.e. (" +previousprotocoldate+")-("+nextprotocoldate+")");     
				Prevent_Event(event);
			}else{
				$("#AddProtocolStartDateError").hide();
			}
		}else if(nextprotocoldate == ""){
			if ( Date.parse(AddProtocolStartDate) <= Date.parse(previousprotocoldate) ) {  
				$("#AddProtocolStartDateError").show().html("Start Date Should be greater than last protocol i.e "+previousprotocoldate);
				Prevent_Event(event);
			}else{
				$("#AddProtocolStartDateError").hide();
			}
		}else if(previousprotocoldate == ""){
			if ( Date.parse(AddProtocolStartDate) >= Date.parse(nextprotocoldate) ) {  
				$("#AddProtocolStartDateError").show().html("Start Date Should be less than next protocol Start Date i.e "+nextprotocoldate);
				Prevent_Event(event);
			}else{
				$("#AddProtocolStartDateError").hide();
			}
		}

		if(event.isDefaultPrevented() != true){
			$("#AddProtocolIdentifier").attr('disabled',false);
			$("#AddProtocolVersion").attr('disabled',false);
		}

	});
	//***********************************End Create Protocol*********************************************************


	//***********************************Start Edit Study*********************************************************

	$('#EditStudyForm').submit(function(event){		

		//CheckAlphaNumericWithoutSpace(event,"studyname","studynameerror");
		Check_isempty(event,"studyname","studynameerror");
		Check_isempty(event,"clientname","clientnameerror");

	});
	//***********************************End Edit Study*********************************************************


	$('#AddprotocolCancelButton').click(function(){
		$('#ActionType').val("");
		$("#ViewStudyDetailDiv").show("slow").siblings().hide("slow");

		$('.error_label_grp').hide();
		$('.chk_avail_yes').hide();
		$("#AddProtocolNextDate").val("");
		$("#AddProtocolPreviousDate").val("");

		RestDates();
	});

	$('#EditStudyCancelButton').click(function(){
		$("#ViewStudyDetailDiv").show("slow").siblings().hide("slow");

		$('.error_label_grp').hide();
		$('.chk_avail_yes').hide();
		$("#AddProtocolNextDate").val("");
		$("#AddProtocolPreviousDate").val("");

		RestDates();
	});


	if($.trim($('#AddProtocol_Main_Error').html())!="")
		$('#AddProtocol_Main_Error').show();			
	else if($.trim($('#AddProtocol_Main_Success').html())!="")
		$('#AddProtocol_Main_Success').show();	
	else if($.trim($('#EditStudy_Main_Error').html())!="")
		$('#EditStudy_Main_Error').show();			
	else if($.trim($('#EditStudy_Main_Success').html())!="")
		$('#EditStudy_Main_Success').show();
});

//********************************************************************
//********************************************************************
//********************************************************************
//*************************Javascript*********************************
function EditProtocol(protocol_version_id,protocol_id,version,name,description,start_date,previous_date,next_date,duration,max_enrollment)
{	 
	$('#AddProtocolForm')[0].reset();
	$('#AddProtocolIdentifier').val(protocol_id);
	$("#AddProtocolIdentifier").attr('readonly','readonly');
	$("#AddProtocolIdentifier").attr('disabled',true);



	$('#AddProtocolVersion').val(version);
	//$("#AddProtocolVersion").attr('readonly','readonly');
	//$("#AddProtocolVersion").attr('disabled',true);

	$('#AddProtocolName').val(name);
	$('#AddProtocolDescription').val(description);
	$('#AddProtocolStartDate').val(start_date);
	$("#AddProtocolStartDate").attr('readonly','readonly');

	$('#AddProtocolDuration').val(duration);
	$('#AddProtocolMaxEroll').val(max_enrollment);
	$('#AddProtocolNextDate').val(next_date);
	$('#AddProtocolPreviousDate').val(previous_date);
	$("#AddProtocolDiv").show("slow").siblings().hide("slow");

	$('#ActionType').val(1);
	$('#protocol_version_id').val(protocol_version_id);

	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();	

}

function EditStudy(id,study_name,name,welcome_template,study_text)
{
	$('#studyname').val(study_name);
	$('#clientname').val(name);
	$('#wellcometemplate').val(welcome_template);

	$('#studytext').val(study_text);
	$('#studyidhidden').val(id);
	$("#EditStudyDiv").show("slow").siblings().hide("slow");

	RestDates();
}

function LoadNewProtocol(id)
{
	$('#AddProtocolForm')[0].reset();
	$("#AddProtocolDiv").show("slow").siblings().hide("slow");

	$("#AddProtocolIdentifier").attr('readonly',false);
	$("#AddProtocolIdentifier").attr('disabled',false);

	$("#AddProtocolVersion").attr('readonly',false);
	$("#AddProtocolVersion").attr('disabled',false);


	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();

	RestDates();
}

function AutoLoadProtocolForm(id)
{	
	if(id=="" || id== null)
		$("#ViewStudyDetailDiv").show("slow").siblings().hide("slow");
	else
		$("#"+id).show("slow").siblings().hide("slow");	


	RestDates();
}

function LoadProtocolForm(id)
{	
	$('#ViewProtocolerror_message').html("");
	$('#ViewProtocolsuccess_message').html("");
	$('#AddProtocol_Main_Error').html("");
	$('#AddProtocol_Main_Success').html("");

	if(id=="" || id== null)
		$("#ViewStudyDetailDiv").show("slow").siblings().hide("slow");
	else
		$("#"+id).show("slow").siblings().hide("slow");	

	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();

	RestDates();
}


function RestDates(){
	$("#AddProtocolNextDate").val("");
	$("#AddProtocolPreviousDate").val("");
	$("#AddProtocolStartDate").val();
}
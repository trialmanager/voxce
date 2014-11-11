////***************************************JQuery**************************************************************************
////***************************************JQuery**************************************************************************
////***************************************JQuery**************************************************************************
////***************************************JQuery**************************************************************************

//$(window).resize(function() {
//var width = $(document).width();
//width = width - 280;
//$('.right_body_content').css('width',width);
//});

$(document).ready(function() {


	// Start load current form

	var state=$("input#InterfaceState").val();
	//commented for testing

	//LoadFormHome(state);
	CreateStudyMessages();

	// Start load current form

	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	//-----------------------------End Case Insensitive search---------------------------------------------------------


	//-----------------------------Start Studies List search------------------------------------------------------------------
	//-----------------------------Start Studies List search------------------------------------------------------------------
	//Start Studies List Search
	$("#Home_Study_Viewstudy_div_Search_bar").keyup(function(){
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
	//-----------------------------End Studies List search------------------------------------------------------------------
	//-----------------------------End Studies List search------------------------------------------------------------------

	//-----------------------------Start SubStudies List search------------------------------------------------------------------
	//-----------------------------Start SubStudies List search------------------------------------------------------------------

	//Start SubStudies List Search
	$("#Home_Study_ViewSubstudy_div_Search_bar").keyup(function(){
		$("#sslbody").find("tr").hide();
		var data = this.value.split(" ");
		var jo = $("#sslbody").find("tr");
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
	//End SubStudies List Search
	//-----------------------------End SubStudies List search------------------------------------------------------------------
	//-----------------------------End SubStudies List search------------------------------------------------------------------
	$("#studyname").focusout(function(){
		//alert($("#studyname").val());
		$.post("CheckStudy.home?studyname="+$("#studyname").val(),function(data){
			$("#studynameerror").hide();
			if(data!="success"){
				$("#studynameerror").show();
				$("#studynameerror").text("Study Name Already Exists!!! ");
			}
		});
	});

	//-----------------------------Start Create Studies Form Submit------------------------------------------------------------------
	//-----------------------------Start Create Studies Form Submit------------------------------------------------------------------

	$('#CreateStudyForm').submit(function(event){

		CheckAlphaNumericWithoutSpace(event,'studyname','studynameerror');
		Check_isempty(event,'clientname','clientnameerror');
		CheckAlphaNumericWithoutSpace(event,'Home_Study_createstudy_code_field','Home_Study_createstudy_code_field_error');
		CheckAlphaNumeric(event,'ProtocolNumber','ProtocolNumberError');
		CheckAlphaNumeric(event,'ProtocolVersion','ProtocolVersionError');
		CheckAlphaNumericWithoutSpace(event,'ProtocolName','ProtocolNameError1');
		Check_isempty(event,'StartDate','StartDateError');
		Validate_Numeric(event,'ProtocolDuration','ProtocolDurationError');
		Validate_Numeric(event,'ProtocolEnrollment','ProtocolEnrollmentError');
	});

	//-----------------------------End  Create Studies Form Submit------------------------------------------------------------------
	//-----------------------------End  Create Studies Form Submit------------------------------------------------------------------

	//-----------------------------Start Create Sub Studies Form Submit------------------------------------------------------------------
	//-----------------------------Start Create Sub Studies Form Submit------------------------------------------------------------------

	$('#CreateSubStudyForm').submit(function(event){
		Check_isempty("Home_Study_createSubstudy_superstudyname","Home_Study_createSubstudy_superstudyname_error");
		Check_isempty("Home_Study_createSubstudy_studyname","Home_Study_createSubstudy_studyname_error");
		Check_isempty("Home_Study_createSubstudy_clientname","Home_Study_createSubstudy_clientname_error"); 
		//Check_isempty("Home_Study_createstudy_language","Home_Study_createstudy_language_error");
		Check_isempty("Home_Study_createSubstudy_startdate","Home_Study_createSubstudy_startdate_error");
		Validate_Numeric("Home_Study_createSubstudy_duration","Home_Study_createSubstudy_duration_error");
		Validate_Numeric("Home_Study_createSubstudy_enrollment","Home_Study_createSubstudy_enrollment_error");
		Check_isempty("Home_Study_createSubstudy_wellcometemplate","Home_Study_createSubstudy_wellcometemplate_error");
		Validate_Numeric("Home_Study_createSubstudy_protocolnumber","Home_Study_createSubstudy_protocolnumber_error");
		var selradiobutton=$('input[name=Home_Study_createSubstudy_codetype]:checked', '#CreateSubStudyForm').val();

		if(selradiobutton=="one")
		{
			Check_isempty("Home_Study_createSubstudy_code_field","Home_Study_createSubstudy_code_field_error");			
		}
		else if(selradiobutton=="two")
		{
			Check_isempty("Home_Study_createSubstudy_code_select","Home_Study_createSubstudy_code_select_error");
		}
	});

	//-----------------------------End  Create Sub Studies Form Submit------------------------------------------------------------------
	//-----------------------------End  Create Sub Studies Form Submit------------------------------------------------------------------



	/* createstudy form radio onchange
	$("input[name='Home_Study_createstudy_codetype']").change(function(){
		var createstudyselectedradiobutton=$('input[name=Home_Study_createstudy_codetype]:checked', '#CreateStudyForm').val();

		if(createstudyselectedradiobutton=="one")
		{
			$('#Home_Study_createstudy_code_field_error').html("");	
			$('#Home_Study_createstudy_code_select_error').html("");
			$('#Home_Study_createstudy_code_field').show();
			$('#Home_Study_createstudy_code_select').hide();
		}
		else if(createstudyselectedradiobutton=="two")
		{
			$('#Home_Study_createstudy_code_field_error').html("");	
			$('#Home_Study_createstudy_code_select_error').html("");
			$('#Home_Study_createstudy_code_field').hide();
			$('#Home_Study_createstudy_code_select').show();
		}
	});*/
	// createstudy form radio onchange

	/* pre selecting createstudy form radio
	$('input:radio[name=Home_Study_createstudy_codetype]')[0].checked = true;	
	$('#Home_Study_createstudy_code_field').show();
	$('#Home_Study_createstudy_code_select').hide();*/
	//pre selecting createstudy form radio

	// createsubstudy form radio onchange
	$("input[name='Home_Study_createSubstudy_codetype']").change(function(){
		var createsubstudyselectedradiobutton=$('input[name=Home_Study_createSubstudy_codetype]:checked', '#CreateSubStudyForm').val();

		if(createsubstudyselectedradiobutton=="one")
		{
			$('#Home_Study_createSubstudy_code_field_error').html("");	
			$('#Home_Study_createSubstudy_code_select_error').html("");

			$('#Home_Study_createSubstudy_code_field').show();
			$('#Home_Study_createSubstudy_code_select').hide();
		}
		else if(createsubstudyselectedradiobutton=="two")
		{
			$('#Home_Study_createSubstudy_code_field_error').html("");	
			$('#Home_Study_createSubstudy_code_select_error').html("");

			$('#Home_Study_createSubstudy_code_field').hide();
			$('#Home_Study_createSubstudy_code_select').show();
		}
	});
	// createsubstudy form radio onchange

	/* pre selecting createsubstudy form radio
	$('input[name="Home_Study_createSubstudy_codetype"]').prop('checked', true);
	$('#Home_Study_createSubstudy_code_field').hide();
	$('#Home_Study_createSubstudy_code_select').show();*/
	//pre selecting createsubstudy form radio
});






////***************************************Javascript**************************************************************************
////***************************************Javascript**************************************************************************
////***************************************Javascript**************************************************************************
////***************************************Javascript**************************************************************************

function CreateStudyMessages()
{
	if($.trim($('#Home_Study_createstudy_Main_Error').html())!="")
	{
		$('#Home_Study_createstudy_Main_Error').show();			
	}
	else if($.trim($('#Home_Study_createstudy_Main_Success').html())!="")
	{
		$('#Home_Study_createstudy_Main_Success').show();			
	}
}

function CreateSubStudyMessages()
{
	if($.trim($('#Home_Study_createSubstudy_Main_Error').html())!="")
	{
		$('#Home_Study_createSubstudy_Main_Error').show();			
	}
	else if($.trim($('#Home_Study_createSubstudy_Main_Success').html())!="")
	{
		$('#Home_Study_createSubstudy_Main_Success').show();			
	}
}
function LoadFormHome(id)
{	
	if(id=="" || id== null)
		$("#Home_Study_Viewstudy_div").show("slow").siblings().hide("slow");
	else
		$("#"+id).show("slow").siblings().hide("slow");
}

function NavigationFormHome(id)
{	
	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();

	if(id=="" || id== null)
		$("#Home_Study_Viewstudy_div").show("slow").siblings().hide("slow");
	else
		$("#"+id).show("slow").siblings().hide("slow");
}

//$('#Add_Site_Form')[0].reset();
//$('#Sites_Add_Div_Title').html("Add Site");


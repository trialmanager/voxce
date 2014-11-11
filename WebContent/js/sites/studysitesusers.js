//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

$(document).ready(function() {



	AddStudySiteUserMessage();
	//-----------------------------Start Setting Sites Multiselection css change----------------------------------------
	//-----------------------------Start Setting Sites Multiselection css changee----------------------------------------	 
	$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");
	$(".selected").width("300px");
	$(".available").width("300px");
	$(".search").width("150px");

	//-----------------------------End Setting Sites Multiselection css change----------------------------------------
	//-----------------------------End Setting Sites Multiselection css change----------------------------------------


	//Site User PreSelected & Unselected
	$("#hidennSelected_SiteUser").find("option").each(function(){
		var outer = $(this);
		$("#Add_StudySiteUser_select_siteuser").find("option").each(function(){
			if($(this).val() == outer.val()){
				$(this).attr("selected","selected");
			}
		});
	});
	//Site User PreSelected & Unselected


	// Study SiteChange PreSelection
	$('#Add_StudySiteUser_Study_Selection').val($('#HiddenValue3').val());
	$('#Add_StudySiteUser_Site_Selection').val($('#HiddenValue4').val());
	// Study Site Change PreSelection

	// Study SiteChange PreSelection
	$('#Add_StudySite_Study_Selection').val($('#HiddenValue5').val());
	$('#Add_StudySite_Site_Selection').val($('#HiddenValue6').val());
	// Study Site Change PreSelection	




	// -------------------------------Start Add Study Site User  Submit-----------------------------------------------------------------
	// ---------------------------------Start Add Study Site User Submit-------------------------------------------------------------

	$('#Add_StudySiteUser_Form').submit(function(event){
		var sitelen=$('select#Add_StudySiteUser_Site_Selection option').length;		
		var studylen=$('select#Add_StudySiteUser_Study_Selection option').length;		
		var sitesel=$('select#Add_StudySiteUser_Site_Selection').val();		
		var studysel=$('select#Add_StudySiteUser_Study_Selection').val();		

		if(studylen==0 || studysel==null)
		{
			$('#Add_StudySiteUser_Main_Error').html("Please Select a study...").show();
			$('#Add_StudySiteUser_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}
		else if(sitelen == 0 || sitesel== null)
		{
			$('#Add_StudySiteUser_Main_Error').html("Please Select a site !").show();
			$('#Add_StudySiteUser_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}
	});

	//--------------------------------- End End Study Site User Submit-------------------------------------------------------------------
	// ---------------------------------End End Study Site User Submit--------------------------------------------------------------------



	//----------------------------------End Save Site Form Submission----------------------------------
	//----------------------------------End Save Site Form Submission----------------------------------

	// ---------------------------------- Start Study and Site Onchange Events-----------------------------------

	$('#Add_StudySiteUser_Study_Selection').change(function() {
		if($('select#Add_StudySiteUser_Study_Selection option:selected').val()=="" || $('select#Add_StudySiteUser_Study_Selection option:selected').val()==null)
			return;					
		$('#typeofaction').val("GetStudySites");
		$('#HiddenValue1').val($('select#Add_StudySiteUser_Study_Selection option:selected').val());
		$('form#studysitehiddenform').submit();		 	
	});


	$('#Add_StudySiteUser_Site_Selection').change(function() {	
		$('#typeofaction').val("GetSiteUsers");
		$('#HiddenValue1').val($('select#Add_StudySiteUser_Study_Selection option:selected').val());
		$('#HiddenValue2').val($('select#Add_StudySiteUser_Site_Selection option:selected').val());
		$('form#studysitehiddenform').submit();		 
	});

	// ---------------------------------- End Study and Site Onchange Events-----------------------------------

});

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript


function AddStudySiteUserMessage()
{
	if($.trim($('#Add_StudySiteUser_Main_Error').html())!="")
		$('#Add_StudySiteUser_Main_Error').show();			
	else if($.trim($('#Add_StudySiteUser_Main_Success').html())!="")
		$('#Add_StudySiteUser_Main_Success').show();
}
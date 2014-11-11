//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

$(document).ready(function() {



	$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");
	$(".selected").width("300px");
	$(".available").width("300px");
	$(".search").width("150px");

	AddStudySiteLabMessage();

	//-----------------------------------------------------------------------------------------------------------------
	//-----------------------------Setting State of studysitelab on change site----------------------------------------

	if(!$.trim($('#SiteLaborotory_Add_study_Selection_preselect_response').val())== "")
	{
		$('#sitelab_StudySelection').val($('#SiteLaborotory_Add_study_Selection_preselect_response').val());			     
	}
	if(!$.trim($('#SiteLaborotory_Site_Selection_preselect_response').val())== "")
	{
		$('#sitelab_StudySelection').val($('#SiteLaborotory_Add_study_Selection_preselect_response1').val());
		$('#SiteLaborotory_Add_Site_Selection').val($('#SiteLaborotory_Site_Selection_preselect_response').val());
	}


	//-------------------------------Setting State of studysitelab on change site----------------------------------------
	//-----------------------------------------------------------------------------------------------------------------



	//-----------------------------Start Pre Selected & Unselected Labs---------------------------------------------------------
	$("#hidennSelected_Sitelab").find("option").each(function(){
		var outer = $(this);
		$("#SiteLaborotory_Add_Laborotory_Selection").find("option").each(function(){
			if($(this).val() == outer.val()){
				$(this).attr("selected","selected");
			}
		});
	});
	//-------------------------------End Pre Selected & Unselected Labs---------------------------------------------------------------



	//-----------------------------End Study Site Laborotory search------------------------------------------------------------------
	//-----------------------------End Study Site Laborotory search------------------------------------------------------------------

	// -------------------------------Start Add Study Site Laborotory  Submit-----------------------------------------------------------------
	// ---------------------------------Start Add Study Site Laborotory  Submit-------------------------------------------------------------

	$('#SiteLaborotory_Add_Form').submit(function(event){
		var studylen=$('select#sitelab_StudySelection option').length;		
		var sitelen=$('select#SiteLaborotory_Add_Site_Selection option').length;		
		var studysel=$('select#sitelab_StudySelection').val();		
		var sitesel=$('select#SiteLaborotory_Add_Site_Selection').val();		

		if(studylen==0 || studysel==null || studysel=="")
		{
			$('#SiteLaborotory_Add_Main_Error').html("Please Select a study...").show();
			$('#SiteLaborotory_Add_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}
		else if(sitelen == 0 || sitesel== null || sitesel== "")
		{
			$('#SiteLaborotory_Add_Main_Error').html("Please Select a site !").show();
			$('#SiteLaborotory_Add_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}
	});

	//--------------------------------- End End Study Site Laborotory Submit-------------------------------------------------------------------
	// ---------------------------------End End Study Site Laborotory Submit--------------------------------------------------------------------



	$('#sitelab_StudySelection').change(function() {

		if($('select#sitelab_StudySelection option:selected').val()=="" || $('select#sitelab_StudySelection option:selected').val()==null)
			return;			
		$('#SiteLaborotory_Add_study_Selection_preselect').val($('select#sitelab_StudySelection option:selected').val());
		$('form#SaveStudySitesLaborotoryStudyChangeForm').submit();		 
	});

	$('#SiteLaborotory_Add_Site_Selection').change(function() {

		if($('select#SiteLaborotory_Add_Site_Selection option:selected').val()=="" || $('select#SiteLaborotory_Add_Site_Selection option:selected').val()==null)
			return;			
		$('#SiteLaborotory_Add_study_Selection_preselect1').val($('select#sitelab_StudySelection option:selected').val());
		$('#SiteLaborotory_Site_Selection_preselect').val($('select#SiteLaborotory_Add_Site_Selection option:selected').val());
		$('form#SaveStudySitesLaborotorySiteChangeForm').submit();		 
	});

});

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript


function AddStudySiteLabMessage()
{
	if($.trim($('#SiteLaborotory_Add_Main_Error').html())!="")
	{
		$('#SiteLaborotory_Add_Main_Error').show();			
	}
	else if($.trim($('#SiteLaborotory_Add_Main_Success').html())!="")
	{
		$('#SiteLaborotory_Add_Main_Success').show();			
	}
}

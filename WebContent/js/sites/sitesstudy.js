//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

$(document).ready(function() {

	$(".grey-pill").click(function(){
//		$("#Add_StudySite_Form")[0].reset();
		window.location.reload();
	});


	AddSSMesCodefunc();
	var EditSSMesCode=$("input#EditSSMessageCode").val();
	if(EditSSMesCode=='0' || EditSSMesCode=='1' )
		EditSSMesCodefunc(EditSSMesCode); 


	// Study SiteChange PreSelection
	$('#Add_StudySite_studysitenumber').val($('#HiddenValue3').val());
	$('#Add_StudySite_Study_Selection').val($('#HiddenValue5').val());
	$('#Add_StudySite_Site_Selection').val($('#HiddenValue6').val());
	// Study Site Change PreSelection	


	//-----------------------------Start Setting Sites Multiselection css change----------------------------------------
	//-----------------------------Start Setting Sites Multiselection css changee----------------------------------------	 
	$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");

	$(".selected").width("300px");
	$(".available").width("300px");
	$(".search").width("150px");

	//-----------------------------End Setting Sites Multiselection css change----------------------------------------
	//-----------------------------End Setting Sites Multiselection css change----------------------------------------


	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	//-----------------------------End Case Insensitive search---------------------------------------------------------




	//-----------------------------Start Study Sites search------------------------------------------------------------------
	//-----------------------------Start Study Sites search------------------------------------------------------------------
	$("#View_StudySite_Search_bar").keyup(function(){
		$("#SSbody").find("tr").hide();
		var data = this.value.split(" ");
		var jo = $("#SSbody").find("tr");
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
	// End Start SponsorDivision Search
	//-----------------------------End Study Sites search------------------------------------------------------------------
	//-----------------------------End Study Sites search------------------------------------------------------------------




	//-----------------------------Start PreSelect Interface State------------------------------------------------------------------
	//-----------------------------Start PreSelect Interface State------------------------------------------------------------------
	var state=$("input#InterfaceState").val();	
	if(state=="" || state==null)
	{
		$('a[name="hrefSites_Study_add_div"]').attr('id', 'current');
		$("#Sites_Study_add_div").show("slow").siblings().hide("slow");
	}
	else
	{
		$("#"+state).show("slow").siblings().hide("slow");
		if(state=="Sites_Study_add_div")
		{
			$('a[name="hrefSites_Study_add_div"]').attr('id', 'current');
			$('a[name="hrefSites_Study_view_div"]').attr('id', '');
		}		 
		else if(state=="Sites_Study_view_div")
		{
			$('a[name="hrefSites_Study_add_div"]').attr('id', '');
			$('a[name="hrefSites_Study_view_div"]').attr('id', 'current');
		}

	}//Current Sponsor Form State	
	//-----------------------------End PreSelect Interface State------------------------------------------------------------------
	//-----------------------------End PreSelect Interface State------------------------------------------------------------------




	//-----------------------------------Add Study Site form--------------------------------------------------------------------
	//-----------------------------------Add Study Site form----------------------------------------------------------------------

	$('#Add_StudySite_Form').submit(function(event){

		var sitelen=$('select#Add_StudySite_Site_Selection option').length;		
		var studylen=$('select#Add_StudySite_Study_Selection option').length;		
		var sitesel=$('select#Add_StudySite_Site_Selection').val();		
		var studysel=$('select#Add_StudySite_Study_Selection').val();
		var InvestLen=$('select#Add_StudySite_Investigator_Selection').val();		
		var Investsel=$('select#Add_StudySite_Investigator_Selection').val();

		if(studylen==0 || studysel==null)
		{
			$('#Add_StudySite_Main_Error').html("Please Select a study...").show();
			$('#Add_StudySite_Main_Success').hide();
			Prevent_Event(event);
		}
		else if(sitelen == 0 || sitesel== null)
		{
			$('#Add_StudySite_Main_Error').html("Please Select a site !").show();
			$('#Add_StudySite_Main_Success').hide();
			Prevent_Event(event);
		}
		else if(Investsel == 0 || Investsel== null)
		{
			$('#Add_StudySite_Main_Error').html("Please Select an Investigator !").show();
			$('#Add_StudySite_Main_Success').hide();
			Prevent_Event(event);
		}
		Validate_Numeric(event,'Add_StudySite_studysitenumber','Add_StudySite_studysitenumber_error');
	});
	//---------------------------------End Study Site form------------------------------------------------------------
	//----------------------------------End Study Site form-----------------------------------------------------------





	$('#Add_Site_User_Site_name').change(function() {
		if($('select#Add_Site_User_Site_name option:selected').val()=="" || $('select#Add_Site_User_Site_name option:selected').val()==null)
			return;					
		$('#typeofaction').val("SiteUserChangeListener");
		$('#HiddenValue1').val($('select#Add_Site_User_Site_name option:selected').val());
		$('form#siteuserhiddenform').submit();		 	
	});

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

	$('#Add_StudySite_Site_Selection').change(function() {		
		if($('select#Add_StudySite_Site_Selection option:selected').val()=="" || $('select#Add_StudySite_Site_Selection option:selected').val()==null)
			return;			

		$('#typeofaction').val("StudySiteInvestigators");
		$('#HiddenValue1').val($('select#Add_StudySite_Study_Selection option:selected').val());
		$('#HiddenValue2').val($('select#Add_StudySite_Site_Selection option:selected').val());
		$('form#studysitehiddenform').submit();		 		 
	});

});

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript

function CheckInvestigator()
{
	$('#Add_StudySite_checkinvestigatorbutton').val(1);
}
function edit_view_studysite_row_show(id)
{
	document.getElementById(id).style.visibility="visible";
	//document.getElementById(id).style.visibility="collapse";
}

function edit_view_studysite_row_hide(id)
{
	//document.getElementById(id).style.visibility="visible";
	document.getElementById(id).style.visibility="collapse";
}

function edit_view_studysite_row_save(study_site_id,study_id,site_id)
{				
	$('#hiddenfieldstudysiteid').val(study_site_id);
	$('#hiddenfieldstudyid').val(study_id);
	$('#hiddenfieldsiteid').val($("#"+site_id).val());

	if( !confirm('Are you sure you want to change site for this study ?')) {
		return false; 
	}	
	$('#Edit_StudySitehidden_Form').submit();
}




function EditSSMesCodefunc(Code)
{
	if(Code == '0')
	{
		$("#View_StudySite_Main_Error").show();
		$("#View_StudySite_Main_Success").hide();
		document.getElementById('View_StudySite_Main_Error').innerHTML="Sorry! Study Site cannot be deleted!";
	}
	else if(Code == '1')
	{
		$("#View_StudySite_Main_Error").hide();
		$("#View_StudySite_Main_Success").show();
		document.getElementById('View_StudySite_Main_Success').innerHTML="Study Site successfully Deleted!";
	}

}

function AddSSMesCodefunc()
{
	if($.trim($('#Add_StudySite_Main_Error').html())!="")
		$('#Add_StudySite_Main_Error').show();			
	else if($.trim($('#Add_StudySite_Main_Error1').html())!="")
		$('#Add_StudySite_Main_Error1').show();
	else if($.trim($('#Add_StudySite_Main_Success').html())!="")
		$('#Add_StudySite_Main_Success').show();
}


function LoadSitesForm(id)
{
	if(id=="Sites_Study_add_div")
	{
		$('a[name="hrefSites_Study_add_div"]').attr('id', 'current');
		$('a[name="hrefSites_Study_view_div"]').attr('id', '');
	}
	else if(id=="Sites_Study_view_div")
	{
		$('a[name="hrefSites_Study_add_div"]').attr('id', '');
		$('a[name="hrefSites_Study_view_div"]').attr('id', 'current');		 
	}

	$('.error_label_grp').hide();
	$(".chk_avail_yes").hide();	

	$("#"+id).show("slow").siblings().hide("slow");
}
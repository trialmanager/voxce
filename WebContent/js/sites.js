//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {
	
	
	AddSiteUserMessageCodefunc();
	$('#Add_Site_User_Site_name').val($('#AddSiteMessageCode').val());
	
	//Site User PreSelected & Unselected
	$("#hidennSelected_SiteUser").find("option").each(function(){
		  var outer = $(this);
		  $("#Add_Site_User_select_user").find("option").each(function(){
		   if($(this).val() == outer.val()){
		    $(this).attr("selected","selected");
		   }
		  });
	});
	//Site User PreSelected & Unselected
	$("#Add_Site_Name").focusout(function(){
		$.post("CheckSite.sites?sitename="+$("#Add_Site_Name").val(),function(data){
			$("#Add_Site_Name_Error").hide();
			if(data!="success"){ 
				$("#Add_Site_Name_Error").text("Site Name Already Exists !!!").show();
			
			}
		});
	});
	
	// Study SiteChange PreSelection
		$('#Add_StudySiteUser_Study_Selection').val($('#HiddenValue3').val());
		$('#Add_StudySiteUser_Site_Selection').val($('#HiddenValue4').val());
	// Study Site Change PreSelection
		
	// Study SiteChange PreSelection
		$('#Add_StudySite_Study_Selection').val($('#HiddenValue5').val());
		$('#Add_StudySite_Site_Selection').val($('#HiddenValue6').val());
	// Study Site Change PreSelection	
	
	
	/*
	//-----------------------------Setting State of studysiteuser on change site----------------------------------------
	//-----------------------------Setting State of studysiteuser on change site----------------------------------------
	
	 var checkinvestigatorpreselectsite=$('#Sites_Study_add_div_siteid').val();
	 var checkinvestigatorpreselectstudy=$('#Sites_Study_add_div_studyid').val();
	 
	 if(checkinvestigatorpreselectstudy !=null)
	 {
		 $('#Add_StudySite_Study_Selection').val(checkinvestigatorpreselectstudy);
		 if(checkinvestigatorpreselectsite != null)
			 $('#Add_StudySite_Site_Selection').val(checkinvestigatorpreselectsite);
	 }
	 
	 var study=$('select#Add_StudySiteUser_Study_Selection option:selected').val(); 
	 if ($.browser.msie) 
	 {
		 $("#Add_StudySiteUser_Site_Selection option").attr('disabled', true);
		 $("#Add_StudySiteUser_Site_Selection option[id='"+study+"']").removeAttr('disabled');
		 $('#Add_StudySiteUser_Site_Selection').attr('selectedIndex', '-1');
	 }
	 else
	 {
		$("#Add_StudySiteUser_Site_Selection option").hide();
		$("#Add_StudySiteUser_Site_Selection option[id='"+study+"']").show();
		$('#Add_StudySiteUser_Site_Selection').attr('selectedIndex', '-1');
	 }	
	 
	 var AddstudySiteUsersiteidpreselect=$('#Add_StudySiteUser_Form_hidden_siteid_preselect').val();
	 var AddstudySiteUserstudyidpreselect=$('#Add_StudySiteUser_Form_hidden_studyid_preselect').val();
	 if(AddstudySiteUsersiteidpreselect !=null)
		 $('#Add_StudySiteUser_Site_Selection').val(AddstudySiteUsersiteidpreselect);
	 if(AddstudySiteUserstudyidpreselect != null)
		 $('#Add_StudySiteUser_Study_Selection').val(AddstudySiteUserstudyidpreselect);
	 
	//-----------------------------End Setting State of studysiteuser on change site----------------------------------------
	//-----------------------------End Setting State of studysiteuser on change site----------------------------------------
	 */
	//-----------------------------Start Setting Sites Multiselection css change----------------------------------------
	//-----------------------------Start Setting Sites Multiselection css changee----------------------------------------	 
		$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");
		 
		 $(".selected").width("300px");
		  $(".available").width("300px");
		  $(".search").width("150px");
		 /*
		   var modWidth = 300;
		   $(".ui-multiselect").width(100+'%');
		   $(".selected").width(modWidth);
		   $(".available").width(modWidth);
		   */
	//-----------------------------End Setting Sites Multiselection css change----------------------------------------
	//-----------------------------End Setting Sites Multiselection css change----------------------------------------
	
	 
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	
	
	
	 
	//-----------------------------Start Sites search------------------------------------------------------------------
	//-----------------------------Start Sites search------------------------------------------------------------------
	//Start Sites Search
	$("#View_Site_Search_bar").keyup(function(){
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
	// End Sites Search
	//-----------------------------End Sites search------------------------------------------------------------------
	//-----------------------------End Sites search------------------------------------------------------------------
	
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
	
	
	//-----------------------------Start Error Message Selection------------------------------------------------------------------
	//-----------------------------Start Error Message Selection------------------------------------------------------------------
	 
	
	
	var AddSiteMessageCode=$("input#AddSiteMessageCode").val();
	if(AddSiteMessageCode=='0' || AddSiteMessageCode=='1' ||  AddSiteMessageCode=='2' || AddSiteMessageCode=='3' || AddSiteMessageCode=='5')
		AddSiteMessageCodefunc(AddSiteMessageCode); 
	
	var EditSitemessagecode=$("input#EditSiteMessageCode").val();
	if(EditSitemessagecode=='0' || EditSitemessagecode=='1' ||  EditSitemessagecode=='2')                                                              		
		EditSitemessageCodefunc(EditSitemessagecode); 
	
	var AddSSMesCode=$("input#AddStudySiteMessageCode").val();
	if(AddSSMesCode=='0' || AddSSMesCode=='1' ||  AddSSMesCode=='2')
		AddSSMesCodefunc(AddSSMesCode); 
	
	var EditSSMesCode=$("input#EditStudySiteMessageCode").val();
	if(EditSSMesCode=='0' || EditSSMesCode=='1' )
		EditSSMesCodefunc(EditSSMesCode); 
	
	
	//-----------------------------End Error Message Selection------------------------------------------------------------------
	//-----------------------------End Error Message Selection------------------------------------------------------------------
	
	
	//-----------------------------Start PreSelect Interface State------------------------------------------------------------------
	//-----------------------------Start PreSelect Interface State------------------------------------------------------------------
	var state=$("input#InterfaceState").val();	
	if(state=="" || state==null)
	{
		$('a[name="hrefSites_Add_Div"]').attr('id', 'current');
		$("#Sites_Add_Div").show("slow").siblings().hide("slow");
		
	}
	else
	{
		
		 $("#"+state).show("slow");//.siblings().hide("slow");
		 if(state=="Sites_Add_Div")
		 {
			 $('#Add_Site_Form')[0].reset();
			
			 $('a[name="hrefSites_Add_Div"]').attr('id', 'current');
			 $('a[name="hrefSites_View_Div"]').attr('id', '');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 }
		 else if(state=="Sites_View_Div")
		 {
			
			 $('a[name="hrefSites_Add_Div"]').attr('id', '');
			 $('a[name="hrefSites_View_Div"]').attr('id', 'current');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 }
		 else if(state=="Sites_Study_add_div")
		 {
			 $('a[name="hrefSites_Add_Div"]').attr('id', '');
			 $('a[name="hrefSites_View_Div"]').attr('id', '');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', 'current');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 }		 
		 else if(state=="Sites_Study_view_div")
		 {
			 $('a[name="hrefSites_Add_Div"]').attr('id', '');
			 $('a[name="hrefSites_View_Div"]').attr('id', '');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', 'current');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 }
		 else if(state=="Add_Site_User_Div")
		 { 
			 $('a[name="hrefSites_Add_Div"]').attr('id', '');
			 $('a[name="hrefSites_View_Div"]').attr('id', '');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', 'current');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 }
		else if(state=="View_Site_User_Div")
		 {
			 $('a[name="hrefSites_Add_Div"]').attr('id', '');
			 $('a[name="hrefSites_View_Div"]').attr('id', '');
			 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
			 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
			 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			 $('a[name="hrefView_Site_User_Div"]').attr('id', 'current');
		 }
		 else if(state == "Add_StudySiteUser_div")
		 {
			$('a[name="hrefSites_Add_Div"]').attr('id', '');
			$('a[name="hrefSites_View_Div"]').attr('id', '');
			$('a[name="hrefSites_Study_add_div"]').attr('id', '');
			$('a[name="hrefSites_Study_view_div"]').attr('id', '');
			$('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			$('a[name="hrefView_Site_User_Div"]').attr('id', '');
			$('a[name="hrefAdd_StudySiteUser_div"]').attr('id', 'current');
		 }
		 else if(state=="View_StudySiteUser_div")
		 {
			$('a[name="hrefSites_Add_Div"]').attr('id', '');
			$('a[name="hrefSites_View_Div"]').attr('id', '');
			$('a[name="hrefSites_Study_add_div"]').attr('id', '');
			$('a[name="hrefSites_Study_view_div"]').attr('id', '');
			$('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
			$('a[name="hrefView_Site_User_Div"]').attr('id', '');
			$('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
			$('a[name="hrefView_StudySiteUser_div"]').attr('id', 'current');
		 }
	
	}//Current Sponsor Form State	
	//-----------------------------End PreSelect Interface State------------------------------------------------------------------
	//-----------------------------End PreSelect Interface State------------------------------------------------------------------
	
	
	// -------------------------------Start Add Study Site User  Submit-----------------------------------------------------------------
	// ---------------------------------Start Add Study Site User Submit-------------------------------------------------------------
	
	$('#Add_StudySiteUser_Form').submit(function(event){
		var sitelen=$('select#Add_StudySiteUser_Site_Selection option').length;		
		var studylen=$('select#Add_StudySiteUser_Study_Selection option').length;		
		var sitesel=$('select#Add_StudySiteUser_Site_Selection').val();		
		var studysel=$('select#Add_StudySiteUser_Study_Selection').val();		
		var number=$('select#Add_StudySiteUser_select_siteuser option:selected').length;
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
		else if(number<= 0)
		{
			$('#Add_StudySiteUser_Main_Error').html("Please Select a User!").show();
			$('#Add_StudySiteUser_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}		
	});
	
	//--------------------------------- End End Study Site User Submit-------------------------------------------------------------------
	// ---------------------------------End End Study Site User Submit--------------------------------------------------------------------
	
	// -------------------------------Start Add Site to user Submit-----------------------------------------------------------------
	// ---------------------------------Start Add Site to user Submit-------------------------------------------------------------
	
	$('#Add_Site_User_Form').submit(function(event){
		var number=$('select#Add_Site_User_select_user option:selected').length;
		
		if(number<= 0)
		{
			$('#Add_Site_User_Main_Error').html("Please select Site and User !").show();
			$('#Add_Site_User_Main_Success').hide();
			if(event.preventDefault) 
				event.preventDefault();
			else
				event.returnValue = false;
		}		
	});
	
	//--------------------------------- End Add Site to user Submit-------------------------------------------------------------------
	// ---------------------------------End Add Site to user Submit--------------------------------------------------------------------
	
	//-----------------------------------Add Study Site form--------------------------------------------------------------------
	//-----------------------------------Add Study Site form----------------------------------------------------------------------
	
	$('#Add_StudySite_Form').submit(function(event){
		
		var buttonval=$('#Add_StudySite_checkinvestigatorbutton').val();
		if(buttonval == '0')
		{
			var number=$.trim($('#Add_StudySite_studysitenumber').val());
			var investigator=$.trim($('#Add_StudySite_Investigator_Selection').val());
			if(investigator=="whatever" || investigator=="" || investigator==null)
			{
				$('#Add_StudySite_Investigator_Selection_error').html("Please Check investigator name !");
				Prevent_Event(event);
			}
			if(number=="")
			{
				$("#Add_StudySite_studysitenumber_error").show();
				Prevent_Event(event);
			}
			else
			{
				$("#Add_StudySite_studysitenumber_error").hide();			
			}
		}		
	});
	//---------------------------------End Study Site form------------------------------------------------------------
	//----------------------------------End Study Site form-----------------------------------------------------------
	
	
	
	//----------------------------------Save Site Form Submission----------------------------------
	//----------------------------------Save Site Form Submission----------------------------------
	
		$('#Add_Site_Form').submit(function(event){		
		
			CheckAlphaNumericWithoutSpace(event,'Add_Site_Name','Add_Site_Name_Error');			
			Check_isempty(event,'Add_Site_Address_1','Add_Site_Address_Error');			
		
			CheckAlphaNumericWithoutSpace(event,'Add_Site_City','Add_Site_City_Error');		
			CheckAlphaNumericWithoutSpace(event,'Add_Site_State','Add_Site_State_Error');
			
		
			CheckAlphaNumeric(event,'Add_Site_Postal_Code','Add_Site_Postal_Code_Error');			
			Check_isempty(event,'Add_Site_Phone','Add_Site_Phone_Error');
			
			
			//if($.trim($('#Add_Site_Cell').val()))
				Check_isempty(event,'Add_Site_Cell','Add_Site_Cell_Error');
		//	if($.trim($('#Add_Site_Fax').val()))
				Check_isempty(event,'Add_Site_Fax','Add_Site_Fax_Error');
			if($.trim($('#Add_Site_Email').val()))
				validateEmail(event,'Add_Site_Email','Add_Site_Email_Error');
		});
	
	//----------------------------------End Save Site Form Submission----------------------------------
	//----------------------------------End Save Site Form Submission----------------------------------
	
	
	
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

function edit_view_site_row(site_id,site_name,email,address1,address2,address3,city,state,country_id,postal_code,phone,cell,fax)
{
	$("#Sites_Add_Div").show("slow").siblings().hide("slow");	
	
	$('#Add_Site_Main_Error').hide();	
	$('#Add_Site_Main_Success').hide();	
	$('#Add_Site_Siteid').val(site_id);
	document.getElementById("Add_Site_Country").value=country_id;
	$('#Add_Site_Name').val(site_name);
	$('#Add_Site_Address_1').val(address1);
	$('#Add_Site_Address_2').val(address2);
	$('#Add_Site_Address_3').val(address3);
	$('#Add_Site_City').val(city);
	$('#Add_Site_State').val(state);
	$('#Add_Site_Postal_Code').val(postal_code);
	$('#Add_Site_Phone').val(phone);
	$('#Add_Site_Cell').val(cell);
	$('#Add_Site_Fax').val(fax);
	$('#Add_Site_Email').val(email);
}

function DeleteStudySiteUserMessageCodefunc(Code)
{
	if(Code == '0')
	{
		$("#View_StudySiteUser_Main_Error").show();
		$("#View_StudySiteUser_Main_Success").hide();
		document.getElementById('View_StudySiteUser_Main_Error').innerHTML="Sorry! Study Site user information cannot be deleted at this time !";
	}
	else if(Code == '1')
	{
		$("#View_StudySiteUser_Main_Error").hide();
		$("#View_StudySiteUser_Main_Success").show();
		document.getElementById('View_StudySiteUser_Main_Success').innerHTML="Information deleted...";
	}

}

function AddStudySiteUserMessageCodefunc(Code)
{
	if(Code == '0')
	{
		$("#Add_StudySiteUser_Main_Error").show();
		$("#Add_StudySiteUser_Main_Success").hide();
		document.getElementById('Add_StudySiteUser_Main_Error').innerHTML="Sorry! Study Site user information cannot be changed at this time !";
	}
	else if(Code == '1')
	{
		$("#Add_StudySiteUser_Main_Error").hide();
		$("#Add_StudySiteUser_Main_Success").show();
		document.getElementById('Add_StudySiteUser_Main_Success').innerHTML="Information Updated...";
	}
}

function Deletesiteusermessagefunc(Code)
{
	if(Code == '0')
	{
		$("#View_SiteUser_Main_Error").show();
		$("#View_SiteUser_Main_Success").hide();
		document.getElementById('View_SiteUser_Main_Error').innerHTML="Sorry! Site user information cannot be changed at this time !";
	}
	else if(Code == '1')
	{
		$("#View_SiteUser_Main_Error").hide();
		$("#View_SiteUser_Main_Success").show();
		document.getElementById('View_SiteUser_Main_Success').innerHTML="Information Updated...";
	}
}

function AddSiteUserMessageCodefunc()
{
	if($.trim($('#Add_Site_User_Main_Error').html())!="")
		$('#Add_Site_User_Main_Error').show();			
	else if($.trim($('#Add_Site_User_Main_Success').html())!="")
		$('#Add_Site_User_Main_Success').show();
}

function EditSitemessageCodefunc(Code)
{
	if(Code == '0')
	{
		$("#Edit_Site_error_message").show();
		$("#Edit_Site_success_message").hide();
		document.getElementById('Edit_Site_error_message').innerHTML="Sorry! Site Status cannot be changed at this time !";
	}
	else if(Code == '1')
	{
		$("#Edit_Site_error_message").hide();
		$("#Edit_Site_success_message").show();
		document.getElementById('Edit_Site_success_message').innerHTML="Site Status Changed !";
	}
	else if(Code == '2')
	{
		$("#Edit_Site_error_message").show();
		$("#Edit_Site_success_message").hide();
		document.getElementById('Edit_Site_error_message').innerHTML="Patients are assigned to this site . Cannot be Inactivated at this time !";
	}

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

function AddSSMesCodefunc(Code)
{
	if(Code == '0')
	{
		$("#Add_StudySite_Main_Error").show();
		$("#Add_StudySite_Main_Success").hide();
		document.getElementById('Add_StudySite_Main_Error').innerHTML="Sorry! Study is already assigned to this Site !";
	}
	else if(Code == '1')
	{
		$("#Add_StudySite_Main_Error").hide();
		$("#Add_StudySite_Main_Success").show();
		document.getElementById('Add_StudySite_Main_Success').innerHTML="Study successfully assigned to Site !";
	}
	else if(Code == '2')
	{
		$("#Add_StudySite_Main_Error").show();
		$("#Add_StudySite_Main_Success").hide();
		document.getElementById('Add_StudySite_Main_Error').innerHTML="Sorry! Study cannot be assigned to this Site at this time..";
	}
}

function AddSiteMessageCodefunc(Code)
{
	
	if(Code == '0')
	{
		$("#Add_Site_Main_Error").show();
		$("#Add_Site_Main_Success").hide();
		$("#Edit_Site_error_message").hide();
		document.getElementById('Add_Site_Main_Error').innerHTML="Sorry! Site Cannot be created at this time..";
	}
	else if(Code == '1')
	{
		$("#Add_Site_Main_Error").hide();
		$("#Add_Site_Main_Success").show();
		$("#Edit_Site_error_message").hide();
		document.getElementById('Add_Site_Main_Success').innerHTML="New Site Created Successfully !";
	}
	else if(Code == '2')
	{
		$("#Add_Site_Main_Error").hide();
		$("#Add_Site_Main_Success").hide();
		$("#Edit_Site_error_message").show();
		$("#Edit_Site_success_message").hide();
		document.getElementById('Edit_Site_error_message').innerHTML="Sorry! Site Information Cannot be updated at this time..";
	}
	else if(Code == '3')
	{
		$("#Add_Site_Main_Error").hide();
		$("#Add_Site_Main_Success").hide();
		$("#Edit_Site_error_message").hide();
		$("#Edit_Site_success_message").show();
		document.getElementById('Edit_Site_success_message').innerHTML="Site information Successfully Updated !";
	}
	else if(Code == '5')
	{
		$("#Add_Site_Main_Error").show();
		$("#Add_Site_Main_Success").hide();
		$("#Edit_Site_error_message").hide();
		$("#Edit_Site_success_message").hide();
		document.getElementById('Add_Site_Main_Error').innerHTML="Sorry , Site name already exists !";
	}
}

function AddSiteCancel()
{
	 $("#Sites_Add_Div").hide("slow");
	 $('#Add_Site_Form')[0].reset();
	 
	 $('#Add_Site_Main_Error').hide();
	 $('#Add_Site_Main_Success').hide();
	 
	 $('a[name="hrefSites_Add_Div"]').attr('id', 'current');
	 $('a[name="hrefSites_View_Div"]').attr('id', '');	
	 
	 $("#Sites_Add_Div").show("slow").siblings().hide("slow");
//	 window.location="http://localhost:8080/VOXCE/ShowSitesIndex.sites";
}


function LoadSitesForm(id)
{
	
	 if(id=="Sites_Add_Div")
	 {		
		 $('#Add_Site_Form')[0].reset(); 
		 
		 $('a[name="hrefSites_Add_Div"]').attr('id', 'current');
		 $('a[name="hrefSites_View_Div"]').attr('id', '');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="Sites_View_Div")
	 {		 
		 $('#View_Site_Search_bar').val('');
		 var e = jQuery.Event("keyup", { keyCode: 20 });
		 $("#View_Site_Search_bar").trigger( e );
		 
		 $('a[name="hrefSites_Add_Div"]').attr('id', '');
		 $('a[name="hrefSites_View_Div"]').attr('id', 'current');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="Sites_Study_add_div")
	 {		 
		 $('a[name="hrefSites_Add_Div"]').attr('id', '');
		 $('a[name="hrefSites_View_Div"]').attr('id', '');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', 'current');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="Sites_Study_view_div")
	 {		 
		 $('a[name="hrefSites_Add_Div"]').attr('id', '');
		 $('a[name="hrefSites_View_Div"]').attr('id', '');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', 'current');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="Add_Site_User_Div")
	 {		 
		 $('a[name="hrefSites_Add_Div"]').attr('id', '');
		 $('a[name="hrefSites_View_Div"]').attr('id', '');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id','current');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	else if(id=="View_Site_User_Div")
	 {		
		 $('a[name="hrefSites_Add_Div"]').attr('id', '');
		 $('a[name="hrefSites_View_Div"]').attr('id', '');
		 $('a[name="hrefSites_Study_add_div"]').attr('id', '');
		 $('a[name="hrefSites_Study_view_div"]').attr('id', '');
		 $('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		 $('a[name="hrefView_Site_User_Div"]').attr('id', 'current');
		 $('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		 $('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="Add_StudySiteUser_div")
	 {		
		$('a[name="hrefSites_Add_Div"]').attr('id', '');
		$('a[name="hrefSites_View_Div"]').attr('id', '');
		$('a[name="hrefSites_Study_add_div"]').attr('id', '');
		$('a[name="hrefSites_Study_view_div"]').attr('id', '');
		$('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		$('a[name="hrefView_Site_User_Div"]').attr('id', '');
		$('a[name="hrefAdd_StudySiteUser_div"]').attr('id', 'current');
		$('a[name="hrefView_StudySiteUser_div"]').attr('id', '');
	 }
	 else if(id=="View_StudySiteUser_div")
	 {		
		$('a[name="hrefSites_Add_Div"]').attr('id', '');
		$('a[name="hrefSites_View_Div"]').attr('id', '');
		$('a[name="hrefSites_Study_add_div"]').attr('id', '');
		$('a[name="hrefSites_Study_view_div"]').attr('id', '');
		$('a[name="hrefAdd_Site_User_Div"]').attr('id', '');
		$('a[name="hrefView_Site_User_Div"]').attr('id', '');
		$('a[name="hrefAdd_StudySiteUser_div"]').attr('id', '');
		$('a[name="hrefView_StudySiteUser_div"]').attr('id', 'current');
	 }
		
	 $('.error_label_grp').hide();
	 $('.chk_avail_yes').hide();
	 
	 $("#"+id).show("slow").siblings().hide("slow");
}
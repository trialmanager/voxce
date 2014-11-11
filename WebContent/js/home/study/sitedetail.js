//********************************************************************
//********************************************************************
//********************************************************************
//*************************JQuery*********************************
/*$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});
 */
$(document).ready(function() {



	$('#Add_Site_Country').val($('#CurrentCountryID').val());

	//***********************************Edit Site Message********************************************************	
	if($.trim($('#Edit_Site_Main_Error').html())!="")
		$('#Edit_Site_Main_Error').show();			
	else if($.trim($('#Edit_Site_Main_Success').html())!="")
		$('#Edit_Site_Main_Success').show();			
	//***********************************Edit Site Message********************************************************


	$('#Add_Site_Country').val($('#countryid').val());
	//***********************************Start Edit Study*********************************************************

	$('#Edit_Site_Form').submit(function(event){		
		//CheckAlphaNumericWithoutSpace(event,'Add_Site_Name','Add_Site_Name_Error');		
		Check_isempty(event,'Add_Site_Address_1','Add_Site_Address_Error');		
		//CheckAlpha(event,'Add_Site_City','Add_Site_City_Error');
		//CheckAlpha(event,'Add_Site_State','Add_Site_State_Error');
		CheckAlphaNumeric(event,'Add_Site_Postal_Code','Add_Site_Postal_Code_Error');
		Check_isempty(event,'Add_Site_Phone','Add_Site_Phone_Error');
		if($.trim($('#Add_Site_Cell').val()))
			Check_isempty(event,'Add_Site_Cell','Add_Site_Cell_Error');
		if($.trim($('#Add_Site_Fax').val()))
			Check_isempty(event,'Add_Site_Fax','Add_Site_Fax_Error');
		if($.trim($('#Add_Site_Email').val()))
			validateEmail(event,'Add_Site_Email','Add_Site_Email_Error');

	});
	//***********************************End Edit Study*********************************************************


	$('#EditSiteCancelbutton').click(function(){		 
		$("#SiteDetailDiv").show("slow").siblings().hide("slow");
	});

});

//********************************************************************
//********************************************************************
//********************************************************************
//*************************Javascript*********************************


function EditSite()
{
	$('#Edit_Site_Main_Error').hide();
	$('#Edit_Site_Main_Success').hide();
	$("#Sites_Add_Div").show("slow").siblings().hide("slow");
}

//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery

$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

$(document).ready(function() {


	//-----------------------------Start Setting Sites Multiselection css change----------------------------------------
	//-----------------------------Start Setting Sites Multiselection css changee----------------------------------------	 
	$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");
	$(".selected").width("300px");
	$(".available").width("300px");
	$(".search").width("150px");

	//-----------------------------End Setting Sites Multiselection css change----------------------------------------
	//-----------------------------End Setting Sites Multiselection css change----------------------------------------

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





	$('#Add_Site_User_Site_name').change(function() {
		if($('select#Add_Site_User_Site_name option:selected').val()=="" || $('select#Add_Site_User_Site_name option:selected').val()==null)
			return;					
		$('#typeofaction').val("SiteUserChangeListener");
		$('#HiddenValue1').val($('select#Add_Site_User_Site_name option:selected').val());
		$('form#siteuserhiddenform').submit();		 	
	});

});

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript


function AddSiteUserMessageCodefunc()
{
	if($.trim($('#Add_Site_User_Main_Error').html())!="")
		$('#Add_Site_User_Main_Error').show();			
	else if($.trim($('#Add_Site_User_Main_Success').html())!="")
		$('#Add_Site_User_Main_Success').show();
}

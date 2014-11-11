//********************************************************************
//********************************************************************
//********************************************************************
//*************************JQuery*************************************

//$(window).resize(function() {
//var width = $(document).width();
//width = width - 290;
//$('.right_body_content').css('width',width);
//});

$(document).ready(function() {



	$("#View_User_Div").show("slow").siblings().hide("slow");
	StudyUserDeleteMessages();
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	//-----------------------------Start Case Insensitive search---------------------------------------------------------
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	//-----------------------------End Case Insensitive search---------------------------------------------------------
	//-----------------------------End Case Insensitive search---------------------------------------------------------


	//-----------------------------Start Users search------------------------------------------------------------------
	//-----------------------------Start Users search------------------------------------------------------------------
	//Start Sites Users Search
	$("#View_users_Search_bar").keyup(function(){
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
	//End Sites Users Search
	//-----------------------------End Users search------------------------------------------------------------------
	//-----------------------------End Users search------------------------------------------------------------------




});

//********************************************************************
//********************************************************************
//********************************************************************
//*************************Javascript*********************************
function StudyUserDeleteMessages()
{
	if($.trim($('#View_User_error_message').html())!="")
	{
		$('#View_User_error_message').show();			
	}
	else if($.trim($('#View_User_success_message').html())!="")
	{
		$('#View_User_success_message').show();			
	}
}

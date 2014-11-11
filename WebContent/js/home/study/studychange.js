//********************************************************************
//********************************************************************
//********************************************************************
//*************************JQuery*********************************

$(document).ready(function() {




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
	$("#View_StudySite_Search_bar").keyup(function(){
		$("#SSbody").find("tr").hide();
		var data = this.value.split(" ");
		var jo = $("#SSbody").find("tr");
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

});


//$(window).resize(function() {
//var width = $(document).width();
//width = width - 290;
//$('.right_body_content').css('width',width);
//});

//********************************************************************
//********************************************************************
//********************************************************************
//*************************Javascript*********************************
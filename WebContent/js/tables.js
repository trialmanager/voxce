/*$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});
*/
//Displays a form within a page



$(document).ready(function(){
	$("body").append("<div id='popup' class='dialog'></div>");
	$("#popup").css("width","400px");
	$("#popup").css("height","400px");
/*	$("#popup").css("z-index","1");
	$("#popup").css("margin-left","50%");
	$("#popup").css("margin-top","50%");*/
	$("ui-icon").click(function(){
	});
});
function elipsis(){
	var i=1;
	$("table").find("tr").each(function(){
		if($(this).attr("class")!="rights_header_view_list")
		$(this).find("td").each(function(){
			
			if($(this).children().length<1){
				var w=$(this).parents("table").find(".rights_header_view_list").children("td:nth-child("+i+")").width();
				if(w<60){
					w=(w*$(this).parents("#mainFormsDiv").outerWidth())/100;
				}
				w=Math.ceil(w/6);
				if(w>60)
					{w=Math.floor(w/2);}
			
				$(this).ellipsis({visible: w, more: '(more)', separator:'', atFront: false});	
			}
			i++;
		});
		
		i=1;
	});
	
}
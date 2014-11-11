$(document).ready(function(){
	$("#hrefadd_question_form").trigger('click');
	$(".resourceRights").css("display","none");
	var bool = true;
	$(this).find(".resourceRights").each(function(){
		
			
		if($(this).attr("right")=='1'&& bool != false){
			$(this).show();
			bool = false;
		}else{
			$(this).css("display","none");
		}
	});
	
	if($("input#InterfaceState").attr("id") != undefined && $("input#InterfaceState").val() != null && $("input#InterfaceState").val() != ""){
		$("#"+$("input#InterfaceState").val()).show().siblings().hide();
		
	}
});
//*****************************************************************************
//*****************************************************************************
//**************************JQUERY*************************************
var prename="";
/*$(window).resize(function() {
    var wid = $(".body_content").outerWidth();
    wid = wid - 280;
 	$('.right_body_content').css('width',wid);
});*/
function loadRelatedVisits()
{
	prename=$(".myOwn").val();
	value=$(".study_select").val();
	var start=$("#hiddenvisitname").find("#zero").clone();

	$("#visitRelated").append(start);
	$("#zero").attr("selected","selected");
	$("#zeror").attr("selected","selected");
	if(value != 0){
		$(".element").removeAttr("disabled");
		$(".myOwn").removeAttr("disabled");
		$("#visitName").empty();
		$("#visitRelated").empty();
		var start=$(this).find("#zero").clone();
		$("#visitRelated").append(start);
		$("#zero").attr("selected","selected");
		$("#zeror").attr("selected","selected");
		$("#hiddenvisitname").find("option").each(function(){
			if($(this).attr("study") == value){
				if($(this).text()!=$(".myOwn").val())
				{
					
					var div = $(this).clone();
					var div2=$(this).clone();
					$("#visitName").append(div);
					$("#visitRelated").append(div2);
				}
			}else{
				//	$(this).attr("disabled",true);
			}
		});
	}else{
		$(".myOwn").attr("disabled","disabled");
		$(".element").attr("disabled","disabled");
	}
}


$("#primaryVisit").live("change",function(){
});
$(".checkbox_IsRepeted").live("change",function(){
	if($(this).is(":checked")){
		$("#primaryVisit").removeAttr("checked");
		$("#primaryVisit").hide();
		$("#primaryVisitLabel").hide();

		loadRelatedVisits();


	}else{
		$("#primaryVisit").show();
		$("#primaryVisitLabel").show();			
	}
});


$(document).ready(function(){

	$(".myOwn").attr("disabled","disabled");
	$(".element").attr("disabled","disabled");
	
	if($(".checkbox_IsRepeted").is(":checked")){
		$("#primaryVisit").removeAttr("checked");
		$("#primaryVisit").hide();
		$("#primaryVisitLabel").hide();
		loadRelatedVisits();

	}else{

		$("#primaryVisit").show();
		$("#primaryVisitLabel").show();
	}





	var state=$("input#InterfaceState").val();	
	if(state=="" || state== null)
	{
		$('a[name="hrefCreate_Visit_Div"]').attr('id', 'current');
		$("#Create_Visit_Div").show("slow").siblings().hide("slow");
	}
	else
	{
		$("#"+state).show("slow").siblings().hide("slow");
		if(state=="Create_Visit_Div")
		{ 
			$('a[name="hrefCreate_Visit_Div"]').attr('id', 'current');
			$('a[name="hrefView_Visitlist_Div"]').attr('id', '');			 
		}
		else if(state=="View_Visitlist_Div")
		{			 
			$('a[name="hrefCreate_Visit_Div"]').attr('id', '');
			$('a[name="hrefView_Visitlist_Div"]').attr('id', 'current');
		}
	}


	if($.trim($("#Create_Visit_Main_Error").text()) != ""){
		$("#Create_Visit_Main_Error").show();
		$("#Create_Visit_Main_Success").hide();
	}
	if($.trim($("#Create_Visit_Main_Success").text()) != ""){
		$("#Create_Visit_Main_Success").show();
		$("#Create_Visit_Main_Error").hide();
	}


	if($.trim($("#view_Visit_Main_Error").text()) != ""){
		$("#view_Visit_Main_Error").show();
		$("#view_Visit_Main_Success").hide();
	}
	if($.trim($("#view_Visit_Main_Success").text()) != ""){
		$("#view_Visit_Main_Success").show();
		$("#view_Visit_Main_Error").hide();
	}

	$("#optimum_days").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$("#optimum_days").live("focusin",function(){
		$(this).val("");

	});
	$("#closeWindow").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$("#closeWindow").live("focusin",function(){
		$(this).val("");

	});
	$("#openWindow").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$("#openWindow").live("focusin",function(){
		$(this).val("");

	});



	$(".study_select").change(function(){
		var value = $(this).val();
		/*if(value != 0){

			$(".element").removeAttr("disabled");
			$("#visitRelated").find("option").each(function(){
				if($(this).attr("study") == value){
					$(this).show();
				}else{
					$(this).attr("disabled",true);
				}
			});
			$("#zero").attr("selected","selected");
			$("#visitName").find("option").each(function(){
				if($(this).attr("study") == value){
					$(this).show();
				}else{
					$(this).attr("disabled",true);
				}
			});
		}else{
			$(".element").attr("disabled","disabled");
		}*/
		//alert("Test function");
		loadRelatedVisits();

	});

	$("#monitor").click(function(){
		if($(this).is(":checked")){
			$("#adverse").removeAttr("checked");
		}
	});
	$("#adverse").click(function(){
		if($(this).is(":checked")){
			$("#monitor").removeAttr("checked");
		}
	});

	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};

	$(".show-my-own").click(function(){
		$(".myOwn").show();
		$(this).hide();
	});
	$(".myOwn").focusout(function(){
//		var cheackExisitng = false;
//		$("#hiddenvisitname").find("option").each(function(){
//		if($(".myOwn").val()== $(this).text()){
//		cheackExisitng = true;
//		}
//		});
//		if(!cheackExisitng ){
//		if($(".myOwn").val() != ""){
//		//		$(".show-my-own").show();
//		$("#visitName").append("<option selected = 'selected' value = '0'>"+$(this).val()+"</option>");	
//		$("#hiddenvisitname").append("<option selected = 'selected' value = '0'>"+$(this).val()+"</option>");	
//		}else{
//		//			$(".show-my-own").show();
//		$(".visitName_error").show();
//		alert("Visit Name Can Not Be Empty!");
//		}

//		}else{
//		$(".visitName_error").show();
//		alert("Name already in The List");
//		}

//		//	$(this).hide();
		if(prename==""|| prename!=$(".myOwn").val()){
			$.post("checkVisitName.visits?vn="+$(".myOwn").val()+"&sid="+$(".study_select").val() ,function(data){

				if(data=="success")
					$("#visitName_error").hide();
				else{
					$("#visitName_error").text($(".myOwn").val()+"  Already Exists in "+$(".study_select option:selected").text()+"! ");
					$("#visitName_error").show();
					$(".myOwn").val(prename);
				}
			});
		}
		else
		{
			$("#visitName_error").hide();
		}

		if($("#checkbox_IsRepeted").is(":checked"))
		{
			$("#primaryVisit").removeAttr("checked");
			$("#primaryVisit").hide();
			$("#primaryVisitLabel").hide();
			loadRelatedVisits();
		}
		else
		{
			$("#primaryVisit").show();
			$("#primaryVisitLabel").show();
		}



	});

	$(".visit_related_with").removeAttr("cheacked");
	$(".checkbox_IsRepeted").click(function(){
		if($(this).is(":checked")){
			$(".visit_related_with").show();
			$(".element").removeAttr("disabled");
			$(".myOwn").removeAttr("disabled");
			loadRelatedVisits();



		}else{
			$(".visit_related_with").hide();
			$("#visitRelated").find("option").removeAttr("selected");
			$("#visitRelated").empty();
		}
	});

	$(".desciption").hover(
			
			function() { $(".tooltip-style1").html($(this).attr("des")); },
			function() { $(".tooltips").contents("span:last-child").css({ display: "block" }); },
			function() { $(".tooltips").contents("span:last-child").css({ display: "none" }); }
			
	);
	$(".desciption").mousemove(function(e) {
		var mousex = e.pageX + 10;
		var mousey = e.pageY + 5;
		$(".tooltips").contents("span:last-child").css({ display: "block" });
		$(".tooltips").contents("span:last-child").css({  top: mousey, left: mousex });
	});
	$(".desciption").mouseleave(function(){
		$(".tooltips").contents("span:last-child").hide();
	});
	//Current Sponsor Form State	
	$(".submit-button").click(function(event){
		$(".study_select").removeAttr("disabled");

		var flage = true;
		var index = 0;
		var bool = true;
		$("#typesVisit").html("");
		$("#noDate").html("");
		$("#noStudy").html("");
		$(".name-visit").each(function(){

			var sel;
			$(".study_select").find("option").each(function(event){
				if($(this).attr("selected")!= undefined){
					sel = $(this).text();
				}
			});

			/*			if($(this).attr("text") == $("#visitName").val() && $(this).parent().siblings(".study_to_visit").text() == sel){
				$("#noStudy").text("Visit With this Name Already Exist In this Study").css("color","red");
				bool = false;
				return;
			}
			 */			
		});

		/*$(".type-of-visit").each(function(){
			if($(this).is(":checked")){
				index++;
			}
		});

		if(index < 1){
			$("#typesVisit").text("Please Select atleast one checkbox!").css("color","red");
			bool = false;
			return;
		}*/
		if(!Optional_Numeric($(this),"closeWindow","closeWindow_error")){
			bool = false;
			return;
		}
		/*	if($("#datepicker1").val() == "" || $("#datepicker1").val()==undefined || $("#datepicker1").val()==null ){
			$("#noDate").text("Please Select the Date of Visit!").css("color","red");
			bool = false;
			return;
		}*/
		if(!Optional_Numeric($(this),"openWindow","openWindow_error")){
			bool = false;
			return;
		}
		if($(".study_select").val() == 0){
			$("#noStudy").text("Please Select Study To Create Visit!").css("color","red");
			bool = false;
			return;
		}

		if($(".checkbox_IsRepeted").is(":checked")){
			$(".is_rel").val("true");
			if($("#optimum_days").val() == ""){
				$("#noDate").text("Please Enter the Optimum days!").css("color","red");
				bool = false;
				return;
			}
			if(parseInt($("#optimum_days").val()) < parseInt($("#openWindow").val()) ){
				$("#openWindow_error").text("Please Enter Open Window value less than Optimum days!").css("color","red");
				$("#openWindow_error").show();
				bool = false;
				return;
			}
			var option;
			$("#visitName").find("option").each(function(){
				if($(this).attr("selected") != undefined){
					option = $(this);
				}

			});
			var seOption
			$("#visitRelated").find("option").each(function(){
				if($(this).attr("selected") != undefined){
					seOption = $(this);
				}

			});
			if(option.attr("visit") != undefined && (option.attr("visit") == seOption.attr("related"))){
				alert("Can not Associate these Two visits these are already Associated with each other!");
				bool = false;
				return;
			}
			if($("#visitRelated").val() == ""){
				alert("Please Select the Visit you want to attach this with!");
				bool = false;
				return;
			}
		}else{
			$(".is_rel").val("false");
			$("#visitRelated").empty();

		}
		if(bool){
			var valueText = "";
			$("#visitName").find("option").each(function(){
				if($(this).is(":selected")){
					valueText = $(this).text();

				}
			});
			var act = $("#createVisitForm").attr("action");
			$("#createVisitForm").attr("action",act+"?valueText="+valueText);
//			var vname=$(".myOwn").text();
//			if(vname==""){
//			$("#visitName_error").text("Please Enter the visit name");
//			$("#visitName_error").show();
//			}
			//$("#visitName_error").show();

			if(CheckAlphaNumericWithoutSpace(event,"visit_name","visitName_error")&& bool){
				$("#createVisitForm").find("input,textarea,option,checkbox").removeAttr("disabled");

				$("#createVisitForm").submit();
			}
			//
		}

	});
	$(".change-the-selected-crf").live("change",function(){
		$(".value-dialog").empty();
		if($(this).val()!= 1){
			$(".value-dialog").html($(this).val());
			$(".value-dialog").dialog({
				width:600
			});
		}

	});


		$("#Visit_study_Search_baro").change(function(){

		$("#fbody").find("tr").hide();
		var data = $(this).val().split(" ");
		var jo = $("#fbody").find("tr");
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



});

//****************************************************************************
//*****************************************************************************
//************************Javascript*******************************************
function LoadVisitsForm(id)
{
	if(id=="Create_Visit_Div")
	{
		$('a[name="hrefCreate_Visit_Div"]').attr('id', 'current');
		$('a[name="hrefView_Visitlist_Div"]').attr('id', '');

	}
	else if(id=="View_Visitlist_Div")
	{
		$('a[name="hrefCreate_Visit_Div"]').attr('id', '');
		$('a[name="hrefView_Visitlist_Div"]').attr('id', 'current');
	}

	$('.error_label_grp').hide();
	$('.chk_avail_yes').hide();	
	$("#"+id).show("slow").siblings().hide("slow");
}

$(function(){
	$("#Visit_study_Search_baro").ready(function(){

		$("#fbody").find("tr").hide();
		var data = "";
		if($("#Visit_study_Search_baro").val() != undefined){
			data =  $("#Visit_study_Search_baro").val().split(" ");
			var jo = $("#fbody").find("tr");
			$.each(data, function(i, v){		
				//Use the new containsIgnoreCase function instead
				jo = jo.filter("*:containsIgnoreCase('"+v+"')");

			});
			jo.show();
		}
	}).focus(function(){
		this.value="";
		$(this).css({"color":"black"});
		$(this).unbind('focus');
	}).css({"color":"#C0C0C0"});
});

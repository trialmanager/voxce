
var sectionId;
var questionId;
var crfId;
$(window).resize(function() {
/*
	var wid = $(".body_content").outerWidth();
	wid = wid - $(".left_nav").outerWidth()-(.05*wid);
	$('.right_body_content').css('width',wid);
	elipsis();
*/
});
$(document).ready(function(){


	LoadCRFForm($('input#InterfaceState').val());


	$(".change").click(function(){
		$(".AddQTGreenMessage").hide();
		$(".AddQTErrorMessage").hide();
		$("#View_SectionTexts_Search_Bar").val("");
		$("#View_QuestionTexts_Search_Bar").val("");
		$("#View_CRFTexts_Search_Bar").val("");

		$("table").find("tr").each(function(){
			$(this).css("display"," table-row"); 
		});
	});


	if($.trim($(".AddQTGreenMessage").text()) != ""){
		$(".AddQTGreenMessage").show();
	}else{
		$(".AddQTGreenMessage").hide();
	}

	if($.trim($(".AddQTErrorMessage").text()) != ""){
		$(".AddQTErrorMessage").show();
	}else{
		$(".AddQTErrorMessage").hide();
	}

	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};

	$("#View_QuestionTexts_Search_Bar").keyup(function(){

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

	$("#View_SectionTexts_Search_Bar").keyup(function(){

		$("#fbody").find("tr").hide();
		var data1 = $(this).val().split(" ");
		var jo1 = $("#fbody").find("tr");
		$.each(data1, function(i, v){		
			//Use the new containsIgnoreCase function instead
			jo1 = jo1.filter("*:containsIgnoreCase('"+v+"')");     
		});
		jo1.show();

	}).focus(function(){
		this.value="";
		$(this).css({"color":"black"});
		$(this).unbind('focus');
	}).css({"color":"#C0C0C0"});


	$("#View_CRFTexts_Search_Bar").keyup(function(){

		$("#fbody").find("tr").hide();
		var data2 = $(this).val().split(" ");
		var jo2 = $("#fbody").find("tr");
		$.each(data2, function(i, v){		
			//Use the new containsIgnoreCase function instead
			jo2 = jo2.filter("*:containsIgnoreCase('"+v+"')");     
		});
		jo2.show();

	}).focus(function(){
		this.value="";
		$(this).css({"color":"black"});
		$(this).unbind('focus');
	}).css({"color":"#C0C0C0"});



	$(".questions-list").each(function(){
		if(!$(this).is(":visible")){
			$(".questions-list").html($(this).html());
		}
	});
	$(".section-list").each(function(){
		if(!$(this).is(":visible")){
			$(".section-list").html($(this).html());
		}
	});
	$(".date").datepicker({
		changeMonth: true,
        changeYear: true
	});
	$(".time").timepicker({
		ampm: true,
		hourMin: 0,
		hourMax: 24
	});
	var edit;
	var selectQuestions =$("<select />").append($("<option />").attr("value","1").text("Question 1")).append($("<option />").attr("value","2").text("Question 2")).append($("<option />").attr("value","3").text("Question 3")).append($("<option />").attr("value","4").text("Question 4")).append($("<option />").attr("value","5").text("Question 5")).append($("<option />").attr("value","6").text("Question 6")).append($("<option />").attr("value","7").text("Question 7"));
	var selectAns =$("<select />").append($("<option />").attr("value","1").text("type 1")).append($("<option />").attr("value","2").text("type 2")).append($("<option />").attr("value","3").text("type 3")).append($("<option />").attr("value","4").text("type 4")).append($("<option />").attr("value","5").text("type 5")).append($("<option />").attr("value","6").text("type 6")).append($("<option />").attr("value","7").text("type 7"));
	var div = $("<div />").css("border","1px dashed #BEBEBE").css("border-radius","10px").css("float","left");
	div.append($("<button />").css("float","right").html("Delete").addClass("delete-div"));
	var page = div.clone(true);
	page.append($("<button/>").css("float","right").text("add section").addClass("add-sections")).append($("<button/>").css("float","right").text("Save Page").addClass("save-page"));
	page.addClass("crf-page").css("width","600px").css("min-height","400px");
	//$("body").append(page);
	$(".add-sections").live("click",function(){
		var section = div.clone(true).addClass("page-section").css("width","550px").css("padding","5px").css("min-height","20px").css("margin","5px");
		section.append($("<button />").text("Edit").addClass("edit-section").css("float","right"));
		$(".crf-page").append(section);

	});
	$(".delete-div").live("click",function(){
		$(this).parent().remove();
		$(".questions-list").each(function(){
			$(this).find("option").each(function(){
				$(this).show();
			});
		});

		$(".questions-list").each(function(){
			$(this).find("option").each(function(){
				var option = $(this);
				$(".question-heading").each(function(){

					if($(this).text().indexOf(option.text())>=0){

						option.hide();
					}
				});

			});
		});


		$(".section-list").each(function(){
			$(this).find("option").each(function(){
				$(this).show();
			});
		});

		$(".section-list").each(function(){
			$(this).find("option").each(function(){
				var option = $(this);
				$(".section-name").each(function(){

					if($(this).text().indexOf(option.text())>=0){


						option.hide();
					}
				});

			});
		});


	});
	$(".edit-section").live("click",function(){
		edit = $(this);
		$("#open").remove();
		if($(this).parent().attr("dialogHtml")== undefined){

			var dialog = $("<div />").attr("id","open").attr("title","Select Questions").addClass("dialog").css("display","none");
			dialog.append($("<select />").addClass("section-name")).append($("<input />").attr("maxlength","250").attr("type","button").val("New Section").addClass("new-section"));
			dialog.append($("<div />").addClass("questions-container"));
			dialog.append($("<button/>").addClass("add-questions").text("Add Question").hide());
		}
		else{
			dialog = $(this).parent().attr("dialogHtml");
		}

		//$("body").append(dialog);
		$("#open").dialog({
			modal:true,
			width:650,
			title: "section",
			closeOnEscape: true,
			maxHeight: 100,
			buttons: {
				"Save": function () {
					$("#open").find(".label-edit").each(function(){
						$(this).attr("value",$(this).val());
					});
					if($(".new-section-name-element").is(":visible")){
						$(".new-section-name-element").attr("value",$(".new-section-name-element").val());
					}
					var dialogHtml = $("<div />").append($("<div />").attr("id","open").addClass("dialog").html($("#open").html()));
					//edit.parent().prepend($("<div />").addClass("section-title").text($(".section-name").val()));
					//edit.parent().attr("html",section.html());

					edit.parent().attr("dialogHtml",dialogHtml.html());

					var section = $("<div />").addClass("created-section").css("float","left").css("width","550px");


					if($(".new-section-name-element").val() == undefined && $(".section-name").val() != undefined){
						section.append($("<h1 />").text($(".section-name").val()));
						edit.parent().find("h1").remove();
						edit.parent().prepend($("<h1 />").text($(".section-name").val()).css("float","left"));
					}else if($(".new-section-name-element").val() != undefined && $(".section-name").val() == undefined){
						section.append($("<h1 />").text($(".new-section-name-element").val()));
						edit.parent().find("h1").remove();
						edit.parent().prepend($("<h1 />").text($(".new-section-name-element").val()).css("float","left"));
					}else{
						alert("You can not save this state of section please make a new section or select any existing section");
						return;
					}

					var div_question = $("<div />").addClass("question-section-rnd").css("border","solid 1px scrollbar").css("border-radius","10px").css("width","95%").css("float","left").css("padding","5px").css("margin","5px");
					$(".each-question").each(function(){

						$(this).find(".ans-block").each(function(){
							$(this).find(".label-edit").each(function(){
								if($(this).hasClass("answer")){
									$(this).after($("<span />").addClass("answer-label").css("margin","5px").text($(this).val()));
								}else{
									$(this).after($("<span />").addClass("lable-answer").css("margin","5px").text("*"+$(this).val()));
								}

								$(this).remove();
							});
							var val = $(this).siblings(".select-questions").val();

							val = text_of_options($(this).siblings(".select-questions"),val);

							$(this).children(".each-ques-crf").prepend($("<span />").addClass("question-heading").html("Q : "+val).css("font-size","10px"));
							$(this).find(".lab").remove();
						});
						div_question.append($(this).find(".ans-block").html());
						div_question.append($("<hr />").css("width","98%").css("float","left").css("background-color","#666"));
					});

					//only to show the saved html of a section
					section.append(div_question);
					$("html").append(section);
					edit.parent().attr("html",section.html());
					$("#open").dialog("destroy");
					$(".date").datepicker({
						 changeMonth: true,
				            changeYear: true
					});
					$(".time").timepicker({
						ampm: true,
						hourMin: 0,
						hourMax: 24
					});
				},
				cancel: function () {
					$(this).dialog("close");
				}
			}

		});
	});
	$(".section-name").live("change",function(){
		$(".questions-container").empty();
		edit.parent().removeAttr("newSection");
		$(".add-questions").show();
	});
	var question = $("<div />").addClass("each-question").css("border","solid 1px scrollbar").css("width","95%").css("float","left").css("padding","5px").css("margin","5px").append($("<button />").addClass("delete-question").css("float","right").text("Delete")).append(selectQuestions.clone().addClass("select-questions")).append(selectAns.clone().addClass("select-answer-type"));
	$(".delete-question").live("click",function(){
		$(this).parent().remove();
	});

	$(".add-questions").live("click",function(){
		$(".questions-container").append(question.clone(true).append($("<div />").addClass("ans-block")));
	});

	$(".new-section").live("click",function(){
		edit.parent().attr("newSection","true");
		$(".questions-container").empty();
		$(".questions-container").append($("<span />").text("Put New Section Name")).append($("<input />").attr("type","text").attr("maxlength","250").addClass("lab new-section-name-element"));
		$(".add-questions").show();
	});
	var table;
	var tableLab;

	$(".select-answer-type").live("change",function(){
		$(this).siblings(".lable-number-of-elements").remove();
		$(this).siblings(".add-options").remove();
		$(this).siblings(".ans-block").empty();
		$(this).siblings(".number-of-elements").remove();
		if($(this).val() == "1"){
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left").css("min-height","50px");

			ques_internal_div.append($("<br />")).append($("<span />").text("Text Field").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").attr("maxlength","255").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("element input_txt edit").css("float","left").css("width","150px")).append($("<input />").attr("maxlength","255").attr("type","text").addClass("label-edit input_txt").css("float","left").css("margin-left","2px").css("width","150px"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-text drop_txt_small").css("float","left").css("margin-top","30px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'numeric' class = ''>Numeric</option><option value = 'less' class = ''>Less Then</option><option value = 'greater' class = ''>Greater Then</option><option value = 'mendtory' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));

		}else if($(this).val() == "2"){
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			ques_internal_div.append($("<span />").text("Text Area").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").text("Write Guide Lines").addClass("lab").css("float","left").css("color","#1090D1").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<textarea />").addClass("element edit").css("float","left").css("min-width","150px").css("max-width","150px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("margin-left","2px").css("float","left").css("width","150px"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-textarea drop_txt_small").css("float","left").css("margin-top","17px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_textarea' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));
		}else if($(this).val() == "3"){
			$(this).after('<label class = "lable-number-of-elements">Select Number: </label><select class = "number-of-elements drop_txt radio"><option vlaue = "0">Select number of elements</option><option value = "2">2</option><option value = "3">3</option><option value = "4">4</option><option value = "5">5</option><option value = "6">6</option><option value = "7">7</option><option value = "8">8</option><option value = "9">9</option><option value = "10">10</option>');
		}else if($(this).val() == "4"){
			$(this).after('<label class = "lable-number-of-elements">Select Number: </label><select class = "number-of-elements drop_txt checkbox"><option vlaue = "0">Select number of elements</option><option value = "2">2</option><option value = "3">3</option><option value = "4">4</option><option value = "5">5</option><option value = "6">6</option><option value = "7">7</option><option value = "8">8</option><option value = "9">9</option><option value = "10">10</option>');

		}else if($(this).val() == "5"){
			$(this).after('<label class = "lable-number-of-elements">Select Number: </label><select class = "number-of-elements drop_txt radio_hor"><option vlaue = "0">Select number of elements</option><option value = "2">2</option><option value = "3">3</option><option value = "4">4</option><option value = "5">5</option><option value = "6">6</option><option value = "7">7</option><option value = "8">8</option><option value = "9">9</option><option value = "10">10</option>');
		}else if($(this).val() == "6"){
			$(this).after('<label class = "lable-number-of-elements">Select Number: </label><select class = "number-of-elements drop_txt checkbox_hor"><option vlaue = "0">Select number of elements</option><option value = "2">2</option><option value = "3">3</option><option value = "4">4</option><option value = "5">5</option><option value = "6">6</option><option value = "7">7</option><option value = "8">8</option><option value = "9">9</option><option value = "10">10</option>');

		}else if($(this).val() == "7"){

			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			ques_internal_div.append($("<br />")).append($("<span />").text("Time Element").addClass("lab").css("float","left").css("color","#1090D1").css("width","160px")).append($("<span />").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<input />").attr("type","text").attr("readonly","readonly").addClass("element input_txt time edit").css("float","left").css("width","150px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("margin-left","2px").css("float","left").css("width","150px"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-time drop_txt_small").css("float","left").css("margin-top","17px").css("margin-top","30px").css("margin-left","15px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_time' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		}else if($(this).val() == "8"){

			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			ques_internal_div.append($("<br />")).append($("<span />").text("Date Element").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<input />").attr("type","text").addClass("element input_txt date edit").attr("readonly","readonly").css("float","left").css("width","150px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("margin-left","2px").css("float","left").css("width","150px")).append($("<br />"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-date drop_txt_small").css("float","left").css("margin-top","17px").css("margin-top","30px").css("margin-left","15px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_date' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		}else if($(this).val() == "9"){
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			ques_internal_div.append($("<br />")).append($("<span />").text("List Element").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").attr("maxlength","255").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<select />").addClass('list-options drop_txt').css('float','left').css('width','150px').append("<option value = '0'>Select Option</option>")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("float","left").css("margin-left","2px").css("width","150px"));


			//ques_internal_div.append("<select class = 'list-options'  />");
			$(this).after("<input type = 'button' class = 'add-options grey-pill' style='margin-left:15px;' value = 'Add Option'>");
			$(this).siblings(".ans-block").append(ques_internal_div);

			var select = $("<select />").addClass("rules-list drop_txt_small").css("float","left").css("margin-top","30px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_list' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));


		}else if($(this).val() == "10"){
			$(this).after('<label class = "lable-number-of-elements">Select Drugs: </label>');
			$(this).next(".lable-number-of-elements").after($("<select />").css("float","left").addClass("drop_txt thisSelectDrugs number-of-elements").append($(".select_box_drugs").html()).after($("<input />").attr("value","Add Drug").css("float","left").css("margin-left","3px").attr("type","button").addClass("grey-pill lable-number-of-elements addDrugs")));
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			table = $("<table />").addClass("drugTable").css("border","1px solid silver").css("border-radius","10px 10px 0px 0px");
			table.hide();
			table.append($("<th />").text("Drug Name"));
			table.append($("<th />").text("Start Date"));
			table.append($("<th />").text("End Date"));
			table.append($("<th />").text("Continued ?"));
			table.append($("<th />").text("Dosage"));
			table.append($("<th />").text("Unit"));
			ques_internal_div.append(table);
			$(this).siblings(".ans-block").append(ques_internal_div);
		}else if($(this).val() == "11"){

			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			ques_internal_div.append($("<br />")).append($("<span />").text("List Element").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").attr("maxlength","255").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<select >").append($(".select_box").html()).addClass('list-options drop_txt').css('float','left').css('width','150px')).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("float","left").css("margin-left","2px").css("width","150px"));

			$(this).siblings(".ans-block").append(ques_internal_div);

			var select = $("<select />").addClass("rules-list drop_txt_small").css("float","left").css("margin-top","30px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_list' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));


		}else if($(this).val() == "12"){

			$(this).after('<label class = "lable-number-of-elements">Select Lab: </label>');
			$(this).next(".lable-number-of-elements").after($("<select />").css("float","left").addClass("drop_txt thisSelectLabs number-of-elements").append($(".select_box_lab").html()).after($("<input />").attr("value","Add Lab").css("float","left").css("margin-left","3px").attr("type","button").addClass("grey-pill lable-number-of-elements addLabs")));
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left");
			table = $("<table />").addClass("labTable").css("border","1px solid silver").css("border-radius","10px 10px 0px 0px");
			table.hide();
			table.append($("<th />").text("Lab Name"));
			table.append($("<th />").text("Results"));
			table.append($("<th />").text("Unit"));
			ques_internal_div.append(table);
			$(this).siblings(".ans-block").append(ques_internal_div);

		}else if($(this).val() == "13"){
			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left").css("min-height","50px");

			ques_internal_div.append($("<br />")).append($("<span />").text("Mesurement").addClass("lab").css("color","#1090D1").css("float","left").css("width","160px")).append($("<span />").attr("maxlength","255").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("element input_txt edit").css("float","left").css("width","150px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("float","left").css("margin-left","2px").css("width","150px"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-text drop_txt_small").css("float","left").css("margin-top","30px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));

		}else if($(this).val() == "14"){

			var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(this).val()).css("float","left").css("min-height","50px");

			ques_internal_div.append($("<br />")).append($("<span />").text("Percentage Field").addClass("lab").css("color","#1090D1").css("float","left").css("width","180px")).append($("<span />").attr("maxlength","255").text("Write Guide Lines").addClass("lab").css("color","#1090D1").css("float","left").css("width","200px"));
			ques_internal_div.append($("<br />")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("element percent input_txt edit").css("float","left").css("width","150px")).append($("<span />").html("%").css("color","gray").css("margin-top","9px").css("margin-right","10px").css("float","left")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt").css("float","left").css("margin-left","2px").css("width","150px"));
			$(this).siblings(".ans-block").append(ques_internal_div);
			var select = $("<select />").addClass("rules-text drop_txt_small").css("float","left").css("margin-top","30px").css("width","163px");
			select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory' class = ''>Mendetory</option>");
			$(this).siblings(".ans-block").append(select);
			$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","283px").css("min-height","65px").css("float","left"));

		}
		$(".element").attr("disabled","disabled");
	});


	$(".addDrugs").live("click",function(){

		var trD = $("<tr />").attr("wing","wing");
		var tdD = $("<td />").css("border","1px solid silver");
		var val = $(this).siblings(".thisSelectDrugs").val();
		if(val != 0){
			table.append(trD.append(tdD.clone().append($("<lable />").addClass("drug-name").text(val).css("color","#1090D1"))).append(tdD.clone().append($("<input />").css("float","left").css("width","75px").attr("type","text").attr("readonly","readonly").addClass("date startDate"))).append(tdD.clone().append($("<input />").css("float","left").css("width","75px").attr("readonly","readonly").attr("type","text").addClass("date StopDate"))).append(tdD.clone().append($("<input />").css("float","left").attr("type","checkbox").addClass("continued"))).append(tdD.clone().append($("<input />").attr("type","text").addClass("dosage").width("75px").attr("maxlength","11"))).append(tdD.clone().append($("<select />").addClass("drop_txt_small1 unitDrug").html($(".select_box_unit").html()))).append(tdD.clone().addClass("removeTd").append($("<div />").append("<img src='images/delete.png' class = 'delete-row-drug' alt='Del' title='Delete' border='0' />").css("border","solid 1px silver"))));
			table.show();
			if(table.parent().find(".instruction").attr("instruction")==undefined){
				table.parent().append($("<span />").addClass("instruction").attr("instruction","instruction").html("Please Select the Start Date for each drug, put End Date or Continued put one of both but not the both,<br /> put dosage and the unit also").css("font-size","10px").css("color","silver").css("font-family","arial").css("margin-left","5px").css("margin-right","5px"));
			}
			$(this).siblings(".thisSelectDrugs").find("option").each(function(){
				if($(this).val()==val){

					$(this).hide();
				}
				if($(this).val()==0){
					$(this).attr("selected","selected");
				}
			});
			$(".element").attr("disabled","disabled");
		}else{
			alert("Please Select Drugs You Want To Put in!");
		}
	});
	$(".delete-row-drug").live("click",function(){
		var textval = $(this).parents("tr").find(".drug-name").text();

		$(".thisSelectDrugs").find("option").each(function(){
			if(textval == $(this).val()){
				$(this).show();
			}
		});
		if($(this).parents("table").find("tr").length == 1){
			$(".instruction").remove();
		}

		$(this).parents("tr").remove();
		if($(".drugTable").find("tr:first").attr("wing")==undefined){
			$(".drugTable").hide();
		}
	});

	$(".delete-row-lab").live("click",function(){
		var textval = $(this).parents("tr").find(".lab-name").text();

		$(".thisSelectLabs").find("option").each(function(){
			if(textval == $(this).val()){
				$(this).show();
			}
		});

		$(this).parents("tr").remove();
		if($(".labTable").find("tr:first").attr("wing")==undefined){
			$(".labTable").hide();
		}
	});

	$(".addLabs").live("click",function(){

		var trD = $("<tr />").attr("wing","wing");
		var tdD = $("<td />").css("border","1px solid silver");
		var val = $(this).siblings(".thisSelectLabs").val();
		if(val != 0){
			table.append(trD.append(tdD.clone().append($("<lable />").addClass("lab-name").text(val).css("color","#1090D1"))).append(tdD.clone().append($("<input />").attr("type","text").css("float","left").css("width","75px").addClass("result"))).append(tdD.clone().append($("<select />").addClass("drop_txt_small1 unitLab").html($(".select_box_unit").html()))).append(tdD.clone().addClass("removeTd").append($("<div />").append("<img src='images/delete.png' class = 'delete-row-lab' alt='Del' title='Delete' border='0' />").css("border","solid 1px silver"))));
			table.show();
			if(table.parent().find(".instruction").attr("instruction")==undefined){
				table.parent().append($("<span />").addClass("instruction").attr("instruction","instruction").html("Please put result and its unit.").css("font-size","10px").css("color","silver").css("font-family","arial").css("margin-left","5px").css("margin-right","5px"));
			}

			$(this).siblings(".thisSelectLabs").find("option").each(function(){
				if($(this).val()==val){

					$(this).hide();
				}
				if($(this).val()==0){
					$(this).attr("selected","selected");
				}
			});

		}else{
			alert("Please Select Labs You Want To Put in!");
		}
	});


	$(".add-options").live("click",function(){
		$(this).after($("<input />").attr("type","text").attr("max-length","150").addClass("option-text").css("color","silver").css("margin-left","2px").val("Please Enter the option text"));
		$(this).addClass("rem-options").removeClass("add-options");
	});
	$(".option-text").live("focusout",function(){
		if($(this).val() != "" && $(this).val() != undefined && $(this).val() != "Please Enter the option text" ){
			$(this).siblings(".ans-block").find(".list-options").append("<option value = '"+$(this).val()+"' >"+$(this).val()+"</option>");
			var newOption = $("<div />").css("float","left").append($("<span />").addClass("option-text-span").text($(this).val()));
			$(this).siblings(".ans-block").find(".ruleContainer").after("<div class = 'option-div-delete' style = 'float:left;border:solid 1px silver;clear:both;margin-top:2px;' ><span class= 'this-option' >"+$(this).val()+"</span> <span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-option' alt='Del' title='Delete' border='0' /></span></div><br />");

		}
		$(this).remove();

	});
	$(".option-text").live("focusin",function(){
		$(this).removeAttr("value");
		$(".rem-options").addClass("add-options").removeClass("rem-options");
	});

	$(".delete-option").live("click",function(){
		var this_element = $(this);
		var text = $(this).parent().siblings(".this-option").text();
		$(this).parent().parent().siblings(".each-ques-crf").find(".list-options").find("option").each(function(){
			if($(this).val() == text){
				$(this).remove();
				this_element.parent().parent().remove();
			}
		});


	});




	$(".radio").live("change",function(){
		$(this).siblings(".ans-block").empty();
		//var date = getTime();
		var now = new Date();
		var date = now.getHours()+':'+now.getMinutes()+':'+now.getSeconds()+':'+now.getMilliseconds();
		var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(".select-answer-type").val()).css("float","left").css("width","100%");
		for(var k= 0 ;k< $(this).val(); k++){
			var newdiv=$("<div />").css("width","100%");
			newdiv.append($("<br />")).append($("<span />").text("Radio Button").addClass("lab").css("color","#1090D1").css("float","left").css("width","150px")).append($("<span />").text("Answer").addClass("lab").css("color","#1090D1").css("float","left").css("width","150px"));
			newdiv.append($("<br />")).append($("<input />").attr("name","radio"+"-"+date).attr("type","radio").addClass("element edit").css("float","left").css("width","100px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit answer").css("float","left").css("width","150px"));
			ques_internal_div.append($("<br />"));
			ques_internal_div.append(newdiv);
		}
		$(this).siblings(".ans-block").append(ques_internal_div);
		var select = $("<select />").addClass("rules-radio drop_txt_small").css("float","left").css("margin-top","17px").css("margin-top","30px").css("margin-left","15px").css("width","163px");
		select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_radio' class = ''>Mendetory</option>");
		$(this).siblings(".ans-block").append(select);
		$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		$(".element").attr("disabled","disabled");
	});

	$(".radio_hor").live("change",function(){
		$(this).siblings(".ans-block").empty();
		//var date = getTime();
		var now = new Date();
		var date = now.getHours()+':'+now.getMinutes()+':'+now.getSeconds()+':'+now.getMilliseconds();
		var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(".select-answer-type").val()).css("float","left");
		for(var k= 0 ;k< $(this).val(); k++){
			//ques_internal_div.append($("<br />")).append($("<span />").text("Radio Button").addClass("lab").css("color","#1090D1").css("float","left").css("width","150px")).append($("<span />").text("Answer").addClass("lab").css("color","#1090D1").css("float","left").css("width","150px"));
			if(k%3 == 0){
				ques_internal_div.append(("<br /><br />")).append($("<input />").attr("name","radio"+"-"+date).attr("type","radio").addClass("element edit").css("float","left").css("width","50px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit answer").css("float","left").css("width","150px"));
			}else{
				ques_internal_div.append($("<input />").attr("name","radio"+"-"+date).attr("type","radio").addClass("element edit").css("float","left").css("width","50px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit answer").css("float","left").css("width","150px"));
			}
		}
		$(this).siblings(".ans-block").append(ques_internal_div);
		var select = $("<select />").addClass("rules-radio drop_txt_small").css("float","left").css("margin-top","2px").css("margin-left","15px").css("width","163px");
		select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'mendtory_radio' class = ''>Mendetory</option>");
		$(this).siblings(".ans-block").append("<br><br>").append(select);
		$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		$(".element").attr("disabled","disabled");
	});

	$(".checkbox_hor").live("change",function(){
		$(this).siblings(".ans-block").empty();
		var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(".select-answer-type").val()).css("float","left");
		var innerDiv;
		for(var k= 0 ;k< $(this).val(); k++){

			if(k%3 == 0){
				var innerDiv=$("<div />");
				innerDiv.css("width","100%").css("float","left");
				ques_internal_div.append($(innerDiv));
				innerDiv.append("<br><br>").append($("<input />").attr("name",k+"-"+($.trim($(this).siblings(".select-questions").val()))).attr("type","checkbox").addClass("element edit").css("float","left").css("width","50px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt answer").css("float","left").css("width","150px"));
			}else{
				innerDiv.append($("<input />").attr("name",k+"-"+($.trim($(this).siblings(".select-questions").val()))).attr("type","checkbox").addClass("element edit").css("float","left").css("width","50px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt answer").css("float","left").css("width","150px"));
			}

		}
		$(this).siblings(".ans-block").append(ques_internal_div);
		var select = $("<select />").addClass("rules-checkbox drop_txt_small").css("float","left").css("margin-top","2px").css("margin-left","15px").css("width","163px");
		select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'greater_checkbox' class = ''>Minimum Selection</option><option value = 'less_checkbox' class = ''>Maximum Selection</option><option value = 'mendtory_checkbox' class = ''>Mendetory</option>");
		$(this).siblings(".ans-block").append(select);
		$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		$(".element").attr("disabled","disabled");
	});

	$(".checkbox").live("change",function(){
		$(this).siblings(".ans-block").empty();
		var ques_internal_div = $("<div />").addClass("each-ques-crf").attr("ansType",$(".select-answer-type").val()).css("float","left");
		ques_internal_div.css("width","365px").css("clear","both");

		for(var k= 0 ;k< $(this).val(); k++){

			var innerDiv=$("<div />");
			innerDiv.css("width","100%").css("float","left");
			ques_internal_div.append($(innerDiv));
			innerDiv.append($("<br />")).append($("<span />").text("Check Box").addClass("lab").css("color","#1090D1").css("float","left").css("width","140px")).append($("<span />").text("Answer").addClass("lab").css("color","#1090D1").css("float","left").css("width","150px"));
			innerDiv.append($("<br />")).append($("<input />").attr("name",k+"-"+($.trim($(this).siblings(".select-questions").val()))).attr("type","checkbox").addClass("element edit").css("float","left").css("width","130px")).append($("<input />").attr("type","text").attr("maxlength","255").addClass("label-edit input_txt answer").css("float","left").css("width","150px"));
		}
		$(this).siblings(".ans-block").append(ques_internal_div);
		var select = $("<select />").addClass("rules-checkbox drop_txt_small").css("float","left").css("margin-top","2px").css("margin-left","15px").css("width","163px");
		select.append("<option value = '' class = 'first'>Select Rule</option><option value = 'greater_checkbox' class = ''>Minimum Selection</option><option value = 'less_checkbox' class = ''>Maximum Selection</option><option value = 'mendtory_checkbox' class = ''>Mendetory</option>");
		$(this).siblings(".ans-block").append(select);
		$(this).siblings(".ans-block").append($("<div />").addClass("ruleContainer").css("width","320px").css("margin-left","15px").css("min-height","65px").css("float","left"));
		$(".element").attr("disabled","disabled");
	});


	$(".save-page").live("click",function(){
		var ding = $("<div />").css("float","left").css("width","98%").css("padding","10px");
		$(".page-section").each(function(){
			ding.append($(this).attr("html"));
		});
		$(".crf-page").attr("crfPage",ding.html());
		$("html").append(ding);
		$(".date").datepicker({
			 changeMonth: true,
	            changeYear: true
		});
		$(".time").timepicker({
			ampm: true,
			hourMin: 0,
			hourMax: 24
		});
	});

	$(".save-question").click(function(){
		$(".element").removeAttr("disabled");
		if($(".select-answer-type").val()!=0 && $(".ans-block").html() != ""){
			$("#error_lable_Question").text("");
			var div_question_create = $("<div />").addClass("question-section-rnd").css("border","solid 1px scrollbar").css("width","95%").css("float","left").css("padding","5px").css("margin","5px");


			$(".each-question").find(".label-edit").each(function(){
				$(this).attr("value",$(this).val());
			});
			var parent_of_eachquestion = $(".each-question:visible").parent().clone().hide();
			$("html").append(parent_of_eachquestion);
			parent_of_eachquestion.find(".each-question").each(function(){

				$(this).find(".ans-block").each(function(){
					$(this).find(".label-edit").each(function(){
						if($(this).hasClass("answer")){
							$(this).after($("<span />").addClass("answer-lable").css("float","left").css("margin","5px").css("font-size","10px").css("font-family","arial").text($(this).val()));

						}else{
							$(this).after($("<span />").addClass("lable-answer").css("float","left").css("margin","5px").text("*"+$(this).val()));

						}

						$(this).remove();
					});
					//	if($(this).siblings(".select-questions").val() != "" && $(this).siblings(".select-questions").val() != undefined){
					var val = $(this).siblings(".select-questions").val();

					$(this).children(".each-ques-crf").prepend($("<span />").addClass("question-heading").html("Q : "+val).css("font-size","10px"));
					//	}
					$(this).find(".lab").prev("br").remove();
					$(this).find(".lab").remove();
					$(this).find("hasDatepicker").removeAttr("id").removeClass("hasDatepicker");
				});
				$(this).find(".ans-block").find(".drop_txt_small").remove();
				$(this).find(".ans-block").find(".option-div-delete").remove();
				$(this).find(".ans-block").find(".removeTd").remove();
				$(this).find(".ans-block").find(".ruleContainer").remove();
				$(this).find(".ans-block").find(".hasDatepicker").removeAttr("id").removeClass("hasDatepicker");
				div_question_create.html($(this).find(".ans-block").html());

				div_question_create.append($("<hr />").css("width","98%").css("float","left"));
			});
			if($(".select-questions").val() == "" || $(".select-questions").val() == undefined){
				$("#error_lable_Question").text("Please Enter the Question Text").css("color","red").show();
				return;
			}else{
				var  cheack = true; 
				$(".name-question-text").each(function(){

					if($(".select-questions").val() == $(this).text() && questionId != $(this).parent().attr("id")){
						cheack = false;
						$("#error_lable_Question").text("This Question text Already exist please try another").css("color","red").show();
						return;
					}
				});
				if(!cheack){
					return;
				}
				$(".answer").each(function(){
					if($(this).val() == ""){
						cheack = false;
						// $(this).after($("<div />").addClass("error_lable_answer").text("Please Write Answer").css("color","red"));
					}
				});
				if(!cheack){
					alert("Please Write Answer with each Option");
					return;
				}else{
					$(".error_lable_answer").remove();
				}

			}

			//only to show the saved html of a section

			//$("html").append(div_question_create);
			$(".each-question").attr("html",div_question_create.html());

			parent_of_eachquestion.remove();

			if($(this).attr("edit")!= undefined){

				if($(".hiddenQuestion").find(".each-ques-crf").attr("anstype") != $(".questions-container").find(".each-ques-crf").attr("anstype")){
					$("#change").val($("#change").val()+"Answer Type changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory") != $(".questions-container").find(".each-ques-crf").attr("mendtory")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_textarea") != $(".questions-container").find(".each-ques-crf").attr("mendtory_textarea")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_time") != $(".questions-container").find(".each-ques-crf").attr("mendtory_time")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_date") != $(".questions-container").find(".each-ques-crf").attr("mendtory_date")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_list") != $(".questions-container").find(".each-ques-crf").attr("mendtory_list")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_radio") != $(".questions-container").find(".each-ques-crf").attr("mendtory_radio")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("mendtory_checkbox") != $(".questions-container").find(".each-ques-crf").attr("mendtory_checkbox")){
					$("#change").val($("#change").val()+"mendtory rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("less_checkbox") != $(".questions-container").find(".each-ques-crf").attr("less_checkbox")){
					$("#change").val($("#change").val()+"less rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("greater_checkbox") != $(".questions-container").find(".each-ques-crf").attr("greater_checkbox")){
					$("#change").val($("#change").val()+"less rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("numeric") != $(".questions-container").find(".each-ques-crf").attr("numeric")){
					$("#change").val($("#change").val()+"numeric rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("less") != $(".questions-container").find(".each-ques-crf").attr("less")){
					$("#change").val($("#change").val()+"less rule changed, ");
				}
				if($(".hiddenQuestion").find(".each-ques-crf").attr("greater") != $(".questions-container").find(".each-ques-crf").attr("greater")){
					$("#change").val($("#change").val()+"greater rule changed, ");
				}
				if($(".hiddenQuestion").find(".select-questions").val() != $(".questions-container").find(".select-questions").val()){
					$("#change").val($("#change").val()+"Name of Question Changed, ");
				}
				$("#oldQuestionName").val($(".hiddenQuestion").find(".select-questions").val());
				$(".hiddenQuestion").remove();		
				$("#questionName").attr("value",$("#questionName").val());
				$("#editHtmlData").val($(".questions-container").html());
				$("#htmlData").val($(".each-question:visible").attr("html"));

				$(this).parents("form").submit();
			}else{
				$("#questionName").attr("value",$("#questionName").val());
				$("#editHtmlData").val($(".questions-container").html());
				$("#htmlData").val($(".each-question").attr("html"));

				$(this).parents("form").submit();
			}
		}else{
			alert("Please Select the Select Answer Type");
		}
	});

	$(".view-question").live("click",function(){
		$("#viewDialog").html("");
		$("#viewDialog").html($(this).attr("htmlData"));
		$("#viewDialog").dialog({
			title:"View Question",
			minWidth:600,
			height:250


		});
		$(".date").datepicker({
			 changeMonth: true,
	            changeYear: true
		});
		$(".time").timepicker({
			ampm: true,
			hourMin: 0,
			hourMax: 24
		});
	});
	$(".questions-list").live("change",function(){
		/*		
$(".section-block").find(".question-div").find(".questions-list").each(function(){

 			var valure =  $(this);
 			$(this).find("option").each(function(){
 				var textString = valure.parent().find(".section-question-block").find(".question-heading").text();
 				textString = textString.substr(textString.indexOf(":",0)+2);
 				if(textString == $(this).text()){
 					$(this).attr("selected","selected");
 				}
 			});



 		});*/
		$(this).siblings(".section-question-block").html($(this).val());
		$(".date").datepicker({
			 changeMonth: true,
	            changeYear: true
		});
		$(".time").timepicker({
			ampm: true,
			hourMin: 0,
			hourMax: 24
		});


		$(".questions-list").each(function(){
			$(this).find("option").each(function(){
				$(this).show();
			});
		});

		$(".questions-list").each(function(){
			$(this).find("option").each(function(){
				var option = $(this);
				$(".question-heading").each(function(){

					if($(this).text().indexOf(option.text())>=0){

						option.hide();
					}
				});

			});
		});



	});
	$(".section-list").live("change",function(){
		$(this).siblings(".crf-section-block").html($(this).val());
		$(".date").datepicker({ 
			changeMonth: true,
            changeYear: true
            });
		$(".time").timepicker({
			ampm: true,
			hourMin: 0,
			hourMax: 24
		});


		$(".section-list").each(function(){
			$(this).find("option").each(function(){
				$(this).show();
			});
		});

		$(".section-list").each(function(){
			$(this).find("option").each(function(){
				var option = $(this);
				$(".section-name").each(function(){

					if($(this).text().indexOf(option.text())>=0){


						option.hide();
					}
				});

			});
		});




	});
	$(".add-Section-Questions").live("click",function(){
		var div = $(".question-div-remove").clone(true);
		div.removeClass("question-div-remove");
		$(this).parent().siblings(".section-block").append(div.show());

	});

	$(".add-crf-section").live("click",function(){
		var div = $(".section-div-remove").clone(true);
		div.removeClass("section-div-remove");
		$(this).parent().siblings(".crf-block").append(div.show());
		//alert($(this).parent().siblings(".crf-block").height());
	});

	$(".save-section").click(function(){

		$("#error_lable_section").hide();



		if($(".section-block").find(".section-question-block").attr("style") != undefined){

			$(".section-question-block").each(function(index){
				var nowSection = new Date();
				var dateSection = nowSection.getHours()+':'+nowSection.getMinutes()+':'+nowSection.getSeconds()+':'+nowSection.getMilliseconds();
				$(this).find(".hasDatepicker").removeAttr("id").removeClass("hasDatepicker");
				$(this).find("input[type=radio]").each(function(){
					$(this).attr("name",$(this).attr("name")+"-"+dateSection);
				});


			});


			$("#error_lable_section").text("");
			var sectionDiv = $("<div />").css("border","solid 1px silver").css("border-radius","10px").css("float","left").css("padding-top","10px").css("padding-right","10px").css("padding-left","10px").css("width","98%");

			$(".section-question-block").each(function(){
				sectionDiv.append($(this).clone(true));

			});
			sectionDiv.find(".removeable").remove();



			var Diver = $("<div />").append(sectionDiv);



			if($("#sectionName").val() == "" || $("#sectionName").val() == undefined){
				$("#error_lable_section").text("Please Enter the Section Name").css("color","red").show();
				return;
			}else{
				var trueElement = true; 
				var index = 0;
				$(".section-block").find(".questions-list").each(function(){
					if($(this).val()==""){
						trueElement = false;
						alert("Please select the Question!");

					}
					index++;
				});
				$(".section-block").find(".questions-list").find("option").show();

				$(".name-section-text").each(function(){
					if($(this).text() == $("#sectionName").val() && $(this).parent().attr("id")!= sectionId){
						$("#error_lable_section").text("Section Name already exist please try another!").css("color","red").show();
						trueElement = false;
						return;
					}
				});
				if(!trueElement){
					return;
				}
				sectionDiv.prepend($("<h3  />").append($("<label />").css("float","left").addClass("section-name").html($("#sectionName").val())));
				$("#sectionName").attr("value",$("#sectionName").val());

			}
			$(".section-container").attr("htmlData",Diver.html());
			$(".section-container").attr("editHtml",$(".section-container").html());
			$("#htmlData").val($(".section-container").attr("htmlData"));
			$("#editHtmlData").val($(".section-container").attr("editHtml"));
			$(this).parents("form").submit();
		}else{
			alert("Please at least 1 Question in a section");
		}
	});

	$(".save-crf").click(function(){
		$("#error_lable_crf").hide();
		if($(".crf-block").find(".section-div").attr("style") != undefined){

			$("#error_lable_crf").text("");
			var sectionDiv = $("<div />").css("border","solid 1px silver").css("float","left").css("width","98%").css("border-radius","10px").css("padding-top","10px").css("padding-right","10px").css("padding-left","10px");
			$(".crf-section-block").each(function(){
				$(this).find(".hasDatepicker").removeAttr("id").removeClass("hasDatepicker");
			});

			$(".crf-section-block").each(function(){
				sectionDiv.append($(this).clone());
			});
			sectionDiv.find(".removeable").remove();
			var Diver = $("<div />").append(sectionDiv);

			if($("#crfName").val() == "" || $("#crfName").val() == undefined){
				$("#error_lable_crf").text("Please Enter the CRF Name").css("color","red");
				$("#error_lable_crf").show();
				return;
			}else{
				var trueElement = true;


				$(".crf-block").find(".section-list").each(function(){
					if($(this).val()==""){
						trueElement = false;
						alert("Please select the Section!");
					}
				});
				$(".name-section-text").each(function(){

					if($(this).text() == $("#crfName").val() && $(this).parent().attr("id")!= crfId){
						$("#error_lable_crf").text("CRF Name already exist please try another!").css("color","red");
						trueElement = false;
						return;
					}
				});
				if(!trueElement){
					return;
				}
				sectionDiv.prepend($("<span />").append($("<lable />").css("float","left").addClass("crf-name").html($("#crfName").val())));
				$("#crfName").attr("value",$("#crfName").val());

			}
			$(".section-container").attr("htmlData",Diver.html());
			$(".section-container").attr("editHtml",$(".section-container").html());
			$("#htmlData").val($(".section-container").attr("htmlData"));
			$("#editHtmlData").val($(".section-container").attr("editHtml"));
			$(this).parents("form").submit();
		}else{
			alert("Please at least 1 Section in a CRF");
		}
	});

	$(".rules-list").live("change",function(){
		if($(this).val()=="mendtory_list"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_list")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_list","mendtory_list");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory-list' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}

	});
	$(".rules-textarea").live("change",function(){
		if($(this).val()=="mendtory_textarea"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_textarea")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_textarea","mendtory_textarea");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory-textarea' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}

	});
	$(".rules-time").live("change",function(){
		if($(this).val()=="mendtory_time"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_time")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_time","mendtory_time");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory_time' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}
	});
	$(".rules-date").live("change",function(){
		if($(this).val()=="mendtory_date"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_date")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_date","mendtory_date");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory_date' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}
	});
	$(".rules-radio").live("change",function(){
		if($(this).val()=="mendtory_radio"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_radio")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_radio","mendtory_radio");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory_radio' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}
	});

	$(".rules-checkbox").live("change",function(){
		if($(this).val()=="mendtory_checkbox"){
			if($(this).siblings(".each-ques-crf").attr("mendtory_checkbox")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory_checkbox","mendtory_checkbox");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory_checkbox' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}else if($(this).val() == "less_checkbox"){

			if($(this).siblings(".each-ques-crf").attr("less_checkbox")== undefined){
				$(this).after("<input class = 'less_checkbox' style = 'font-size:10px;color:silver;position: relative;top: 2px;left:2px;float:left;' maxlength = '11' value = 'Please Enter number!'/>");
			}
		}else if($(this).val() == "greater_checkbox"){

			if($(this).siblings(".each-ques-crf").attr("greater_checkbox")== undefined){
				$(this).after("<input class = 'greater_checkbox' style = 'font-size:10px;color:silver;position: relative;top: 2px;left:2px;float:left;' maxlength = '11' value = 'Please Enter number!'/>");
			}
		}


	});

	$(".rules-text").live("change",function(){
		$(this).next(".less").remove();
		$(this).next(".greater").remove();
		if($(this).val()=="mendtory"){
			if($(this).siblings(".each-ques-crf").attr("mendtory")== undefined){
				$(this).siblings(".each-ques-crf").attr("mendtory","mendtory");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Mendeteory<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-mendtory' alt='Del' title='Delete' border='0' /></span></div><br/>");
			}
		}else if($(this).val() == "numeric"){
			if($(this).siblings(".each-ques-crf").attr("numeric")== undefined){
				$(this).siblings(".each-ques-crf").attr("numeric","numeric");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Numeric<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-numeric' alt='Del' title='Delete' border='0' /></span></div><br />");
			}
		}else if($(this).val() == "less"){

			if($(this).siblings(".each-ques-crf").attr("less")== undefined){

				$(this).after("<input class = 'less' style = 'font-size:10px;color:silver;margin-top:31px;' maxlength = '11' value = 'Please Enter number!'/>");

			}
		}else if($(this).val() == "greater"){

			if($(this).siblings(".each-ques-crf").attr("greater")== undefined){
				$(this).after("<input class = 'greater' style = 'font-size:10px;color:silver;margin-top:31px;' maxlength = '11' value = 'Please Enter number!'/>");

			}
		}

	});

	$(".less").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$(".less").live("focusin",function(){
		$(this).val("");
		$(this).removeAttr("style");
		$(this).css("margin-top","2px");
		$(this).css("float","left");
	});
	$(".less").live("focusout",function(){

		if($(this).siblings(".each-ques-crf").attr("greater")!= undefined){
			if(parseInt($(this).siblings(".each-ques-crf").attr("greater"))>=parseInt($(".less").val())){
				alert("value must be greater then"+parseInt($(this).siblings(".each-ques-crf").attr("greater")));
				return;
			}
		}

		if($(".less").val()>0){
			$(this).siblings(".each-ques-crf").attr("less",$(".less").val());
			$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Less Then "+$(".less").val()+" <span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-less' alt='Del' title='Delete' border='0' /></span></div><br />");
			if($(this).siblings(".each-ques-crf").attr("numeric")== undefined){
				$(this).siblings(".each-ques-crf").attr("numeric","numeric");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Numeric<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-numeric' alt='Del' title='Delete' border='0' /></span></div><br />");
			}
		}
		$(this).remove();

	});
	$(".greater").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$(".greater").live("focusin",function(){
		$(this).val("");
		$(this).removeAttr("style");
		$(this).css("margin-top","2px");
		$(this).css("float","left");
	});
	$(".greater").live("focusout",function(){
		if($(this).siblings(".each-ques-crf").attr("less")!= undefined){
			if(parseInt($(this).siblings(".each-ques-crf").attr("less"))<= parseInt($(".greater").val())){
				alert("value must be less then"+parseInt($(this).siblings(".each-ques-crf").attr("less")));
				return;
			}
		}
		if($(".greater").val()> -1){
			$(this).siblings(".each-ques-crf").attr("greater",$(".greater").val());
			$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Greater Then "+$(".greater").val()+" <span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-greater' alt='Del' title='Delete' border='0' /></span></div><br />");
			if($(this).siblings(".each-ques-crf").attr("numeric")== undefined){
				$(this).siblings(".each-ques-crf").attr("numeric","numeric");
				$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Numeric<span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-numeric' alt='Del' title='Delete' border='0' /></span></div><br />");
			}
		}
		$(this).remove();



	});

	$(".less_checkbox").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);
	});
	$(".less_checkbox").live("focusin",function(){
		$(this).val("");
		$(this).removeAttr("style");
		$(this).css("margin-top","2px");
		$(this).css("float","left");
	});
	$(".less_checkbox").live("focusout",function(){
		//alert(($(".element").length-1)+"*****"+(parseInt($(this).val())-1));
		if($(".element").length < parseInt($(this).val())){
			alert("value must be less then "+$(".element").length);
			return;
		}else if($(this).siblings(".each-ques-crf").attr("greater_checkbox")!= undefined){
			if(parseInt($(this).siblings(".each-ques-crf").attr("greater_checkbox")) > parseInt($(".less_checkbox").val())){
				alert("value must be greater then "+parseInt($(this).siblings(".each-ques-crf").attr("greater_checkbox")));
				return;
			}
		}

		if($(".less_checkbox").val()>0){
			$(this).siblings(".each-ques-crf").attr("less_checkbox",$(".less_checkbox").val());
			$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Maximum Select "+$(".less_checkbox").val()+" <span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-less_checkbox' alt='Del' title='Delete' border='0' /></span></div><br />");
		}
		$(this).remove();

	});
	$(".greater_checkbox").live("keyup",function(){

		this.value = this.value.replace(/[^0-9\.]/g,'');

		if($(this).val()=="" || $(this).val()==null)
			$(this).val(0);  
		var temp=$(this).val();
		temp=parseFloat(temp);
		$(this).val(temp);

	});
	$(".greater_checkbox").live("focusin",function(){
		$(this).val("");
		$(this).removeAttr("style");
		$(this).css("margin-top","2px");
		$(this).css("float","left");
	});
	$(".greater_checkbox").live("focusout",function(){
		if($(this).siblings(".each-ques-crf").attr("less_checkbox")!= undefined){
			if(parseInt($(this).siblings(".each-ques-crf").attr("less_checkbox"))< parseInt($(".greater_checkbox").val())){
				alert("value must be less then "+parseInt($(this).siblings(".each-ques-crf").attr("less_checkbox")));
				return;
			}
		}
		if($(".greater_checkbox").val()>0){
			$(this).siblings(".each-ques-crf").attr("greater_checkbox",$(".greater_checkbox").val());
			$(this).siblings(".ruleContainer").append("<div class = 'mendtory' style = 'width:160px;float:left;border:solid 1px silver;clear:both;margin-top:2px;' >Minimum Select "+$(".greater_checkbox").val()+" <span style = 'float:right;border:solid 1px silver;'><img src='images/delete.png' class = 'delete-rule-greater_checkbox' alt='Del' title='Delete' border='0' /></span></div><br />");
		}else{
			$(".rules-checkbox").find(".first").attr("selected","selected");
		}
		$(this).remove();

	});

	////////////////////////////////
	$(".delete-rule-mendtory-list").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_list");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
	});

	$(".delete-rule-mendtory-textarea").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_textarea");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
	});

	$(".delete-rule-mendtory_time").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_time");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
	});
	$(".delete-rule-mendtory_date").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_date");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
	});

	$(".delete-rule-mendtory_checkbox").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_checkbox");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
	});
	$(".delete-rule-mendtory_radio").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory_radio");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-numeric").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("numeric");
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("less");
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("greater");

		var elem1 = $(this).parents(".ruleContainer").find(".delete-rule-less");
		elem1.parent().parent().prev().remove();
		elem1.parent().parent().remove();

		var elem2 = $(this).parents(".ruleContainer").find(".delete-rule-greater");
		elem2.parent().parent().prev().remove();
		elem2.parent().parent().remove();

		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-mendtory").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("mendtory");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-less_checkbox").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("less_checkbox");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-greater_checkbox").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("greater_checkbox");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-less").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("less");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});
	$(".delete-rule-greater").live("click",function(){
		$(this).parents(".ruleContainer").siblings(".each-ques-crf").removeAttr("greater");
		$(this).parent().parent().prev().remove();
		$(this).parent().parent().remove();
		if($(".ruleContainer").html() == "<br>"){
			$(".ruleContainer").html("");
		}
	});

	var wid = $(".body_content").outerWidth();
	/*	if(screen.width == 1024){
		alert(screen.width);
		 $('.right_body_content').css('width',"785px");
		}else if(screen.width >= 1366){
			alert(screen.width);
			$('.right_body_content').css('width',"1100px");
		}*/

	$('.right_body_content').css('width',"80%");

});

function LoadVisitsForm(id){
	if(id=="formAddQuestion")
	{
		$("#Create_Visit_Main_Error").hide();
		$("#Create_Visit_Main_Success").hide();

		$('a[name="hrefCrf_Add_Div"]').attr('id', 'current');
		$('a[name="hrefView_Visitlist_Div"]').attr('id', '');

	}
	else if(id=="View_Visitlist_Div")
	{
		$("#View_Visitlist_Main_Error").hide();
		$("#View_Visitlist_Main_Success").hide();

		$('a[name="hrefCreate_Visit_Div"]').attr('id', '');
		$('a[name="hrefView_Visitlist_Div"]').attr('id', 'current');
	}

	$("#"+id).show("slow").siblings().hide("slow");
}



function text_of_options(element , val){
	var return_value;
	element.find("option").each(function(){
		if($(this).attr("value") == val){
			val = $(this).text();
			return_value = val;
			return;
		}
	});
	return return_value;
}

function LoadCRFForm(id)
{ 

	if(id=="" || id== null){
		$("#add_question_form").show("slow").siblings().hide("slow");
	}
	else{
		$("#"+id).show("slow").siblings().hide("slow");

	}

	$('.chk_avail_yes').hide();
	$('.error_label').hide();
}




function getTime() {

	var dTime = new Date();

	var hours = dTime.getHours();

	var minute = dTime.getMinutes();

	var period = "AM";

	if (hours > 12) {

		period = "PM";

	}else {

		period = "AM";

	}

	hours = ((hours > 12) ? hours - 12 : hours);

	return hours + ":" + minute + " " + period;

}


//resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//Displays a form within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddATGreenMessage").hide();
	$("#AddATErrorMessage").hide();

	$("#EditATGreenMessage").hide();
	$("#EditATErrorMessage").hide();

	document.getElementById("addatcode").value = "";
	document.getElementById("addatname").value = "";
	//document.getElementById("addattext").innerHTML = "";
	document.getElementById("addattext").value = "";

	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddAnswerTextMessage(val)
{	

	if(val == 1){
		document.getElementById('AddATErrorMessage').innerHTML="Answer Text already Exists!";
		$("#AddATErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddATErrorMessage').innerHTML="Answer Text Code already exists";
		$("#AddATErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddATGreenMessage').innerHTML="Answer Text saved Successfully!";
		$("#AddATGreenMessage").show();

		document.getElementById("addatcode").value = "";
		document.getElementById("addatname").value = "";
		//document.getElementById("addattext").innerHTML = "";
		document.getElementById("addattext").value = "";
	}
	else if(val == 4){
		document.getElementById("AddATErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddATErrorMessage").show();
	}
	else{
		document.getElementById("AddATGreenMessage").innerHTML = "";
		document.getElementById("AddATErrorMessage").innerHTML = "";
		$("#AddATGreenMessage").hide();
		$("#AddATErrorMessage").hide();
	}
}

function EditAnswerTextMessage(val){

	if(val == 1){
		document.getElementById('EditATErrorMessage').innerHTML="Answer Text Code already Exists!";
		$("#EditATErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditATErrorMessage').innerHTML="Answer Text already exists";
		$("#EditATErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditATGreenMessage').innerHTML="Answer Text updated Successfully!";
		$("#EditATGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditATErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditATErrorMessage").show();
	}
	else{
		document.getElementById("EditATGreenMessage").innerHTML = "";
		document.getElementById("EditATErrorMessage").innerHTML = "";
		$("#EditATGreenMessage").hide();
		$("#EditATErrorMessage").hide();
	}
}

function passEditValues(at_id, at_code, at_name, at_text, edit_form_id, form_id){

//	Populate existing values in edit form

	document.getElementById("editatid").value =at_id;
	document.getElementById("editatcode").value=at_code;
	document.getElementById("editatname").value=at_name;
	document.getElementById("editattext").innerHTML=at_text;

//	Make Edit Form Visible
	LoadFormLibrary(form_id);

}

$(document).ready(function() {

	// resize window


	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};

	$("#AddATGreenMessage").hide();
	$("#AddATErrorMessage").hide();

	$("#EditATGreenMessage").hide();
	$("#EditATErrorMessage").hide();

	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	if(state=="")
	{
		$("#add_answertext_form").show("slow").siblings().hide("slow");	
	}else{
		AddAnswerTextMessage(MessageCode);
		EditAnswerTextMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH ANSWER TEXT
	$("#View_AnswerTexts_Search_Bar").keyup(function(){

		$("#fbody").find("tr").hide();
		var data = this.value.split(" ");
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

//	**** END SEARCH

}); //end document ready function


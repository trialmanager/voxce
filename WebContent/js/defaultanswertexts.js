
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

	document.getElementById("addatdisplayorder").value = "";

	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddDefaultAnswerTextMessage(val)
{	

	if(val == 1){
		document.getElementById('AddATErrorMessage').innerHTML="Default Answer Text already Exists!";
		$("#AddATErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddATErrorMessage').innerHTML="Default Answer Text Code already exists";
		$("#AddATErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddATGreenMessage').innerHTML="Default Answer Text saved Successfully!";
		$("#AddATGreenMessage").show();

		document.getElementById("addatdisplayorder").value = "";
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

function EditDefaultAnswerTextMessage(val){

	if(val == 1){
		document.getElementById('EditATErrorMessage').innerHTML="Default Answer Text Code already Exists!";
		$("#EditATErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditATErrorMessage').innerHTML="Default Answer Text already exists";
		$("#EditATErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditATGreenMessage').innerHTML="Default Answer Text updated Successfully!";
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

function passEditValues(at_id, at_quest, at_order, at_ans, edit_form_id, form_id){

//	Populate existing values in edit form

	alert("copying values");
	document.getElementById("editdatid").value =at_id;
	document.getElementById("editdatquestiontextid").value=at_quest;
	document.getElementById("editdatdisplayorder").value=at_order;
	document.getElementById("editdatanswertextid").value=at_ans;
	alert("copied value");
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
		$("#add_defaultanswertext_form").show("slow").siblings().hide("slow");	
	}else{
		AddDefaultAnswerTextMessage(MessageCode);
		EditDefaultAnswerTextMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DEFAULT ANSWER TEXT
	$("#View_DefaultAnswerTexts_Search_Bar").keyup(function(){

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


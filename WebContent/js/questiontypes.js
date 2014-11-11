// resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//loads a form within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddQuestionTypeGreenMessage").hide();
	$("#AddQuestionTypeErrorMessage").hide();
	
	$("#EditQuestionTypeGreenMessage").hide();
	$("#EditQuestionTypeErrorMessage").hide();
	
	document.getElementById("addquestiontypecode").value = "";
	document.getElementById("addquestiontypename").value = "";
	//document.getElementById("addquestiontypedescription").innerHTML = "";
	document.getElementById("addquestiontypedescription").value = "";
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddQuestionTypeMessage(val)
{	
	if(val == 1){
		document.getElementById('AddQuestionTypeErrorMessage').innerHTML="QuestionType already Exists!";
		$("#AddQuestionTypeErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddQuestionTypeErrorMessage').innerHTML="QuestionType Code already exists";
		$("#AddQuestionTypeErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddQuestionTypeGreenMessage').innerHTML="QuestionType saved Successfully!";
		$("#AddQuestionTypeGreenMessage").show();
		
		document.getElementById("addquestiontypecode").value = "";
		document.getElementById("addquestiontypename").value = "";
		//document.getElementById("addquestiontypedescription").innerHTML = "";
		document.getElementById("addquestiontypedescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddQuestionTypeErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddQuestionTypeErrorMessage").show();
	}
	else{
		document.getElementById("AddQuestionTypeGreenMessage").innerHTML = "";
		document.getElementById("AddQuestionTypeErrorMessage").innerHTML = "";
		$("#AddQuestionTypeGreenMessage").hide();
		$("#AddQuestionTypeErrorMessage").hide();
	}
}

function EditQuestionTypeMessage(val){

	if(val == 1){
		document.getElementById('EditQuestionTypeErrorMessage').innerHTML="QuestionType Code already Exists!";
		$("#EditQuestionTypeErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditQuestionTypeErrorMessage').innerHTML="QuestionType already exists";
		$("#EditQuestionTypeErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditQuestionTypeGreenMessage').innerHTML="QuestionType saved Successfully!";
		$("#EditQuestionTypeGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditQuestionTypeErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditQuestionTypeErrorMessage").show();
	}
	else{
		document.getElementById("EditQuestionTypeGreenMessage").innerHTML = "";
		document.getElementById("EditQuestionTypeErrorMessage").innerHTML = "";
		$("#EditQuestionTypeGreenMessage").hide();
		$("#EditQuestionTypeErrorMessage").hide();
	}
}



function passEditValues(qt_id, qt_code, qt_name, qt_description, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editquestiontypeid").value =qt_id;
	document.getElementById("editquestiontypecode").value=qt_code;
	document.getElementById("editquestiontypename").value=qt_name;
	document.getElementById("editquestiontypedescription").value=qt_description;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	$("#AddQuestionTypeGreenMessage").hide();
	$("#AddQuestionTypeErrorMessage").hide();
	
	$("#EditQuestionTypeGreenMessage").hide();
	$("#EditQuestionTypeErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#add_questiontype_form").show("slow").siblings().hide("slow");	
	}else{
		AddQuestionTypeMessage(MessageCode);
		EditQuestionTypeMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

//***** SEARCH LAB
	$("#View_QuestionTypes_Search_Bar").keyup(function(){
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

//**** END SEARCH

}); //end document ready function


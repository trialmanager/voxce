// resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//Displays a form within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddQTGreenMessage").hide();
	$("#AddQTErrorMessage").hide();
	
	$("#EditQTGreenMessage").hide();
	$("#EditQTErrorMessage").hide();
	
	document.getElementById("addqtcode").value = "";
	document.getElementById("addqtname").value = "";
	//document.getElementById("addqttext").innerHTML = "";
	document.getElementById("addqttext").value = "";
	
	//Show Form
	 $("#"+id).show("slow").siblings().hide("slow");
}

function AddQuestionTextMessage(val)
{	
	
	if(val == 1){
		document.getElementById('AddQTErrorMessage').innerHTML="Question Text already Exists!";
		$("#AddQTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddQTErrorMessage').innerHTML="Question Text Code already exists";
		$("#AddQTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddQTGreenMessage').innerHTML="Question Text saved Successfully!";
		$("#AddQTGreenMessage").show();
		
		document.getElementById("addqtcode").value = "";
		document.getElementById("addqtname").value = "";
		//document.getElementById("addqttext").innerHTML = "";
		document.getElementById("addqttext").value = "";
	}
	else if(val == 4){
		document.getElementById("AddQTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddQTErrorMessage").show();
	}
	else{
		document.getElementById("AddQTGreenMessage").innerHTML = "";
		document.getElementById("AddQTErrorMessage").innerHTML = "";
		$("#AddQTGreenMessage").hide();
		$("#AddQTErrorMessage").hide();
	}
}

function EditQuestionTextMessage(val){

	if(val == 1){
		document.getElementById('EditQtErrorMessage').innerHTML="Question Text Code already Exists!";
		$("#EditQTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditQTErrorMessage').innerHTML="Question Text already exists";
		$("#EditQTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditQTGreenMessage').innerHTML="Question Text updated Successfully!";
		$("#EditQTGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditQTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditQTErrorMessage").show();
	}
	else{
		document.getElementById("EditQTGreenMessage").innerHTML = "";
		document.getElementById("EditQTErrorMessage").innerHTML = "";
		$("#EditQTGreenMessage").hide();
		$("#EditQTErrorMessage").hide();
	}
}

function passEditValues(qt_id, qt_code, qt_name, qt_cat_id, qt_cat_name, qt_text, edit_form_id, form_id){

//Populate existing values in edit form
	

	document.getElementById("editqtid").value =qt_id;
	document.getElementById("editqtcode").value=qt_code;
	document.getElementById("editqtname").value=qt_name;
	document.getElementById("editqtcategory").value=qt_cat_id;
	document.getElementById("editqttext").innerHTML=qt_text;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AddQTGreenMessage").hide();
	$("#AddQTErrorMessage").hide();
	
	$("#EditQTGreenMessage").hide();
	$("#EditQTErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	if(state=="")
	{
		$("#add_questiontext_form").show("slow").siblings().hide("slow");	
	}else{
		
		AddQuestionTextMessage(MessageCode);
		EditQuestionTextMessage(EditMessageCode);
		
		$("#"+state).show("slow").siblings().hide("slow");
	}
	
	//***** SEARCH QUESTION TEXT
	$("#View_QuestionTexts_Search_Bar").keyup(function(){
		
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


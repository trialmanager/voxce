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
	$("#AddVRuleGreenMessage").hide();
	$("#AddVRuleErrorMessage").hide();
	
	$("#EditVRuleGreenMessage").hide();
	$("#EditVRuleErrorMessage").hide();
	
	document.getElementById("addvrulename").value = "";
	document.getElementById("addvruletext").value = "";
	document.getElementById("addvruletype").value = "";
	//document.getElementById("addvruleargument").innerHTML = "";
	document.getElementById("addvruleargument").value = "";
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddValidationRulesMessage(val)
{	
	if(val == 1){
		document.getElementById('AddVRuleErrorMessage').innerHTML="Validation Rule already Exists!";
		$("#AddVRuleErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddVRuleErrorMessage').innerHTML="Validation Rule Code already exists";
		$("#AddVRuleErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddVRuleGreenMessage').innerHTML="Validation Rule saved Successfully!";
		$("#AddVRuleGreenMessage").show();
		
		document.getElementById("addvrulename").value = "";
		document.getElementById("addvruletext").value = "";
		document.getElementById("addvruletype").value = "";
		//document.getElementById("addvruleargument").innerHTML = "";
		document.getElementById("addvruleargument").value = "";
	}
	else if(val == 4){
		document.getElementById("AddVRuleErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddVRuleErrorMessage").show();
	}
	else{
		document.getElementById("AddVRuleGreenMessage").innerHTML = "";
		document.getElementById("AddVRuleErrorMessage").innerHTML = "";
		$("#AddVRuleGreenMessage").hide();
		$("#AddVRuleErrorMessage").hide();
	}
}

function EditValidationRulesMessage(val){

	if(val == 1){
		document.getElementById('EditVRuleErrorMessage').innerHTML="Validation Rule Code already Exists!";
		$("#EditVRuleErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditVRuleErrorMessage').innerHTML="Validation Rule already exists";
		$("#EditVRuleErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditVRuleGreenMessage').innerHTML="Validation Rule saved Successfully!";
		$("#EditVRuleGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditVRuleErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditVRuleErrorMessage").show();
	}
	else{
		document.getElementById("EditVRuleGreenMessage").innerHTML = "";
		document.getElementById("EditVRuleErrorMessage").innerHTML = "";
		$("#EditVRuleGreenMessage").hide();
		$("#EditVRuleErrorMessage").hide();
	}
}



function passEditValues(vrule_id, vrule_name, vrule_text, vrule_type, vrule_argument, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editvruleid").value=vrule_id;
	document.getElementById("editvrulename").value=vrule_name;
	document.getElementById("editvruletext").value=vrule_text;
	document.getElementById("editvruletype").value=vrule_type;
	document.getElementById("editvruleargument").value=vrule_argument;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window

	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AddVRuleGreenMessage").hide();
	$("#AddVRuleErrorMessage").hide();
	
	$("#EditVRuleGreenMessage").hide();
	$("#EditVRuleErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formAddValidationRule").show("slow").siblings().hide("slow");	
	}else{
		AddValidationRulesMessage(MessageCode);
		EditValidationRulesMessage(EditMessageCode);
		
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

//***** SEARCH LAB
	$("#View_ValidationRules_Search_Bar").keyup(function(){
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


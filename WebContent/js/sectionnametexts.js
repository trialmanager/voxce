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
	$("#AddSNTGreenMessage").hide();
	$("#AddSNTErrorMessage").hide();
	
	$("#EditSNTGreenMessage").hide();
	$("#EditSNTErrorMessage").hide();
	
	document.getElementById("addsntcode").value = "";
	document.getElementById("addsntname").value = "";
	//document.getElementById("addsnttext").innerHTML = "";
	document.getElementById("addsnttext").value = "";
	
	//Show Form
	 $("#"+id).show("slow").siblings().hide("slow");
}

function AddSectionNameTextMessage(val)
{	
	
	if(val == 1){
		document.getElementById('AddSNTErrorMessage').innerHTML="Section Name Text already Exists!";
		$("#AddSNTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddSNTErrorMessage').innerHTML="Section Name Text Code already exists";
		$("#AddSNTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddSNTGreenMessage').innerHTML="Section Name Text saved Successfully!";
		$("#AddSNTGreenMessage").show();
		
		document.getElementById("addsntcode").value = "";
		document.getElementById("addsntname").value = "";
		//document.getElementById("addsnttext").innerHTML = "";
		document.getElementById("addsnttext").value = "";
	}
	else if(val == 4){
		document.getElementById("AddSNTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddSNTErrorMessage").show();
	}
	else{
		document.getElementById("AddSNTGreenMessage").innerHTML = "";
		document.getElementById("AddSNTErrorMessage").innerHTML = "";
		$("#AddSNTGreenMessage").hide();
		$("#AddSNTErrorMessage").hide();
	}
}

function EditSectionNameTextMessage(val){

	if(val == 1){
		document.getElementById('EditSNTErrorMessage').innerHTML="Section Name Text Code already Exists!";
		$("#EditSNTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditSNTErrorMessage').innerHTML="Section Name Text already exists";
		$("#EditSNTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditSNTGreenMessage').innerHTML="Section Name Text updated Successfully!";
		$("#EditSNTGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditSNTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditSNTErrorMessage").show();
	}
	else{
		document.getElementById("EditSNTGreenMessage").innerHTML = "";
		document.getElementById("EditSNTErrorMessage").innerHTML = "";
		$("#EditSNTGreenMessage").hide();
		$("#EditSNTErrorMessage").hide();
	}
}

function passEditValues(snt_id, snt_code, snt_name, snt_text, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editsntid").value =snt_id;
	document.getElementById("editsntcode").value=snt_code;
	document.getElementById("editsntname").value=snt_name;
	document.getElementById("editsnttext").innerHTML=snt_text;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AdSNTGreenMessage").hide();
	$("#AddSNTErrorMessage").hide();
	
	$("#EditSNTGreenMessage").hide();
	$("#EditSNTErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	if(state=="")
	{
		$("#add_SectionNametext_form").show("slow").siblings().hide("slow");	
	}else{
		AddSectionNameTextMessage(MessageCode);
		EditSectionNameTextMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	
	//***** SEARCH SECTION NAME TEXT
	$("#View_SectionNameTexts_Search_Bar").keyup(function(){
		
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


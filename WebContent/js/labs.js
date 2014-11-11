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
	$("#AddLabGreenMessage").hide();
	$("#AddLabErrorMessage").hide();
	
	$("#EditLabGreenMessage").hide();
	$("#EditLabErrorMessage").hide();
	
	document.getElementById("addlabcode").value = "";
	document.getElementById("addlabname").value = "";
	//document.getElementById("addlabdescription").innerHTML = "";
	document.getElementById("addlabdescription").value = "";
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddLabMessage(val)
{	
	if(val == 1){
		document.getElementById('AddLabErrorMessage').innerHTML="Lab already Exists!";
		$("#AddLabErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddLabErrorMessage').innerHTML="Lab Code already exists";
		$("#AddLabErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddLabGreenMessage').innerHTML="Lab saved Successfully!";
		$("#AddLabGreenMessage").show();
		
		document.getElementById("addlabcode").value = "";
		document.getElementById("addlabname").value = "";
		//document.getElementById("addlabdescription").innerHTML = "";
		document.getElementById("addlabdescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddLabErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddLabErrorMessage").show();
	}
	else{
		document.getElementById("AddLabGreenMessage").innerHTML = "";
		document.getElementById("AddLabErrorMessage").innerHTML = "";
		$("#AddLabGreenMessage").hide();
		$("#AddLabErrorMessage").hide();
	}
}

function EditLabMessage(val){

	if(val == 1){
		document.getElementById('EditLabErrorMessage').innerHTML="Lab Code already Exists!";
		$("#EditLabErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditLabErrorMessage').innerHTML="Lab already exists";
		$("#EditLabErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditLabGreenMessage').innerHTML="Lab saved Successfully!";
		$("#EditLabGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditLabErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditLabErrorMessage").show();
	}
	else{
		document.getElementById("EditLabGreenMessage").innerHTML = "";
		document.getElementById("EditLabErrorMessage").innerHTML = "";
		$("#EditLabGreenMessage").hide();
		$("#EditLabErrorMessage").hide();
	}
}



function passEditValues(lab_id, lab_code, lab_name, lab_description, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editlabid").value =lab_id;
	document.getElementById("editlabcode").value=lab_code;
	document.getElementById("editlabname").value=lab_name;
	document.getElementById("editlabdescription").value=lab_description;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	$("#AddLabGreenMessage").hide();
	$("#AddLabErrorMessage").hide();
	
	$("#EditLabGreenMessage").hide();
	$("#EditLabErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formAddLab").show("slow").siblings().hide("slow");	
	}else{
		AddLabMessage(MessageCode);
		EditLabMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

//***** SEARCH LAB
	$("#View_Labs_Search_Bar").keyup(function(){
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


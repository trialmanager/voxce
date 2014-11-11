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
	$("#AddUOMGreenMessage").hide();
	$("#AddUOMErrorMessage").hide();
	
	$("#EditUOMGreenMessage").hide();
	$("#EditUOMErrorMessage").hide();
	
	document.getElementById("adduomcode").value = "";
	document.getElementById("adduomname").value = "";
	//document.getElementById("adduomdescription").innerHTML = "";
	document.getElementById("adduomdescription").value = "";
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddUOMMessage(val)
{	
	if(val == 1){
		document.getElementById('AddUOMErrorMessage').innerHTML="Unit Of Measure already Exists!";
		$("#AddUOMErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddUOMErrorMessage').innerHTML="Unit Of Measure Code already exists";
		$("#AddUOMErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddUOMGreenMessage').innerHTML="Unit Of Measure saved Successfully!";
		$("#AddUOMGreenMessage").show();
		
		document.getElementById("adduomcode").value = "";
		document.getElementById("adduomname").value = "";
		//document.getElementById("adduomdescription").innerHTML = "";
		document.getElementById("adduomdescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddUOMErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddUOMErrorMessage").show();
	}
	else{
		document.getElementById("AddUOMGreenMessage").innerHTML = "";
		document.getElementById("AddUOMErrorMessage").innerHTML = "";
		$("#AddUOMGreenMessage").hide();
		$("#AddUOMErrorMessage").hide();
	}
}

function EditUOMMessage(val){

	if(val == 1){
		document.getElementById('EditUOMErrorMessage').innerHTML="Unit Of Measure Code already Exists!";
		$("#EditUOMErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditUOMErrorMessage').innerHTML="Unit Of Measure already exists";
		$("#EditUOMErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditUOMGreenMessage').innerHTML="Unit Of Measure saved Successfully!";
		$("#EditUOMGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditUOMErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditUOMErrorMessage").show();
	}
	else{
		document.getElementById("EditUOMGreenMessage").innerHTML = "";
		document.getElementById("EditUOMErrorMessage").innerHTML = "";
		$("#EditUOMGreenMessage").hide();
		$("#EditUOMErrorMessage").hide();
	}
}



function passEditValues(uom_id, uom_code, uom_name, uom_description, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("edituomid").value =uom_id;
	document.getElementById("edituomcode").value=uom_code;
	document.getElementById("edituomname").value=uom_name;
	document.getElementById("edituomdescription").value=uom_description;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window

	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	$("#AddUOMGreenMessage").hide();
	$("#AddUOMErrorMessage").hide();
	
	$("#EditUOMGreenMessage").hide();
	$("#EditUOMErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formAddUOM").show("slow").siblings().hide("slow");	
	}else{
		AddUOMMessage(MessageCode);
		EditUOMMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

//***** SEARCH UOM
	$("#View_UOM_Search_Bar").keyup(function(){
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


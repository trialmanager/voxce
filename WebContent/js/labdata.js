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
	
	$("#EditLabDataGreenMessage").hide();
	$("#EditLabDataErrorMessage").hide();
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}


function EditLabMessage(val){

	if(val == 1){
		document.getElementById('EditLabDataErrorMessage').innerHTML="Lab Code already Exists!";
		$("#EditLabDataErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditLabDataErrorMessage').innerHTML="Lab already exists";
		$("#EditLabDataErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditLabDataGreenMessage').innerHTML="Lab Data saved Successfully!";
		$("#EditLabDataGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditLabDataErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditLabDataErrorMessage").show();
	}
	else{
		document.getElementById("EditLabDataGreenMessage").innerHTML = "";
		document.getElementById("EditLabDataErrorMessage").innerHTML = "";
		$("#EditLabDataGreenMessage").hide();
		$("#EditLabDataErrorMessage").hide();
	}
}



function passEditValues(lab_norm_id, laboratory_id, lab_id, default_unit, n_low, n_low_unit, n_high, n_high_unit, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editlabdataid").value=lab_norm_id;
	document.getElementById("editlabdatacurrentlaboratoryid").value=laboratory_id;
	document.getElementById("editlabdatalabname").value=lab_id;
	document.getElementById("editlabdatadefaultunit").value=default_unit;
	document.getElementById("editlabdatanormallow").value=n_low;
	document.getElementById("editlabdatalowunit").value=n_low_unit;
	document.getElementById("editlabdatanormalhigh").value=n_high;
	document.getElementById("editlabdatahighunit").value=n_high_unit;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window

	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	$("#EditLabDataGreenMessage").hide();
	$("#EditLabDataErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formEditLabData").show("slow").siblings().hide("slow");	
	}else{
		EditLabMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

//***** SEARCH LAB DATA
	$("#View_LabData_Search_Bar").keyup(function(){
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


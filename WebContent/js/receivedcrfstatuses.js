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
	$("#AddRCSGreenMessage").hide();
	$("#AddRCSErrorMessage").hide();
	
	$("#EditRCSGreenMessage").hide();
	$("#EditRCSErrorMessage").hide();
	
	document.getElementById("addrcscode").value = "";
	document.getElementById("addrcsname").value = "";
	//document.getElementById("addrcsdescription").innerHTML = "";
	document.getElementById("addrcsdescription").value = "";
	
	//Show form
	 $("#"+id).show("slow").siblings().hide("slow");
}

function AddReceivedCrfStatusesMessage(val)
{		
	if(val == 1){
		document.getElementById('AddRCSErrorMessage').innerHTML="Received CRF Status already Exists!";
		$("#AddRCSErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddRCSErrorMessage').innerHTML="Received CRF Status Code already exists";
		$("#AddRCSErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddRCSGreenMessage').innerHTML="Received CRF Status saved Successfully!";
		$("#AddRCSGreenMessage").show();
		
		document.getElementById("addrcscode").value = "";
		document.getElementById("addrcsname").value = "";
		//document.getElementById("addrcsdescription").innerHTML = "";
		document.getElementById("addrcsdescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddRCSErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddRCSErrorMessage").show();
	}
	else{
		document.getElementById("AddRCSGreenMessage").innerHTML = "";
		document.getElementById("AddRCSErrorMessage").innerHTML = "";
		$("#AddRCSGreenMessage").hide();
		$("#AddRCSErrorMessage").hide();
	}
}

function EditReceivedCrfStatusesMessage(val){

	if(val == 1){
		document.getElementById('EditRCSErrorMessage').innerHTML="Received CRF Status Code already Exists!";
		$("#EditRCSErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditRCSErrorMessage').innerHTML="Received CRF Status already exists";
		$("#EditRCSErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditRCSGreenMessage').innerHTML="Received CRF Status updated Successfully!";
		$("#EditRCSGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditRCSErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditRCSErrorMessage").show();
	}
	else{
		document.getElementById("EditRCSGreenMessage").innerHTML = "";
		document.getElementById("EditRCSErrorMessage").innerHTML = "";
		$("#EditRCSGreenMessage").hide();
		$("#EditRCSErrorMessage").hide();
	}
}



function passEditValues(rcs_id, rcs_code, rcs_name, rcs_description, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("editrcsid").value =rcs_id;
	document.getElementById("editrcscode").value=rcs_code;
	document.getElementById("editrcsname").value=rcs_name;
	document.getElementById("editrcsdescription").value=rcs_description;
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	 
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	//Set message fields	
	$("#AddRCSGreenMessage").hide();
	$("#AddRCSErrorMessage").hide();
	
	$("#EditRCSGreenMessage").hide();
	$("#EditRCSErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	//Decide and Show form on page load
	if(state=="")
	{
		$("#add_rcs_form").show("slow").siblings().hide("slow");	
	}else{
		AddReceivedCrfStatusesMessage(MessageCode);
		EditReceivedCrfStatusesMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	
	//***** SEARCH DRUG
	$("#View_ReceivedCrfStatuses_Search_Bar").keyup(function(){
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


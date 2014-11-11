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
	$("#AddDTGreenMessage").hide();
	$("#AddDTErrorMessage").hide();

	$("#EditDTGreenMessage").hide();
	$("#EditDTErrorMessage").hide();

	document.getElementById("adddtcode").value = "";
	document.getElementById("adddtname").value = "";
	//document.getElementById("adddttext").innerHTML = "";
	document.getElementById("adddttext").value = "";

	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddDiscrepancyTextMessage(val)
{	

	if(val == 1){
		document.getElementById('AddDTErrorMessage').innerHTML="Discrepancy Text already Exists!";
		$("#AddDTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddDTErrorMessage').innerHTML="Discrepancy Text Code already exists";
		$("#AddDTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddDTGreenMessage').innerHTML="Discrepancy Text saved Successfully!";
		$("#AddDTGreenMessage").show();

		document.getElementById("adddtcode").value = "";
		document.getElementById("adddtname").value = "";
		//document.getElementById("adddttext").innerHTML = "";
		document.getElementById("adddttext").value = "";
	}
	else if(val == 4){
		document.getElementById("AddDTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddDTErrorMessage").show();
	}
	else{
		document.getElementById("AddDTGreenMessage").innerHTML = "";
		document.getElementById("AddDTErrorMessage").innerHTML = "";
		$("#AddDTGreenMessage").hide();
		$("#AddDTErrorMessage").hide();
	}
}

function EditDiscrepancyTextMessage(val){

	if(val == 1){
		document.getElementById('EditDtErrorMessage').innerHTML="Discrepancy Text Code already Exists!";
		$("#EditDTErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditDTErrorMessage').innerHTML="Discrepancy Text already exists";
		$("#EditDTErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditDTGreenMessage').innerHTML="Discrepancy Text updated Successfully!";
		$("#EditDTGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditDTErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditDTErrorMessage").show();
	}
	else{
		document.getElementById("EditDTGreenMessage").innerHTML = "";
		document.getElementById("EditDTErrorMessage").innerHTML = "";
		$("#EditDTGreenMessage").hide();
		$("#EditDTErrorMessage").hide();
	}
}

function passEditValues(dt_id, dt_code, dt_name, dt_text, edit_form_id, form_id){

//	Populate existing values in edit form
	document.getElementById("editdtid").value =dt_id;
	document.getElementById("editdtcode").value=dt_code;
	document.getElementById("editdtname").value=dt_name;
	document.getElementById("editdttext").innerHTML=dt_text;

//	Make Edit Form Visible
	LoadFormLibrary(form_id);

}

$(document).ready(function() {

	$(".grey-pill").click(function(){
		$("#editdttext").text("");
	});

	// resize window

	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};


	$("#AddDTGreenMessage").hide();
	$("#AddDTErrorMessage").hide();

	$("#EditDTGreenMessage").hide();
	$("#EditDTErrorMessage").hide();

	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	if(state=="")
	{
		$("#add_discrepancytext_form").show("slow").siblings().hide("slow");	
	}else{
		AddDiscrepancyTextMessage(MessageCode);
		EditDiscrepancyTextMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DISCREPANCY TEXT

	$("#View_DiscrepancyTexts_Search_Bar").keyup(function(){

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


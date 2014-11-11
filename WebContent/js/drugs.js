// resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});


//Show a form from within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	//alert(1);
	$("#AddDrugGreenMessage").hide();
	$("#AddDrugErrorMessage").hide();
	//alert(2);
	$("#EditDrugGreenMessage").hide();
	$("#EditDrugErrorMessage").hide();
	//alert(3);
	document.getElementById("adddrugcode").value = "";
	document.getElementById("adddrugcode").value = "";
	document.getElementById("adddrugname").value = "";
	document.getElementById("adddrugdose").value = "";
	document.getElementById("adddrugnormalvalue").value = "";
	document.getElementById("adddrugpernormalvalue").value = "";
	//document.getElementById("adddrugdescription").innerHTML = "";
	//document.getElementById("adddruginstructions").innerHTML = "";
	document.getElementById("adddrugdescription").value = "";
	document.getElementById("adddruginstructions").value = "";
	//alert(123);
	//Show form		
	 $("#"+id).show("slow").siblings().hide("slow");
}


function AddDrugMessage(val)
{		
	
	if(val == 1){
		document.getElementById('AddDrugErrorMessage').innerHTML="Drug already Exists!";
		$("#AddDrugErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddDrugErrorMessage').innerHTML="Drug Code already exists";
		$("#AddDrugErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddDrugGreenMessage').innerHTML="Drug saved Successfully!";
		$("#AddDrugGreenMessage").show();
		
		document.getElementById("adddrugcode").value = "";
		document.getElementById("adddrugname").value = "";
		document.getElementById("adddrugdose").value = "";
		document.getElementById("adddrugnormalvalue").value = "";
		document.getElementById("adddrugpernormalvalue").value = "";
		//document.getElementById("adddrugdescription").innerHTML = "";
		//document.getElementById("adddruginstructions").innerHTML = "";
		document.getElementById("adddrugdescription").value = "";
		document.getElementById("adddruginstructions").value = "";
	}
	else if(val == 4){
		document.getElementById("AddDrugErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddDrugErrorMessage").show();
	}
	else{
		if(document.getElementById("AddDrugGreenMessage")!=null){
			document.getElementById("AddDrugGreenMessage").innerHTML = "";
		}
		document.getElementById("AddDrugErrorMessage").innerHTML = "";
		$("#AddDrugGreenMessage").hide();
		$("#AddDrugErrorMessage").hide();
	}
}

function EditDrugMessage(val){

	if(val == 1){
		document.getElementById('EditDrugErrorMessage').innerHTML="Drug Code already Exists!";
		$("#EditDrugErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditDrugErrorMessage').innerHTML="Drug already exists";
		$("#EditDrugErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditDrugGreenMessage').innerHTML="Drug updated Successfully!";
		$("#EditDrugGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditDrugErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditDrugErrorMessage").show();
	}
	else{
		document.getElementById("EditDrugGreenMessage").innerHTML = "";
		document.getElementById("EditDrugErrorMessage").innerHTML = "";
		$("#EditDrugGreenMessage").hide();
		$("#EditDrugErrorMessage").hide();
	}
}
	
function passEditValues(drug_id, drug_code, drug_name, drug_type,
						drug_dose, normal_values, per_normal_values, 
						drug_refillable,drug_description,instructions,
						 edit_form_id, form_id){

	//Populate existing values in edit form
		document.getElementById("editdrugid").value =drug_id;
		document.getElementById("editdrugcode").value=drug_code;
		document.getElementById("editdrugname").value=drug_name;
		//document.getElementById("editdrugtype").value = drug_type;
		
		$("input:radio[name=editdrugtype]").filter("[value='"+drug_type+"']").attr("checked","checked");
		
		document.getElementById("editdrugdose").value = drug_dose;
		document.getElementById("editdrugnormalvalue").value = normal_values;
		document.getElementById("editdrugpernormalvalue").value = per_normal_values;
		
		$("input:radio[name=editdrugrefillable]").filter("[value='"+drug_refillable+"']").attr("checked","checked");
		
		
		document.getElementById("editdrugdescription").value = drug_description;
		document.getElementById("editdruginstructions").value = instructions;
		
		// Make Edit Form Visible
		LoadFormLibrary(form_id);
		
	}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
//Set message fields	
	$("#AddDrugGreenMessage").hide();
	$("#AddDrugErrorMessage").hide();
	
	$("#EditDrugGreenMessage").hide();
	$("#EditDrugErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	
//Decide and Show form on page load
	if(state=="")
	{
		$("#adddrugform").show("slow").siblings().hide("slow");	
	}else{
		
		AddDrugMessage(MessageCode);
		EditDrugMessage(EditMessageCode);
		
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DRUG
		$("#View_Drugs_Search_Bar").keyup(function(){
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

	
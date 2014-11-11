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
	$("#AddInventoryGreenMessage").hide();
	$("#AddInventoryErrorMessage").hide();
	//alert(2);
	$("#EditInventoryGreenMessage").hide();
	$("#EditInventoryErrorMessage").hide();
	//alert(3);
	document.getElementById("AddInventorycode").value = "";
	document.getElementById("AddInventoryname").value = "";
	document.getElementById("addinventorymass").value = "";
	document.getElementById("addinventorymassunit").value = "";
	document.getElementById("addinventoryvolume").value = "";
	document.getElementById("addinventoryvolumeu").value = "";
	document.getElementById("addinventoryconcentration").value = "";
	document.getElementById("addinventoryconcentrationu").value = "";
	document.getElementById("addinventorytemp").value = "";
	//alert(123);
	//Show form		
	 $("#"+id).show("slow").siblings().hide("slow");
}


function AddInventoryMessage(val)
{		
	
	if(val == 1){
		document.getElementById('AddInventoryErrorMessage').innerHTML="Drug already Exists!";
		$("#AddInventoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddInventoryErrorMessage').innerHTML="Drug Code already exists";
		$("#AddInventoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddInventoryGreenMessage').innerHTML="Drug saved Successfully!";
		$("#AddInventoryGreenMessage").show();
		
		document.getElementById("AddInventorycode").value = "";
		document.getElementById("AddInventoryname").value = "";
		document.getElementById("AddInventorydose").value = "";
		document.getElementById("AddInventorynormalvalue").value = "";
		document.getElementById("AddInventorypernormalvalue").value = "";
		//document.getElementById("AddInventorydescription").innerHTML = "";
		//document.getElementById("AddInventoryinstructions").innerHTML = "";
		document.getElementById("AddInventorydescription").value = "";
		document.getElementById("AddInventoryinstructions").value = "";
	}
	else if(val == 4){
		document.getElementById("AddInventoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddInventoryErrorMessage").show();
	}
	else{
		if(document.getElementById("AddInventoryGreenMessage")!=null){
			document.getElementById("AddInventoryGreenMessage").innerHTML = "";
		}
		document.getElementById("AddInventoryErrorMessage").innerHTML = "";
		$("#AddInventoryGreenMessage").hide();
		$("#AddInventoryErrorMessage").hide();
	}
}

function EditInventoryMessage(val){

	if(val == 1){
		document.getElementById('EditInventoryErrorMessage').innerHTML="Drug Code already Exists!";
		$("#EditInventoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditInventoryErrorMessage').innerHTML="Drug already exists";
		$("#EditInventoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditInventoryGreenMessage').innerHTML="Drug updated Successfully!";
		$("#EditInventoryGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditInventoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditInventoryErrorMessage").show();
	}
	else{
		document.getElementById("EditInventoryGreenMessage").innerHTML = "";
		document.getElementById("EditInventoryErrorMessage").innerHTML = "";
		$("#EditInventoryGreenMessage").hide();
		$("#EditInventoryErrorMessage").hide();
	}
}
	
function passEditValues(drug_id, drug_code, drug_name, drug_type,
						drug_dose, normal_values, per_normal_values, 
						drug_refillable,drug_description,instructions,
						 edit_form_id, form_id){

	//Populate existing values in edit form
		document.getElementById("EditInventoryid").value =drug_id;
		document.getElementById("EditInventorycode").value=drug_code;
		document.getElementById("EditInventoryname").value=drug_name;
		//document.getElementById("EditInventorytype").value = drug_type;
		
		$("input:radio[name=EditInventorytype]").filter("[value='"+drug_type+"']").attr("checked","checked");
		
		document.getElementById("EditInventorydose").value = drug_dose;
		document.getElementById("EditInventorynormalvalue").value = normal_values;
		document.getElementById("EditInventorypernormalvalue").value = per_normal_values;
		
		$("input:radio[name=EditInventoryrefillable]").filter("[value='"+drug_refillable+"']").attr("checked","checked");
		
		
		document.getElementById("EditInventorydescription").value = drug_description;
		document.getElementById("EditInventoryinstructions").value = instructions;
		
		// Make Edit Form Visible
		LoadFormLibrary(form_id);
		
	}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
//Set message fields	
	$("#AddInventoryGreenMessage").hide();
	$("#AddInventoryErrorMessage").hide();
	
	$("#EditInventoryGreenMessage").hide();
	$("#EditInventoryErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	
//Decide and Show form on page load
	if(state=="")
	{
		$("#addinventoryform").show("slow").siblings().hide("slow");	
	}else{
		
		AddInventoryMessage(MessageCode);
		EditInventoryMessage(EditMessageCode);
		
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DRUG
		$("#View_Inventory_Search_Bar").keyup(function(){
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

	
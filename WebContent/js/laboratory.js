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
	$("#AddLaboratoryGreenMessage").hide();
	$("#AddLaboratoryErrorMessage").hide();
	
	$("#EditLaboratoryGreenMessage").hide();
	$("#EditLaboratoryErrorMessage").hide();
	
	document.getElementById("addlaboratoryname").value="";
	document.getElementById("addlaboratoryemail").value="";
	document.getElementById("addlaboratoryaddress1").value="";
	document.getElementById("addlaboratoryaddress2").value="";
	document.getElementById("addlaboratoryaddress3").value="";
	document.getElementById("addlaboratorycity").value="";
	document.getElementById("addlaboratorystate").value="";

	document.getElementById("addlaboratoryphone").value="";
	document.getElementById("addlaboratorycell").value="";
	document.getElementById("addlaboratoryfax").value="";
	
	document.getElementById("addlabdatanormallow").value="";
	document.getElementById("addlabdatanormalhigh").value="";
	
	//Show Form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddLaboratoryMessage(val)
{	
	if(val == 1){
		document.getElementById('AddLaboratoryErrorMessage').innerHTML="Laboratory already Exists!";
		$("#AddLaboratoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddLaboratoryErrorMessage').innerHTML="Laboratory Code already exists";
		$("#AddLaboratoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddLaboratoryGreenMessage').innerHTML="Laboratory saved Successfully!";
		$("#AddLaboratoryGreenMessage").show();
		
		document.getElementById("addlaboratoryname").value="";
		document.getElementById("addlaboratoryemail").value="";
		document.getElementById("addlaboratoryaddress1").value="";
		document.getElementById("addlaboratoryaddress2").value="";
		document.getElementById("addlaboratoryaddress3").value="";
		document.getElementById("addlaboratorycity").value="";
		document.getElementById("addlaboratorystate").value="";

		document.getElementById("addlaboratoryphone").value="";
		document.getElementById("addlaboratorycell").value="";
		document.getElementById("addlaboratoryfax").value="";
		
		
	}
	else if(val == 4){
		document.getElementById("AddLaboratoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddLaoratoryErrorMessage").show();
	}
	else if(val == 5){
		document.getElementById('AddLaboratoryGreenMessage').innerHTML="Lab Data saved Successfully!";
		$("#AddLaboratoryGreenMessage").show();
		
		document.getElementById("addlabdatanormallow").value="";
		document.getElementById("addlabdatanormalhigh").value="";
	}
	else{
		document.getElementById("AddLaboratoryGreenMessage").innerHTML = "";
		document.getElementById("AddLaboratoryErrorMessage").innerHTML = "";
		$("#AddLaboratoryGreenMessage").hide();
		$("#AddLaboratoryErrorMessage").hide();
	}
}

function EditLaboratoryMessage(val){

	if(val == 1){
		document.getElementById('EditLaboratoryErrorMessage').innerHTML="Laboratory Code already Exists!";
		$("#EditLaboratoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditLaboratoryErrorMessage').innerHTML="Laboratory already exists";
		$("#EditLaboratoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditLaboratoryGreenMessage').innerHTML="Laboratory saved Successfully!";
		$("#EditLaboratoryGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditLaboratoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditLaboratoryErrorMessage").show();
	}
	else{
		document.getElementById("EditLaboratoryGreenMessage").innerHTML = "";
		document.getElementById("EditLaboratoryErrorMessage").innerHTML = "";
		$("#EditLaboratoryGreenMessage").hide();
		$("#EditLaboratoryErrorMessage").hide();
	}
}


function passEditValues(id,name,email, address1,address2, address3, city, state, country, postalcode, phone, cell, fax, edit_form_id, form_id){

//Populate existing values in edit form

	document.getElementById("editlaboratoryid").value =id;
	document.getElementById("editlaboratoryname").value=name;
	document.getElementById("editlaboratoryemail").value=email;
	document.getElementById("editlaboratoryaddress1").value=address1;
	document.getElementById("editlaboratoryaddress2").value=address2;
	document.getElementById("editlaboratoryaddress3").value=address3;
	document.getElementById("editlaboratorycity").value=city;
	document.getElementById("editlaboratorystate").value=state;
	document.getElementById("editlaboratorycountry").value=country;
	document.getElementById("editlaboratorypostalcode").value=postalcode;
	document.getElementById("editlaboratoryphone").value=phone;
	document.getElementById("editlaboratorycell").value=cell;
	document.getElementById("editlaboratoryfax").value=fax;
	
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AddLaboratoryGreenMessage").hide();
	$("#AddLaboratoryErrorMessage").hide();
	
	$("#EditLaboratoryGreenMessage").hide();
	$("#EditLaboratoryErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formAddLaboratory").show("slow").siblings().hide("slow");	
	}else{
		AddLaboratoryMessage(MessageCode);
		EditLaboratoryMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	

	//***** SEARCH LABORATORY
	$("#View_Laboratory_Search_Bar").keyup(function(){
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


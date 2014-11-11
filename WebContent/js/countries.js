//resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//Library JavaScript Support
//Shows form from within the page

//Show a form from within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddCountryGreenMessage").hide();
	$("#AddCountryErrorMessage").hide();

	$("#EditCountryGreenMessage").hide();
	$("#EditCountryErrorMessage").hide();

	document.getElementById("addcountrycode").value = "";
	document.getElementById("addcountryname").value = "";
	//document.getElementById("addcountrydescription").innerHTML = "";
	document.getElementById("addcountrydescription").value = "";

	//Show form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddCountryMessage(val)
{		
	if(val == 1){
		document.getElementById('AddCountryErrorMessage').innerHTML="Country already Exists!";
		$("#AddCountryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddCountryErrorMessage').innerHTML="Country Code already exists";
		$("#AddCountryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddCountryGreenMessage').innerHTML="Country saved Successfully!";
		$("#AddCountryGreenMessage").show();

		document.getElementById("addcountrycode").value = "";
		document.getElementById("addcountryname").value = "";
		//document.getElementById("addcountrydescription").innerHTML = "";
		document.getElementById("addcountrydescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddCountryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddCountryErrorMessage").show();
	}
	else{
		document.getElementById("AddCountryGreenMessage").innerHTML = "";
		document.getElementById("AddCountryErrorMessage").innerHTML = "";
		$("#AddCountryGreenMessage").hide();
		$("#AddCountryErrorMessage").hide();
	}
}

function EditCountryMessage(val){

	if(val == 1){
		document.getElementById('EditCountryErrorMessage').innerHTML="Country Code already Exists!";
		$("#EditCountryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditCountryErrorMessage').innerHTML="Country already exists";
		$("#EditCountryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditCountryGreenMessage').innerHTML="Country updated Successfully!";
		$("#EditCountryGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditCountryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditCountryErrorMessage").show();
	}
	else{
		document.getElementById("EditCountryGreenMessage").innerHTML = "";
		document.getElementById("EditCountryErrorMessage").innerHTML = "";
		$("#EditCountryGreenMessage").hide();
		$("#EditCountryErrorMessage").hide();
	}
}

function passEditValues(c_id, c_code, c_name, c_description, edit_form_id, form_id){

//	Populate existing values in edit form
	document.getElementById("editcountryid").value =c_id;
	document.getElementById("editcountrycode").value=c_code;
	document.getElementById("editcountryname").value=c_name;
	document.getElementById("editcountrydescription").innerHTML=c_description;

//	Make Edit Form Visible
	LoadFormLibrary(form_id);
}

$(document).ready(function() {

	// resize window


	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};


//	Set message fields	
	$("#AddCountryGreenMessage").hide();
	$("#AddCountryErrorMessage").hide();

	$("#EditCountryGreenMessage").hide();
	$("#EditCountryErrorMessage").hide();

	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();


//	Decide and Show form on page load
	if(state=="")
	{
		$("#add_country_form").show("slow").siblings().hide("slow");	
	}else{
		AddCountryMessage(MessageCode);
		EditCountryMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DRUG
	$("#View_Countries_Search_Bar").keyup(function(){
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
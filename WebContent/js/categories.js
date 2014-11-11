//resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//loads a form within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddCategoryGreenMessage").hide();
	$("#AddCategoryErrorMessage").hide();

	$("#EditCategoryGreenMessage").hide();
	$("#EditCategoryErrorMessage").hide();

	document.getElementById("addcategorycode").value = "";
	document.getElementById("addcategoryname").value = "";
	//document.getElementById("addcategorydescription").innerHTML = "";
	document.getElementById("addcategorydescription").value="";

	//Show form
	$("#"+id).show("slow").siblings().hide("slow");
}

function AddCategoryMessage(val)
{		
	if(val == 1){
		document.getElementById('AddCategoryErrorMessage').innerHTML="Category already Exists!";
		$("#AddCategoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddCategoryErrorMessage').innerHTML="Category Code already exists";
		$("#AddCategoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddCategoryGreenMessage').innerHTML="Category saved Successfully!";
		$("#AddCategoryGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("AddCategoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddCategoryErrorMessage").show();
	}
	else{
		document.getElementById("AddCategoryGreenMessage").innerHTML = "";
		document.getElementById("AddCategoryErrorMessage").innerHTML = "";
		$("#AddCategoryGreenMessage").hide();
		$("#AddCategoryErrorMessage").hide();
	}
}

function EditCategoryMessage(val){

	if(val == 1){
		document.getElementById('EditCategoryErrorMessage').innerHTML="Category Code already Exists!";
		$("#EditCategoryErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditCountryErrorMessage').innerHTML="Category already exists";
		$("#EditCategoryErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditCountryGreenMessage').innerHTML="Category updated Successfully!";
		$("#EditCategoryGreenMessage").show();

		document.getElementById("addcategorycode").value = "";
		document.getElementById("addcategoryname").value = "";
		//document.getElementById("addcategorydescription").innerHTML = "";
		document.getElementById("addcategorydescription").value = "";
	}
	else if(val == 4){
		document.getElementById("EditCategoryErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditCategoryErrorMessage").show();
	}
	else{
		document.getElementById("EditCategoryGreenMessage").innerHTML = "";
		document.getElementById("EditCategoryErrorMessage").innerHTML = "";
		$("#EditCategoryGreenMessage").hide();
		$("#EditCategoryErrorMessage").hide();
	}
}



function passEditValues(cat_id, cat_code, cat_name, cat_description, edit_form_id, form_id){

//	Populate existing values in edit form

	document.getElementById("editcategoryid").value =cat_id;
	document.getElementById("editcategorycode").value=cat_code;
	document.getElementById("editcategoryname").value=cat_name;
	document.getElementById("editcategorydescription").value=cat_description;

//	Make Edit Form Visible
	LoadFormLibrary(form_id);

}

$(document).ready(function() {

	// resize window

	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};

	//Set message fields	
	$("#AddCategoryGreenMessage").hide();
	$("#AddCategoryErrorMessage").hide();

	$("#EditCategoryGreenMessage").hide();
	$("#EditCategoryErrorMessage").hide();

	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();

	//Decide and Show form on page load
	if(state=="")
	{
		$("#add_category_form").show("slow").siblings().hide("slow");	
	}else{
		AddCategoryMessage(MessageCode);
		EditCategoryMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}

	//***** SEARCH DRUG
	$("#View_Categories_Search_Bar").keyup(function(){
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


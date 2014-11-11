// resizes window
$(window).resize(function() {
	var width = $(document).width();
	width = width - 290;
	$('.right_body_content').css('width',width);
});

//Shows a form within a page
function LoadFormLibrary(id)
{		
	//Reset All Fields
	$("#AddResGreenMessage").hide();
	$("#AddResErrorMessage").hide();
	
	$("#EditResGreenMessage").hide();
	$("#EditResErrorMessage").hide();
	
	document.getElementById("addrescode").value = "";
	document.getElementById("addresname").value = "";
	//document.getElementById("addresdescription").innerHTML = "";
	document.getElementById("addresdescription").value = "";
	
	//Show Form
	 $("#"+id).show("slow").siblings().hide("slow");
}

function AddResolutionMessage(val)
{	
	
	if(val == 1){
		document.getElementById('AddResErrorMessage').innerHTML="Resolution already Exists!";
		$("#AddResErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddResErrorMessage').innerHTML="Resolution Code already exists";
		$("#AddResErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddResGreenMessage').innerHTML="Resolution saved Successfully!";
		$("#AddResGreenMessage").show();
		
		document.getElementById("addrescode").value = "";
		document.getElementById("addresname").value = "";
		//document.getElementById("addresdescription").innerHTML = "";
		document.getElementById("addresdescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddResErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddResErrorMessage").show();
	}
	else{
		document.getElementById("AddResGreenMessage").innerHTML = "";
		document.getElementById("AddResErrorMessage").innerHTML = "";
		$("#AddResGreenMessage").hide();
		$("#AddResErrorMessage").hide();
	}
}

function EditResolutionMessage(val){

	if(val == 1){
		document.getElementById('EditResErrorMessage').innerHTML="Resolution Code already Exists!";
		$("#EditResErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditResErrorMessage').innerHTML="Resolution already exists";
		$("#EditResErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditResGreenMessage').innerHTML="Resolution updated Successfully!";
		$("#EditResGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditResErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditResErrorMessage").show();
	}
	else{
		document.getElementById("EditResGreenMessage").innerHTML = "";
		document.getElementById("EditResErrorMessage").innerHTML = "";
		$("#EditResGreenMessage").hide();
		$("#EditResErrorMessage").hide();
	}
}

function passEditValues(res_id, res_code, res_name, res_desc, edit_form_id, form_id){

//Populate existing values in edit form
	document.getElementById("editresid").value =res_id;
	document.getElementById("editrescode").value=res_code;
	document.getElementById("editresname").value=res_name;
	document.getElementById("editresdescription").innerHTML=res_desc;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AddResGreenMessage").hide();
	$("#AddResErrorMessage").hide();
	
	$("#EditResGreenMessage").hide();
	$("#EditResErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#add_resolution_form").show("slow").siblings().hide("slow");	
	}else{
		AddResolutionMessage(MessageCode);
		EditResolutionMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
		
	}
	
	$(".grey-pill").click(function(){
		$("#editresdescription").text("");
	});
	
	
	
//***** SEARCH RESOLUTION
	$("#View_Resolutions_Search_Bar").keyup(function(){
		
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


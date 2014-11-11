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
	$("#AddQSGreenMessage").hide();
	$("#AddQSErrorMessage").hide();
	
	$("#EditQSGreenMessage").hide();
	$("#EditQSErrorMessage").hide();
	
	document.getElementById("addqscode").value = "";
	document.getElementById("addqsname").value = "";
	//document.getElementById("addqsdescription").innerHTML = "";
	document.getElementById("addqsdescription").value = "";
	
	//Show Form
	 $("#"+id).show("slow").siblings().hide("slow");
}

function AddQueryStatusMessage(val)
{	
	
	if(val == 1){
		document.getElementById('AddQSErrorMessage').innerHTML="Query Status already Exists!";
		$("#AddQSErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('AddQSErrorMessage').innerHTML="Query Status Code already exists";
		$("#AddQSErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('AddQSGreenMessage').innerHTML="Query Status saved Successfully!";
		$("#AddQSGreenMessage").show();
		
		document.getElementById("addqscode").value = "";
		document.getElementById("addqsname").value = "";
		//document.getElementById("addqsdescription").innerHTML = "";
		document.getElementById("addqsdescription").value = "";
	}
	else if(val == 4){
		document.getElementById("AddQSErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#AddQSErrorMessage").show();
	}
	else{
		document.getElementById("AddQSGreenMessage").innerHTML = "";
		document.getElementById("AddQSErrorMessage").innerHTML = "";
		$("#AddQSGreenMessage").hide();
		$("#AddQSErrorMessage").hide();
	}
}

function EditQueryStatusMessage(val){

	if(val == 1){
		document.getElementById('EditQSErrorMessage').innerHTML="Query Status Code already Exists!";
		$("#EditQSErrorMessage").show();
	}
	else if(val == 2){
		document.getElementById('EditQSErrorMessage').innerHTML="Query Status already exists";
		$("#EditQSErrorMessage").show();
	}	
	else if(val == 3){
		document.getElementById('EditQSGreenMessage').innerHTML="Query Status saved Successfully!";
		$("#EditQSGreenMessage").show();
	}
	else if(val == 4){
		document.getElementById("EditQSErrorMessage").innerHTML = "DataBase Connection Problem !";
		$("#EditQSErrorMessage").show();
	}
	else{
		document.getElementById("EditQSGreenMessage").innerHTML = "";
		document.getElementById("EditQSErrorMessage").innerHTML = "";
		$("#EditQSGreenMessage").hide();
		$("#EditQSErrorMessage").hide();
	}
}

function passEditValues(qs_id, qs_code, qs_name, qs_desc, edit_form_id, form_id){

//Populate existing values in edit form
	document.getElementById("editqsid").value =qs_id;
	document.getElementById("editqscode").value=qs_code;
	document.getElementById("editqsname").value=qs_name;
	document.getElementById("editqsdescription").innerHTML=qs_desc;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(document).ready(function() {
	
	// resize window
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#AddQSGreenMessage").hide();
	$("#AddQSErrorMessage").hide();
	
	var state=$("input#InterfaceState").val();
	var MessageCode=$("input#MessageCode").val();
	var EditMessageCode = $("input#EditMessageCode").val();
	
	
	if(state=="")
	{
		$("#formAddQuerystatus").show("slow").siblings().hide("slow");	
	}else{
		AddQueryStatusMessage(MessageCode);
		EditQueryStatusMessage(EditMessageCode);
		$("#"+state).show("slow").siblings().hide("slow");
	}
	
	
	
	//***** SEARCH DRUG
	$("#View_QueryStatuses_Search_Bar").keyup(function(){
		
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

	$(".grey-pill").click(function(){
	//	alert($("#editqsdescription").val());
		
		$("#editqsdescription").text(" ");
	});
//**** END SEARCH

}); //end document ready function


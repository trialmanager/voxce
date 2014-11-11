// Library JavaScript Support


function LoadFormLibrary(id)
{		
	 $("#"+id).show("slow").siblings().hide("slow");
}

function CreateCountryMessage(val)
{	

	if(val== 1)
	{
		document.getElementById('messageshow').innerHTML="Country already Exists!";
	}
	else if(val== 2)
	{
		document.getElementById('messageshow').innerHTML="Country saved Successfully!";
	}	
	else if(val== 3)
	{
		document.getElementById('messageshow').innerHTML="DataBase Connection Problem !";
	}
	else if(val==4)
		{
			document.getElementById("messageshow").innerHTML = "Country Code already exists";
		}
	else{
		document.getElementById("messageshow").innerHTML = "";
	}
}



function passEditValues(c_id, c_code, c_name, c_description, edit_form_id, form_id){

//Populate existing values in edit form
	
	document.getElementById("edit_country_id").value =c_id;
	document.getElementById("edit_country_code").value=c_code;
	document.getElementById("edit_country_name").value=c_name;
	document.getElementById("edit_country_description").value=c_description;
	
// Make Edit Form Visible
	LoadFormLibrary(form_id);
	
}

$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {
	
	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
		return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$('#form_edit').submit(function(event) {
		
	});
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

//**** END SEARCH

}); //end document ready function
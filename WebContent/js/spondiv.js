$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});



$(document).ready(function() {
	
	
	$(".grey-pill").click(function(){
		$("#Add_SponsorDivision_Form")[0].reset();
	});
	$("#sponsor_user_btn").click(function(){
		window.location.reload();
	});
	
	$(".ui-multiselect").width("55.3%").css("float","left").css("border","none");
	 
	 $(".selected").width("300px");
	  $(".available").width("300px");
	  $(".search").width("150px");
	  
	 /*
	   var modWidth = 300;
	   $(".ui-multiselect").width(100+'%');
	   $(".selected").width(modWidth);
	   $(".available").width(modWidth);
	   */
	
	
	
	//Current Sponsor Form State
	
	  $("#hiddenAdd_Sponsor_User_select_user").find("option").each(function(){
			 var outer = $(this);
			  $("#Add_Sponsor_User_select_user").find("option").each(function(){
			   if($(this).val() == outer.val()){
			    $(this).attr("selected","selected");
			   }
			  });
		 });  
	var state=$("input#InterfaceState").val();	
	if(state=="")
	{
		 $('#Add_SponsorDiv_Title').html("Add Sponsor");
		 $('#Add_Sponsor_Main_Error').hide();
		 $('#Add_Sponsor_Main_Success').hide();
		 $('#Add_Sponsor_sponsorid').val('');
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', 'current');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	}
	else
	{
		
		$("#"+state).show("slow").siblings().hide("slow");
		 if(state=="Add_SponsorDiv")
		 {
			 $("#Add_Sponsor_Main_Error").hide();
			 $("#Add_Sponsor_Main_Success").hide();
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', 'current');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
		 }
		 else if(state=="View_SponsorDiv")
		 {
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', 'current');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
		 }
		 else if(state =="Add_SponsorDivisionDiv")
		 {
			 $("#Add_SponsorDivision_Main_Error").hide();
			 $("#Add_SponsorDivision_Main_Success").hide();
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', 'current');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
		 }
		 else if(state=="View_SponsorDivisionDiv")
		 {
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', 'current');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
		 }		
		 else if(state=="Add_User_SponsorDivisionDiv")
		 {
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', 'current');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
			 
			
		 }
		 else if(state=="View_User_SponsorDivisionDiv")
		 {
			 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
			 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
			 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', 'current');
		 }
	}//Current Sponsor Form State	
	
	
	
	
	
	var AddSponsorMessageCode=$("input#AddSponsorMessageCode").val();
	var AddSponsorDevisionMessageCode=$("input#AddSponsorDevisionMessageCode").val();
	var AddSponDivUsMessage=$('#AddSponDivUsMessage').val();
	var ViewSponDivUsMessage=$('#ViewSponDivUsMessage').val();
	
	if(ViewSponDivUsMessage == '0' || ViewSponDivUsMessage == '1')
		{ViewSponDivUsMessagefunc(ViewSponDivUsMessage);}
	
	if(AddSponDivUsMessage == '0' || AddSponDivUsMessage == '1')
		{AddSponDivUsMessagefunc(AddSponDivUsMessage);}
	
	if(AddSponsorDevisionMessageCode=='0' || AddSponsorDevisionMessageCode=='1' ||  AddSponsorDevisionMessageCode=='2')
		{AddSponsorDevisionMessageCodefunc(AddSponsorDevisionMessageCode); }
	
	if(AddSponsorMessageCode=='0' || AddSponsorMessageCode=='1' || AddSponsorMessageCode=='2' || AddSponsorMessageCode=='3' || AddSponsorMessageCode=='4' ||  AddSponsorMessageCode=='5')
		{AddSponsorMessageCodefunc(AddSponsorMessageCode);}
	
	
	
	
	
	
	
	
	//Start SponsorDivision Search
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	$("#View_SponsorDivision_Search_bar").keyup(function(){
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
	// End Start SponsorDivision Search
	
	//Start Sponsor Division USer Search
	$("#View_SponsorDivisionUser_Search_bar").keyup(function(){
        $("#sdubody").find("tr").hide();
        var data = this.value.split(" ");
        var jo = $("#sdubody").find("tr");
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
	//End Sponsor Division USer Search
	
	//Start Sponsor Search
	$("#View_sponsor_Search_bar").keyup(function(){
        $("#gbody").find("tr").hide();
        var data = this.value.split(" ");
        var jo = $("#gbody").find("tr");
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
	//End Sponsor Search
	
	
	// Start site sponsor division user  submit form
	$('#Add_user_SponsorDivision_Form').submit(function(event){	
		
			var divlen=$('select#Add_Sponsor_User_Divisionlist option').length;
			var divsel=$('select#Add_Sponsor_User_Divisionlist').val();
			var number=$('select#Add_Sponsor_User_select_user option:selected').length;
			
			if(divlen==0)
			{
				$('#Add_SponsorDivisionUser_Main_Error').html("There are no division available within this sponsor...").show();
				$('#Add_SponsorDivisionUser_Main_Success').hide();
				if(event.preventDefault) 
					event.preventDefault();
				else
					event.returnValue = false;
			}
			else if(divsel == null)
			{
				$('#Add_SponsorDivisionUser_Main_Error').html("Please Select a division !").show();
				$('#Add_SponsorDivisionUser_Main_Success').hide();
				if(event.preventDefault) 
					event.preventDefault();
				else
					event.returnValue = false;
			}
			else if(number<= 0)
			{
				$('#Add_SponsorDivisionUser_Main_Error').html("Please Select a User!").show();
				$('#Add_SponsorDivisionUser_Main_Success').hide();
				if(event.preventDefault) 
					event.preventDefault();
				else
					event.returnValue = false;
			}		
	});
	
	
	// Start SaveSponsor Submission.............
	$('#Add_SponsorDivision_Form').submit(function(event){
		
		Check_isempty(event,'Add_SponsorDivision_Select_Sponsor','Add_SponsorDivision_Select_Sponsor_error');		
		
		
		Check_isempty(event,'Add_SponsorDivision_divisionname','Add_SponsorDivision_divisionname_error');
		CheckAlphaNumericWithoutSpace(event,'Add_SponsorDivision_divisionname','Add_SponsorDivision_divisionname_error1');
		
		Check_isempty(event,'Add_SponsorDivision_address1','Add_SponsorDivision_address1_error');
		
		Check_isempty(event,'Add_SponsorDivision_City','Add_SponsorDivision_City_error');
		CheckAlphaNumericWithoutSpace(event,'Add_SponsorDivision_City','Add_SponsorDivision_City_error1');
		
		Check_isempty(event,'Add_SponsorDivision_State','Add_SponsorDivision_State_error');
		CheckAlphaNumericWithoutSpace(event,'Add_SponsorDivision_State','Add_SponsorDivision_State_error1');
		
		CheckAlphaNumeric(event,'Add_SponsorDivision_Zipcode','Add_SponsorDivision_Zipcode_error');
		Check_isempty(event,'Add_SponsorDivision_country','Add_SponsorDivision_country_error');		
		
		Check_isempty(event,'Add_SponsorDivision_phone','Add_SponsorDivision_phone_Error');	
		
	//	if($.trim($('#Add_SponsorDivision_fax').val()) != "")
			Check_isempty(event,'Add_SponsorDivision_fax','Add_SponsorDivision_fax_error');	
		if($.trim($('#Add_SponsorDivision_email').val()) != "")
			validateEmail(event,'Add_SponsorDivision_email','Add_SponsorDivision_email_Error');	
	});
	//End SaveSponsor Submission.............
	
	
	// Start SaveSponsor Submission.............
	$('#Add_Sponsor_Form').submit(function(event){
		
		Check_isempty(event,'Add_Sponsor_Name','Add_Sponsor_Name_Error');
		CheckAlphaNumericWithoutSpace(event,'Add_Sponsor_Name','Add_Sponsor_Name_Error1');
		
		Check_isempty(event,'Add_Sponsor_Address_1','Add_Sponsor_Address_error');
		
		Check_isempty(event,'Add_Sponsor_City','Add_Sponsor_City_error');
		CheckAlphaNumericWithoutSpace(event,'Add_Sponsor_City','Add_Sponsor_City_error1');
		
		Check_isempty(event,'Add_Sponsor_State','Add_Sponsor_State_error');
		CheckAlphaNumericWithoutSpace(event,'Add_Sponsor_State','Add_Sponsor_State_error1');
		
		CheckAlphaNumeric(event,'Add_Sponsor_ZipCode','Add_Sponsor_ZipCode_error');
		
		Check_isempty(event,'Add_Sponsor_Phone','Add_Sponsor_Phone_error');	
		
		if($.trim($('#Add_Sponsor_Fax').val()) != "")
			Check_isempty(event,'Add_Sponsor_Fax','Add_Sponsor_Fax_error');	
		if($.trim($('#Add_Sponsor_Email').val()) != "")
			validateEmail(event,'Add_Sponsor_Email','Add_Sponsor_Email_error');	
	});
	//End SaveSponsor Submission.............
	
	//Sponsor preselection onchange
		$('#Add_Sponsor_User_Sponsorslist').val($('#Field2').val());
		$('#Add_Sponsor_User_Divisionlist').val($('#Field33').val());
	//Sponsor preselection onchange
	
	
	$('#Add_Sponsor_User_Sponsorslist').change(function() {
		
		if($('select#Add_Sponsor_User_Sponsorslist option:selected').val()=="" || $('select#Add_Sponsor_User_Sponsorslist option:selected').val()==null)
			return;			
		$('#SponsorDivisionHiddenAction').val("OnChangeSponsor");
		$('#Field1').val($('select#Add_Sponsor_User_Sponsorslist option:selected').val());
		$('form#SponsorHiddenForm').submit();		 
	});
	$('#Add_Sponsor_User_Divisionlist').change(function() {
		
		if($('select#Add_Sponsor_User_Divisionlist option:selected').val()=="" || $('select#Add_Sponsor_User_Divisionlist option:selected').val()==null)
			return;			
		$('#SponsorDivisionUserHiddenAction').val("OnChangeSponsor");
		$('#Field12').val($('select#Add_Sponsor_User_Sponsorslist option:selected').val());
		$('#Field22').val($('select#Add_Sponsor_User_Divisionlist option:selected').val());
		//alert($("#Field12").val()+"   "+$("#Field22").val());
		$('form#SponsorDivHiddenForm').submit();		 
	});
	
	
});

//Javascript
//Javascript
//Javascript
//Javascript

function edit_view_sponsordivision_row(devision_id,sponsor_id,name,address1,address2,address3,city,state,country_id,zip,phone,fax,email)
{
	$('#View_SponsorDivisionDiv').hide('slow');
	$('#Add_SponsorDivisionDiv').show('slow');
	$('#Add_SponsorDivisionDiv_Title').html("Edit Division  ( "+ name+" )" );
	$('#Add_SponsorDivision_Main_Error').hide('slow');
	$('#Add_SponsorDivision_Main_Success').hide('slow');
	
	document.getElementById("Add_SponsorDivision_Select_Sponsor").value=sponsor_id;
	document.getElementById("Add_SponsorDivision_country").value=country_id;
	$('#Add_SponsorDivision_divisionid').val(devision_id);
	$('#Add_SponsorDivision_divisionname').val(name);
	$('#Add_SponsorDivision_address1').val(address1);
	$('#Add_SponsorDivision_address2').val(address2);
	$('#Add_SponsorDivision_address3').val(address3);
	$('#Add_SponsorDivision_City').val(city);
	$('#Add_SponsorDivision_State').val(state);
	$('#Add_SponsorDivision_Zipcode').val(zip);
	$('#Add_SponsorDivision_phone').val(phone);
	$('#Add_SponsorDivision_fax').val(fax);
	$('#Add_SponsorDivision_email').val(email);
}

function edit_view_sponsor_row(sponsor_id,name,email,address1,address2,address3,city,state,country_id,zip,phone,fax,email){
	
	$('#Add_SponsorDiv_Title').html("Edit Sponsor  ( "+ name+" )" );
	$('#Add_Sponsor_Main_Error').hide();
	$('#Add_Sponsor_Main_Success').hide();	
	$('#Add_Sponsor_sponsorid').val(sponsor_id);	
	$('#Add_Sponsor_Name').val(name);
	$('#Add_Sponsor_Address_1').val(address1);
	$('#Add_Sponsor_Address_2').val(address2);
	$('#Add_Sponsor_Address_3').val(address3);
	$('#Add_Sponsor_City').val(city);
	$('#Add_Sponsor_State').val(state);
	$('#Add_Sponsor_ZipCode').val(zip);	
	document.getElementById('Add_Sponsor_Country').value = country_id;
	$('#Add_Sponsor_Phone').val(phone);
	$('#Add_Sponsor_Fax').val(fax);
	$('#Add_Sponsor_Email').val(email);
	$("#Add_SponsorDiv").show("slow").siblings().hide("slow");
		
}

function ViewSponDivUsMessagefunc(Code)
{
	if(Code == '0')
	{
		$("#View_SponsorDivisionUser_Main_Error").show();
		$("#View_SponsorDivisionUser_Main_Success").hide();
		document.getElementById('View_SponsorDivisionUser_Main_Error').innerHTML="Sorry! information cannot be deleted at this time...";
	}
	else if(Code == '1')
	{
		$("#View_SponsorDivisionUser_Main_Error").hide();
		$("#View_SponsorDivisionUser_Main_Success").show();
		document.getElementById('View_SponsorDivisionUser_Main_Success').innerHTML="Information Deleted...";
	}
}

function AddSponDivUsMessagefunc(Code)
{
	if(Code == '0')
	{
		$("#Add_SponsorDivisionUser_Main_Error").show();
		$("#Add_SponsorDivisionUser_Main_Success").hide();
		document.getElementById('Add_SponsorDivisionUser_Main_Error').innerHTML="Sorry! Information Cannot be updated at this time..";
	}
	else if(Code == '1')
	{
		$("#Add_SponsorDivisionUser_Main_Error").hide();
		$("#Add_SponsorDivisionUser_Main_Success").show();
		document.getElementById('Add_SponsorDivisionUser_Main_Success').innerHTML="Sponsor Users Updated...";
	}
}


function AddSponsorDevisionMessageCodefunc(Code)
{
	if(Code == '0')
	{
		$("#Add_SponsorDivision_Main_Error").show();
		$("#Add_SponsorDivision_Main_Success").hide();
		$("#Edit_SponsorDivision_error_message").hide();
		document.getElementById('Add_SponsorDivision_Main_Error').innerHTML="Sorry! Division Cannot be created at this time..";
	}
	else if(Code == '1')
	{
		$("#Add_SponsorDivision_Main_Error").hide();
		$("#Add_SponsorDivision_Main_Success").show();
		$("#Edit_SponsorDivision_error_message").hide();
		document.getElementById('Add_SponsorDivision_Main_Success').innerHTML="New Division Created Successfully !";
	}
	else if(Code == '2')
	{
		$("#Add_SponsorDivision_Main_Error").hide();
		$("#Add_SponsorDivision_Main_Success").hide();
		$("#Edit_SponsorDivision_error_message").show();
		document.getElementById('Edit_SponsorDivision_error_message').innerHTML="Division information updated !";
	}
}

function AddSponsorMessageCodefunc(Code)
{
	if(Code == '0')
	{
		$("#Add_Sponsor_Main_Error").show();
		$("#Add_Sponsor_Main_Success").hide();
		$("#Edit_Sponsor_error_message").hide();
		$('#SiteLaborotory_Add_Main_Error').html("Please Select a site !");
		document.getElementById('Add_Sponsor_Main_Error').innerHTML="Sorry! Sponsor Cannot be created at this time..";
	}
	else if(Code == '1')
	{
		$("#Add_Sponsor_Main_Error").hide();
		$("#Add_Sponsor_Main_Success").show();
		$("#Edit_Sponsor_error_message").hide();
		document.getElementById('Add_Sponsor_Main_Success').innerHTML="New Sponsor Created Successfully !";
	}
	else if(Code == '2')
	{
		$("#Add_Sponsor_Main_Error").hide();
		$("#Add_Sponsor_Main_Success").hide();
		$("#Edit_Sponsor_error_message").show();
		document.getElementById('Edit_Sponsor_error_message').innerHTML="Sponsor information Successfully updated !";
	}
	else if(Code == '3')
	{
		$("#Add_Sponsor_Main_Error").hide();
		$("#Add_Sponsor_Main_Success").hide();
		$("#Edit_Sponsor_error_message").show();
		document.getElementById('Add_Sponsor_Main_Success').innerHTML="Sorry! Sponsor Cannot be updated at this time..";
	}
	
	else if(Code == '4')
	{
		$("#Add_Sponsor_Main_Error").show();
		$("#Add_Sponsor_Main_Success").hide();
		$("#Edit_Sponsor_error_message").hide();
		document.getElementById('Add_Sponsor_Main_Error').innerHTML="Sponsor Name already exists !";
	}
	
	else if(Code == '5')
	{
		$("#Add_Sponsor_Main_Error").show();
		$("#Add_Sponsor_Main_Success").hide();
		$("#Edit_Sponsor_error_message").hide();
		document.getElementById('Add_Sponsor_Main_Error').innerHTML="Sponsor Name already exists !";
		
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', 'current');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	}
}

function AddSponsorCancel()
{
	 $("#Add_SponsorDiv").hide("slow");
	 $('#Add_Sponsor_Form')[0].reset();
	 $('#Add_SponsorDiv_Title').html("Add Sponsor");
	 
	 $('#Add_Sponsor_Main_Error').hide();
	 $('#Add_Sponsor_Main_Success').hide();
	 
	 $('a[name="hrefAdd_SponsorDiv"]').attr('id', 'current');
	 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
	 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
	 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
	 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
	 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	 
	 $("#Add_SponsorDiv").show("slow").siblings().hide("slow");
}




function LoadFormSponsor(id){
	
	 if(id=="Add_SponsorDiv")
	 {
		 

		 $("#"+id).hide("slow");
		 $('#Add_Sponsor_Form')[0].reset();
		 $('#Add_SponsorDiv_Title').html("Add Sponsor");
		 
		 $('#Add_Sponsor_Main_Error').hide();
		 $('#Add_Sponsor_Main_Success').hide();
		 $('#Add_Sponsor_sponsorid').val('');
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', 'current');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	 }
	 else if(id=="View_SponsorDiv")
	 {	
		 
		
		 $("#View_sponsor_Search_bar").val('');
		 var e = jQuery.Event("keyup", { keyCode: 20 });
		 $("#View_sponsor_Search_bar").trigger( e );
		
		 $('#Edit_Sponsor_error_message').hide();
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', 'current');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
		
	 }
	 else if(id=="Add_SponsorDivisionDiv")
	 {
		 $('#Add_SponsorDivision_Main_Error').hide();
		 $('#Add_SponsorDivision_Main_Success').hide();
		 
		 $("#"+id).hide("slow");
		 $('#Add_SponsorDivision_Form')[0].reset();
		 $('#Add_SponsorDivisionDiv_Title').html("Add Division");
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', 'current');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	 }
	 else if(id=="View_SponsorDivisionDiv")
	 {
		 $('#View_SponsorDivision_Search_bar').val('');
		 var e = jQuery.Event("keyup", { keyCode: 20 });
		 $("#View_SponsorDivision_Search_bar").trigger( e );
		 
		 $('#Edit_SponsorDivision_error_message').hide();
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', 'current');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	 }
	 else if(id=="Add_User_SponsorDivisionDiv")
	 {
		 $('#Add_SponsorDivisionUser_Main_Error').hide();
		 $('#Add_SponsorDivisionUser_Main_Success').hide();
		 
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', 'current');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', '');
	 }
	 else if(id=="View_User_SponsorDivisionDiv")
	 {
		 
		 $('#View_SponsorDivisionUser_Search_bar').val('');
		 var e = jQuery.Event("keyup", { keyCode: 20 });
		 $("#View_SponsorDivisionUser_Search_bar").trigger( e );
		 
		 $('#View_SponsorDivisionUser_Main_Error').hide();
		 $('#View_SponsorDivisionUser_Main_Success').hide();
		 
		 $('a[name="hrefAdd_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDiv"]').attr('id', '');
		 $('a[name="hrefAdd_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefAdd_User_SponsorDivisionDiv"]').attr('id', '');
		 $('a[name="hrefView_User_SponsorDivisionDiv"]').attr('id', 'current');
	 }
	 $('.error_label_grp').hide();
	 $("#"+id).show("slow").siblings().hide("slow");
	 
}
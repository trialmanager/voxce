// Groups Javascript Support






function AddGroupMessage()
{
	if($.trim($('#Add_Site_Main_Error').html())!="")
	{
		$('#Add_Site_Main_Error').show();			
	}
	else if($.trim($('#Add_Site_Main_Success').html())!="")
	{
		$('#Add_Site_Main_Success').show();			
	}
}


function Groups_Edit_Select_tag_selection()
{
	var a=$("#Groups_Edit_Select_tag option:selected").attr("id");
	var substr = a.split('@1@1@1');
	$("#Edit_Groups_Group_Name").val(substr[0]);
	$("#Edit_Groups_Group_Description").val(substr[1]);
}

function Edit_Groups()
{
	 $("#edit_groupForm_fields_div").toggle('slow');
}

function LoadFormGroups(id)
{		
	 if(id=="create_groupForm" || id=="" || id==null)
	 {
		 $('a[name="hrefcreate_groupForm"]').attr('id', 'current');
		 $('a[name="hrefedit_groupForm"]').attr('id', '');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', '');
	 }
	 else if(id=="edit_groupForm")
	 {
		 $('a[name="hrefcreate_groupForm"]').attr('id', '');
		 $('a[name="hrefedit_groupForm"]').attr('id', 'current');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', '');
	 }
	 else if(id=="GroupRights_groupForm")
	 {
		 $('a[name="hrefcreate_groupForm"]').attr('id', '');
		 $('a[name="hrefedit_groupForm"]').attr('id', '');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', 'current');
	 }
	 if(id=="" || id==null)
		$("#create_groupForm").show("slow").siblings().hide("slow");	
	 else
		$("#"+id).show("slow").siblings().hide("slow");	
}



function ChangeGroupForm(id)
{		
	 if(id=="create_groupForm" || id=="" || id==null)
	 {
		 $('#Add_Site_Main_Error').hide();
		 $('#Add_Site_Main_Success').hide();
		 $('a[name="hrefcreate_groupForm"]').attr('id', 'current');
		 $('a[name="hrefedit_groupForm"]').attr('id', '');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', '');
	 }
	 else if(id=="edit_groupForm")
	 {
		 $('#Edit_Groups_Submission_Error').hide();
		 $('#Edit_Groups_Submission_Success').hide();
		 $('a[name="hrefcreate_groupForm"]').attr('id', '');
		 $('a[name="hrefedit_groupForm"]').attr('id', 'current');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', '');
	 }
	 else if(id=="GroupRights_groupForm")
	 {
		 $('#RightsError').hide();
		 $('#RightsSuccess').hide();
		 $('a[name="hrefcreate_groupForm"]').attr('id', '');
		 $('a[name="hrefedit_groupForm"]').attr('id', '');
		 $('a[name="hrefGroupRights_groupForm"]').attr('id', 'current');
	 }
	 if(id=="" || id==null)
		$("#create_groupForm").show("slow").siblings().hide("slow");	
	 else
		$("#"+id).show("slow").siblings().hide("slow");	
}

function CreateGroupMessage(val)
{	
	if(val== 0)
	{
		document.getElementById('messageshow').innerHTML="Group with this name already Exists !";
	}
	else if(val== 1)
	{
		document.getElementById('messageshow').innerHTML="Group Created Successfully  !!!";
	}	
	else if(val== 2)
	{
		document.getElementById('messageshow').innerHTML="DataBase Connection Problem !";
	}
}

function Set_Hidden_Field_For_Add_Update(val){ $("#Groups_Hidden_Field_For_Add_Update").val(val); }



//--------------------------------------------------Jquery Event---------------------------------------------------------
//--------------------------------------------------Jquery Event---------------------------------------------------------
//--------------------------------------------------Jquery Event---------------------------------------------------------


//JavaScript Document

//---------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------Login Jquery-----------------------------------------------------------------
//---------------------------------------------------Login JQuery-----------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------

$(window).resize(function() {
    var width = $(document).width();
 	width = width - 290;
 	$('.right_body_content').css('width',width);
});

$(document).ready(function() {	
	
	$(".grey-pill").click(function(){
		$("#Edit_Groups_Group_Name").val("");
		$("#Edit_Groups_Group_Description").val("");
	});
	
	$(".all-values").each(function(){
		if($(this).val() == 0){
			$(this).removeAttr("checked");
		}else{
			$(this).attr("checked","checked");
		}
	});
	if(!$("#U25").is(":checked")){
		$(".hierarchy").attr("disabled","disabled");
	}
	$("#U25").click(function(){
		if(!$("#U25").is(":checked")){
			$(".hierarchy").attr("disabled","disabled");
		}
		else{
			$(".hierarchy").removeAttr("disabled");
		}
	});
	//------------Add Group Message Code----------------------------------------
	if($.trim($('#Add_Site_Main_Error').html())!="")
		$('#Add_Site_Main_Error').show();			
	else if($.trim($('#Add_Site_Main_Success').html())!="")
		$('#Add_Site_Main_Success').show();			
	//------------Add Group Message Code----------------------------------------
	
	//------------Edit Group Message Code----------------------------------------
	if($.trim($('#Edit_Groups_Submission_Error').html())!="")
		$('#Edit_Groups_Submission_Error').show();			
	else if($.trim($('#Edit_Groups_Submission_Success').html())!="")
		$('#Edit_Groups_Submission_Success').show();			
	//------------Edit Group Message Code----------------------------------------
	
	//------------Edit Group Rights Message Code----------------------------------------
	if($.trim($('#RightsError').html())!="")
		$('#RightsError').show();			
	else if($.trim($('#RightsSuccess').html())!="")
		$('#RightsSuccess').show();			
	//------------Edit Group Rights  Message Code----------------------------------------
	
/*	var str=$("#Groups_Edit_Select_tag option:selected").attr("id");
	var substr = str.split('@1@1@1');
	$("#Edit_Groups_Group_Name").val(substr[0]);
	$("#Edit_Groups_Group_Description").val(substr[1]);
*/	
	
	$('#GroupSelection').val($('#PreSelectedGroup').val());
	
	var state=$("input#InterfaceState").val();
	LoadFormGroups(state);
	
	var size=$('#GroupSelection option').size();
	
	if(size==0)
		$(".all").attr("disabled","disabled");
	
	
	for(var i=1;i<=41;i++)
	{
		if($('#U'+i).val()==1)
			$('#U'+i).attr("checked","checked");
		else if($('#U'+i).val()==0)
			$('#U'+i).removeAttr("checked");
	}	
	
	
	
	$(".view-all-select").click(function(){
		if($(this).is(":checked")){
			$(".view-all").attr("checked","checked");
			$(".all").removeAttr("disabled");
		}else{
			$(".view-all").removeAttr("checked");
			$(".all").removeAttr("checked").val("0").attr("disabled","disabled");
			
		}
	});
	$(".update-all-select").click(function(){
		if($(this).is(":checked")){
			$(".update-all").attr("checked","checked");
		}else{
			$(".update-all").removeAttr("checked");
		}
	});

	$(".insert-all-select").click(function(){
		if($(this).is(":checked")){
			$(".insert-all").attr("checked","checked");
		}else{
			$(".insert-all").removeAttr("checked");
		}
	});
	$(".delete-all-select").click(function(){
		if($(this).is(":checked")){
			$(".delete-all").attr("checked","checked");
		}else{
			$(".delete-all").removeAttr("checked");
		}
	});
	$(".view-Payments").click(function(){
		if($(this).is(":checked")){
			$(".Payments").removeAttr("disabled");
		}else{
			
			$(".Payments").removeAttr("checked").val("0").attr("disabled","disabled");
			
			
		}
	});
	$(".view-Trial").click(function(){
		if($(this).is(":checked")){
			$(".Trial").removeAttr("disabled");
		}else{
			
			$(".Trial").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Patients").click(function(){
		if($(this).is(":checked")){
			$(".Patients").removeAttr("disabled");
		}else{
			
			$(".Patients").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Library").click(function(){
		if($(this).is(":checked")){
			$(".Library").removeAttr("disabled");
		}else{
			
			$(".Library").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Sites").click(function(){
		if($(this).is(":checked")){
			
			$(".Sites").removeAttr("disabled");
		}else{
			$(".Sites").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Visits").click(function(){
		if($(this).is(":checked")){
			$(".Visits").removeAttr("disabled");
		}else{
			
			$(".Visits").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-CRF").click(function(){
		if($(this).is(":checked")){
			$(".CRF").removeAttr("disabled");
		}else{
			
			$(".CRF").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Management").click(function(){
		if($(this).is(":checked")){
			$(".Management").removeAttr("disabled");
		}else{
			
			$(".Management").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Division").click(function(){
		if($(this).is(":checked")){
			$(".Division").removeAttr("disabled");
		}else{
			
			$(".Division").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-Group").click(function(){
		if($(this).is(":checked")){
			$(".Group").removeAttr("disabled");
		}else{
			
			$(".Group").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	$(".view-User").click(function(){
		if($(this).is(":checked")){
			$(this).parents("tr").find(".User").removeAttr("disabled");
		}else{
			
			$(this).parents("tr").find(".User").removeAttr("checked").val("0").attr("disabled","disabled");
		}
	});
	
	//this the button please change the class on it
	$(".blue-pill").click(function(){
		var rights="";
		/*$(".all-values").each(function(){
			if($(this).is(":checked")){
				$(this).val("1");
				rights=rights+"1";
				
			}else{
				$(this).val("0");
				rights=rights+"0";
			}
		});
		$("#rights").val(rights);*/
		
		var rowcount=0;
		var rights="";
		var colcount=0;
		var centre=true;
		

		//alert(rights);
		$(".table_border_view_list").find("tr").each(function(){
			rowcount++;
			
			$(this).find("td").each(function(){
					colcount++;
					if($(this).attr("align")=='left'){
						centre=false;
					}
					else{
						//alert("asad");
						centre=true;
					}
			});
			if(colcount==1){
				if(centre==true){
					rights=rights+"3";
				}
				else{
					rights=rights+"2";
				}
			}
			else{
				$(this).find("input").each(function(){
					if($(this).is(":checked")){
							rights=rights+"1";
						}
					else{
						rights=rights+"0";
					}
				});
			}
			rights=rights+"4";
			rowcount=0;
			colcount=0;
		});
		$("#rights").val(rights);
	});
	
	$('#Create_Group_Form').submit(function(event) 
	{
		CheckAlphaNumericWithoutSpace(event,'Group_Name','Name_Error');		
	});
	
	$('#edit_group_form').submit(function(event) {

		$("#Edit_Groups_Group_Name_Error").text('Group Name Cannot be Empty !');
		var groupName=$.trim($("#Edit_Groups_Group_Name").val());
   	    var groupListDropDown = document.getElementById("Groups_Edit_Select_tag");
		var selectedGroup = groupListDropDown.options[groupListDropDown.selectedIndex].innerHTML;
		
		if(CheckAlphaNumericWithoutSpace(event,'Edit_Groups_Group_Name','Edit_Groups_Group_Name_Error')==false)
			return;
		if(groupName!="" )
		{
		  	   if ( selectedGroup != groupName )
		  	   {
				    for ( var i = 0 ; i < groupListDropDown.length ; i ++ ) 
				    {
					     if (groupName == groupListDropDown.options[i].innerHTML)
					     {		
					    	$('#Edit_Groups_Group_Name_Error').html( "Group Name already exists").show(); 
					    	Prevent_Event(event);
					    	return; 
					     }
				    }
		  	   }	
		  }
		  else if(groupName=="")
		  {   
			  Check_isempty(event,'Edit_Groups_Group_Name','Edit_Groups_Group_Name_Error');	
			  Prevent_Event(event);
			  return;
		  }
		
	});
	
	
	$('#GroupSelection').change(function() {		
		if($('select#GroupSelection option:selected').val()=="" || $('select#GroupSelection option:selected').val()==null)
			return;			
		$('#groupid').val($('select#GroupSelection option:selected').val());
		$('form#GrouphiddenForm').submit();		 		 
	});
	
});




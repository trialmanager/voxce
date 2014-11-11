//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
//JQuery JQuery JQuery JQuery JQuery JQuery
var visitName;

$(window).resize(function() {
	 var wid = $(".body_content").outerWidth();
	    wid = wid - $(".left_nav").outerWidth()-(.05*wid);
	 	$('.right_body_content').css('width',wid);
});

$(document).ready(function() {
	 var wid = $(".body_content").outerWidth();
	    wid = wid - $(".left_nav").outerWidth()-66;
	 	$('.right_body_content').css('width',wid);
	var relatedVisit;
	var visitToRelate;
	var i=0;
	var flag=true;
	var date;
	/*$(".visit_date_patient_td").each(function(){
		// get rows with attr related =0
		if($(this).attr("related")=="0"){
			//find related visits
			relatedVisit=$(this);
			visitToRelate=$(this);
			flag=true;
			//da = $.datepicker.parseDate('dd-mm-yy', $(this).val());
		//	 $(this).val($.datepicker.formatDate('dd-M-yy',da));
			date=relatedVisit.find(".patient_visit_date").val();
			while(flag){
				$(".visit_date_patient_td").each(function(){
					if(relatedVisit.attr("visit")==$(this).attr("related")){
						visitToRelate=$(this);
					}
				});
				if(relatedVisit.attr("visit")==visitToRelate.attr("visit")){
					flag=false;
					break;
				}
				
				if(relatedVisit.find(".patient_visit_date")!=undefined && relatedVisit.find(".patient_visit_date").val()!="Not Set" && date!=undefined){
					var date_split=date.split("-");
					var set_date=new Date(date_split[2],date_split[1],date_split[0]);
					var optimum_days=parseInt(visitToRelate.siblings(".orignal_dueDate").attr("optimum"));
					var new_date=new Date(set_date.getFullYear(),set_date.getMonth(),set_date.getDate()+optimum_days);
					var open_window=parseInt(visitToRelate.siblings(".orignal_slab").attr("openw"));
					var close_window=parseInt(visitToRelate.siblings(".orignal_slab").attr("close"));
					var open_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()-open_window);
					var close_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()+close_window);
					
					if(parseInt(new_date.getMonth())==0){
						visitToRelate.siblings(".orignal_dueDate").text(new_date.getDate()+"-"+(new_date.getMonth()+12)+"-"+(new_date.getFullYear()-1));	
						
						date=new_date.getDate()+"-"+(new_date.getMonth()+12)+"-"+(new_date.getFullYear()-1);
					}else{
						visitToRelate.siblings(".orignal_dueDate").text(new_date.getDate()+"-"+new_date.getMonth()+"-"+new_date.getFullYear());	
						date=new_date.getDate()+"-"+new_date.getMonth()+"-"+new_date.getFullYear();
						}
					if(parseInt(open_date.getMonth())==0){
						visitToRelate.siblings(".orignal_slab").text(open_date.getDate()+"/"+(open_date.getMonth()+12)+"/"+(open_date.getFullYear()-1));
					}else{
						visitToRelate.siblings(".orignal_slab").text(open_date.getDate()+"/"+open_date.getMonth()+"/"+open_date.getFullYear());
					}
					var open_t=visitToRelate.siblings(".orignal_slab").text();
					var close_t;
					if(parseInt(close_date.getMonth())==0){
						
						close_t=close_date.getDate()+"/"+(close_date.getMonth()+12)+"/"+(close_date.getFullYear()-1);
						
					}else{
						close_t=close_date.getDate()+"/"+(close_date.getMonth())+"/"+(close_date.getFullYear());
						
					}
					 var attr_date=date.replace("-","/");
					 attr_date=attr_date.replace("-","/");
					visitToRelate.siblings(".orignal_slab").text(open_t+" - "+close_t);
					
					// format change start
					
				//	var td=$.datepicker.parseDate("yy-mm-dd",open_t);
				//	open_t=$.datepicker.formatDate('dd-M-yy',td);
					
					// format change end
					
					visitToRelate.siblings(".orignal_dueDate").attr("open_date",open_t);
					visitToRelate.siblings(".orignal_dueDate").attr("close_date",close_t);
					visitToRelate.siblings(".orignal_dueDate").attr("due_date",attr_date);
					
					if(visitToRelate.attr("related")=="0"){
						flag=false;
						
					}else{
						$.ajaxSetup({async: false});
						$.post("updateOptimum.pat?optimumDate="+visitToRelate.siblings(".orignal_dueDate").text()+"&open="+open_t+"&close="+close_t+"&opt="+optimum_days+"&pvid="+visitToRelate.parent().attr("id"),function(data){
							//alert(data);
						});
						 $.ajaxSetup({async: true});
						
						flag=true;
					}
				
					relatedVisit=visitToRelate;
				}else{
					break;
				}
				
			}
		}
	});*/
	

	
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};
	
	
	$(".continued").live("click",function(){
		if($(this).is(":checked")){
			$(this).parents("tr").find(".StopDate").val("");
		}
	});
	$(".StopDate").live("click",function(){
		
			$(this).parents("tr").find(".continued").removeAttr("checked");
		
	});
	
	if(visitName!=undefined){
		 $("#fbodyo").find("tr").hide();
	       var data = "";
	       if(visitName != undefined){
	    	   data =  visitName.split(" ");
	       var jo = $("#fbodyo").find("tr");
	       $.each(data, function(i, v){		
	            //Use the new containsIgnoreCase function instead
	            jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	       });
	       	jo.show();
	       }
	}

	var fl = false;

	$(".date").datepicker({
		dateFormat: "dd M, yy",
		changeMonth:true,
		changeYear:true,
		 	onSelect: function(input, inst) {
		 		$(this).attr("value",$(this).val());
		 		var relatedVisit;
		 		var visitToRelate;
		 		var i=0;
		 		var flag=true;
		 		var date;
		 		if($(this).parent().attr("related")=="0"){
/*		 			$(".visit_date_patient_td").each(function(){
			 			
			 			if($(this).attr("related")=="0"){
			 				relatedVisit=$(this);
			 				visitToRelate=$(this);
			 				flag=true;
			 				
			 				
			 				date=relatedVisit.find(".patient_visit_date").val();
			 				
			 				
			 				
			 			}
			 		});*/
		 			relatedVisit=$(this).parent();
	 				visitToRelate=$(this).parent();
	 				date=input;
	 				flag=true;
		 			while(flag){
	 					$(".visit_date_patient_td").each(function(){
	 						if(relatedVisit.attr("visit")==$(this).attr("related")){
	 							visitToRelate=$(this);
	 						}
	 					});
	 					if(relatedVisit.attr("visit")==visitToRelate.attr("visit")){
	 						flag=false;
	 						break;
	 					}
	 					
	 					if(relatedVisit.find(".patient_visit_date")!=undefined && relatedVisit.find(".patient_visit_date").val()!="Not Set" && date!=undefined){
	 						
	 						var set_date=new Date(date);
	 						var optimum_days=parseInt(visitToRelate.siblings(".orignal_dueDate").attr("optimum"));
	 						var new_date=new Date(set_date.getFullYear(),set_date.getMonth(),set_date.getDate()+optimum_days);
	 						var open_window=parseInt(visitToRelate.siblings(".orignal_slab").attr("openw"));
	 						var close_window=parseInt(visitToRelate.siblings(".orignal_slab").attr("close"));
	 						var open_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()-open_window);
	 						var close_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()+close_window);
	 						
	 						visitToRelate.siblings(".orignal_dueDate").text($.datepicker.formatDate("dd M, yy",new_date));
	 						visitToRelate.siblings(".orignal_slab").text($.datepicker.formatDate("dd M, yy",open_date)+" - "+$.datepicker.formatDate("dd M, yy",close_date));
	 						visitToRelate.siblings(".orignal_dueDate").attr("open_date",$.datepicker.formatDate("dd M, yy",open_date));
	 						visitToRelate.siblings(".orignal_dueDate").attr("close_date",$.datepicker.formatDate("dd M, yy",close_date));
	 						visitToRelate.siblings(".orignal_dueDate").attr("due_date",$.datepicker.formatDate("dd M, yy",close_date));
	 						
	 						if(visitToRelate.attr("related")=="0"){
	 							flag=false;
	 							
	 						}else{
	 							$.ajaxSetup({async: false});
	 							$.post("updateOptimum.pat?optimumDate="+visitToRelate.siblings(".orignal_dueDate").text()+"&open="+$.datepicker.formatDate("dd M, yy",open_date)+"&close="+$.datepicker.formatDate("dd M, yy",close_date)+"&opt="+optimum_days+"&pvid="+visitToRelate.parent().attr("id"),function(data){
	 								//alert(data);
	 							});
	 							 $.ajaxSetup({async: true});
	 							
	 							flag=true;
	 						}
	 					
	 						relatedVisit=visitToRelate;
	 						date=visitToRelate.siblings(".orignal_dueDate").text();
	 					}else{
	 						break;
	 					}
	 					
	 				}
		 		}else{
		 			//alert("Not Related");
		 		}
		 		if($(this).parent().siblings(".orignal_dueDate").attr("optimum") != undefined){
		 				var new_date=new Date($(this).parent().siblings(".orignal_dueDate").text());
						var open_window=parseInt($(this).parent().siblings(".orignal_slab").attr("openw"));
						var close_window=parseInt($(this).parent().siblings(".orignal_slab").attr("close"));
						var open_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()-open_window);
						var close_date=new Date(new_date.getFullYear(),new_date.getMonth(),new_date.getDate()+close_window);
		 			
		 			$.post("RelatedVisitDate.pat?patientVisitId="+$(this).parents("tr").attr("id")+"&date="+$(this).val()+"&open_date="+$.datepicker.formatDate("dd M, yy",open_date)+"&close_date="+$.datepicker.formatDate("dd M, yy",close_date)+"&due_date="+$.datepicker.formatDate("dd M, yy",new_date),function(data){
		 					if(data == "success"){
		 						window.location.reload();
		 					}
		 				
					});
		 		}else{
		 			$.post("visitDate.pat?patientVisitId="+$(this).parents("tr").attr("id")+"&date="+$(this).val(),function(data){
						
		 				if(data == "success"){
							
	 						window.location.reload();
						}
		 			});
		 		}
		 			
		 }

	});
	 $(".st_status").each(function(){
		if($(this).text() == "Filled"){
			$(this).css("color","green");
		}else if($(this).text() == "Unfilled"){
			$(this).css("color","red");
		}else{
			$(this).css("color","orange");
			$(this).siblings("td").find(".html-data").attr("discripency","discripency");
		}
	});
	$("#hidennSelectedPatient_visit").find("option").each(function(){
		var outer = $(this);
		$("#patient_visit").find("option").each(function(){
			if($(this).val() == outer.val()){
				$(this).attr("selected","selected");
			}
		});
	});
	var links;
	var link;
	var crf_id;
	$(".html-data").click(function(){
			$(".table_disc").show();
			$(".table_audit").show();
			link = $(this);
			links = $(this);
			crf_id = link.parents("tr").attr("id");
			$(".dialog-div").html("");
			$(".dialog-div").html($(this).attr("htmldata"));
			$(".dialog-div").show();
			$(".controls").show();
			$(".create_group_container").hide();
			$(".cancle-button-p-crf").click(function(){
				$(".dialog-div").hide();
		    	$(".controls").hide();
		    	$(".create_group_container").show();
		    	$(".table_disc").hide();
		    	$(".table_audit").hide();
			});
			loadAuditAndDiscripencies(link);
			
			
		/*if($(this).attr("discripency")!= undefined){
			$(".dialog-div").find(".error").each(function(){
				$(this).after($("<input />").attr("type","button").val("ADD Instructions").css("clear","both").css("float","left").addClass("discrepancyText grey-pill"));
			});
			$(".discrepancyText").click(function(){
				if($(this).next().attr("discrepancyText")==undefined){
					$(this).after($("<textarea />").addClass("text_discrepancyText").css("clear","both").css("float","left").attr("discrepancyText","discrepancyText").css("max-width","200px"));
				}
			});
		}*/
		$("input[type=radio]").click(function(){
			$(this).siblings("input[type=radio]").removeAttr("checked");
			$(this).attr("checked","checked");
		});
		$(".save-button-p-crf").click(function(){
			 var filled = false;
			 $(".dialog-div").find("input").each(function(){
	       		$(this).attr("value",$(this).val());
	       		if($(this).val() != "" && $(this).val() != null && $(this).val() != undefined){
	       			filled = true;
	       		}
	       	 });
			 $(".dialog-div").find("input[type=radio]").each(function(){
       		 $(this).removeAttr("value");
       		 if($(this).is(":checked")){
       			 $(this).attr("checked","checked");
       			 filled = true;
       		 }
        		
        	 });
			 $(".dialog-div").find("input[type=checkbox]").each(function(){
       		 $(this).removeAttr("value");
       		 if($(this).is(":checked")){
       			 $(this).attr("checked","checked");
       			 filled = true;
       		 }else{
       			 $(this).removeAttr("checked");
       			 
       		 }
        		
        	 });
			 $(".dialog-div").find("textarea").each(function(){
       		 
       		 $(this).html($(this).val());
       		 if($(this).text() != "" ){
       			 filled = true;
       		 }
			 });
			
			 
			 
	       	$("#idOfPCRT").attr("value",link.parents("tr").attr("id"));
	       	if(filled){
	       		$("#filled").attr("value","true");
	       	}
	       	var boolean = true;
       	
       		$(".each-ques-crf").each(function(){
       			if($(this).attr("resolved")==undefined){
	       			$(this).siblings(".error").remove();      			
	       			$(this).after($("<div />").addClass("error error2discrepancy"));       			
	       			if($(this).attr("mendtory_textarea")){
	       				if($(this).find("textarea").text() == ""){
	       					
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("margin-right","5px").append("Please Answer This Question!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       				
	       			}
	       			if($(this).siblings(".error1").html() != null){
	       				boolean = false;
	       			}
	       			
	       			if($(this).attr("mendtory")){
	       				if($(this).find("input").val() == ""){
	       					
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("margin-right","5px").append("Please Answer This Question!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       				
	       			}
	       			if($(this).attr("mendtory_radio") != undefined){
	       				if($(this).find("input[type=radio]:checked").val() == undefined){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("margin-right","5px").append("Please Answer This Question!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       				
	       			}
	       			if($(this).attr("mendtory_checkbox") != undefined){
	       				var value = -1;
	       				$(this).find("input[type=checkbox]:checked").each(function(index){
	       					value = index;
	       				});
	       				if(value == -1){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("margin-right","5px").append("Please Answer This Question!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("mendtory_time") != undefined){
	       				if($(this).find("input").val() == ""){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Select the Time!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("mendtory_date") != undefined){
	       				if($(this).find("input").val() == ""){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Select the Date!").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("mendtory_list") != undefined){
	       				if($(this).find("select").val() == 0){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Select an Option").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("greater") != undefined && $(this).find("input").val() != ""){
	       				if(parseInt($(this).find("input").val()) < parseInt($(this).attr("greater"))){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Enter the value greater then "+$(this).attr("greater")+" !").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       				
	       			}
	       			if($(this).attr("less") != undefined){
	       				if(parseInt($(this).find("input").val()) > parseInt($(this).attr("less"))){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Enter the value Less then "+$(this).attr("less")+" !").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       				
	       			}
	       			if($(this).attr("greater_checkbox") != undefined){
	       				$(this).find("input[type=checkbox]:checked").each(function(index){
	       					value = index;
	       				});
	       				if(value <= parseInt($(this).attr("greater_checkbox"))){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Select More or Equal "+$(this).attr("greater_checkbox")+" !").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("less_checkbox")!= undefined){
	       				$(this).find("input[type=checkbox]:checked").each(function(index){
	       					value = index;
	       				});
	       				if(value >= parseInt($(this).attr("less_checkbox"))){
	       					boolean = false;
	       					if($(this).siblings(".error").find("span").html()==null)
	       					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Select Less or Equal "+$(this).attr("less_checkbox")+" !").css("font-size","10px").css("font-family","arial").css("color","red"));
	       				}
	       			}
	       			if($(this).attr("numeric") != undefined){
	       				
	       				
	       					 if($(this).find("input").val() != "") {
	       					     var value = $(this).find("input").val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	       					     var intRegex = /^\d+$/;
	       					     if(!intRegex.test(value)) {
	       					    	 boolean = false;
	       	        					if($(this).siblings(".error").find("span").html()==null)
	       	        					$(this).siblings(".error").append($("<span />").css("margin-left","5px").css("font-family","arial").css("margin-right","5px").append("Please Enter Numeric Values Only !").css("font-size","10px").css("font-family","arial").css("color","red"));
	       					       
	       					     }
	       					 } 	
	       				
	       			}
	       			var filled = true;
	       			$(this).find(".dosage").each(function(){
	       				var elementTD = $(this).parent();
	       			
	       				if($(this).val() == 0 || $(this).val() == ""){
	       					 boolean = false;
	       					 filled = false;
	       					 
	       				}
	       				if(elementTD.siblings("td").find(".startDate").val() == ""){
	       					boolean = false;
	       					filled = false;
	       					
	       				}
	       				if(elementTD.siblings("td").find(".StopDate").val() == "" && !elementTD.siblings("td").find(".continued").is(":checked")){
	       					boolean = false;
	       					filled = false;
	       					
	       				}
	       				if(elementTD.siblings("td").find(".StopDate").val() != "" && elementTD.siblings("td").find(".continued").is(":checked")){
	       					boolean = false;
	       					filled = false;
	       					
	       				}
	       				if(elementTD.siblings("td").find(".unitDrug").val() == 0){
	       					boolean = false;
	       					filled = false;
	       					elementTD.siblings("td").find(".unitDrug").find("option").each(function(){
	       						$(this).removeAttr("selected");
	       					});
	       					elementTD.siblings("td").find(".unitDrug").find("option:first").attr("selected","selected");
	       				}
	       			});
	       			if(!filled){
	       				$(this).after($("<div />").addClass("error error2discrepancy").append($("<span />").text("Fill this Block As Instructed Below").css("font-size","10px").css("color","red").css("font-family","arial").css("margin-left","5px").css("margin-right","5px")));
	       			}
	       			var filledLab = true;
	       			$(this).find(".result").each(function(){
	       				var elementTDlab = $(this).parent();
	       				if($(this).val() == null || $(this).val() == ""){
	      					 boolean = false;
	      					 filledLab = false;
	      					 
	       				}
	       				if(elementTDlab.siblings("td").find(".unitLab").val() == 0){
	       					boolean = false;
	       					filledLab = false;
	       					elementTDlab.siblings("td").find(".unitLab").find("option").each(function(){
	       						$(this).removeAttr("selected");
	       					});
	       					elementTDlab.siblings("td").find(".unitLab").find("option:first").attr("selected","selected");
	       				}
	       			});
	       			if(!filledLab){
	       				$(this).after($("<div />").addClass("error error2discrepancy").append($("<span />").text("Fill this Block As Instructed Below").css("font-size","10px").css("color","red").css("font-family","arial").css("margin-left","5px").css("margin-right","5px")));
	       			}
	       			
	       			
	       			if(boolean){
	       				$(this).remove("border","none");
	       			}
	       		}
       		});
       		
       	
	       	if(boolean){
	       		 $(".dialog-div").find("input").each(function(){
	            		$(this).removeAttr("id").removeClass("hasDatepicker");
	            		
	            	 });
	       			$(".dialog-div").find(".error").remove();
	       			$(".dialog-div").find(".discrepancyText").remove();
	       			$(".dialog-div").find(".addQuery").remove();
	       			$(".dialog-div").find(".text_discrepancyText").remove();
	      		 $("#data").attr("value",$(".dialog-div").html());
	      		 var valu = audit();
	      		 if(valu){
		       		$("#saveHtml").submit();
		       		
		           	$(".dialog-div").hide();
		           	$(".controls").hide();
		           	$(".create_group_container").show();
	      		 }
	       	}else{
	       		$("#confirmDiscrepancy").dialog({
	       			maxWidth:400,
	       			minWidth:400,
	       			minHeight:150,
	       			maxHeight:150,
	       			resize:false,
	       			title:"Alert!",
	       			buttons: {
	                       "Yes": function () {
	                    	   audit();
	                    	   
	                       	 $(".dialog-div").find("input").each(function(){
	                         		$(this).removeAttr("id").removeClass("hasDatepicker");
	                         	 });
	                       	 var error = new Array();
	                       	 var index = 0;
	                       	$(".dialog-div").find(".each-ques-crf").each(function(){
	                       		var ques = ($(this).find(".question-heading").html()).substring(4);
	                       		
	                       		$(this).siblings(".error2discrepancy").each(function(){
	                       			if($(this).html() == ""){
	                          			 $(this).next(".text_discrepancyText").remove();
	                          			$(this).remove();
	                          		 }else{
	                          			 error[index] = ques;
	                          			 error[index+1] = $(this).find("span").html();
	                          			error[index+2] =  $(this).parents(".crf-section-block").find(".section-name").html();
	                          			index = index+3;
	                          		 }
	                       		});
	                       		
	                       	});
                      
                     /*  	 $(".dialog-div").find(".error").each(function(){
                       		 if($(this).html() == ""){
                       			 $(this).next(".text_discrepancyText").remove();
                       			$(this).remove();
                       		 }else{
                       			 error[index] = $(this).find("span").html();
                       		 }
                       	 });*/
	                      
                       	 $.ajax({
                       			 url:"saveDiscrepancies.pat?errors="+error+"&patientCrfID="+$("#idOfPCRT").val(),
                       			 method:"POST",
                       			 dataType:"html",
                       			async:   false,
                       			 success: function(data) {
                       			   
                       				 
				                       		 if(data == "success"){
				                       			 
				                       			 $(".dialog-div").find(".discrepancyText").remove();
				                       			$(".dialog-div").find(".addQuery").remove();
				                               	 
				                             		if($(".dialog-div").find(".error").length>0 || $(".dialog-div").find(".error1").length>0){
				                             			$("#filled").attr("value","discrepancy");
				                             		}
				                             		if($(".dialog-div").find(".error").length <= 0 ){
				                             			$(".dialog-div").find(".error").remove();
				                             		}
				                             		
				                            		 $("#data").attr("value",$(".dialog-div").html());
				                             		$("#saveHtml").submit();
				                                 	$(this).dialog("close");
				                                 	$(".dialog-div").hide();
				                                 	$(".controls").hide();
				                                 	$(".create_group_container").show();
				                       		 }
				                       		 else{
				                       			 $("#confirmDiscrepancy").html("<span>Error!</span>");
				                       		 }
                       			 		},
                       	 error:function(data){
                       		 alert("Error! Mendatory Fields Must be Filled ");
                       	 }
                       	 
                       	 });
                       	
                       	
                        	
                       },
                       "No":function(){
                      	 $(this).dialog("close");
                       }
                      }
       			
       		});
       		boolean = true;
       	}

		});
		
		
		
		
		
		
		
		
		$(".unitDrug").live("change",function(){
			var val = $(this).val();
			$(this).find("option").each(function(){
				if($(this).val() == val){
					$(this).attr("selected","selected");
				}
			});
		});
		
		
		$(".list-options").live("change",function(){
			var val = $(this).val();
			$(this).find("option").each(function(){
				if($(this).val() == val){
					$(this).attr("selected","selected");
				}
			});
		});
		
		$(".dosage").live("keyup",function(){
			  this.value = this.value.replace(/[^0-9\.]/g,'');
			  
			  if($(this).val()=="" || $(this).val()==null)
			   $(this).val(0);  
			  var temp=$(this).val();
			  temp=parseFloat(temp);
			  $(this).val(temp);
		});
		
		$(".percent").live("keyup",function(){
			  this.value = this.value.replace(/[^0-9\.]/g,'');
			  
			  if($(this).val()=="" || $(this).val()==null)
			   $(this).val(0);  
			  var temp=$(this).val();
			  temp=parseFloat(temp);
			  $(this).val(temp);
			  
			if(temp < 0 ){
				$(this).val(0);
			}
			if(temp>100){
				$(this).val(100);
			}
		});
		$(".each-ques-crf").each(function(){
		
				$(this).parent().prepend("<a href='javascript://' style = 'float:right;' class = 'addQuery' ><img src = 'images/question-blue.png' ></img></a>");
				
		});
		$(".addQuery").click(function(){
			var button = $(this);
			$(".query").dialog(
					{
						buttons:{
							"Put":function(){							
									button.siblings(".each-ques-crf").after($("<div />").css("border","silver solid 1px").css("padding","4px").addClass("error1 error2discrepancy").attr("manual","manual").append($("<span/>").html($(".text-of-query").val()).css("margin-left","5px").css("margin-right","5px").css("font-family","arial").css("color","red").css("font-size","10px")));
									$(".query").find(".text-of-query").val("");
									$(this).dialog("destroy");
									
							}
						},
						width:350,
						title:"Manual Query",
						resize:false
					});
		});
	
		$(".date").datepicker({
			 changeMonth: true,
	            changeYear: true
		});
		$(".time").timepicker({
		ampm: true,
		hourMin: 0,
		hourMax: 24
		});
	
	});
	
	if(screen.width<1200){
		   $(".ui-multiselect").width("80.3%").css("float","left");
	   }else{
		   $(".ui-multiselect").width("55.3%").css("float","left");
	   }
	$(".selected").width("300px");
	 $(".available").width("300px");
	 $(".search").width("150px");
	  
	$.expr[':'].containsIgnoreCase = function(e,i,m){
	    return jQuery(e).text().toUpperCase().indexOf(m[3].toUpperCase())>=0;
	};

//=====================================which form to show=============================================//	
	var state=$("input#InterfaceState").val();	
	var msg = $("input#PatientReturnMessage").val();
	if(msg=='0' || msg=='1')
	{
		
		CreatePatientMessage(msg); 
		$("#View_Patient_Div").hide();
		  $('#createpatientdiv').hide();
		 $('#Patient_Visit').show("slow").siblings().hide("slow");
	}
	if(state =="")
	{
		
		 $('a[name="hrefcreatepatientdiv"]').attr('id', '');
		 $('a[name="hrefviewpatientdiv"]').attr('id', 'current');
		 $("#View_Patient_Div").show("slow").siblings().hide("slow");
		  $('#createpatientdiv').hide();
		 $('#Patient_Visit').hide();
	}
	else
	{
		$("#"+state).show("slow").siblings().hide("slow");
		 if(state=="createpatientdiv")
		 {
			 $('#View_Patient_Div').hide();
			 $('a[name="hrefcreatepatientdiv"]').attr('id', 'current');
			 $('a[name="hrefviewpatientdiv"]').attr('id', ''); 
			 $('#Patient_Visit').hide();
		 }
		 else if(state=="View_Patient_Div")
		 {
			 $('a[name="hrefviewpatientdiv"]').attr('id', 'current');
			 $('a[name="hrefcreatepatientdiv"]').attr('id', '');
			 $('#Patient_Visit').hide();
			 
		 }	 
		
	}//Current Sponsor Form State	
	
	//====================================search bar has been clicked==============================================//
	
	 $("#View_Patient_Search_baro").change(function(){
		 
	        $("#fbodyo").find("tr").hide();
	        var data = $(this).val().split(" ");
	        var jo = $("#fbodyo").find("tr");
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
	
	 $("#View_Patient_Search_bar").keyup(function(){
		 
	        $("#fbody").find("tr").hide();
	        var data = $(this).val().split(" ");
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
	
	//====================================save button has been clicked==============================================//
	$('#create_patient_form').submit(function(event) {
		Validate_Numeric_range(event,'number','Number_Error',1,10);
		Character_Range(event,'initials','initial_error',5);
		Check_isempty(event,'datepicker1','Doberror');
		Check_isempty(event,'datepicker2','Dateofinformedconsenterror');
		
		var td=$.datepicker.parseDate("dd-M-yy",$("#datepicker1").val());
		//$("#datepicker1").val($.datepicker.formatDate('dd-mm-yy',td));
	//	alert(td);
		td=$.datepicker.parseDate("dd-M-yy",$("#datepicker2").val());
		//$("#datepicker2").val($.datepicker.formatDate('dd-mm-yy',td));
		//alert(td);
		td=$.datepicker.parseDate("dd-M-yy",$("#datepicker3").val());
		//$("#datepicker3").val($.datepicker.formatDate('dd-mm-yy',td));
	//	alert(td);
	});
	
	
	var wid = $(".body_content").outerWidth();
	wid = wid - 230;
	$('.right_body_content').css('width',wid);
	$("tr:visible").each(function(){
		if($(this).find(".name_user").attr("username")!=undefined){
			$(this).find(".user_name").text($(this).find(".name_user").text());
		}else{
			$(this).find(".user_name").text("Unknown");
		}
		
		if($(this).find(".date_filled").attr("username")!=undefined && ($(this).find(".date_filled").attr("username")!="1901-01-01" ||$(this).find(".date_filled").attr("username")!= "null")){
			$(this).find(".filled_date").text($(this).find(".date_filled").text());
		}else{
			$(this).find(".filled_date").text("New");
		}
	});
	$(".unitLab").live("change",function(){
		var val = $(this).val();
		$(this).find("option").removeAttr("selected");
		$(this).find("option").each(function(){
			
			if($(this).text() == val){
				$(this).attr("selected","selected");
			}
		});
	});
	$(".error2discrepancy").live("click",function(){
		var element_dis = $(this);
		var div = $(".responseToQuery").clone();
		div.find(".section_text_name").val($(this).parents(".crf-section-block").find(".section-name").text());
		div.find(".question_text_name").val(($(this).siblings(".each-ques-crf").find(".question-heading").text()).substring(4));
		div.dialog({
			maxWidth:400,
			minWidth:400,
			minHeight:400,
   			maxHeight:400,
			title:element_dis.find("span").text(),
			close: function(event, ui) {
				div.remove();
				$(this).dialog("distroy");
				},
			buttons:{
				"Save":function(){
					var button = $(this);
					element_dis.siblings(".each-ques-crf").attr("resolved","resolved");
					var status = div.find(".status").val();
					var discrepancy = element_dis.find("span").text();
					var question = div.find(".question_text_name").val();
					var section = div.find(".section_text_name").val();
					var pacientCrf = links.parents("tr").attr("id");
					var action = div.find(".action").val();
					var resion = div.find(".resion").val();
					var orignal = div.find(".orignal_value").val();
					var current = div.find(".current_value").val();
					var type = div.find(".type").val();
					if(status != "0" && action != "0" && type != "0"){
						$.post("responseOnQuery.pat?status="+status+"&discrepancy="+discrepancy+"&question="+question+"&section="+section+"&pacientCrf="+pacientCrf+"&action="+action+"&reasion="+resion+"&orignal="+orignal+"&current="+current+"&type="+type,function(data){
							if(data == "success"){
								element_dis.remove();
								button.dialog("close");
							}else{
								button.dialog("close");
								alert("Can not resolve the query please try later!");
							}
						});
					}
				}
			}
		});
		
		
	});
	$(".table_disc").click(function(){
		if($(this).text() == "Discrepancies"){
			$(this).text("Back to Crf");
			$(".table_audit").text("Audit Trail");
			$(".dialog-div").hide();
	    	$(".controls").hide();
	    	$("#current").removeAttr("id");
	    	$(".show_disc").show();
	    	$(this).attr("id","current");
	    	
	    	$(".create_group_container").hide();
		}else{
			
			$(this).text("Discrepancies");
			
			if($.trim($(".dialog-div").html()) == ""){
				$(".create_group_container").show();
			}else{
				$(".dialog-div").show();
				$(".controls").show();
			}
	    	
			$(".show_disc").hide();
	    	$("#current").removeAttr("id");
	    	
		}
		$(".show_audit").hide();
		
	});
	$(".table_audit").click(function(){
		
		if($(this).text() == "Audit Trail"){
	    	
	    	$(".show_audit").show();
			$(".dialog-div").hide();
			$(".create_group_container").hide();
	    	$(".controls").hide();
	    	$("#current").removeAttr("id");
	    	$(this).attr("id","current");
			$(this).text("Back to Crf");
			$(".table_disc").text("Discrepancies");
			$("#View_audit_Table").find(".audit_crf").each(function(){
				if($(this).text() == crf_id){
					$(this).parent().show();
				}
			});
			$(".audit_answer").each(function(){
				if($(this).attr("done")==undefined){
					$(this).attr("done","done");
					$(this).html($(this).text().replace("-*-***-*", "<br />"));
					if($(this).text().indexOf("~*~*~*~") != -1){
						var str1 = $(this).html().split("~*~*~*~");
						var sttr1 = "<table class = 'distro'><tr class = 'rights_header_view_list'><td class='set_padding'>Lab Name</td>" + "<td class='set_padding'>Results</td>" + "<td class='set_padding'>Unit</td></tr>";
						for(var i = 0 ; i < str1.length ; i++ ){
							sttr1 = sttr1 + "<tr><td class='set_padding' style = 'text-size:10px;'>"+str1[i]+"</td>" + "<td class='set_padding' style = 'text-size:10px;'>"+str1[i+1]+"</td>" + "<td class='set_padding' style = 'text-size:10px;'>"+str1[i+2]+"</td></tr>";
							i= i+2;
						}
						sttr = sttr1+"</table>";
						$(this).html(sttr1);
					}
					if($(this).text().indexOf("~-~-~-~") != -1){
						var str = $(this).html().split("~-~-~-~");
						var sttr = "<table class = 'distro'><tr class = 'rights_header_view_list'><td class='set_padding'>Drug Name</td>" + "<td class='set_padding'>Start Date</td>" + "<td class='set_padding'>Stop Date</td>" + "<td class='set_padding'>Continued</td>" +"<td class='set_padding'>Dosage</td>"+"<td class='set_padding'>Unit</td></tr>";
						for(var j = 0 ; j < str.length ; j++ ){
								sttr = sttr + "<tr><td class='set_padding'>"+str[j]+"</td><td class='set_padding'>"+str[j+1]+"</td><td class='set_padding'>"+str[j+2]+"</td><td class='set_padding'>"+str[j+3]+"</td><td class='set_padding'>"+str[j+4]+"</td><td class='set_padding'>"+str[j+5]+"</td></tr>";
							j = j +5;
						}
						sttr = sttr+"</table>";
						$(this).html(sttr);
					}

				
				}
				
			});
		}else{
			$(this).text("Audit Trail");

	    	$(".show_audit").hide();
	    	if($.trim($(".dialog-div").html()) == ""){
				$(".create_group_container").show();
			}else{
				$(".dialog-div").show();
				$(".controls").show();
			}
	    	$("#current").removeAttr("id");
	    	
			
		}
		$(".show_disc").hide();
    	
		
	});
});

//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//Javascript Javascript Javascript Javascript
//============================================================Patient Message==========================================================//

function CreatePatientMessage(val)
{	
	if(val == 0)
	{
		$('#Create_Patient_Main_Error').html("Patient alreday exist");
		$("#Create_Patient_Main_Success").hide();
		$('#Create_Patient_Main_Error').show();
	//	$("#Create_User_user_name_error").show();
	//	document.getElementById('Create_User_user_name_error').innerHTML="Username already exists";
	}
	else if(val == 1)
	{
		 $('#Create_Patient_Main_Success').html("New patient has been created");
		$("#Create_Patient_Main_Success").show();
		$('#Create_Patient_Main_Error').hide();
	//	document.getElementById('Create_User_error_message').innerHTML="User Created Successfully";		
	}
}

//============================================================Loading Forms==========================================================//
	
function LoadPatientForm(id)
{
	$("#"+id).show("slow").siblings().hide("slow");
	$('#create_patient_title').html("Create Patient");
	 if(id=="createpatientdiv")
	 {
		 refreshform();
		 $('a[name="hrefcreatepatientdiv"]').attr('id', 'current');
		 $('a[name="hrefviewpatientdiv"]').attr('id', '');
		 $('#View_Patient_Div').hide();
		 $('#Patient_Visit').hide();
	 }
	 else if(id=="View_Patient_Div")
	 {
		 $('a[name="hrefviewpatientdiv"]').attr('id', 'current');
		 $('a[name="hrefcreatepatientdiv"]').attr('id', '');
		 $("#View_Patient_Search_bar").val("");
		 $('#Patient_Visit').hide();
	 }	 
}
//============================================================EDIT PATIENT==========================================================//


function edit_view_patient_row(id,number,initials,gender,date_of_birth,date_of_informed_consent,date_of_randomization,date_created,created_by)
{
	
	$("#Number_Error").html("");	
	$("#Initials_Error").html("");
	$("#Dob_Error").html("");	
	$("#Dateofinformedconsent_Error").html("");	
	$("#dateofrandomization_error").html("");	
	$('#create_patient_title').html("Edit Patient");
	$('#Create_Patient_Main_Error').hide();
	$("#Create_Patient_Main_Success").hide();
	$('#date_created').val(date_created);
	$('#created_by').val(created_by);
		$('#edit_id').val(id);
		$('#number').val(number);
		$('#initials').val(initials); 
		$("[name=gender]").filter("[value="+gender+"]").attr("checked","checked");
		var td=$.datepicker.parseDate("yy-mm-dd",date_of_birth);
		$('#datepicker1').val($.datepicker.formatDate('dd-M-yy',td));
		var td=$.datepicker.parseDate("yy-mm-dd",date_of_informed_consent);
		$('#datepicker2').val($.datepicker.formatDate('dd-M-yy',td));
		var td=$.datepicker.parseDate("yy-mm-dd",date_of_randomization);
		$('#datepicker3').val($.datepicker.formatDate('dd-M-yy',td));
		
		$("#createpatientdiv").show("slow").siblings().hide("slow");
		$('#View_Patient_Div').hide();	
		
}

function create_visit(id,number)
{	
	
	$("#Patient_Visit_div").show("slow").siblings().hide("slow");
	$('#View_Patient_Div').hide();
	$('#Create_Patient_Main_Error').hide();
	$("#Create_Patient_Main_Success").hide();
	$("#patient_no").val(number);
	$("#edit_id_patient_visit").val(id);
	$('#createpatientdiv').hide();	
}

function cancleAssignCrf(){
	$("#Patient_Visit_div").hide("slow").siblings().show("slow");
	$('#View_Patient_Div').show();
	$('#Create_Patient_Main_Error').show();
	$("#Create_Patient_Main_Success").show();
	$("#patient_no").val(number);
	$("#edit_id_patient_visit").val(id);
	$('#createpatientdiv').show();
}

function refreshform()
{
	$('#edit_id').val(0);
	$('#number').val("");
	$('#initials').val("");
	$('#datepicker1').val("");
	$('#datepicker2').val("");
	$('#datepicker3').val("");
	$("#Number_Error").html("");	
	$("#Initials_Error").html("");
	$("#Dob_Error").html("");	
	$("#Dateofinformedconsent_Error").html("");	
	$("#dateofrandomization_error").html("");	
	$('#Create_Patient_Main_Error').hide();
	$("#Create_Patient_Main_Success").hide();
}

function show_visit_id(patient_visit_id,patient_id)
{
	if(patient_visit_id == patient_id)
		return patient_visit_id;
	else
		return 0;
}

/*
$(function(){
	$("#View_Patient_Search_baro").ready(function(){
	       $("#fbodyo").find("tr").hide();
	       var data = "";
	       if($("#View_Patient_Search_baro").val() != undefined){
	    	   data =  $("#View_Patient_Search_baro").val().split(" ");
	       alert(data);
	       var jo = $("#fbodyo").find("tr");
	       $.each(data, function(i, v){		
	            //Use the new containsIgnoreCase function instead
	            jo = jo.filter("*:containsIgnoreCase('"+v+"')");     
	       });
	       	jo.show();
	       }
	   }).focus(function(){
	       this.value="";
	       $(this).css({"color":"black"});
	       $(this).unbind('focus');
	   }).css({"color":"#C0C0C0"});
});
*/

function audit(){
	
	var answerxs = new Array();
	var qindex = 0;
	$(".crf-section-block").each(function(){
		if($(this).html() == "" || $(this).html() == null || $(this).find(".each-ques-crf").attr("anstype") == undefined){
			$(this).remove();
		}else{

			var sectionName =  $(this).find(".section-name").html();
	//		alert(sectionName);
			$(this).find(".section-question-block").each(function(){
				
				if($(this).html() != "" && $(this).html() != null && $(this).find(".each-ques-crf").attr("anstype") != undefined){
			//		alert(sectionName);
					answerxs[qindex] = sectionName;
					qindex++;
					answerxs[qindex] = $(this).find(".question-heading").text().substring(4);
					qindex++;
					if($(this).find(".each-ques-crf").attr("anstype") == 1){
						answerxs[qindex] = $(this).find("input.input_txt").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 2){
						answerxs[qindex] = $(this).find("textarea").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 3){
						var thinh="";
						var leng = $(this).find("input[type=radio]:checked").length;
						$(this).find("input[type=radio]:checked").each(function(index){
							thinh= thinh+$(this).next(".answer-lable").text();
							if((index+1) < leng){
								thinh= thinh+"-*-***-*";
							}
						});
						answerxs[qindex] = thinh;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 4){
						var thinh="";
						var leng = $(this).find("input[type=checkbox]:checked").length;
						$(this).find("input[type=checkbox]:checked").each(function(index){
							thinh= thinh+$(this).next(".answer-lable").text();
							if((index+1) < leng){
								thinh= thinh+"-*-***-*";
							}
						});
						answerxs[qindex] = thinh;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 5){
						var thinh = "";
						var leng = $(this).find("input[type=radio]:checked").length;
						$(this).find("input[type=radio]:checked").each(function(index){
							thinh= thinh+$(this).next(".answer-lable").text();
							if((index+1) < leng){
								thinh= thinh+"-*-***-*";
							}
						});
						answerxs[qindex] = thinh;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 6){
						var thinh="";
						var leng = $(this).find("input[type=checkbox]:checked").length;
						$(this).find("input[type=checkbox]:checked").each(function(index){
							thinh= thinh+$(this).next(".answer-lable").text();
							if((index+1) < leng){
								thinh= thinh+"-*-***-*";
							}
						});
						answerxs[qindex] = thinh;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 7){
						answerxs[qindex] = $(this).find("input.time").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 8){
						answerxs[qindex] = $(this).find("input.date").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 9){
						if($(this).find(".list-options").val() == 0){
							answerxs[qindex] = "Empty";
						}else{
							answerxs[qindex] = $(this).find(".list-options").val();
						}
						
					}else if($(this).find(".each-ques-crf").attr("anstype") == 10){
						var ans = "";
						var leng = $(this).find("tr").length;
						$(this).find("tr").each(function(indexTr){
							if($(this).attr("wing") == "wing"){
								
								var startDate;
								var stopDate;
								var drug_name;
								var continued;
								var unit;
								var dosage;
								if($(this).find(".drug-name").text() == ""){
									drug_name = "Empty";
								}else{
									drug_name = $(this).find(".drug-name").text();
								}
								if($(this).find(".startDate").val() == "" || $(this).find(".startDate").val() == null){
									startDate = "Empty";
								}else{
									startDate = $(this).find(".startDate").val();
								}
								if($(this).find(".StopDate").val() == "" || $(this).find(".StopDate").val() == null){
									stopDate = "Empty";
								}else{
									stopDate = $(this).find(".StopDate").val();
								}
								if($(this).find(".continued").is(":checked")){
									continued  = "On";
								}else{
									continued = "Off";
								}
								if($(this).find(".unitDrug").val() == 0 || $(this).find(".unitDrug").val() == null){
									unit = "Empty";
								}else{
									unit = $(this).find(".unitDrug").val();
								}
								if($(this).find(".dosage").val() == "" || $(this).find(".dosage").val() == null){
									dosage = "Empty";
								}else{
									dosage = $(this).find(".dosage").val();
								}
								ans=ans+drug_name+"~-~-~-~"+startDate+"~-~-~-~"+stopDate+"~-~-~-~"+continued+"~-~-~-~"+dosage+"~-~-~-~"+unit;
								if((indexTr+1)<leng){
									ans =ans+"~-~-~-~";
								}
							}
						});
						answerxs[qindex] = ans;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 11){
						answerxs[qindex] = $(this).find(".list-options").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 12){
						var ans = "";
						
						var leng = $(this).find("tr").length;
						$(this).find("tr").each(function(indexTr){
							if($(this).attr("wing") == "wing"){
								
								var lab_name;
								var result ;
								var unitLab;
								
								if($(this).find(".lab-name").text() == "" || $(this).find(".lab-name").text() == null){
									lab_name = "Empty";
								}else{
									
									lab_name = $(this).find(".lab-name").text();
									
								}
								if($(this).find(".result").val() == "" || $(this).find(".result").val() == null){
									result = "Empty";
								}else{
									
									result = $(this).find(".result").val();
									
								}
								if($(this).find(".unitLab").val() == 0 || $(this).find(".unitLab").val() == null){
									unitLab = "Empty";
								}else{
									
									unitLab = $(this).find(".unitLab").val();
									
								}
								ans =ans+lab_name+"~*~*~*~"+result+"~*~*~*~"+unitLab;
								if((indexTr+1)<leng){
									ans =ans+"~*~*~*~";
								}
							}
						});
						answerxs[qindex] = ans;
					}else if($(this).find(".each-ques-crf").attr("anstype") == 13){
						answerxs[qindex] = $(this).find("input.input_txt").val();
					}else if($(this).find(".each-ques-crf").attr("anstype") == 14){
						answerxs[qindex] = $(this).find("input.input_txt").val();
					}
					qindex++;
				}
			});
		}
	});
	
	
	$.post("auditTrail.pat?patientVisitId="+$("#patient_visit_id").val()+"&patientid="+$("#patientid").val()+"&dataArray="+answerxs+"&studyid="+$("#studyid").val()+"&siteid="+$("#siteid").val()+"&patientCrf="+$("#idOfPCRT").val(),
			   function(data) {
				return true;
				
			}
			   
		);
	return true;
}
function loadAuditAndDiscripencies(link){
	 $("#fbodyoDisc").find("tr").hide();
	 $("#fbodyoDisc").find("tr").each(function(){
			if(link.parents("tr").attr("id") == $(this).attr("pcrfId")){
				$(this).show();
			}
		
		});
	 $("#fbodyoDiscAudit").find("tr").hide();
	 $("#fbodyoDiscAudit").find("tr").each(function(){
			if(link.parents("tr").attr("id") == $(this).attr("pcrfId")){
				$(this).show();
			}
		
		});
}

function ReplaceAll(Source,stringToFind,stringToReplace){

	  var temp = Source;

	    var index = temp.indexOf(stringToFind);

	        while(index != -1){

	            temp = temp.replace(stringToFind,stringToReplace);

	            index = temp.indexOf(stringToFind);

	        }

	        return temp;

	}

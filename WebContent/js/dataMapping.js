$(document).ready(function() {

		$(".main_btn3").click(function() {
			var div=$("#db_div").clone();
			$("#popupdiv").html(div);
			$("#popupdiv").dialog({
				resizable : true,
				height : 'auto',
				width : 'auto',
				modal : true,

			});
			$(div).show();
		});
		
		$(".main_btn2").click(function() {
			var div=$("#ws_div").clone();
			$("#popupdiv").html(div);
			$("#popupdiv").dialog({
				resizable : true,
				height : 'auto',
				width : 'auto',
				modal : true,

			});
			$(div).show();
		});
		
		$(".main_btn1").click(function() {
			var div=$("#ex_div").clone();
			$("#popupdiv").html(div);
			$("#popupdiv").dialog({
				resizable : true,
				height : 'auto',
				width : 'auto',
				modal : true,

			});
			$(div).show();
		});
		
		
		$("#submit").live("click",function(){
		//	alert("123456");
			var div=$("#table_img").clone();
			$("#popupdiv").html(div);
			$("#popupdiv").dialog({
				resizable : true,
				height : 'auto',
				width : 'auto',
				modal : true,

			});
			$(div).show();
		});
	});
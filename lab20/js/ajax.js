$("#userInput").keyup(function()
	{
		$.ajax({
			url: "controller.php",
			data:{
				pattern: $("input#userInput").val()
			},
			success: function( result)
			{
				$("#ajaxResponse").html(result);
			}
		}
		);
	});
$("#ajaxResponse").change(function()
	{
		$("input#userInput").val($("#ajaxResponse select option:selected").val());

		$("#ajaxResponse").html("");
		$("input#userInput").focus();
	}
);


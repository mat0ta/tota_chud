window.addEventListener('message', function(e) {
	$("#container").stop(false, true);
    if (e.data.displayWindow == 'true') {
        $("#container").css('display', 'flex');
  		
        $("#container").animate({
        	bottom: "25%",
        	opacity: "1.0"
        	},
        	700, function() {

		});
		$('#container').css('border', '4px #FF0000 solid');
		$(".blink-image").css('animation', 'blink normal 1s infinite ease-in-out' );

    } else {
		$('#container').css('border', '4px #FFFFFF solid');		
		$("#container").css('display', 'flex');
		$(".blink-image").css('animation', 'none');
	}
	
	if (e.data.displayWindow == 'false') {
		$('#container').css('border', '4px #00FF0C solid');	
		$("#container").css('display', 'none');
	}

	if (e.data.displayWindow == 'green') {
		$('#container').css('border', '4px rgb(103, 235, 98) solid');	
		$("#container").css('display', 'flex');
	}
});
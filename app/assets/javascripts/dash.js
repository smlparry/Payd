$(document).ready(function(){
	$('.flash_notice').on('click', '.dismiss-notice', function(event){
		$(event.target.parentElement.parentElement.parentElement).remove();
	});

	
});
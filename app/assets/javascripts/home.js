$(document).on('page:load ready', function() {
	
	if ($('.alert').text() && $('.notice').text() == "") {
		$('#flashes').hide();
	} else if ( $('.alert').text() == "" ) {
		$('.alert').hide();
	} else if ($('.notice').text() == "" ) {
		$('.notice').hide();
	};
});
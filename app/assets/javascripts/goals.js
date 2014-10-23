 $(document).on('page:load ready', function() {
    $('.field-hide').hide();
    metricsShow();

    function metricsShow() {
		$( "input[type=checkbox]" ).one( "click", function(){
			$('.field-hide').show();
			metricsHide();

		} );
    }

    function metricsHide() {
    	$( "input[type=checkbox]" ).one( "click", function(){
    			$('.field-hide').hide();
    			metricsShow();
    	});
    }
  });

 
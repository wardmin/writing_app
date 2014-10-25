 $(document).on('page:load ready', function() {
    $('.goal-field-hide').hide();
    metricsShow();

    function metricsShow() {
		$( "input[type=checkbox]" ).one( "click", function(){
			$('.goal-field-hide').show();
			metricsHide();

		} );
    }

    function metricsHide() {
    	$( "input[type=checkbox]" ).one( "click", function(){
    			$('.goal-field-hide').hide();
    			metricsShow();
    	});
    }
  });


// $(document).on('page:load ready', function() {
//      $('.calendar-link').on('click', function(event) {
//         var self = $(this);
//         event.preventDefault();
//         $.ajax({
//             type: 'GET',
//             dataType: 'script',
//             url: self.attr('href')
//         }).done(function() {
//             $('#entries-view').html("<%= escape_javascript(render :partial => 'calendar') %>");
//         });
//     });
//  });

$(document).on('page:load ready', function() {
      
                if ( $('#goal_goal_type_id').val() == 6) {
                    $('#conditional-draft-number').show();     
                }



        $('#goal_goal_type_id').change(function() {
                var selectedValue = $(this).val();
                if (selectedValue != '6') {
                    $('#conditional-draft-number').hide();
                } else {
                    $('#conditional-draft-number').show();
                }
            }); 
    });
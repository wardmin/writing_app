// Ajax anyone?
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
    // on page load.
    // displaying conditional draft number field.
    if ( $('#goal_goal_type_id').val() == 6) {
        $('#conditional-draft-number').show();     
    }

    // checking check box depending on drop down set to none / 6
    // and showing the metric name field depending on value.
    if ( $('#goal_metric_id').val() == 6 ) {
        $('#metric_check').prop('checked', false);
        $('.goal-field-hide').hide();
    } else if ( $('#goal_metric_id').val() != 5 )  {
        $('#goal_metric_name').hide();
        $('#metric_check').prop('checked', true);
    } else {
        $('#metric_check').prop('checked', true);
    }

    // On click.
    // display or hide metrics field with 

    // functions for event toggling
    function checkClick() {
        $('#metric_check').off();
        $('#metric_check').one('click', function() {
            $('.goal-field-hide').show();
            if ( $('#goal_metric_id').val() == '6') {
                if ($('#goal_metric_name').val() != '') {
                    $('#goal_metric_id').val('5');
                    $('#goal_metric_name').show();
                } else {
                    $('#goal_metric_id').val('2');
                    $('#goal_metric_name').hide();
                } 
            }
            checkUnclick()
        });
    }
    function checkUnclick() {
        $('#metric_check').off();
        $('#metric_check').one('click', function() {
            $('.goal-field-hide').hide();
            $('#goal_metric_id').val('6');
            checkClick()
        });
    }
    // initial page load or refresh check to see what handler to apply
    if ( $('#metric_check').prop('checked') ) {
        checkUnclick();
    } else {
        checkClick();
    };
    
    // on change.
    // display field for draft number.
    $('#goal_goal_type_id').change(function() {
            var selectedValue = $(this).val();
            if (selectedValue != '6') {
                $('#conditional-draft-number').hide();
            } else {
                $('#conditional-draft-number').show();
            }
        }); 
    // display field for other metric type.
     $('#goal_metric_id').change(function() {
        var selectedValue = $(this).val();
        if (selectedValue == '5') {
            $('#goal_metric_name').show();
        } else if (selectedValue == '6') {
            $('#metric_check').prop('checked', false);
            $('.goal-field-hide').hide();
            $('#metric_check').off();
            checkClick();
        } else {
            $('#goal_metric_name').hide();
        }
     });


   
});
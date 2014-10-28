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
    if ( $('#goal_goal_type_id').val() == 4) { //changed
        $('#conditional-draft-number').show();     
    }

    // checking check box depending on drop down set to none / 6
    // and showing the metric name field depending on value.
    if ( $('#goal_metric_id').val() == 5 ) { // changed
        $('#metric_check').prop('checked', false);
        $('.goal-field-hide').hide();
    } else if ( $('#goal_metric_id').val() != 4 )  { // changed
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
            if ( $('#goal_metric_id').val() == '5') { // changed
                if ($('#goal_metric_name').val() != '') {
                    $('#goal_metric_id').val('4'); // changed
                    $('#goal_metric_name').show();
                } else {
                    $('#goal_metric_id').val('1');
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
            $('#goal_metric_id').val('5'); // changed
            checkClick()
        });
    }
    // initial page load or refresh check to see what handler to apply
    if ( $('#metric_check').prop('checked') ) {
        checkUnclick();
    } else {
        checkClick();
    };
    

    // form 6 to 5 = none // other = from 5 to 4 
    // on change.
    // display field for draft number.
    $('#goal_goal_type_id').change(function() {
            var selectedValue = $(this).val();
            if (selectedValue != '4') { // changed
                $('#conditional-draft-number').hide();
            } else {
                $('#conditional-draft-number').show();
            }
        }); 
    // display field for other metric type.
     $('#goal_metric_id').change(function() {
        var selectedValue = $(this).val();
        if (selectedValue == '4') { // changed
            $('#goal_metric_name').show();
        } else if (selectedValue == '5') { // changed
            $('#metric_check').prop('checked', false);
            $('.goal-field-hide').hide();
            $('#metric_check').off();
            checkClick();
        } else {
            $('#goal_metric_name').hide();
        }
     });

    // BUTTON GROUP - CAL / LIST VIEW
    // Makes the button group work as the user expects.
    // i.e. when they click the surrounding area they are 
    // aslo clicking the button.
    $('.button-group-item').on('click', function() { 
        var self = $(this);
        self.children()[0].click();
    });
    $('.button-group-item').children().on('click', function(){
        var self = $(this);
        self.parent()[0].click();
    })
   
});
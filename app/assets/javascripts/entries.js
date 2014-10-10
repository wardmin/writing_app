$(document).on('page:load ready', function() {
	var clock = $('.clock').FlipClock({
		autoStart: true,
		clearExcessDigits: true,

	});

	$('.clock').click(function(event){
		event.preventDefault();
		// Stops the clock from resetting on click.
	});


	//  Play / Pause Button toggle functionality.
	function pause(){
		$('.pause').one('click', function(){
			$('.clock').off('mouseenter mouseleave');
			$("button[name|='playpause']").text('Resume');
			showClock();
			clock.stop(function(){
				startAgain();
			});

		});
	}

	function startAgain(){
		$('.pause').one('click', function(){
			$("button[name|='playpause']").text('Pause');
			fadeClock();
			attachHandlers();
			clock.start(function(){
				pause();
			});
		});
	}
	$('.pause').on('click', pause() );
	
	// Clock fade toggle functionality. 
	$('.clock')
		.fadeTo(10000, 0.03, attachHandlers() );
	
	function fadeClock() {
		$('.clock').stop();
		$('.clock').fadeTo(5000, 0.03 );
	}
	function showClock() {
		$('.clock').stop();
		$('.clock').fadeTo('slow', 0.9 );
	}
	function attachHandlers() {
		$('.clock')
		.mouseenter(function() {
			showClock();
		})
		.mouseleave(function() {
			fadeClock();
		});
	}

	// Save final time to form on completion.
	$('input').last().on('click', function() {
		var time = clock.getTime();
		$('#entry_duration').attr('value', time);
	})
});
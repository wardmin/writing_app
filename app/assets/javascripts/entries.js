$(document).on('page:load ready', function() {
	var clock = $('.clock').FlipClock({
		clockFace: 'WriteTrack'
	});
	
	var writetrack = $('.secondhand').FlipClock( {
		clockFace: 'SecondHand',
		autoStart: true
	});



	$('.clock, .secondhand').click(function(event){
		event.preventDefault();
		// Stops the clock from resetting on click.
	});


	//  Play / Pause Button toggle functionality.
	function pause(){
		$('.pause').one('click', function(){
			$('.clock, .secondhand').off('mouseenter mouseleave');
			$("button[name|='playpause']").text('Resume');
			showClock();
			clock.stop(function(){
				startAgain();
			});
			writetrack.stop()
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
			writetrack.start();
		});
	}
	$('.pause').on('click', pause() );
	
	// Clock fade toggle functionality. 
	$('.clock, .secondhand')
		.fadeTo(10000, 0.2, attachHandlers() );
	
	function fadeClock() {
		$('.clock, .secondhand').stop();
		$('.clock, .secondhand').fadeTo(5000, 0.2 );
	}
	function showClock() {
		$('.clock, .secondhand').stop();
		$('.clock, .secondhand').fadeTo('slow', 0.9 );
	}
	function attachHandlers() {
		$('.clock, .secondhand')
		.mouseenter(function() {
			showClock();
		})
		.mouseleave(function() {
			fadeClock();
		});
	}

	// Save final time to form on completion.
	$('.timer').last().on('click', function() {
		var time = clock.getTime();
		$('#entry_duration').attr('value', time);
	})
});

$(document).on('page:load ready', function() {
	$('.calendar-entry').parent().css( "background-color", "tomato" );
	$('.prev-month, .next-month').css( "background-color", "lavender");
});
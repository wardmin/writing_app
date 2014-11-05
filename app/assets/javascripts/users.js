
// $(document).ready(function() {
// /* Activating Best In Place */
// jQuery(".best_in_place").best_in_place()
// });

// $('.best_in_place').bind("ajax:success", function () {$(this).closest('tr').effect('highlight'); });
$(document).on('page:load ready', function() {
	$('#user_tag_list').tagsInput();

	$('.calendar-entry').parent().parent().addClass('entry-date tooltip-item');
 	$('.calendar-entry').on('click', function() {
 	var self = $(this);
 	self.children()[0].click();
 	});
	 $('.prev-month, .next-month').addClass('old-month');

	 
	

	var options = [{
    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
    scaleBeginAtZero : true,

    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : true,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 1,

    //Boolean - If there is a stroke on each bar
    barShowStroke : true,

    //Number - Pixel width of the bar stroke
    barStrokeWidth : 2,

    //Number - Spacing between each of the X value sets
    barValueSpacing : 5,

    //Number - Spacing between data sets within X values
    barDatasetSpacing : 1,

    //String - A legend template
    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

}];

});


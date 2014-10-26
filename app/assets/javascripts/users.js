
// $(document).ready(function() {
// /* Activating Best In Place */
// jQuery(".best_in_place").best_in_place()
// });

// $('.best_in_place').bind("ajax:success", function () {$(this).closest('tr').effect('highlight'); });
$(document).on('page:load ready', function() {
	$('#user_tag_list').tagsInput();
});

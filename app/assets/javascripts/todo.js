// hack to avoid multiple call most likely called by multiple jquery inclusion

var global_counter = 0;
var global_counter1 = 0;

$(function (){

 	$('.new_date').datepicker({ dateFormat: 'd MM yy' });

 	if ((global_counter % 2 == 0)) {
 		global_counter = global_counter + 1;
		$('#addNewThing').click(function() {
			$('#new_thing').toggle('slow', function() {
		    // Animation complete.
		  });
		});
	}

 	if ((global_counter1 % 2 == 0)) {
 		global_counter1 = global_counter1 + 1;
		$('.editThing').click(function() {
			$('.edit_thing').toggle('slow', function() {
		    // Animation complete.
		  });
		});
	 }
});


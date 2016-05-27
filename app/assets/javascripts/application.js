// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $('#say_hello').click(function(){
    alert('Hello button clicked!');
  });

  $('#recent_activity_button').click(function(){
  		// alert('recent button clicked!');

  		if($('#recent_activity_list').is(':hidden')){
  			$('#recent_activity_list').removeClass('hide')
     	}

     	if($('#view_items_list').is(':hidden')){

     	} else {
     		$('#view_items_list').addClass('hide');
     	}

     	Materialize.showStaggeredList('#staggered-recent')

	});

	$('#view_items_button').click(function(){

			if($('#view_items_list').is(':hidden')){
  			$('#view_items_list').removeClass('hide')
     	}
 			

     	if($('#recent_activity_list').is(':hidden')){
     	} else {
     		$('#recent_activity_list').addClass('hide');
     	}

     	Materialize.showStaggeredList('#staggered-items')

	});

 
    

});

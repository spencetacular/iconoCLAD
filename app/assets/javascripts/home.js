$(document).ready(function(){

  console.log("called");

  // $('.alert').show(function() {
  //    setTimeout((function() {
  //       $('.alert').slideToggle();
  //   }), 300);
  // });


  $('.recent_activity_button').click(function(){
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

	$('.view_items_button').click(function(){

			if($('#view_items_list').is(':hidden')){
  			$('#view_items_list').removeClass('hide')
     	}
 			

     	if($('#recent_activity_list').is(':hidden')){
     	} else {
     		$('#recent_activity_list').addClass('hide');
     	}

     	Materialize.showStaggeredList('#staggered-items')

	});

 
    $('.recent_activity_button').trigger('click');

     $(".button-collapse").sideNav();

});
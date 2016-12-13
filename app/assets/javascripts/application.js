// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/tab
//= require bootstrap/transition
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .



$(window).scroll(function() {
		if ($(document).scrollTop() > 50)
		 {
				$('.navbar-collapse').collapse('hide');
		 }
 });


$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('nav').addClass('shrink');
  } else {
    $('nav').removeClass('shrink');
  }
});

$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('a').addClass('shrink');
  } else {
    $('a').removeClass('shrink');
  }
});

$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('img').addClass('shrink');
  } else {
    $('img').removeClass('shrink');
  }
});

$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('button').addClass('shrink');
  } else {
    $('button').removeClass('shrink');
  }
});

$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('div').addClass('shrink');
  } else {
    $('div').removeClass('shrink');
  }
});

$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('collapse').addClass('shrink');
  } else {
    $('collapse').removeClass('shrink');
  }
});


$('.carousel').carousel({
	interval: 20000
})


//notifications
$(document).on("turbolinks:load", function()
	{
		$("#notificationLink").click(function()
			{
				$("#notificationContainer").fadeToggle(300);
				$("#notification_count").fadeOut("slow");
				function scrollbar(){
					var parH = $('.parent').outerHeight(true);
					var areaH = $('.scrollable').outerHeight(true);
					var scrH = parH / (areaH/parH);

					function dragging(){
					var scrPos = $('.scrollbar').position().top;
					$('.scrollable').css({top: -(scrPos*(areaH/parH)-1)});
					}



					$('.scrollbar').height(scrH);
					$('.scrollbar').draggable({
					axis: 'y',
					containment: 'parent',
					drag: function() {
					dragging()
					}

					});

				};//]]>


				return false;
			});

//Document Click hiding the popup
		$(document).click(function()
			{
				$("#notificationContainer").hide();
			});

//Popup on click
		$("#notificationContainer").click(function()
			{
				e.stopPropagation();
			});

			});


//Alert changes fade in and out

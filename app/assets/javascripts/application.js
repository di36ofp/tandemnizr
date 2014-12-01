// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

var ready;
ready = function() {

  $(document).foundation({
    orbit: {
      animation: 'fade',
      timer_speed: 3500,
      pause_on_hover: false,
      next_on_click: true,
      container_class: 'orbit-wrapper',
      animation_speed: 500,
      navigation_arrows: false,
      bullets: true,
      slide_number: false,
      timer: false
    }
  });

  $( window ).scroll( function( scrollPosition ) {

    var pos = scrollPosition.currentTarget.pageYOffset;
    var limitTopBar = $( '.top-bar' ).height();
    var limitOrbit = $( '.orbit-bullets' ).position().top - limitTopBar;

    if( pos > limitTopBar && pos < limitOrbit ){
      $( '.contain-to-grid' ).addClass( 'smoked-top-bar' ).removeClass( 'white-top-bar' );
    }else if( pos > limitOrbit ){
      $( '.contain-to-grid' ).removeClass( 'smoked-top-bar').addClass( 'white-top-bar' );
    }else{
      $( '.contain-to-grid' ).removeClass( 'smoked-top-bar white-top-bar' );
    }

  });

  $("#orbit").on("ready.fndtn.orbit", function animateHexagon() {
    $( '.hexagon' ).addClass("hidden").viewportChecker({
            classToAdd: 'animated rubberBand',
            offset: 100
    });
  });


};

$(document).ready(ready);
$(document).on( 'page:load', ready);
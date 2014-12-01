function initOrbit () {

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
    },
    topbar: {
      scrolltop: true,
    }
  });
};

function initScroll ( scrollPosition ) {
  var pos = scrollPosition.currentTarget.pageYOffset;
  var limitTopBar = ( $( '.top-bar' ).length > 0 ) ?  $( '.top-bar' ).height() : 0;
  var limitOrbit = ( $( '.orbit-bullets' ).length > 0 ) ? $( '.orbit-bullets' ).position().top - limitTopBar : 0;

  if( pos > limitTopBar && pos < limitOrbit ){
    $( '.contain-to-grid' ).addClass( 'smoked-top-bar' ).removeClass( 'white-top-bar' );
  }else if( pos > limitOrbit ){
    $( '.contain-to-grid' ).removeClass( 'smoked-top-bar').addClass( 'white-top-bar' );
  }else{
    $( '.contain-to-grid' ).removeClass( 'smoked-top-bar white-top-bar' );
  }

}

function initHexagon() {
  $("#orbit").on("ready.fndtn.orbit", function animateHexagon() {
    $( '.hexagon' ).addClass("hidden").viewportChecker({
            classToAdd: 'animated rubberBand',
            offset: 100
    });
  });
 }

$( document ).ready( function () {

  var orbit = document.getElementsByClassName( 'orbit-container' );
  if ( orbit.length > 0 ) $( '.orbit-container' ).load( initOrbit() );

  var hexagon = document.getElementsByClassName( 'hexagon' );
  if ( hexagon.length > 0 ) $( '.hexagon' ).load( initHexagon() );

  $( window ).scroll( function ( scrollPosition ) { initScroll ( scrollPosition ) });
});
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
  var hexagon = document.getElementsByClassName( 'hexagon' );
  if ( hexagon.length > 0 ) $( '.hexagon' ).load( initHexagon() );

  $( window ).scroll( function ( scrollPosition ) { initScroll ( scrollPosition ) });
});
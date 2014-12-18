if( $( '#map-canvas' ).length > 0 ) {

  var map = $( '#map-canvas'),
      centerPlace,
      pos_lat,
      pos_long,
      tandem_map = 'custom_style';

    var nEnd,
        nStart = window.performance.now(),
        oDocumentFragment = document.createDocumentFragment(),
        oList = $( '.place_list' );

  google.maps.event.addDomListener(window, 'load', geolocate);
  $( '.place_list li a' ).click( function(){
    setPlace( $( this).text());
    return false;
  });

  function geolocate(){
    navigator.geolocation.getCurrentPosition(currentPosition, defaultCity);
  }

  function currentPosition(pos){
    pos_lat = pos.coords.latitude;
    pos_long = pos.coords.longitude;
    centerPlace = new google.maps.LatLng(pos_lat, pos_long);
    initialize();
  }

  function defaultCity(error_locating){
    pos_lat = 41.395603613998205;
    pos_long = 41.395603613998205;
    centerPlace = new google.maps.LatLng(pos_lat, pos_long);
    //TODO print message for relative goolge position
    initialize();
  }

  function initialize() {

    var featureOpts = [
      {
        featureType: 'water',
        stylers: [
          { color: '#9ECEB4' }
        ]
      }
    ];
    var styledMapOptions = {
      name: 'Custom Style'
    };
    var mapOptions = {
      zoom: 15,
      center: centerPlace,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, tandem_map]
      },
      mapTypeId: tandem_map
    };
    var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    map.mapTypes.set(tandem_map, customMapType);

    loadMarkers();
  }

  function loadMarkers() {
    $.ajax({
      type:'POST',
      dataType: 'json',
      url: '/places',
      data: { latitude: pos_lat, longitude: pos_long }
    }).success(function(data){
      $.each(data.places, function(index, place){
        addMarker(place);
      });
    }).error(function(data){
    //TODO display message on error
    });
  }

  function addMarker ( place ) {
    var bar = new google.maps.LatLng(place.lat, place.lng);
    var image = 'https://dl.dropboxusercontent.com/u/79814994/cdn/location-icon.png';
    var marker = new google.maps.Marker({
        position: bar,
        map: map,
        icon: image,
        animation: google.maps.Animation.DROP,
        title: place.name
    });

    addPlaceToList( place.name );
    google.maps.event.addListener( marker, 'click', function (){
      setPlace(place.name);
    });
  }
  function addPlaceToList( coffee ){
    var oCoffee = '<li><span class="label secondary tiny"><a href="#">' + coffee + '</span></li>';
    $( oCoffee ).appendTo(oList);
  }

  function setPlace( name ) {
    $('#tandem_place').val( name );
  }
}
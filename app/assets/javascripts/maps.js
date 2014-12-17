if( $( '#map-canvas' ).length > 0 ) {

  var map = $( '#map-canvas');
  var place,
      pos_lat,
      pos_long,
      MY_MAPTYPE_ID = 'custom_style';

  google.maps.event.addDomListener(window, 'load', geolocate);

  function geolocate(){
    debugger;
    navigator.geolocation.getCurrentPosition(currentPosition, defaultCity);
  }

  function currentPosition(pos){
    pos_lat = pos.coords.latitude;
    pos_long = pos.coords.longitude;
    place = new google.maps.LatLng(pos_lat, pos_long);
    initialize();
  }

  function defaultCity(error_locating){
    pos_lat = 41.395603613998205;
    pos_long = 41.395603613998205;
    place = new google.maps.LatLng(pos_lat, pos_long);
  }

  function initialize() {

    var featureOpts = [
      {
        elementType: 'labels',
        stylers: [
          { "visibility": "on" }
        ]
      },
      {
        featureType: 'water',
        stylers: [
          { color: '#9ECEB4' }
        ]
      }
    ];

    var mapOptions = {
      zoom: 15,
      center: place,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
      },
      mapTypeId: MY_MAPTYPE_ID
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    // var image = 'https://dl.dropboxusercontent.com/u/79814994/cdn.images/logo_hotel_map.png';
    // var hotelMarker = new google.maps.Marker({
    //     position: barcelona,
    //     map: map,
    //     icon: image
    // });

    var styledMapOptions = {
      name: 'Custom Style'
    };

    var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

    map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

    loadMarkers();
    $('.place_list li a').on('click', setPlace($(this).text()), false);
  }

  function loadMarkers() {
    $.ajax({url: '/places', dataType: 'json'}).success(function(data){
      $.each(data.places, function(index, place){
        addMarker(place);
      });
    });
  }

  function addMarker ( place ) {
    var bar = new google.maps.LatLng(place.lat, place.lng);
    var marker = new google.maps.Marker({
        position: bar,
        map: map,
        title: place.name
    });

    google.maps.event.addListener( marker, 'click', function (){
      setPlace(place.name);
    });
  }

  function setPlace( name ) {
    $('#tandem_place').val( name );
  }
}
var map;
var barcelona = new google.maps.LatLng(41.395603613998205, 2.157095799999979);

var MY_MAPTYPE_ID = 'custom_style';

function initialize() {

  var featureOpts = [
    {
      elementType: 'labels',
      stylers: [
        { "visibility": "off" }
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
    center: barcelona,
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
    },
    mapTypeId: MY_MAPTYPE_ID
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

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
}

google.maps.event.addDomListener(window, 'load', initialize);

//////////////////////////////////////////
var map = document.getElementById('map-canvas');

function loadMarkers() {
debugger;
  var http_request = new XMLHttpRequest();
      http_host = window.location.origin,
      http_request.open("GET", http_host + "/places.json", true);

  http_request.onreadystatechange = function () {
    var done = 4, ok = 200;
    if (http_request.readyState === done && http_request.status === ok) {
        var places = JSON.parse(http_request.responseText);
        for(var i = 0; i <= places.lenght -1; i++) addMarker( places )
    }
  };

  http_request.send(null)


}

function addMarker ( place ) {
  console.log(place.name);
  var bar = new google.maps.LatLng(place.lat, place.lng);

  var barMarker = new google.maps.Marker({
      position: bar,
      map: map,
      title: place.name
  });

}

if (map.addEventListener) {
  window.addEventListener('load', loadMarkers, false);
} else if (map.attachEvent) {
  window.attachEvent('load', loadMarkers);
}

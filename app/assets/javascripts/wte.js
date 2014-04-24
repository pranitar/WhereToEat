$(document).ready(function(){


  /*var mapOptions = {
              center: new google.maps.LatLng(40.442729, -79.942537),
              zoom: 16,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
  
  var center = null;
  var bounds;

	function initialize() {
            console.log(document.getElementById("map-canvas"));
            window.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
            bounds = new google.maps.LatLngBounds();
            center = bounds.getCenter();
          }

    google.maps.event.addDomListener(window, 'load', initialize);

    

    $(document).on( 'shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
        console.log(map.getCenter()) 
        google.maps.event.trigger(map, 'resize');
        lastCenter=map.getCenter();
        map.setCenter(lastCenter);
        map.fitBounds(bounds);
    })
   */
   

var settingsItemsMap = {
    zoom: 16,
    center: new google.maps.LatLng(40.442729, -79.942537),
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.LARGE
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById('map-canvas'), settingsItemsMap );

var myMarker = new google.maps.Marker({
    position: new google.maps.LatLng(40.442729, -79.942537),
    draggable: true
});

map.setCenter(myMarker.position);
myMarker.setMap(map);

$(document).on( 'shown.bs.tab', 'a[data-number="2"]', function (e) {
        console.log($('#map-canvas')); 
        $('#map-canvas').css("visibility","visible");
        google.maps.event.trigger(map, 'resize');
    })
$(document).on( 'shown.bs.tab', 'a[data-number="1"]', function (e) {
        $('#map-canvas').css("visibility","hidden");
    })
});

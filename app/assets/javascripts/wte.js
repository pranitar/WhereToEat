$(document).ready(function(){


  var mapOptions = {
              center: new google.maps.LatLng(40.442745, -79.942553),
              zoom: 15,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

	function initialize() {
            console.log(document.getElementById("map-canvas"));
            $("#map-canvas").css("top", "0px");
            google.maps.event.trigger(map, 'resize');
          }

    google.maps.event.addDomListener(window, 'load', initialize);
    
  
    map.updateSize();
    map.set_zoom(map.get_zoom()); 


    google.maps.event.trigger(map, 'resize');
});





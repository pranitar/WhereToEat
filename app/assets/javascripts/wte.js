$(document).ready(function(){

var settingsItemsMap = {
    zoom: 15,
    center: new google.maps.LatLng(40.442729, -79.942537),
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.LARGE
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById('map-canvas'), settingsItemsMap );
var isOpen = true;
var markerColor = '#DD4814';
if (!isOpen) {
  markerColor = '#CCCCCC';
}

var timeAgo;

console.log("markerColor "+markerColor);

$.getJSON('users.json', function(data){
  $.each( data, function( key, val ) {
    var marker = new google.maps.Marker({
    position: new google.maps.LatLng(val.latitude, val.longitude),
    draggable: false,
    bounds: true,
    icon: {
            path: "M768 896q0 106 -75 181t-181 75t-181 -75t-75 -181t75 -181t181 -75t181 75t75 181zM1024 896q0 -109 -33 -179l-364 -774q-16 -33 -47.5 -52t-67.5 -19t-67.5 19t-46.5 52l-365 774q-33 70 -33 179q0 212 150 362t362 150t362 -150t150 -362z",
            scale: 0.02,
            strokeColor: '#ffffff',
            strokeWeight: 1,
            fillColor: '#00BFFF',
            fillOpacity: 1,
            rotation: 180
        }
    });

    marker.setMap(map);
   // map.setCenter(marker.position);
    google.maps.event.addListener(marker, 'click', function() {
      var contentwindow = $("<a>").attr("href", "/users/"+val.id)

      var content = $("<span>").addClass("popup").html(val.name + " - ")
      var timeago = $("<abbr>").addClass("timeago").attr("title", jQuery.timeago(val.location_updated_at)).html(jQuery.timeago(val.location_updated_at))
      content.append(timeago)
      contentwindow.append(content)
      console.log(jQuery.timeago(val.location_updated_at))
      // var contentwindow = "<a href='/user/"+val.id+ "><span class='popup'> " +val.name + " " + "shared their location "+ "<abbr class='timeago' title='"+ val.location_updated_at + "></abbr>" + "</span></a>";
      infowindow = new google.maps.InfoWindow({
          content: $('<div>').append($(contentwindow).clone()).html()
       });
      infowindow.open(map, marker);
      //console.log("Here "+contentwindow);
    });

  });
});

$.getJSON( 'restaurants.json', function( data ) {
  $.each( data, function( key, val ) {
    var marker = new google.maps.Marker({
    position: new google.maps.LatLng(val.latitude, val.longitude),
    draggable: false,
    bounds: true,
    icon: {
            path: "M768 896q0 106 -75 181t-181 75t-181 -75t-75 -181t75 -181t181 -75t181 75t75 181zM1024 896q0 -109 -33 -179l-364 -774q-16 -33 -47.5 -52t-67.5 -19t-67.5 19t-46.5 52l-365 774q-33 70 -33 179q0 212 150 362t362 150t362 -150t150 -362z",
            scale: 0.02,
            strokeColor: '#ffffff',
            strokeWeight: 1,
            fillColor: markerColor,
            fillOpacity: 1,
            rotation: 180
        }
    });

    marker.setMap(map);
   // map.setCenter(marker.position);
    google.maps.event.addListener(marker, 'click', function() {
      var contentwindow = "<a href='/restaurants/"+val.id+"<span class='popup'> " +val.name+"</span></a>";

      infowindow = new google.maps.InfoWindow({
          content: contentwindow
       });

      infowindow.open(map, marker);
      console.log("Here "+contentwindow);
    });

  });

});

$(document).on( 'shown.bs.tab', 'a[data-number="2"]', function (e) {
        console.log($('#map-canvas'));
        $('#map-canvas').css("visibility","visible");
        google.maps.event.trigger(map, 'resize');
    })
$(document).on( 'shown.bs.tab', 'a[data-number="1"]', function (e) {
        $('#map-canvas').css("visibility","hidden");
    })
$(document).on( 'shown.bs.tab', 'a[data-number="3"]', function (e) {
        $('#map-canvas').css("visibility","hidden");
    })
});

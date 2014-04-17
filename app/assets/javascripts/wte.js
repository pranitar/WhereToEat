(function(window) {

	$("#map_icon").on("click", mapicon_onclick);
	var toggle = 0 ;

	function mapicon_onclick() {

		if (toggle == 0) {
			$("#map-canvas").css("top", "-1000px");
            toggle = 1;

		}
		else {
			 $("#map-canvas").css("top", "52px");
            toggle = 0;

		}
	}
	function initialize() {
            var mapOptions = {
              center: new google.maps.LatLng(40.442745, -79.942553),
              zoom: 15,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
            console.log(document.getElementById("map-canvas"));
            $("#map-canvas").css("top", "-1000px");
            toggle = 1;
          }
    google.maps.event.addDomListener(window, 'load', initialize);

  $('body').on('click', '.btn-group button', function (e) {
  	if ($(this).hasClass( "active" )) {
		$(this).removeClass('active');
		$(this).css('background-color', "#aea79f");
		$(this).css('border-color', "#aea79f");
		$(this).css('box-shadow', "none");

  	}
  	else {
  		$(this).addClass('active');	
  		$(this).css('background-color', "#8e8983");
		$(this).css('border-color', "#8e8983");
		$(this).css('box-shadow', "none");
  	}
    

});

})(window);





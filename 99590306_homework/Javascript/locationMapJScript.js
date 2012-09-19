var map;
var geocoder;
var marker;
var latLabel;
var lngLabel;

function onPageLoad() {
    var centerLatLng = new google.maps.LatLng(25.0419, 121.5353);
    var text = document.getElementById("addressTextBox").innerText = "";
    latLabel = document.getElementById("latLabel");
    lngLabel = document.getElementById("lngLabel");
    latLabel.innerText = centerLatLng.lat();
    lngLabel.innerText = centerLatLng.lng();

    initialmap(centerLatLng);

    geocoder = new google.maps.Geocoder();
}

function initialmap(centerLatLng) {
    var mapOptions = {
        zoom: 15,
        center: centerLatLng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}


function codeAddress() {
    var address = document.getElementById("addressTextBox").value;
    var request = { 'address': address };
    if (address != "") {
        geocoder.geocode(request, showMarker);
    }
}


function showMarker(results, status) {

    if (status == google.maps.GeocoderStatus.OK) {

        var location = results[0].geometry.location;

        map.setCenter(location);

        latLabel.innerText = location.lat();
        lngLabel.innerText = location.lng();

        var markerOptions = {
            position: location,
            map: map,
            draggable: true
        };

        marker = new google.maps.Marker(markerOptions);

        google.maps.event.addListener(marker, 'dragstart', clearLocation);
        google.maps.event.addListener(marker, 'dragend', showLocation);
    }
    else {
        alert('無效地址!');
    }
}


function clearLocation(event) {
    latLabel.innerText = "";
    lngLabel.innerText = "";
}


function showLocation(event) {
    latLabel.innerText = event.latLng.lat();
    lngLabel.innerText = event.latLng.lng();
}

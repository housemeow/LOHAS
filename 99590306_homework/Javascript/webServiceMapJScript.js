var map;
var centerLatLng;

function onPageLoad() {
    var mapOptions = {
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false
    };
    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
    var pid;
    var placeRadioButtonListItems = document.getElementById("placeRadioButtonList").getElementsByTagName("input");

    for (var i = 0; i < placeRadioButtonListItems.length; i++) {
        if (placeRadioButtonListItems[i].checked) {
            pid = placeRadioButtonListItems[i].value;
            break;
        }
    }
    LocationWebService.getLocationData(pid, showGoogleMap);
}
function placeRadioButtonList_onclick(pid) {
    LocationWebService.getLocationData(pid, showGoogleMap);
}


function showGoogleMap(location) {
    centerLatLng = new google.maps.LatLng(location.latitude, location.longitude);
    map.setCenter(centerLatLng);
}
var streetView;
var streetViewService;
var centerLatLng;
var panoramaOptions;

function onPageLoad() {
    panoramaOptions = {
        position: centerLatLng,
        pov: {
            heading: 0,
            pitch: 0,
            zoom: 1
        },
        panControl: false,
        zoomControl: false,
        addressControl: false
    };
    streetView = new google.maps.StreetViewPanorama(document.getElementById("streetViewCanvas"), panoramaOptions);
    streetViewService = new google.maps.StreetViewService();
    var pid;
    var placeRadioButtonListItems = document.getElementById("placeRadioButtonList").getElementsByTagName("input");
    for (var i = 0; i < placeRadioButtonListItems.length; i++) {
        if (placeRadioButtonListItems[i].checked) {
            pid = placeRadioButtonListItems[i].value;
            break;
        }
    }
    LocationWebService.getLocationData(pid, getStreetViewPano);
}


function placeRadioButtonList_onclick(pid) {
    LocationWebService.getLocationData(pid, getStreetViewPano);
}


function getStreetViewPano(location) {
    centerLatLng = new google.maps.LatLng(location.latitude, location.longitude);
    streetViewService.getPanoramaByLocation(centerLatLng, 100, showStreetView);
}


function showStreetView(data, status) {
    if (status == google.maps.StreetViewStatus.OK) {
        streetView.setPano(data.location.pano);
        streetView.setPov(panoramaOptions.pov);
    }
    else {
        alert('抱歉!此處無街景服務');
    }
}
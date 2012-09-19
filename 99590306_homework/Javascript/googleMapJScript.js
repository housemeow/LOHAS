var map;
var centerLatLng;
var streetView;
var streetViewService;
var centerLatLng;
var panoramaOptions;

function onPageLoad() {
    var mapOptions = {
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false,
        disableDoubleClickZoom: true
    };

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

    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
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
    google.maps.event.addListener(map, 'dblclick', updateStreetView);
    LocationWebService.getLocationData(pid, showGoogleMap);
}


function onPageLoadAndShowShopMap() {
    var mapOptions = {
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false,
        disableDoubleClickZoom: true
    };

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

    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
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
    google.maps.event.addListener(map, 'dblclick', updateStreetView);
    //LocationWebService.getLocationData(pid, showGoogleMap);

    //centerLatLng = new google.maps.LatLng(24.99772, 121.50457);
    centerLatLng.latitude = 24.99772;
    centerLatLng.longitude = 121.50457;
    //location.latitude, location.longitude
    showGoogleMap(centerLatLng);
    //    LocationWebService.getLocationData(pid, showGoogleMap);


//    var mapOptions = {
//        zoom: 15,
//        mapTypeId: google.maps.MapTypeId.ROADMAP,
//        streetViewControl: false,
//        disableDoubleClickZoom: true
//    };

//    panoramaOptions = {
//        position: centerLatLng,
//        pov: {
//            heading: 0,
//            pitch: 0,
//            zoom: 1
//        },
//        panControl: false,
//        zoomControl: false,
//        addressControl: false

//    };

//    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
//    streetView = new google.maps.StreetViewPanorama(document.getElementById("streetViewCanvas"), panoramaOptions);
//    streetViewService = new google.maps.StreetViewService();

//    var pid;
//    var placeRadioButtonListItems = document.getElementById("placeRadioButtonList").getElementsByTagName("input");

//    for (var i = 0; i < placeRadioButtonListItems.length; i++) {
//        if (placeRadioButtonListItems[i].checked) {
//            pid = placeRadioButtonListItems[i].value;
//            break;
//        }
//    }
//    google.maps.event.addListener(map, 'dblclick', updateStreetView);

}


function placeRadioButtonList_onclick(pid) {
    LocationWebService.getLocationData(pid, showGoogleMap);
}


function showGoogleMap(location) {
    centerLatLng = new google.maps.LatLng(location.latitude, location.longitude);
    map.setCenter(centerLatLng);
    streetViewService.getPanoramaByLocation(centerLatLng, 100, showStreetView);
}

function updateStreetView(event) {
    streetViewService.getPanoramaByLocation(event.latLng, 100, showStreetView);
}



function showShopMap() {
    centerLatLng = new google.maps.LatLng(24.99772, 121.50457);
    map.setCenter(centerLatLng);
    streetViewService.getPanoramaByLocation(centerLatLng, 100, showStreetView);
}


function showStreetView(data, status) {
    if (status == google.maps.StreetViewStatus.OK) {
        streetView.setPano(data.location.pano);
        streetView.setPov(panoramaOptions.pov);
    }
    else {
        alert('抱歉！此處無街景服務');
    }
}
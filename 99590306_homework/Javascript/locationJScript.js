function placeRadioButtonList_onclick(pid) {
    LocationWebService.getLocationData(pid, showLocation);
}   
function showLocation(location){
    document.getElementById("longitudeLabel").innerHTML = location.longitude;
    document.getElementById("latitudeLabel").innerHTML = location.latitude;
}
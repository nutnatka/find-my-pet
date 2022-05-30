function initMap() {
    const center = new google.maps.LatLng(49.427673, 32.050320);

    // Declare your map options
    const mapOptions = {
        zoom: 12,
        center: center,
        const: my_pet = {},
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDoubleClickZoom: true,
        mapTypeControl: false,
        streetViewControl: false,
    };


    // Create a map in the #map HTML element, using the declared options
    const map = new google.maps.Map(document.getElementById("map"), mapOptions);

    map.addListener("dblclick", (e) => {
        placeMarkerAndPanTo(e.latLng, map);
    });

    const options = {
        enableHighAccuracy: true,
        timeout: 300,
        maximumAge: 0
    };
    navigator.geolocation.getCurrentPosition(showPosition, error, options);

    function showPosition(position) {
        new google.maps.Marker({
            // position: position,
            position: position.coords,
            map: map,
        });
    }
    function error(err) {
        console.warn(`ERROR(${err.code}): ${err.message}`);
    }



}


function placeMarkerAndPanTo(latLng, map) {

    const petInfo = `<h1>INfo</h1>`

    const infoWindow = new google.maps.InfoWindow({
        content: petInfo,
    });

    const marker = new google.maps.Marker({
        position: latLng,
        map: map,
    });

    marker.addListener("click", () => {
        infoWindow.open({
            anchor: marker,
            map,
            shouldFocus: false,
        });
    });

    map.panTo(latLng);
}


window.initMap = initMap;
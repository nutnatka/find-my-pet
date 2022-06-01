let map;

function initMap() {
    const center = {lat: 49.427673, lng: 32.050320};

    // Declare your map options
    const mapOptions = {
        zoom: 18,
        center: center,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDoubleClickZoom: true,
        mapTypeControl: false,
        streetViewControl: false,
    };

    // Create a map in the #map HTML element, using the declared options
    map = new google.maps.Map(document.getElementById("map"), mapOptions);

    // map.addListener("dblclick", (e) => {
    //     placeMarkerAndPanTo(e.latLng);
    // });

    navigator.geolocation.getCurrentPosition((position) => {
        if (position.coords == undefined) {
            return;
        }
        var latLng = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
        };
        new google.maps.Marker({
            position: latLng,
            map: map,
        });
        map.setCenter(latLng);
    });

}

function placeMarkerAndPanTo(latLng) {

    // const petInfo = `<h1>INfo</h1>`
    //
    // const infoWindow = new google.maps.InfoWindow({
    //     content: petInfo,
    // });
    //
    // const marker = new google.maps.Marker({
    //     position: latLng,
    //     map: map,
    // });
    //
    // marker.addListener("click", () => {
    //     infoWindow.open({
    //         anchor: marker,
    //         map,
    //         shouldFocus: false,
    //     });
    // });
    //
    // map.panTo(latLng);
}

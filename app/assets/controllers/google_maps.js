
function initMap() {

    const center = {lat: 49.427673, lng: 32.050320};

    // Declare your map options
    const mapOptions = {
        zoom: 18,
        center: center,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        streetViewControl: false,
    };

    // Create a map in the #map HTML element, using the declared options
    const map = new google.maps.Map(document.getElementById("map"), mapOptions);
    
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

    const lost_pets = document.querySelectorAll("div.lost-pet-card");
    lost_pets.forEach(lost_pet => {
        new google.maps.Marker({
            position: {
                lat: Number(lost_pet.getAttribute("data-latitude")),
                lng: Number(lost_pet.getAttribute("data-longitude"))
            },
            map: map
        });
    });

}

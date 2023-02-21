import L from "leaflet";
import "leaflet-draw";

var davenportGolfClub = new L.LatLng(53.3513668,-2.0975508),
    map = L.map('map', {center: davenportGolfClub, zoom: 16}),
    satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
    }),
    drawnItems = L.featureGroup().addTo(map);


// satelliteLayer.addTo(map);

L.control.layers(
    {'Satellite': satelliteLayer.addTo(map)},
    {'drawLayer': drawnItems},
    {position: 'topleft', collapsed: false}
).addTo(map);

map.addControl(new L.Control.Draw({
    edit: {
        featureGroup: drawnItems,
        poly: {
            allowIntersection: false
        }
    },
    draw: {
        polygon: {
            allowIntersection: false,
            showArea: true
        }
    }
}));

map.on(L.Draw.Event.CREATED, function(e) {
    var layer = e.layer;
    drawnItems.addLayer(layer);
});

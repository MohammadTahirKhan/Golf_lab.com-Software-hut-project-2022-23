import L from "leaflet";
import "leaflet-draw";


const davenportGolfClub = new L.LatLng(53.3513668,-2.0975508);
const satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'});

var map = L.map('map', {center: davenportGolfClub, zoom: 16}),
    map2 = L.map('map2', {center: davenportGolfClub, zoom: 16, minZoom: 14, maxZoom: 18});

satelliteLayer.addTo(map);
L.control.scale({position: 'topright'}).addTo(map);
L.control.scale({position: 'topright'}).addTo(map2);

var fairways = new L.FeatureGroup(),
    greens = new L.FeatureGroup(),
    roughs = new L.FeatureGroup(), 
    hazards = new L.FeatureGroup(), 
    tees = new L.FeatureGroup();

var options = {
    position: 'topleft',
    draw: {
        polyline: false,
        polygon: {
            allowIntersection: false,
        },
        circle: false,
        rectangle: false,
        marker: false,
        circlemarker: false
    },
    edit: {
        featureGroup: fairways,
        remove: true
    }
};

var drawControl = new L.Control.Draw(options);
function initialiseDrawControl(type, colour) {
    options.edit.featureGroup = type;
    options.draw.polygon.shapeOptions = {color: colour};
    map.removeControl(drawControl);
    
    drawControl = new L.Control.Draw(options);
    map.addControl(drawControl);
}


var shapeType = document.getElementById('shape-type');
shapeType.onchange = function() {
    switch (shapeType.value) {
        case 'fairway':
            initialiseDrawControl(fairways, 'rgb(190, 255, 190)');
            break;
        case 'green':
            initialiseDrawControl(greens, 'rgb(0, 255, 0)');
            break;
        case 'rough':
            initialiseDrawControl(roughs, 'rgb(100, 255, 100)');
            break;
        case 'hazard':
            initialiseDrawControl(hazards, 'rgb(255, 0, 0)');
            break;
        case 'tee':
            initialiseDrawControl(tees, 'rgb(255, 255, 255)');
    }
}


map.on('draw:created', function (e) {
    var layer = e.layer;

    switch (shapeType.value) {
        case 'fairway':
            fairways.addLayer(layer);
            break;
        case 'green':
            greens.addLayer(layer);
            break;
        case 'rough':
            roughs.addLayer(layer);
            break;
        case 'hazard':
            hazards.addLayer(layer);
            break;
        case 'tee':
            tees.addLayer(layer);
    }

});

map.addLayer(fairways);
map.addLayer(greens);
map.addLayer(roughs);
map.addLayer(hazards);
map.addLayer(tees);

initialiseDrawControl(fairways, 'rgb(190, 255, 190)');
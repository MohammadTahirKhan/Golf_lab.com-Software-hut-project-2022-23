import L from "leaflet";
import "leaflet-draw";
import Rails from "@rails/ujs";
import {GeoSearchControl, OpenStreetMapProvider} from "leaflet-geosearch";


const searchControl = new GeoSearchControl({
    provider: new OpenStreetMapProvider(),
    style: 'bar',
    showMarker: false,
    searchLabel: 'Search for a golf course',
});
const davenportGolfClub = new L.LatLng(53.3513668,-2.0975508);
const satelliteLayer = L.tileLayer('http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}', {
    attribution: 'Imagery &copy;2023 Bluesky, CNES / Airbus, Getmapping plc, Infoterra Ltd & Bluesky, Maxar Technologies, The GeoInformation Group',
    maxZoom: 21,
})

var map = L.map('map', {center: davenportGolfClub, zoom: 16, maxZoom: 21});

satelliteLayer.addTo(map);
L.control.scale({position: 'topright'}).addTo(map);
map.addControl(searchControl);

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

var button = document.getElementById("button")

button.onclick = function () {
    var datum = {
        xCoordinates: [1, 2, 3],
        yCoordinates: [100, 200, 300],
        hole_id: 5,
        userhole_id: 3
    }

    var fd = new FormData()
    fd.append("datum", JSON.stringify(datum))

    Rails.ajax({
        url: "/data",
        type: "post",
        data: fd,
    })
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


var resultbox = document.getElementById("result");
searchControl.onSubmit = function(result) {
    resultbox.innerHTML = result.data.label;
    map.flyTo([result.data.y, result.data.x])
    console.log(result);
}
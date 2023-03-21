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
    bunker = new L.FeatureGroup(),
    water = new L.FeatureGroup(),
    rock = new L.FeatureGroup(),
    trees = new L.FeatureGroup(),
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
        case '1':
            initialiseDrawControl(fairways, 'rgb(190, 255, 190)');
            break;
        case '3':
            initialiseDrawControl(greens, 'rgb(0, 255, 0)');
            break;
        case '4':
            initialiseDrawControl(bunker, 'rgb(100, 255, 100)');
            break;
        case '6':
            initialiseDrawControl(water, 'rgb(100, 255, 100)');
            break;
        case '2':
            initialiseDrawControl(roughs, 'rgb(100, 255, 100)');
            break;
        case '0':
            initialiseDrawControl(rock, 'rgb(255, 0, 0)');
            break;
        case '6':
            initialiseDrawControl(trees, 'rgb(255, 0, 0)');
            break;
        case '7':
            initialiseDrawControl(tees, 'rgb(255, 255, 255)');
    }
}


function sendData(xCoordinates,yCoordinates,hole_id, terrain_type){
    let form = new FormData()

    form.append('datum[xCoordinates]', xCoordinates)
    form.append('datum[yCoordinates]', yCoordinates)
    form.append('datum[hole_id]', hole_id)
    //form.append('datum[user_hole_id]', user_hole_id)
    form.append('datum[terrain_type]', terrain_type)

    Rails.ajax({
        url: "/data",
        type: "post",
        data: form,
    })
}


button.onclick = function () {

    var hole_id = document.getElementById("holeid").value
   
    if (fairways.getLayers().length > 0 ){
        fairways.eachLayer(function(layer){
            let xCoordinates = []
            let yCoordinates = []
           for(let i =0; i <  layer.getLatLngs()[0].length; i++){
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
           } 
           sendData(xCoordinates,yCoordinates,hole_id, 'fairway')
        })

    }

    if (bunker.getLayers().length > 0) {
        bunker.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates,hole_id, 'bunker')
        })

    }

    if (rock.getLayers().length > 0) {
        rock.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates,hole_id,'rock')
        })
        

    }

    if (greens.getLayers().length > 0) {
        greens.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates,hole_id, 'green')
        })

    }

    if (roughs.getLayers().length > 0) {
        roughs.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates,hole_id, 'rough')
        })
        
    }

    if (trees.getLayers().length > 0) {
        trees.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates,hole_id, 'tree')
        })

    }

    if (water.getLayers().length > 0) {
        water.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates, hole_id, 'water')
        })

    }

    if (tees.getLayers().length > 0) {
        tees.eachLayer(function (layer) {
            let xCoordinates = []
            let yCoordinates = []
            for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
                xCoordinates.push(layer.getLatLngs()[0][i].lat)
                yCoordinates.push(layer.getLatLngs()[0][i].lng)
            }
            sendData(xCoordinates, yCoordinates, hole_id, 'tee')
        })

    }
}


map.on('draw:created', function (e) {
    var layer = e.layer;

    switch (shapeType.value) {
        case '1':
            fairways.addLayer(layer);
            break;
        case '3':
            greens.addLayer(layer);
            break;
        case '2':
            roughs.addLayer(layer);
            break;
        case '0':
            rock.addLayer(layer);
            break;
        case '4':
            bunker.addLayer(layer);
            break;
        case '6':
            water.addLayer(layer);
            break;
        case '5':
            trees.addLayer(layer);
            break;     
        case '7':
            tees.addLayer(layer);
    }

});



map.addLayer(fairways);
map.addLayer(greens);
map.addLayer(roughs);
map.addLayer(trees);
map.addLayer(water);
map.addLayer(bunker);
map.addLayer(rock);
map.addLayer(tees);

initialiseDrawControl(rock, 'rgb(190, 255, 190)');


var resultbox = document.getElementById("result");
searchControl.onSubmit = function(result) {
    resultbox.innerHTML = result.data.label;
    map.flyTo([result.data.y, result.data.x])
    console.log(result);
}

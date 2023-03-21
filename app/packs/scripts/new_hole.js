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
const satelliteLayer = L.tileLayer('http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}', {
    attribution: 'Imagery &copy;2023 Bluesky, CNES / Airbus, Getmapping plc, Infoterra Ltd & Bluesky, Maxar Technologies, The GeoInformation Group',
    maxZoom: 21,
    noWrap: true,
})

var map = L.map('map', {center: [54, -10], zoom: 14, maxZoom: 21, minZoom: 4, maxBounds: [[-90, -180], [90, 180]]});

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
        case 'fairway':
            initialiseDrawControl(fairways, 'rgb(190, 255, 190)');
            break;
        case 'green':
            initialiseDrawControl(greens, 'rgb(0, 255, 0)');
            break;
        case 'rough':
            initialiseDrawControl(bunker, 'rgb(0, 120, 60)');
            break;
        case 'rock':
            initialiseDrawControl(water, 'rgb(50, 50, 50)');
            break;
        case 'bunker':
            initialiseDrawControl(roughs, 'rgb(255, 255, 80)');
            break;
        case 'water':
            initialiseDrawControl(rock, 'rgb(0, 0, 255)');
            break;
        case 'tree':
            initialiseDrawControl(trees, 'rgb(100, 50, 0)');
            break;
        case 'tee':
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


var submitButton = document.getElementById('submit-hole');
submitButton.onclick = function () {
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
        case 'fairway':
            fairways.addLayer(layer);
            break;
        case 'green':
            greens.addLayer(layer);
            break;
        case 'rough':
            roughs.addLayer(layer);
            break;
        case 'rock':
            rock.addLayer(layer);
            break;
        case 'bunker':
            bunker.addLayer(layer);
            break;
        case 'water':
            water.addLayer(layer);
            break;
        case 'tree':
            trees.addLayer(layer);
            break;     
        case 'tee':
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


var courseName = document.getElementById("hole_course_name");
searchControl.onSubmit = function(result) {
    var searchedCourseName = result.data.label.split(",")[0];
    courseName.value = searchedCourseName
    map.flyTo([result.data.y, result.data.x])
}

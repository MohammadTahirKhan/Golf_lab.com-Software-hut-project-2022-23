import L from "leaflet";
import "leaflet-draw";
import { OpenStreetMapProvider } from "leaflet-geosearch";
import Rails from "@rails/ujs";

const satelliteLayer = L.tileLayer(
  "http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}",
  {
    attribution:
      "Imagery &copy;2023 Bluesky, CNES / Airbus, Getmapping plc, Infoterra Ltd & Bluesky, Maxar Technologies, The GeoInformation Group",
    maxZoom: 21,
    noWrap: true,
  }
);

var featureGroups = [];

var fairways = new L.FeatureGroup(),
  greens = new L.FeatureGroup(),
  roughs = new L.FeatureGroup(),
  bunkers = new L.FeatureGroup(),
  water = new L.FeatureGroup(),
  rocks = new L.FeatureGroup(),
  trees = new L.FeatureGroup(),
  tees = new L.FeatureGroup();

var map = L.map("map", {
  center: [54, -10],
  zoom: 14,
  maxZoom: 21,
  minZoom: 4,
  maxBounds: [
    [-90, -180],
    [90, 180],
  ],
});

satelliteLayer.addTo(map);
L.control.scale({ position: "topright" }).addTo(map);
map.addLayer(fairways);
map.addLayer(greens);
map.addLayer(roughs);
map.addLayer(trees);
map.addLayer(water);
map.addLayer(bunkers);
map.addLayer(rocks);
map.addLayer(tees);

// Centres the map on the coordinates of the course
window.onload = function () {
  var courseName = document.getElementById("course");
  var osm = new OpenStreetMapProvider();
  osm.search({ query: courseName.value }).then(function (results) {
    var latLng = [results[0].y, results[0].x];
    map.setView(latLng, 16);
  });
};

var drawOptions = {
  position: "topleft",
  draw: {
    polyline: false,
    polygon: {
      allowIntersection: false,
    },
    circle: false,
    rectangle: false,
    marker: false,
    circlemarker: false,
  },
  edit: {
    featureGroup: fairways,
    remove: true,
  },
};

var drawControl = new L.Control.Draw(drawOptions);
function initialiseDrawControl(type, colour) {
  drawOptions.edit.featureGroup = type;
  drawOptions.draw.polygon.shapeOptions = { color: colour };
  map.removeControl(drawControl);

  drawControl = new L.Control.Draw(drawOptions);
  map.addControl(drawControl);
}
initialiseDrawControl(fairways, "rgb(190, 255, 190)");

var shapeType = document.getElementById("shape-type");
shapeType.onchange = function () {
  switch (shapeType.value) {
    case "fairway":
      initialiseDrawControl(fairways, "rgb(190, 255, 190)");
      break;
    case "green":
      initialiseDrawControl(greens, "rgb(0, 255, 0)");
      break;
    case "rough":
      initialiseDrawControl(roughs, "rgb(0, 120, 60)");
      break;
    case "rock":
      initialiseDrawControl(rocks, "rgb(50, 50, 50)");
      break;
    case "bunker":
      initialiseDrawControl(bunkers, "rgb(255, 255, 80)");
      break;
    case "water":
      initialiseDrawControl(water, "rgb(0, 0, 255)");
      break;
    case "tree":
      initialiseDrawControl(trees, "rgb(100, 50, 0)");
      break;
    case "tee":
      initialiseDrawControl(tees, "rgb(255, 255, 255)");
  }
};

map.on("draw:created", function (e) {
  var layer = e.layer;

  switch (shapeType.value) {
    case "fairway":
      fairways.addLayer(layer);
      break;
    case "green":
      greens.addLayer(layer);
      break;
    case "rough":
      roughs.addLayer(layer);
      break;
    case "rock":
      rocks.addLayer(layer);
      break;
    case "bunker":
      bunkers.addLayer(layer);
      break;
    case "water":
      water.addLayer(layer);
      break;
    case "tree":
      trees.addLayer(layer);
      break;
    case "tee":
      tees.addLayer(layer);
  }
});

export {
  fairways,
  greens,
  roughs,
  bunkers,
  water,
  rocks,
  trees,
  tees,  
};

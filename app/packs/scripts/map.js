import L from "leaflet";
import "leaflet-draw";
import { OpenStreetMapProvider } from "leaflet-geosearch";

var fairways = new L.FeatureGroup();
var greens = new L.FeatureGroup();
var roughs = new L.FeatureGroup();
var bunkers = new L.FeatureGroup();
var water = new L.FeatureGroup();
var rocks = new L.FeatureGroup();
var trees = new L.FeatureGroup();
var tees = new L.FeatureGroup();

var map = L.map("map", {
  center: [0, 0],
  zoom: 14,
  maxZoom: 21,
  minZoom: 4,
  maxBounds: [
    [-90, -180],
    [90, 180],
  ],
});

// Centres map on course
window.onload = function () {
  var osm = new OpenStreetMapProvider();
  var courseName = document.getElementById("course").value.split(",")[0];
  osm.search({ query: courseName }).then((result) => {
    map.setView([result[0].y, result[0].x], 16);
  });
};

L.control.scale({ position: "topright" }).addTo(map);
map.addLayer(fairways);
map.addLayer(greens);
map.addLayer(roughs);
map.addLayer(trees);
map.addLayer(water);
map.addLayer(bunkers);
map.addLayer(rocks);
map.addLayer(tees);

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

// Changes feature group being edited, called from dropdown event listener
var drawControl = new L.Control.Draw(drawOptions);
function initialiseDrawControl(type) {
  drawOptions.edit.featureGroup = type;
  map.removeControl(drawControl);

  drawControl = new L.Control.Draw(drawOptions);
  map.addControl(drawControl);
}
initialiseDrawControl(fairways);

var shapeType = document.getElementById("shape-type");
shapeType.onchange = function () {
  switch (shapeType.value) {
    case "fairway":
      initialiseDrawControl(fairways);
      break;
    case "green":
      initialiseDrawControl(greens);
      break;
    case "rough":
      initialiseDrawControl(roughs);
      break;
    case "rock":
      initialiseDrawControl(rocks);
      break;
    case "bunker":
      initialiseDrawControl(bunkers);
      break;
    case "water":
      initialiseDrawControl(water);
      break;
    case "tree":
      initialiseDrawControl(trees);
      break;
    case "tee":
      initialiseDrawControl(tees);
  }
};

// Sets colour of each feature group
fairways.on("layeradd", function () {
  fairways.setStyle({ color: "rgb(190, 255, 190)" });
});
greens.on("layeradd", function () {
  greens.setStyle({ color: "rgb(0, 255, 0)" });
});
roughs.on("layeradd", function () {
  roughs.setStyle({ color: "rgb(0, 120, 60)" });
});
rocks.on("layeradd", function () {
  rocks.setStyle({ color: "rgb(50, 50, 50)" });
});
bunkers.on("layeradd", function () {
  bunkers.setStyle({ color: "rgb(255, 255, 80)" });
});
water.on("layeradd", function () {
  water.setStyle({ color: "rgb(0, 0, 255)" });
});
trees.on("layeradd", function () {
  trees.setStyle({ color: "rgb(100, 50, 0)" });
});
tees.on("layeradd", function () {
  tees.setStyle({ color: "rgb(255, 255, 255)" });
});

// Adds new shape to feature group
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

export { map, fairways, greens, roughs, bunkers, water, rocks, trees, tees };

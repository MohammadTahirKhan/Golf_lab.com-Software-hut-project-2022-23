import L from "leaflet";
import "leaflet-draw";
import { OpenStreetMapProvider } from "leaflet-geosearch";
import {
  map,
  fairways,
  greens,
  roughs,
  bunkers,
  water,
  rocks,
  trees,
  tees,
} from "./map";

const satelliteLayer = L.tileLayer(
  "http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}",
  {
    attribution:
      "Imagery &copy;2023 Bluesky, CNES / Airbus, Getmapping plc, Infoterra Ltd & Bluesky, Maxar Technologies, The GeoInformation Group",
    maxZoom: 21,
    noWrap: true,
  }
);

map.addLayer(satelliteLayer);

var xCoords = document.getElementById("xCoordinates").value.split('"');
var yCoords = document.getElementById("yCoordinates").value.split('"');
var terrain = document.getElementById("terrain_type").value.split('"');

xCoords = xCoords.filter((x) => x != "[" && x != "]" && x != ", ");
yCoords = yCoords.filter((x) => x != "[" && x != "]" && x != ", ");
terrain = terrain.filter((x) => x != "[" && x != "]" && x != ", ");

for (var i = 0; i < xCoords.length; i++) {
  xCoords[i] = xCoords[i].split(",");
  yCoords[i] = yCoords[i].split(",");
}

for (var shape = 0; shape < xCoords.length; shape++) {
  var latLngs = [];
  for (var point = 0; point < xCoords[shape].length; point++) {
    latLngs.push([xCoords[shape][point], yCoords[shape][point]]);
  }
  var polygon = L.polygon(latLngs);

  switch (terrain[shape]) {
    case "fairway":
      fairways.addLayer(polygon);
      break;
    case "green":
      greens.addLayer(polygon);
      break;
    case "rough":
      roughs.addLayer(polygon);
      break;
    case "rock":
      rocks.addLayer(polygon);
      break;
    case "bunker":
      bunkers.addLayer(polygon);
      break;
    case "water":
      water.addLayer(polygon);
      break;
    case "tree":
      trees.addLayer(polygon);
      break;
    case "tee":
      tees.addLayer(polygon);
  }
}

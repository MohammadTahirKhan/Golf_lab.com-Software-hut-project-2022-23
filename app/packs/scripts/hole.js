import { map } from "./map";

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

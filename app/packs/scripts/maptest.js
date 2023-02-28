import L, { LatLng, latLng, LatLngUtil, Point, Projection, SVG } from "leaflet";
import LD from "leaflet-draw";

var davenportGolfClub = new L.LatLng(53.3513668,-2.0975508),
    map = L.map('map', {center: davenportGolfClub, zoom: 16}),
    satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
    }),
    drawnItems = new L.featureGroup();

satelliteLayer.addTo(map);
map.addLayer(drawnItems);

var drawOptions = {
    position: 'topleft',
    draw: {
        polygon: true,
        polyline: false,
        circle: false,
        rectangle: false,
        marker: false,
        circlemarker: false
    },
    edit: {
        featureGroup: drawnItems,
        remove: true
    }
};

var drawControl = new L.Control.Draw(drawOptions);
map.addControl(drawControl);


map.on('draw:created', function (e) {
    var type = e.layerType,
        layer = e.layer,
        para = document.getElementById("coords"),
        coords = layer.getLatLngs()[0];

    para.innerHTML = coords;

    var shapePoints = [];
    coords.forEach(function(coord) {
        var point = map.latLngToLayerPoint(coord);
        shapePoints.push(point);
    });

    var svg = document.getElementById("svg");
    var polygon = document.createElementNS("http://www.w3.org/2000/svg", "polygon");
    svg.appendChild(polygon);

    shapePoints.forEach(function(value) {
        var point = svg.createSVGPoint();
        point.x = value.x;
        point.y = value.y;
        polygon.points.appendItem(point);
      }
    );
    
    drawnItems.addLayer(layer);
});

// satelliteLayer.addTo(map);

// L.control.layers(
//     {'Satellite': satelliteLayer.addTo(map)},
//     {'drawLayer': drawnItems},
//     {position: 'topleft', collapsed: false}
// ).addTo(map);

// map.addControl(new L.Control.Draw({
//     edit: {
//         featureGroup: drawnItems,
//         poly: {
//             allowIntersection: false
//         }
//     },
//     draw: {
//         polygon: {
//             allowIntersection: false,
//             showArea: true
//         }
//     }
// }));

// map.on(L.Draw.Event.CREATED, function(e) {
//     var layer = e.layer;
//     drawnItems.addLayer(layer);
// });
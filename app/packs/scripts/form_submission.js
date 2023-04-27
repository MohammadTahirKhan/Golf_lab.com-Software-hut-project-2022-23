import Rails from "@rails/ujs";
import {
  fairways,
  greens,
  roughs,
  rocks,
  bunkers,
  water,
  trees,
  tees,
} from "./load_map";

function deleteData(hole_id) {
  var form = new FormData();

  // form.append("datum[xCoordinates]", null);
  // form.append("datum[yCoordinates]", null);
  form.append("datum[hole_id]", hole_id);
  // form.append("datum[terrain_type]", null);
  console.log("gfsgsgs");

  Rails.ajax({
    url: "/data/deleter",
    type: "post",
    data: form,
  });
}

function sendData(xCoordinates, yCoordinates, hole_id, terrain_type) {
  var form = new FormData();
  console.log("gfsgsgsfefewf44");

  form.append("datum[xCoordinates]", xCoordinates);
  form.append("datum[yCoordinates]", yCoordinates);
  form.append("datum[hole_id]", hole_id);
  form.append("datum[terrain_type]", terrain_type);

  Rails.ajax({
    url: "/data/new",
    type: "post",
    data: form,
  });
}

var submitButton = document.getElementById("submit-hole");
submitButton.onclick = function () {
  var hole_id = document.getElementById("hole").value;
  deleteData(hole_id);
  if (fairways.getLayers().length > 0) {
    fairways.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "fairway");
    });
  }

  if (bunkers.getLayers().length > 0) {
    bunkers.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "bunker");
    });
  }

  if (rocks.getLayers().length > 0) {
    rocks.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "rock");
    });
  }

  if (greens.getLayers().length > 0) {
    greens.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "green");
    });
  }

  if (roughs.getLayers().length > 0) {
    roughs.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "rough");
    });
  }

  if (trees.getLayers().length > 0) {
    trees.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "tree");
    });
  }

  if (water.getLayers().length > 0) {
    water.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "water");
    });
  }

  if (tees.getLayers().length > 0) {
    tees.eachLayer(function (layer) {
      var xCoordinates = [];
      var yCoordinates = [];
      for (let i = 0; i < layer.getLatLngs()[0].length; i++) {
        xCoordinates.push(layer.getLatLngs()[0][i].lat);
        yCoordinates.push(layer.getLatLngs()[0][i].lng);
      }
      sendData(xCoordinates, yCoordinates, hole_id, "tee");
    });
  }
};

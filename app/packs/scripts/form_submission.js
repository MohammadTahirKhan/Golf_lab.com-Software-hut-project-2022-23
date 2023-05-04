/**
 * Contains scripts responsible for submitting new data and deleting old
 */

import Rails from "@rails/ujs";
import { data, error, post } from "jquery";
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

/**
 * Deletes all data associated with a hole
 * @param {Number} hole_id 
 * @returns {void}
 */
function deleteData(hole_id) {
  var form = new FormData();
  if (window.location.pathname.includes("userhole")){
    form.append("datum[user_hole_id]", hole_id);
  }
  else{
    form.append("datum[hole_id]", hole_id);
  }

  Rails.ajax({
    url: "/data/deleter",
    type: "post",
    data: form,
  });
}

/**
 * Sends shape data to Rails
 * @param {Number[][]} xCoordinates 
 * @param {Number[][]} yCoordinates 
 * @param {Number} hole_id 
 * @param {String[]} terrain_type
 * @returns {void}
 */
function sendData(xCoordinates, yCoordinates, hole_id, terrain_type) {
  // var form = new FormData();
  
  
  // form.append("datum[xCoordinates]", xCoordinates);
  // form.append("datum[yCoordinates]", yCoordinates);
  // if (window.location.pathname.includes("userhole")) {
  //   form.append("datum[user_hole_id]", hole_id);
  // }
  // else{
  //   form.append("datum[hole_id]", hole_id);
  // }
  // form.append("datum[terrain_type]", terrain_type);

  // Rails.ajax({
  //   url: "/data/new",
  //   type: "post",
  //   data: form,
  //   timeout: 5000
  // });
  var datum;
  if (window.location.pathname.includes("userhole")){
    datum = {
      xCoordinates: xCoordinates.toString(),
      yCoordinates: yCoordinates.toString(),
      terrain_type: terrain_type,
      user_hole_id: hole_id
    }
  }
  else{
    datum = {
      xCoordinates: xCoordinates.toString(),
      yCoordinates: yCoordinates.toString(),
      terrain_type: terrain_type,
      hole_id: hole_id,
    }
  }

  const csrfToken = document.getElementsByName("csrf-token")[0].content;
  fetch("/data/new", {

    method: "POST",

    headers: {
      "X-CSRF-Token": csrfToken,
      "Content-Type": "application/json",
      Accept: "application/json"
    },

    body: JSON.stringify({
      datum
    }),

  })
    .then((response) => response.json())
    .then((data) => {
      console.log("Success", data);
    })
    .catch((error => {
      console.log("Error",error);
    }));

}

var submitButton = document.getElementById("submit-hole");

/**
 * Combines all shape coordinates into a multi-dimensional array
 * Calls sendData() and deleteData() to create holes
 * @returns {void}
 */
submitButton.onclick = function () {
  var hole_id = document.getElementById("hole").value; 
  // alert(
  //   ("afterclick fairwaysLLLL:" + fairways.getLayers().length) +
  //   ("  bunker:" + bunkers.getLayers().length) +
  //   ("  rocks:" + rocks.getLayers().length) +
  //   ("  greens:" + greens.getLayers().length ) +
  //   ("  roughs:" + roughs.getLayers().length )+
  //   ("  trees:" + trees.getLayers().length ) +
  //   ("  water:" + water.getLayers().length) +
  //   ("  tees:" + tees.getLayers().length)
  // )
  if (window.location.pathname.includes("edit")) {
    deleteData(hole_id);
  }
  
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

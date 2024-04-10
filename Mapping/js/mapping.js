function zoomToFeature(e) {
  myMap.fitBounds(e.target.getBounds());
}

function highlightFeature(e) {
  var layer = e.target;
  layer.setStyle({
      weight: 5,
      color: '#666',
      dashArray: '',
      fillOpacity: 0.7
  });
  layer.bringToFront();
  info.update(layer.feature.properties);
}

function resetHighlight(e) {
  geojson.resetStyle(e.target);
}

// Creating the map object
let myMap = L.map("map", {
  center: [40.0583, -74.4057],
  zoom: 8
});

var geojson;
// Adding the tile layer
//L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
//    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
//}).addTo(myMap);
// control that shows state info on hover
const info = L.control();

info.onAdd = function (map) {
  this._div = L.DomUtil.create('div', 'info');
  this.update();
  return this._div;
};

info.update = function (props) {
  const contents = props ? `<b>${props.COUNTY_LABEL}</b><br />${props.POP2020} people` : 'Hover over a state';
  this._div.innerHTML = `<h4>County Info</h4>${contents}`;
};

info.addTo(myMap);

 //Load the GeoJSON data.
//let geoData = "https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-classroom/v1.1/15-Mapping-Web/ACS-ED_2014-2018_Economic_Characteristics_FL.geojson";
let geoData = "County_Boundaries_of_NJ.geojson"
// Get the data with d3.
d3.json(geoData).then(function(data) {
    console.log(data);
    //BoundaryCanvas is a plugin for Leaflet mapping library to draw tiled raster layers with arbitrary boundary. HTML5 Canvas is used for rendering.
    var osm = new L.TileLayer.BoundaryCanvas("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    boundary: data,
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors</a>'
    });
    myMap.addLayer(osm);
    var njLayer = L.geoJSON(data);
    myMap.fitBounds(njLayer.getBounds());
    // Create a new choropleth layer.
    geojson = L.choropleth(data, {
    // Define which property in the features to use.
    valueProperty: "POP2020",
    // Set the color scale.
    scale: ["#ffffb2", "#b10026"],
    // The number of breaks in the step range
    steps: 10,
    // q for quartile, e for equidistant, k for k-means
    mode: "q",
    style: {
      // Border color
      color: "#fff",
      weight: 1,
      fillOpacity: 0.8
    },


    onEachFeature: function(feature, layer) {
      layer.on({
        mouseover: highlightFeature,
        mouseout: resetHighlight,
        click: zoomToFeature
      });
      //layer.bindPopup("<strong>" + feature.properties.NAME + "</strong><br /><br />Estimated employed population with children age 6-17: " + feature.properties.POP2020)
    }
  }).addTo(myMap);

  // Set up the legend.
  let legend = L.control({ position: "bottomright" });
  legend.onAdd = function() {
    let div = L.DomUtil.create("div", "info legend");
    let limits = geojson.options.limits;
    let colors = geojson.options.colors;
    let labels = [];

    // Add the minimum and maximum.
    let legendInfo = "<h1>Population 2020</h1>" +
      "<div class=\"labels\">" +
        "<div class=\"min\">" + limits[0] + "</div>" +
        "<div class=\"max\">" + limits[limits.length - 1] + "</div>" +
      "</div>";

    div.innerHTML = legendInfo;

    limits.forEach(function(limit, index) {
      labels.push("<li style=\"background-color: " + colors[index] + "\"></li>");
    });

    div.innerHTML += "<ul>" + labels.join("") + "</ul>";
    return div;
  };

  // Adding the legend to the map
  legend.addTo(myMap);
});
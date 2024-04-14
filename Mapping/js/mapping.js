function formatNum(num){
  return new Intl.NumberFormat().format(Math.round(num));
}

function getCensusDataFromAPI(){
  // Get the data with d3.  
  $.ajaxSetup({
    headers:{
      "Access-Control-Allow-Origin": "*"
    }
 })

  $.get({url: "http://127.0.0.1:5000/api/v1.0/getCensusData", dataType: "json",  async:false}, (data, status) => {    
    censusData = data;
    console.log(typeof(censusData));
  });
}

function getCensusDataByObjectID(objectId){        
    if (Array.isArray(censusData))
      return censusData.filter(data => data.OBJECTID  == objectId)[0];            
    else
      return null;
}

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


function createMap(metrics){
  // Creating the map object
  myMap = L.map("map", {
    center: [40.0583, -74.4057],
    zoom: 8
  });
  //Load the GeoJSON data.  
  let geoData = "County_Boundaries_of_NJ.geojson"
  // Get the data with d3.
  d3.json(geoData).then(function(data) {        

    let geoJsonData = data;
    //merge GeoJSON with API data and save census and crime data in CUSTOM field
    for (let i = 0;i<geoJsonData.features.length;i++)
    {
      let feature = geoJsonData.features[i];
      countyCensus = getCensusDataByObjectID(feature.properties.OBJECTID);      
      if (countyCensus)
        feature.properties.CUSTOM = countyCensus;
      else
        feature.properties.CUSTOM = null;      
    }

    //BoundaryCanvas is a plugin for Leaflet mapping library to draw tiled raster layers with arbitrary boundary. HTML5 Canvas is used for rendering.
    var osm = new L.TileLayer.BoundaryCanvas("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    boundary: geoJsonData,
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors</a>'
    });
    myMap.addLayer(osm);
    var njLayer = L.geoJSON(data);
    myMap.fitBounds(njLayer.getBounds());
    // Create a new choropleth layer.
    geojson = L.choropleth(geoJsonData, {
      // Define which property in the features to use.
      valueProperty: function (feature){        
        if (metrics=="total_2018")          
          return Math.round(feature.properties.CUSTOM.total_2018/feature.properties.CUSTOM.POPULATION_25_PLUS * 100000);       
        else if (metrics=="total_2019")          
          return Math.round(feature.properties.CUSTOM.total_2019/feature.properties.CUSTOM.POPULATION_25_PLUS * 100000);       
        else if (metrics=="total_2020")
          return Math.round(feature.properties.CUSTOM.total_2020/feature.properties.CUSTOM.POPULATION_25_PLUS * 100000);
        else if (metrics=="masters")      
          return feature.properties.CUSTOM.MASTERS;
        else if (metrics=="bachelor")      
          return feature.properties.CUSTOM.BACHELOR;
        else if (metrics=="high_school")      
          return feature.properties.CUSTOM.HIGH_SCHOOL;
        else        
          return feature.properties.CUSTOM.MEDIAN_HOUSEHOLD_INCOME;
      },        
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

    let legendTitle = "";
    if (metrics=="total_2018")          
      legendTitle = "2018 Crime Rate"
    else if (metrics=="total_2019")          
      legendTitle = "2019 Crime Rate"
    else if (metrics=="total_2020") 
      legendTitle = "2020 Crime Rate"
    else if (metrics=="masters")
      legendTitle = "Pop with Masters Edu"
    else if (metrics=="bachelor")      
      legendTitle = "Pop with BACHELAR Edu"
    else if (metrics=="high_school")      
      legendTitle = "Pop with High School Edu"
    else        
      legendTitle = "Median Household Income"
    // Add the minimum and maximum.    
    let legendInfo = `<h1>${legendTitle}</h1>` +
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

  info.onAdd = function (map) {
    this._div = L.DomUtil.create('div', 'info');
    this.update();
    return this._div;
  };
  
  info.update = function (props) {
    const contents = props?`<table><thead>
      <tr>
        <th>${props.COUNTY_LABEL}</th>      
      </tr>
     </thead>
     <tbody>
       <tr> 
        <td>Polulation 25+</td>
        <td>${formatNum(props.CUSTOM.POPULATION_25_PLUS)}</td>
       </tr>
       <tr> 
        <td>Median Household Income</td>
        <td>$${formatNum(props.CUSTOM.MEDIAN_HOUSEHOLD_INCOME)}</td>
       </tr>
       <tr> 
        <td>Population with High School Education</td>
        <td>${formatNum(props.CUSTOM.HIGH_SCHOOL)}</td>
       </tr>
       <tr> 
        <td>Polulation with BACHELOR Education</td>
        <td>${formatNum(props.CUSTOM.BACHELOR)}</td>
       </tr>
       <tr> 
        <td>Polulation with MASTERS Education</td>
        <td>${formatNum(props.CUSTOM.MASTERS)}</td>
       </tr>
       <tr> 
        <td>Polulation with DOCTORATE Education</td>
        <td>${formatNum(props.CUSTOM.DOCTORATE)}</td>
       </tr>
       <tr> 
        <td>2018 Reported Crime/Crime Rate</td>
        <td>${formatNum(props.CUSTOM.total_2018)}/${formatNum(props.CUSTOM.total_2018/props.CUSTOM.POPULATION_25_PLUS* 100000)}</td>
       </tr>
       <tr> 
        <td>2019 Reported Crime/Crime Rate</td>
        <td>${formatNum(props.CUSTOM.total_2019)}/${formatNum(props.CUSTOM.total_2019/props.CUSTOM.POPULATION_25_PLUS* 100000)}</td>
       </tr>
       <tr> 
        <td>2020 Reported Crime/Crime Rate</td>
        <td>${formatNum(props.CUSTOM.total_2020)}/${formatNum(props.CUSTOM.total_2020/props.CUSTOM.POPULATION_25_PLUS* 100000)}</td>
       </tr>
      </tbody>
    </table>`: 'Hover over a county';    
    this._div.innerHTML = `${contents}`;
  };
  
  info.addTo(myMap);

  });
  
}


// global variables
// Map object
var myMap;
//The data getting from API call
var censusData;
//geoJson Layer
var geojson;
// county info table 
const info = L.control();

getCensusDataFromAPI();
createMap();



$("#metricsSelection").change(function () {           
    myMap.remove();
    createMap(this.value);
});

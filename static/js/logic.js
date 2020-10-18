// set the dimensions and margins of the graph
var margin = { top: 10, right: 100, bottom: 30, left: 60 },
  width = 1000 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

// Possible Selections from DropDown Menu
var prettyAttributes = ["Select Attribute","HP", "Attack", "Defense", "Special Attack", "Special Defense","Speed"]

// column names (maybe I'll figure out how to do the pretty selections later. Right now, I just need a chart that updates)
var xAttribute = ["HP", "Attack", "Defense", "Sp_Atk", "Sp_Def","Speed"]

// append the chart as an SVG to the body of the page
var svg = d3.select("#scatter")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform",
    "translate(" + margin.left + "," + margin.top + ")");

//Read the data
d3.csv("data/winning_ratio.csv", function (data) {
  
  // add the options to the button
  d3.select("#selectButton")
    .selectAll('myOptions')
    .data(xAttribute)
    .enter()
    .append('option')
    .text(function (d) { return d; }) // text showed in the menu
    .attr("value", function (d) { return d; }) // corresponding value returned by the button
   

  // Add X axis
  var x = d3
    .scaleLinear()
    .domain([0, 260])
    .range([0, width]);

  svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  // Add Y axis
  var y = d3
    .scaleLinear()
    .domain([0, 100])
    .range([height, 0]);

  svg.append("g")
    .call(d3.axisLeft(y));

//custom colorscale
    var colorscale = d3.scaleOrdinal() // D3 Version 4
    .domain(["Normal", "Fire", "Water", "Electric","Grass","Ice", "Fighting","Poison","Ground","Flying","Psychic","Bug","Rock","Ghost","Dragon","Dark","Steel", "Fairy"])
    .range(["#A8A77A", "#EE8130","#6390F0","#F7D02C","#7AC74C","#96D9D6", "#C22E28", "#A33EA1", "#E2BF65", "#A98FF3", "#F95587", "#A6B91A", "#B6A136", "#735797", "#6F35FC", "#705746","#B7B7CE", "#D685AD"]);

  // Tooltip instantiate
  var tooltip = d3.select("#scatter").append("div")
      .attr("class", "tooltip")
      .style("opacity", 0);

  // tooltip mouseover event handler
  var tipMouseover = function(d) {
    var color = colorscale(d.Type_1);
    var html  = d.Name + ", #" + d.Num + "<br> <span style='color:" + color + ";'>" + "Primary Type: " + d.Type_1 + "</span></br>";

      tooltip.html(html)
          .style("left", (d3.event.pageX + 15) + "px")
          .style("top", (d3.event.pageY - 28) + "px")
        .transition()
          .duration(200) // ms
          .style("opacity", .9) // started as 0!

  };
  // tooltip mouseout event handler
  var tipMouseout = function(d) {
      tooltip.transition()
          .duration(300) // ms
          .style("opacity", 0); // don't care about position!
  };

  // Initialize dots with first attribute
  var dot = svg
    .selectAll('circle')
    .data(data)
    .enter()
    .append('circle')
    .attr("cx", function (d) { return x(+d.HP) })
    .attr("cy", function (d) { return y(+d.Winning_Perc) })
    .attr("r", 7)
    .style("fill", function(d) { return colorscale(d.Type_1); })
      .on("mouseover", tipMouseover)
      .on("mouseout", tipMouseout);

//A function that updates the chart
function update(selectedGroup) {

  // Create new data with the selection?
  var dataFilter = data.map(function(d){return {x:d[selectedGroup], y:d.Winning_Perc} })

  // Give these new data to update dots
  dot
    .data(dataFilter)
    .transition()
    .duration(1000)
      .attr("cx", function(d) { return x(+d.x); })
      .attr("cy", function(d) { return y(+d.y); })
}

    // When the button is changed, run the updateChart function
    d3.select("#selectButton").on("change", function(d) {
        // recover the option that has been chosen
        var selectedOption = d3.select(this).property("value")
        // run the updateChart function with this selected option
        update(selectedOption)
    })

  })
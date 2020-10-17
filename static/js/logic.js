// set the dimensions and margins of the graph
var margin = { top: 10, right: 100, bottom: 30, left: 60 },
  width = 1000 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

// Possible Selections from DropDown Menu
var xAttribute = ["Select Attribute","HP", "Attack", "Defense", "Speed", "Special Attack", "Special Defense"]

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

  // Initialize dots with first attribute
  var dot = svg
    .selectAll('circle')
    .data(data)
    .enter()
    .append('circle')
    .attr("cx", function (d) { return x(+d.HP) })
    .attr("cy", function (d) { return y(+d.Winning_Perc) })
    .attr("r", 7)
    .style("fill", "#FAD61D")


//get the chart to update where it is getting the x values

//A function that update the chart
function update(selectedGroup) {

  // Create new data with the selection?
  var dataFilter = data.map(function(d){return {x:d[selectedGroup], y:d.Winning_Perc} })

  // Give these new data to update dots
  dot
    .data(dataFilter)
    .transition()
    .duration(1000)
      .attr("cx", function(d) { return x(+x); })
      .attr("cy", function(d) { return y(+y); })
}

    // When the button is changed, run the updateChart function
    d3.select("#selectButton").on("change", function(d) {
        // recover the option that has been chosen
        var selectedOption = d3.select(this).property("value")
        // run the updateChart function with this selected option
        update(selectedOption)
    })

  })
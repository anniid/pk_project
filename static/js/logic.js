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
  
  //create a var for the primary type just to see if that helps.
  var primary = data.Type_1
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
  var tip = d3.tip()
  .attr("class", "d3-tip")
  .offset([-10, 0])
  .html(function(d) {
      return "<b>" + d.Name + ", #" + d.Num + "<br> Primary Type: " + "<span style='color:" + colorscale(d.Type_1) + ";'>" + d.Type_1 + "</span></br></b>";
  });
  svg.call(tip);
  
  // Initialize dots with first attribute
  var dot = svg
    .selectAll('dot')
    .data(data)
    .enter()
    .append('circle')
    .classed('dot', true)
    .attr("cx", function (d) { return x(+d.HP) })
    .attr("cy", function (d) { return y(+d.Winning_Perc) })
    .attr("r", 7)
    .style("fill", function(d) { return colorscale(d.Type_1); })
      .on("mouseover", tip.show)
      .on("mouseout", tip.hide)
  //legend
  var clicked = ""
  var legend = svg.selectAll(".legend")
      .data(colorscale.domain())
      .enter().append("g")
      .classed("legend", true)
      .attr("transform", function(d, i) {
          return "translate(0," + i * 20 + ")";
      });
  legend.append("rect")
      .attr("x", width + 10)
      .attr("width", 12)
      .attr("height", 12)
      .style("fill", function(d) { return colorscale(d); });

      legend.on("click", function(type) {
        // dim all of the icons in legend
        d3.selectAll(".legend")
            .style("opacity", 0.1);
        // make the one selected be un-dimmed
        d3.select(this)
            .style("opacity", 1);
        // select all dots and apply 0 opacity (hide)
        d3.selectAll(".dot")
        // .transition()
        // .duration(500)
        .style("opacity", 0.0)
        // filter out the ones we want to show and apply properties
        .filter(function(d) {
            return d["Type_1"] == type;
        })
        .style("opacity", 1) // need this line to unhide dots
        .style("stroke", "black")
        // apply stroke rule
        .style("fill", function(d) {
            if (d.Type_1 == type) {
                return this
            } else {
                return "white"
            };
        });
    });

    legend.append("text")
        .attr("x", width + 25)
        .attr("dy", ".65em")
        .text(function(d) { return d; });
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
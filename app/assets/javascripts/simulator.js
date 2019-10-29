$(function() {
  $('[data-toggle="tooltip"]').tooltip();

  $('.chart').easyPieChart({
    barColor: "#f58531",
    trackColor: "#b5b5b5",
    scaleColor: false,
    lineWidth: 25,
    lineCap: "butt",
    size: 180,
  });

  $('.chart-parent').easyPieChart({
    barColor: "#7ecdc0",
    trackColor: "#b5b5b5",
    scaleColor: false,
    lineWidth: 25,
    lineCap: "butt",
    size: 180,
  })
});

function updateBooks(select) {
  let selectedOption = select.options[select.selectedIndex];

  let legendHigh = selectedOption.getAttribute("data-legend-high");
  let legendMedium = selectedOption.getAttribute("data-legend-medium");
  let legendLow = selectedOption.getAttribute("data-legend-low");
  let image = selectedOption.getAttribute("data-image");

  document.getElementById("legend-high").innerHTML = legendHigh;
  document.getElementById("legend-medium").innerHTML = legendMedium;
  document.getElementById("legend-low").innerHTML = legendLow;
  document.getElementById("education-books").src = image;
}

function delete_cookie() {
  document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  location.replace('/');
}

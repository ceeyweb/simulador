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

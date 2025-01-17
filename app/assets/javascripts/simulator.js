function updateBooks(select) {
  let selectedOption = select.options[select.selectedIndex];
  let image = selectedOption.getAttribute("data-image");

  document.getElementById("education-books").src = image;
}

function deleteCookie() {
  document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  window.location.replace('/');
}

function displayFinishModal() {
  Rails.ajax({
    url: "/simulator/finish",
    type: "GET",
    success: function(data) {
      $(".body-main").css("z-index", "auto");
      $("#finishModal").html(data.html);
      $("#finishModal").modal("show");
    }.bind(this),
  });
}

function redirectUser(select) {
  select.disabled = true;

  let value = parseInt(select.options[select.selectedIndex].value);
  let location = "";

  if(value > 14 && value < 25) {
    location = "/questions/start?age=" + value;
  } else {
    location = "/";
  }

  window.location.replace(location);
}

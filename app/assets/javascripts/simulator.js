function updateBooks(select) {
  let selectedOption = select.options[select.selectedIndex];
  let image = selectedOption.getAttribute("data-image");

  document.getElementById("education-books").src = image;
}

function deleteCookie() {
  document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  location.replace('/');
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

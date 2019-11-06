function updateBooks(select) {
  let selectedOption = select.options[select.selectedIndex];
  let image = selectedOption.getAttribute("data-image");

  document.getElementById("education-books").src = image;
}

function delete_cookie() {
  document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  location.replace('/');
}

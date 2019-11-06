class Slider {
  constructor() {
    this.slider = document.querySelector("[data-behavior='slider']");
    this.image = document.querySelector("[data-behavior='slider-image']");

    if (this.slider) {
      this.slider.addEventListener("click", function(event) {
        let selectedValue = parseInt(event.target.getAttribute("data-value"));

        if (event.target.getAttribute("data-behavior") === "slider-enabled") {
          this.updateSlider(event, selectedValue);
          this.updateImage(selectedValue);
          this.updateKpis(selectedValue);
        }
      }.bind(this), false);
    }
  }

  updateSlider(event, selectedValue) {
    event.
      currentTarget.
      querySelectorAll("[data-behavior='slider-enabled']").
      forEach(function(section) {
        let sectionValue = parseInt(section.getAttribute("data-value"));

        if(sectionValue > selectedValue) {
          section.classList.remove("slider__section--selected");
        } else {
          section.classList.add("slider__section--selected");
        }

        section.innerHTML = "";
      });

    event.target.innerHTML = "<div class='slider__thumb'></div>";
  }

  updateImage(selectedValue) {
    let partial_name = this.image.src.split(".png")[0].slice(0, -1);

    this.image.src = partial_name + selectedValue + ".png";
  }

  updateKpis(value) {
    let section = this.slider.getAttribute("data-section");

    Rails.ajax({
      url: "/kpis/" + section + "?education_level_id=" + value,
      type: "get",
      success: function(data) {
        let kpis = this.slider.getAttribute("data-kpis").split(",");

        kpis.forEach(function (item) {
          document
            .getElementById(item)
            .innerHTML = data[item.replace(/-/g, "_")].toLocaleString();
        });
      }.bind(this),
    });
  }
}

document.addEventListener("turbolinks:load", function() {
  new Slider();
});

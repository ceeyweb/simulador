class Slider {
  constructor() {
    this.slider = document.querySelector("[data-behavior='slider']");
    this.image = document.querySelector("[data-behavior='slider-image']");
    this.refresh = document.querySelector("[data-behavior='slider-refresh']");

    if(this.refresh) {
      this.refresh.addEventListener("click", function(event) {
        this.updateAll(
          this.slider,
          parseInt(this.refresh.getAttribute("data-value"))
        );
      }.bind(this), false);
    }

    if(this.slider) {
      this.slider.addEventListener("click", function(event) {
        let section = event.target;
        let selectedValue = parseInt(section.getAttribute("data-value"));

        if(section.getAttribute("data-behavior") === "slider-enabled") {
          this.updateAll(event.currentTarget, selectedValue);
        }
      }.bind(this), false);
    }
  }

  updateAll(target, selectedValue) {
    this.updateSlider(target, selectedValue);
    this.updateImage(selectedValue);
    this.updateKpis(selectedValue);
  }

  updateSlider(target, selectedValue) {
    console.log(selectedValue);
    target.
      querySelectorAll("[data-behavior='slider-enabled']").
      forEach(function(section) {
        let sectionValue = parseInt(section.getAttribute("data-value"));

        if(sectionValue > selectedValue) {
          section.classList.remove("slider__section--selected");
        } else {
          section.classList.add("slider__section--selected");
        }

        if(sectionValue === selectedValue) {
          section.innerHTML = "<div class='slider__thumb'></div>";
        } else if(selectedValue === 0 && sectionValue === 1) {
          section.innerHTML = "<div class='slider__thumb slider__thumb--left'></div>";
        } else {
          section.innerHTML = "";
        }
      });
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

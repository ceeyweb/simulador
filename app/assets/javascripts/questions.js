class Questions {
  constructor(element) {
    let id = element.getAttribute('data-id');
    let trigger = element.querySelector("[data-behavior='questions-trigger']");

    this.questions = document.querySelectorAll("[data-behavior='questions-" + id + "']");
    this.hidden = true;


    trigger.addEventListener("change", function(event) {
      let action = event.target.getAttribute("data-action")

      if (action === "show" && this.hidden) {
        this.show();
      } else if (action === "hide" && !this.hidden) {
        this.hide();
      }
    }.bind(this), false);
  }

  show() {
    if (this.hidden) {
      this.questions.forEach(function (question) {
        question.classList.remove("hidden");
      });

      this.hidden = false;
    }
  }

  hide() {
    if (!this.hidden) {
      this.questions.forEach(function (question) {
        question.classList.add("hidden");
      });

      this.hidden = true;
    }
  }
}

document.addEventListener("turbolinks:load", function() {
  let questions = document.querySelectorAll("[data-behavior='questions']");

  if (questions) {
    questions.forEach(function(element) {
      new Questions(element);
    });
  }
});

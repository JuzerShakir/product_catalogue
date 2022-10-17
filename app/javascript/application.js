// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery";
import "@nathanvda/cocoon";

// $("form").on("click", ".add_fields", function (event) {
//   let regexp, time;
//   time = new Date().getTime();
//   regexp = new RegExp($(this).data("id"), "g");
//   $(".fields").append($(this).data("fields").replace(regexp, time));
//   return event.preventDefault();
// });

// const add_fields = document.querySelector(".add_fields");
// const fields = document.querySelector(".fields");

// add_fields.addEventListener("click", function (e) {
//   e.preventDefault();
//   // console.log("Hi");
//   const time = new Date().getTime();
//   const regexp = new RegExp($(this).data("id"), "g");
//   fields.append(this.data("fields").replace(regexp, time));
// });

$(document).on('turbolinks:load', function () {
  $(".answer-question").click(function() {
    $(".answer-form").removeClass("hidden");
    $(".answer-question").addClass("hidden");
    event.preventDefault();
  });
});
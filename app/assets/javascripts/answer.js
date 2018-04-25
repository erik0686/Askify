$(document).on('turbolinks:load', function () {
  $(".answer-question").click(function() {
    $(".answer-form").removeClass("hidden");
    $(".answer-question").addClass("hidden");
    event.preventDefault();
  });

  $("#cancel-write-answer").click(function(){
    event.preventDefault();
    $(".answer-question").removeClass("hidden");
    $(".answer-form").addClass("hidden");
  })
});


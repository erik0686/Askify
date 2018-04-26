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
  });

  $(".btn-reply").click(function() {
    var answerId = $(this).attr('id').replace("btn-reply-","");
    $("#reply-container-" + answerId).removeClass("hidden");
    event.preventDefault();
  });

  $(".textarea-new-comment").on('keypress', (e) => {
    if (e.key == 'Enter'){
      event.preventDefault();
      var answerId = e.target.id.replace("textarea-comment-","");
      submitForm(answerId);
    }
  });

  $(".cancel-write-comment").click(function(){
    event.preventDefault();
    var answerId = $(this).attr('id').replace("cancel-comment-","");
    $("#reply-container-" + answerId).addClass("hidden");
  })

  $(".submit-comment").click(function(){
    event.preventDefault();
    var answerId = $(this).attr('id').replace("submit-comment-","");
    return submitForm(answerId);
  })
});

function submitForm (answerId) {
  var comment_text = $("#textarea-comment-" + answerId).text();
  $("#answer-comment-" + answerId).val(comment_text);

  var text = $("#answer-comment-" + answerId).val();
  $("#form-comment-" + answerId).submit();
  return true;
}

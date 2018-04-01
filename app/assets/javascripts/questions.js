function newQuestionFirst() {
  $('#new-question-modal-title').text("Choose a category:");
  $('#new-question-modal-body-footer').html($("#new-question-first-body").html());
}

function newQuestionSecond(alreadyInSecondModal) {
  $('#new-question-modal-title').text("Type a topic for your question:" );
  
  if (!alreadyInSecondModal){
    // $('#new-question-modal-body-footer').html($("#new-question-second-body").html());
    if ($("#new-question-modal-body-footer").find("#new-question-second-body-content").length == 0 ) {
      $('#new-question-modal-body-footer').append($("#new-question-second-body").html());
      $('#new-question-first-body-content').hide();
    }
  }

  $('.new-question-topic').show();
  $('.new-question-question').hide();
  $('.new-question-topic > #topic_name').focus();

  
  $("#topic_name").autocomplete({
    source: $('#topic_name').data('autocomplete-source')
  });

  $('#create-new-question-form').attr('autocomplete', 'off');

}

function newQuestionThird() {
  $('#new-question-modal-title').text("Now type what you want to ask:" );
  // $('#new-question-modal-body-footer').html($("#new-question-second-body").html());
  $('.new-question-topic').hide();
  $('.new-question-question').show();
  $('.new-question-question > #question_title').focus();
}

$(document).on('turbolinks:load', function () {

  $("#new-question-modal").on("show.bs.modal", function () {
    newQuestionFirst();
  });

  $(document).on('click',".card-category", function(e) {
    newQuestionSecond(false);
  });

  $(document).on('click',".new-question-topic > .btn-back", function() {
    newQuestionFirst();
  });

  $(document).on('click',".new-question-topic > .btn-continue", function() {
    newQuestionThird();
  });

  $(document).on('click', ".new-question-question > .btn-back", function () {
    newQuestionSecond(true);
  });

  $(document).on('click', ".new-question-question > .btn-continue", function () {
    console.log("question created!");
  });

});
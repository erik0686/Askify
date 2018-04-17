function newQuestionFirst() {
  $('#new-question-modal-title-1').text("Choose a category");
  $('#new-question-modal-body-footer').html($("#new-question-first-body").html());
}

function newQuestionSecond(alreadyInSecondModal) {
  $(".new-question-topic > .btn-continue").hide();
  
  $('#new-question-modal-title').text("Type a topic for your question");
  $('#new-question-modal-title-1').text("");
  
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
    source: $('#topic_name').data('autocomplete-source'),
    minLength: 0,
    delay: 0,
    select: function(event, ui) {
      validateTopic(ui.item.value);      
    }
  });

  $('#create-new-question-form').attr('autocomplete', 'off');

}

function newQuestionThird() {
  $('div.new-question-question > #question_title').attr('required', 'required');
  $('div.new-question-question > #question_text').attr('required', 'required');
  $('#new-question-modal-title').text("Now type what you want to ask" );
  $('#new-question-modal-title-1').text("");
  $('.new-question-topic').hide();
  $('.new-question-question').show();
  $('.new-question-question > #question_title').focus();
}

function validateTopic(value) {
  var widgetOpen = $($('#topic_name').autocomplete('widget')).is(':visible');

  $("#topic_name").autocomplete("search", value);

  var options = $('#topic_name').autocomplete("widget").children().children().map(function () {
    return this.outerText
  });

  if (widgetOpen)
    $("#topic_name").autocomplete("close");
  
  if ($.inArray(value, options) != -1) {
    $(".new-question-topic > .btn-continue").show();
    return true;
  } else {
    $(".new-question-topic > .btn-continue").hide();
    return false;      
  }
  
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
  });

  $(document).on('input', "#topic_name", function () {
    validateTopic(this.value);
  });

  $(document).on('keypress', "#topic_name", function (e) {
    if (e.which == 13) {
      $('div.new-question-question > #question_title').removeAttr('required');
      $('div.new-question-question > #question_text').removeAttr('required');

      if (validateTopic($('#topic_name').val())) {
        newQuestionThird();
        return false;
      } else if ($('#topic_name').val() != "") {
        return false;
      }
    }
  });

  $(document).on('keydown', "#topic_name", function (e) {
    if (e.which == 37 || e.which == 39) {
      if ($('.ui-state-active').size() == 1) {
        validateTopic($('.ui-state-active').text());
      }
    }
  });

});
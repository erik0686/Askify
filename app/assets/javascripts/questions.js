function insertParam(key, value) {
  key = encodeURI(key); value = encodeURI(value);

  var kvp = document.location.search.substr(1).split('&');

  var i = kvp.length; var x; while (i--) {
    x = kvp[i].split('=');

    if (x[0] == key) {
      x[1] = value;
      kvp[i] = x.join('=');
      break;
    }
  }

  if (i < 0) { kvp[kvp.length] = [key, value].join('='); }

  //this will reload the page, it's likely better to store this until finished
  document.location.search = kvp.join('&');
}

function newQuestionFirst() {
  $('#new-question-modal-title').text("Choose a category:");
  $('#new-question-modal-body-footer').html($("#new-question-first-body").html());
}

function newQuestionSecond() {
  $('#new-question-modal-title').text("Type a topic for your question:" );
  $('#new-question-modal-body-footer').html($("#new-question-second-body").html());
  $('#new-question-topic-input').focus();    
}

function newQuestionThird() {
  $('#new-question-modal-title').text("Now type what you want to ask:" );
  $('#new-question-modal-body-footer').html($("#new-question-third-body").html());
  $('#new-question-question-input').focus();    
}

$(document).on('turbolinks:load', function () {

  $("#new-question-modal").on("show.bs.modal", function () {
    //newQuestionFirst();
  });

  $(document).on('click',".col-category>a", function(e) {
    e.preventDefault();
    newQuestionSecond();
  });

  $(document).on('click',"#btn-new-question-show-categories", function() {
    newQuestionFirst();
  });

  $(document).on('click',"#btn-new-question-ask-question", function() {
    newQuestionThird();
  });

  $(document).on('click', "#btn-new-question-select-topic", function () {
    newQuestionSecond();
  });

});
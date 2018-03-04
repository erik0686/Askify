$(document).ready(function () {
  $("#new-question-second").on("shown.bs.modal", function () {
    document.activeElement.blur();
    $("#question-modal-input").focus();
  });
});

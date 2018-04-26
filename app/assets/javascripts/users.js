$(document).on('ready', function () {
  //reloadUserPage();
  jQuery(".best_in_place").best_in_place();
  $('#updateChangesBut').hide();
  $('.file-upload').on('change', function() {
    $('#updateChangesBut').show();
    $("#saveChangesBut").hide();
  });

});

$(document).on('turbolinks:load', function () {
  //file upload
  $("#change-profile-button").on('change', (e) => {
    var fileName = e.target.files[0].name;

    //submit form for photo
    $("#form-update-user").submit();
    return true;
});

  $('.file-upload').on('change', function() {
    $('#updateChangesBut').show();
    $("#saveChangesBut").hide();
  });

  $('#updateChangesBut').hide();
  $(".profile-details").click(function() {
    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-information-tab").show();
    $(".suggested-topics-tab").hide();
    $( "#editProfileBut" ).show();
    $( "#saveChangesBut" ).hide();
    $( "#bottomSaveChangesBut" ).hide();
    $('#updateChangesBut').hide();

    $(".static-field").removeClass("hidden");
    $(".static-field").addClass("showing");

  });
  $(".my-questions").click(function() {
    $(".user-questions-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-answers-tab").hide();
    $(".suggested-topics-tab").hide();
    $(".user-questions-tab").show();
    $( "#editProfileBut" ).hide();
    $('#updateChangesBut').hide();
    hideUpdateFields();

  });

  $(".my-answers").click(function() {
    $(".user-answers-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".suggested-topics-tab").hide();
    $(".user-answers-tab").show();
    $( "#editProfileBut" ).hide();
    $('#updateChangesBut').hide();
    hideUpdateFields();

  });

  $(".suggested-topics").click(function() {
    $("#bottomSaveChangesBut" ).hide();
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $("#editProfileBut" ).hide();
    $('#updateChangesBut').hide();
    $("#saveChangesBut" ).hide();
    $(".editable-field").addClass("hidden");
    $(".editable-field").removeClass("showing");

    $(".suggested-topics-tab").show();
  });

  reloadUserPage();
});

function reloadUserPage(){
  $( ".form-control.editProfile" ).focusin(function() {
    $(this).parent().parent().parent()
    .addClass("cardWithFocus");
  });

  $( "#saveChangesBut" ).hide();
  $( "#bottomSaveChangesBut" ).hide();
  $( "#deleteProfileBut" ).show();
  $( "#editProfileBut" ).show();

  $( "#editProfileBut").click(function() {
    event.preventDefault()
    showEditableFields();
  });

  $( "#saveChangesBut").click(function() {
    event.preventDefault()
    saveData();
  });

  $( "#bottomSaveChangesBut").click(function() {
    event.preventDefault()
    saveData();
  });

  $( "#deleteProfileBut" ).click(function() {
    event.preventDefault()
  });

  $( ".form-control.editProfile" ).focusout(function() {
    $(this).parent().parent().parent()
    .removeClass("cardWithFocus");
  });

  /*$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
    });*/
}

function saveData(){
  // edit html, hide fields, show form
  $( "#deleteProfileBut" ).show();
  $( "#editProfileBut" ).show();
  $( "#saveChangesBut" ).hide();
  $( "#bottomSaveChangesBut" ).hide();

  // show editable fields
  $(".hidden").toggle();
  $(".showing").toggle();
  location.reload();
}

function showEditableFields(){
  // edit html, hide fields, show form
  $( "#deleteProfileBut" ).hide();
  $( "#editProfileBut" ).hide();
  $( "#saveChangesBut" ).show();
  $( "#bottomSaveChangesBut" ).show();

  // show editable fields
  $(".editable-field").removeClass("hidden");
  $(".editable-field").addClass("showing");


  $(".static-field").addClass("hidden");
  $(".static-field").removeClass("showing");
}

function hideUpdateFields(){
  $( "#deleteProfileBut" ).show();
  $( "#saveChangesBut" ).hide();
  $( "#bottomSaveChangesBut" ).hide();

  // show editable fields
  $(".editable-field").addClass("hidden");
  $(".editable-field").removeClass("showing");
}

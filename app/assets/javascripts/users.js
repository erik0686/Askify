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
  $(".profile-details").click(function() {
    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-information-tab").show();
    $( "#editProfileBut" ).show();
    $( "#saveChangesBut" ).hide();
    $( "#bottomSaveChangesBut" ).hide();
  });
  $(".my-questions").click(function() {
    $(".user-questions-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-questions-tab").show();
    $( "#editProfileBut" ).hide();
  });

  $(".my-answers").click(function() {
    $(".user-answers-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".user-answers-tab").show();
    $( "#editProfileBut" ).hide();
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
    // edit html, hide fields, show form
    $( "#deleteProfileBut" ).hide();
    $( "#editProfileBut" ).hide();
    $( "#saveChangesBut" ).show();
    $( "#bottomSaveChangesBut" ).show();

    // show editable fields
    $(".hidden").toggle();
    $(".showing").toggle();
  });

  $( "#saveChangesBut").click(function() {
    event.preventDefault()
    // edit html, hide fields, show form
    $( "#deleteProfileBut" ).show();
    $( "#editProfileBut" ).show();
    $( "#saveChangesBut" ).hide();
    $( "#bottomSaveChangesBut" ).hide();

    // show editable fields
    $(".hidden").toggle();
    $(".showing").toggle();
    location.reload();
  });

  $( "#bottomSaveChangesBut").click(function() {
    event.preventDefault()
    // edit html, hide fields, show form
    $( "#deleteProfileBut" ).show();
    $( "#editProfileBut" ).show();
    $( "#saveChangesBut" ).hide();
    $( "#bottomSaveChangesBut" ).hide();

    // show editable fields
    $(".hidden").toggle();
    $(".showing").toggle();
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
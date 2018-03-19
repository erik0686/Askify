$(document).on('ready', function () {
  //reloadUserPage();
  jQuery(".best_in_place").best_in_place();
});

$(document).on('turbolinks:load', function () {
  $(".profile-details").click(function() {
    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-information-tab").show();
  });
  $(".my-questions").click(function() {
    $(".user-questions-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-questions-tab").show();
  });

  $(".my-answers").click(function() {
    console.log("ERIK");  
    $(".user-answers-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".user-answers-tab").show();
  });

  $( "#editProfileBut").click(function() {
    event.preventDefault();
    $(".editable-fields").css('color', 'blue');
  });
});

// function reloadUserPage(){
//   $( ".form-control.editProfile" ).focusin(function() {
//     $(this).parent().parent().parent()
//     .addClass("cardWithFocus");
//   });

//   $( "#saveChangesBut" ).hide();
//   $( "#bottomSaveChangesBut" ).hide();
//   $( "#deleteProfileBut" ).show();
//   $( "#editProfileBut" ).show();

//   $( "#editProfileBut").click(function() {
//     event.preventDefault()
//     // edit html, hide fields, show form
//     $( "#deleteProfileBut" ).hide();
//     $( "#editProfileBut" ).hide();
//     $( "#saveChangesBut" ).show();
//     $( "#bottomSaveChangesBut" ).show();

//     // show editable fields
//     $(".hidden").toggle();
//     $(".showing").toggle();
//   });

//   $( "#saveChangesBut").click(function() {
//     event.preventDefault()
//     // edit html, hide fields, show form
//     $( "#deleteProfileBut" ).show();
//     $( "#editProfileBut" ).show();
//     $( "#saveChangesBut" ).hide();
//     $( "#bottomSaveChangesBut" ).hide();

//     // show editable fields
//     $(".hidden").toggle();
//     $(".showing").toggle();
//   });

//   $( "#bottomSaveChangesBut").click(function() {
//     event.preventDefault()
//     // edit html, hide fields, show form
//     $( "#deleteProfileBut" ).show();
//     $( "#editProfileBut" ).show();
//     $( "#saveChangesBut" ).hide();
//     $( "#bottomSaveChangesBut" ).hide();

//     // show editable fields
//     $(".hidden").toggle();
//     $(".showing").toggle();
//   });

//   $( "#deleteProfileBut" ).click(function() {
//     event.preventDefault()
//   });

//   $( ".form-control.editProfile" ).focusout(function() {
//     $(this).parent().parent().parent()
//     .removeClass("cardWithFocus");
//   });

//   /*$('.datepicker').pickadate({
//     selectMonths: true, // Creates a dropdown to control month
//     selectYears: 15, // Creates a dropdown of 15 years to control year,
//     today: 'Today',
//     clear: 'Clear',
//     close: 'Ok',
//     closeOnSelect: false // Close upon selecting a date,
//     });*/
// }
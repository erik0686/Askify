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

  $(".editable-fields").focusout(function(event){
    // debugger
    if ( $(this).data("bestInPlaceEditor").getValue() == ""){
      $(".edit-error").text("Por favor no dejes el campo vacío")
      event.stopImmediatePropagation();
    }
  });
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
    //titles
    $("#profile-title").show();
    $("#my-questions-title").hide();
    $("#my-answers-title").hide();
    $("#my-topics-title").hide();

    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $(".user-information-tab").show();
    $(".suggested-topics-tab").hide();
    $(".photo_upload").show();
    $("#editProfileBut").show();
    $("#form-update-user").show();
    $( "#saveChangesBut" ).hide();
    $( "#bottomSaveChangesBut" ).hide();
    $('#updateChangesBut').hide();

    $(".static-field").removeClass("hidden");
    $(".static-field").addClass("showing");

  });
  $(".my-questions").click(function() {
    //titles
    $("#profile-title").hide();
    $("#my-questions-title").show();
    $("#my-answers-title").hide();
    $("#my-topics-title").hide();

    $(".user-questions-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-answers-tab").hide();
    $(".suggested-topics-tab").hide();
    $(".user-questions-tab").show();
    $(".photo_upload").hide();
    $("#editProfileBut").hide();
    $("#form-update-user").hide();
    $('#updateChangesBut').hide();
    hideUpdateFields();

  });

  $(".my-answers").click(function() {
    //titles
    $("#profile-title").hide();
    $("#my-questions-title").hide();
    $("#my-answers-title").show();
    $("#my-topics-title").hide();

    $(".user-answers-tab").removeClass("hidden");
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".suggested-topics-tab").hide();
    $(".user-answers-tab").show();
    $( "#editProfileBut" ).hide();
    $("#form-update-user").hide();
    $(".photo_upload").hide();
    $('#updateChangesBut').hide();
    hideUpdateFields();

  });

  $(".suggested-topics").click(function() {
    //titles
    $("#profile-title").hide();
    $("#my-questions-title").hide();
    $("#my-answers-title").hide();
    $("#my-topics-title").show();

    $("#bottomSaveChangesBut" ).hide();
    $(".user-information-tab").hide();
    $(".user-questions-tab").hide();
    $(".user-answers-tab").hide();
    $("#editProfileBut" ).hide();
    $("#form-update-user").hide();
    $(".photo_upload").hide();
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
  //titles
  $("#profile-title").show();
  $("#my-questions-title").hide();
  $("#my-answers-title").hide();
  $("#my-topics-title").hide();

  $( "#saveChangesBut" ).hide();
  $( "#bottomSaveChangesBut" ).hide();
  $( "#deleteProfileBut" ).show();
  $( "#editProfileBut" ).show();
  $("#form-update-user").show();

  $(".photo_upload").show();

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
}

function saveData(){
  // edit html, hide fields, show form
  // $( "#deleteProfileBut" ).show();
  // $( "#editProfileBut" ).show();
  // $( "#saveChangesBut" ).hide();
  // $( "#bottomSaveChangesBut" ).hide();

  // show editable fields
  // $(".hidden").toggle();
  // $(".showing").toggle();
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

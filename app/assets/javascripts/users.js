$(document).on('ready', function () {
    //reloadUserPage();
});

$(document).on('turbolinks:load', function () {
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

    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
        });
}
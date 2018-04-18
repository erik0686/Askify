function setBodyTopPadding() {
  $('body').css("padding-top", ($('#navbar').outerHeight()).toString() + "px");
}

$(document).on('turbolinks:load', function () {

  setBodyTopPadding();

  if ($("#navbar-toggler").is(":visible")) {
    $('#navbarContentCollapsable').addClass("mobile-navbar");
    $('.dropdown-non-hover').removeClass("dropdown-toggle");
  } else {
    $('#navbarContentCollapsable').addClass("desktop-navbar");
  }

  $('#navbarContentCollapsable').on('show.bs.collapse', function () {
    $('.navbar-logo-text').hide();
  });

  $('#navbarContentCollapsable').on('shown.bs.collapse', function () {
    setBodyTopPadding();
  });

  $('#navbarContentCollapsable').on('hidden.bs.collapse', function () {
    $('.navbar-logo-text').show();
    $('.dropdown-menu').removeAttr('style');
    setBodyTopPadding();
  });

  $("#navbar-toggler").hideShow(function (e, visibility) {
    var isVisible = $("#navbar-toggler").is(":visible");
    var visibilityStatus;
    if (isVisible){
      visibilityStatus = "shown";
    } else {
      visibilityStatus = "hidden";
    }
    if (visibilityStatus == "hidden") {
      $('#navbarContentCollapsable').removeClass("mobile-navbar");
      $('#navbarContentCollapsable').addClass("desktop-navbar");
      $('#navbarContentCollapsable').collapse('hide')
      $('.dropdown-non-hover').addClass("dropdown-toggle");
    } else {
      $('#navbarContentCollapsable').addClass("mobile-navbar");
      $('#navbarContentCollapsable').removeClass("desktop-navbar");
      $('.dropdown-non-hover').removeClass("dropdown-toggle");
    }
  });

  $('.dropdown-toggle').click(function (e) {
    $(this).next().removeClass('dd-menu');
    $('.dd-menu').removeAttr('style');
    $(this).next().toggle();
    $(this).next().addClass('dd-menu');
    if (!$(this).next().is(':visible')) {
      $(this).next().hide();
    }
    if ($(this).hasClass("dropdown-hover")) {
      return false;
    }

  });

  $('.dropdown-toggle').mouseenter(function() {
    if (!$("#navbar-toggler").is(":visible")) {
      $(".dd-menu").not($(this).next()).removeAttr('style');
    }
  });

});

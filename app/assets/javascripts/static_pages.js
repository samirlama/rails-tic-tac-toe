//Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load', function () {
    $('.username-uparrow').on('click', function () {
        $(this).hide();
        $('.username-downarrow').show();

    });
    $('.username-downarrow').on('click', function () {
        $(this).hide();
        $('.username-uparrow').show();

    })
    $('.win-uparrow').on('click', function () {
        $(this).hide();
        $('.win-downarrow').show();

    });
    $('.win-downarrow').on('click', function () {
        $(this).hide();
        $('.win-uparrow').show();

    });

})
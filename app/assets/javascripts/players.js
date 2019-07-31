// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
    $("#select_all").on('click', function () {
        if ($(this).hasClass("toggle-check")) {
            $('input[type=checkbox]').prop('checked', true);
            $(this).prop('checked', true);
            $(this).removeClass("toggle-check");
        } else {
            $('input[type=checkbox]').removeProp('checked');
            $(this).addClass("toggle-check");
        }
    })
    for (let i = 0; i < $('.player-status').length; i++) {
        if ($('.player-status').eq(i).text() == "Active") {
            $('.player-status').eq(i).css("color", "green");
        } else {
            $('.player-status').eq(i).css("color", "red");
        }
    }
})
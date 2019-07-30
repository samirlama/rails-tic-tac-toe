// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
    var $tr_tag = $('.sort-tr-tag')
    var $container = $('tbody');
    $(".sort-tr-tag").sort(function (a, b) {
        a = parseFloat($("td", a).text()); // get the value of .score element inside a
        b = parseFloat($("td", b).text()); // get the value of .score element inside b
        return b - a; // sort descendently
    }).appendTo($container);
    if ($container.length > 1) {
        for (var i = 0; i < $container.length - 1; i++) {
            $container.eq(i).addClass("hide");
        }
    }
})
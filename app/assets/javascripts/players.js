// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on('turbolinks:load', function () {
    //pagination  with remote true
    $('.pagination a').attr('data-remote', 'true');

    //all checkbox selection with selectall
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

    //activation and deactivation with ajax
    $('input[type=submit]').on('click', function (e) {
        if ($(this).hasClass('btn-success')) {
            checked = $('#player_ids_:checked');
            var ids = [];
            checked.each(function (i, e) {
                ids.push($(this).val());
            })
            $.ajax({
                url: '/players/deactivate',
                type: "PUT",
                data: {
                    player_ids: ids,
                    commit: "Deactivate"
                }
            })
        }
    })

    //text added in dropdown sort
    $('li > a').on('click', function () {
        $caret = '<span class="caret"></span>';
        var a_text = $(this).text();
        $('.dropdown-toggle').css("padding", "10px");
        $('.dropdown-toggle').text(a_text);
        $('.dropdown-toggle').append($caret);
    })

    //for toggling of button
    $("[data-toggle='toggle']").bootstrapToggle('destroy');
    $("[data-toggle='toggle']").bootstrapToggle();

    //palyer status changed with toggle button with ajax
    $(document).on('click', '.toggle', function () {

        self = this
        var user_name = $(this).closest('.player-status').siblings('.player-name').text();
        if ($(this).closest('.player-status').find('span').text() == "Active") {

            $.ajax({
                    url: "/players/update_status",
                    type: "PUT",
                    data: {
                        status: false,
                        username: user_name
                    }
                })
                .done(function () {
                    $(self).closest('.player-status').children('span').text("Inactive")
                    $(self).closest('.player-status').children('span').removeClass().addClass('inactive');
                })


        } else {

            $.ajax({
                    url: "/players/update_status",
                    type: "PUT",
                    data: {
                        status: true,
                        username: user_name
                    }
                })
                .done(function () {
                    $(self).closest('.player-status').children('span').text("Active");
                    $(self).closest('.player-status').children('span').removeClass().addClass('active');
                })
        }
    })
});
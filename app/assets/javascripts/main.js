var player1_moves = [];
var player2_moves = [];
var active_player;
var game_player1;
var game_player2;
var player1;
var player2;
var game_active_player = [];
var all_moves = [];
var goals = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
]
game_status = false


// var count = 0;


// $(document).on('click', '.block', function () {
//     setTimeout(function () {
//        
//     }, 100)

$(function () {
    setInterval(function () {
        player1 = $('.player1').text();
        console.log(player1);
        if (game_status == false) {
            $.ajax({
                url: "/moves.json",
                success: function (data) {
                    $('#player').text(data.all_data.active_player)
                    active_player = data.all_data.active_player;
                    game_player1 = data.all_data.player1;
                    game_player2 = data.all_data.player2;
                    // if (!game_active_player.includes(game_player1) || !game_active_player.includes(game_player2)) {
                    //     game_active_player.push(game_player1);
                    //     game_active_player.push(game_player2);
                    // }
                    if (game_player1 == game_player2) {
                        $('.player-status').text("Waiting");
                    } else {
                        $('.player-status').text("Game Started");
                    }

                    console.log(window.localStorage.getItem("player"));


                    console.log("Players" + game_active_player);
                    data.all_data.move.forEach(function (d) {
                        if (!all_moves.includes(d.step)) {
                            all_moves.push(d.step);
                            if (data.all_data.move.length % 2 != 0) {
                                if (!player1_moves.includes(d.step) && !player2_moves.includes(d.step)) {
                                    player1_moves.push(d.step)
                                    console.log("player1" + player1_moves);
                                    if (player1_moves.length >= 1) {
                                        console.log("enter1");
                                        player1_moves.forEach(function (f) {
                                            $data_id = f;
                                            // $block = $('.block').attr("data-id", $data_id);
                                            $block = $(".block[data-id='" + $data_id + "']")[0];
                                            $($block).html("X");
                                        })
                                    }
                                    for (var i = 0; i < 8; i++) {
                                        count = 0;
                                        for (var j = 0; j < 3; j++) {
                                            if (player1_moves.includes(goals[i][j])) {
                                                count++;
                                            }

                                        }
                                        if (count == 3) {
                                            game_status = true;
                                            $('#won-status').text(data.all_data.player1 + "won");
                                            $('#player').hide();
                                            $('#modal-btn').trigger("click");
                                            $('.modal-title').text(data.all_data.player1 + " won");
                                        }
                                    }
                                    if (all_moves.length == 9 && game_status == false) {
                                        $('#player').hide();
                                        $('#modal-btn').trigger("click");
                                        $('.modal-title').text("It's a draw");
                                    }
                                }
                            } else {
                                if (!player2_moves.includes(d.step) && !player1_moves.includes(d.step)) {
                                    player2_moves.push(d.step)
                                    console.log("player2" + player2_moves)
                                    if (player2_moves.length >= 1) {
                                        player2_moves.forEach(function (f) {
                                            $data_id = f;
                                            // $block = $('.block').attr("data-id", $data_id);
                                            $block = $(".block[data-id='" + $data_id + "']")[0];
                                            $($block).html("0");
                                        })
                                    }
                                    for (var i = 0; i < 8; i++) {
                                        count1 = 0;
                                        for (var j = 0; j < 3; j++) {
                                            if (player2_moves.includes(goals[i][j])) {
                                                count1++;
                                            }
                                        }
                                        if (count1 == 3) {
                                            game_status = true;
                                            $('#player').hide();
                                            $('#modal-btn').trigger("click");
                                            $('.modal-title').text(data.all_data.player2 + " won");
                                        }
                                    }
                                }
                            }
                        }
                    })
                }
            })
        }
    }, 3000);
})
// $.ajax({
//     url: "/moves.json",
//     success: function(data){
//         player1 = data.all_data.player1
//         player2 = data.all_data.player2
//         active_player = data.all_data.player1
//     }
// })




$(document).on('click', '.block', function (e) {
    // if (all_moves.length == 0 && game_player1) {
    //     window.localStorage.setItem("player", game_player1);
    // }
    if (game_player1 != game_player2) {


        player1 = $('.player1').text();
        // $(this).off(event);
        if (player1 == active_player) { //window.localStorage.getItem("player") == active_player
            if (game_status == false) {
                data_id = $(this).attr("data-id");
                $.ajax({
                    url: "/moves",
                    type: "POST",
                    data: {
                        move: {
                            step: data_id,
                        }
                    },
                    dataType: "json",
                    success: function () {

                    }
                })


            }
            // if (all_moves.length % 2 == 0) {
            //     window.localStorage.setItem("player", game_player2);
            // } else {
            //     window.localStorage.setItem("player", game_player1);
            // }

        }


    } // if (count % 2 != 0) {
    //     game_active_player[i++];
    // } else {
    //     game_active_player[i--];
    // }
})








// $.ajax({
//     url: "/moves.json",
//     success: function (data) {

//         data.forEach(function (d) {
//             if (data.length % 2 != 0) {
//                 if (!player1_moves.includes(d.step) && !player2_moves.includes(d.step)) {
//                     player1_moves.push(d.step)
//                     console.log("player1" + player1_moves);
//                     if (player1_moves.length > 1) {
//                         player1_moves.forEach(function (f) {
//                             $data_id = f;
//                             $block = $('.block').attr("data-id", $data_id);
//                             $($block).html("X")
//                         })
//                     }


//                 }
//             } else {
//                 if (!player2_moves.includes(d.step) && !player1_moves.includes(d.step)) {
//                     player2_moves.push(d.step)
//                     console.log("player2" + player2_moves)
//                     if (player2_moves.length > 1) {
//                         player2_moves.forEach(function (f) {
//                             $data_id = f;
//                             $block = $('.block').attr("data-id", $data_id);
//                             $($block).html("0");
//                         })
//                     }
//                 }
//             }
//         })
//     }

// })
// asdjadahsfksdgkfhsdlkfhsdf gsvfdnkfgidshfdshfsd

// sdfsdhfgksudfbdsf
// var player1_moves = [];
// var player2_moves = [];
// var active_player;
// var game_player1;
// var game_player2;
// var player1;
// var player2;
// var game_active_player = [];
// var all_moves = [];
// var goals = [
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8],
//     [0, 3, 6],
//     [1, 4, 7],
//     [2, 5, 8],
//     [2, 4, 6],
//     [0, 4, 8]
// ];
// var moves_count_player1;
// var moves_count_player2;
// game_status = false;
// $(function () {
//     /*
//     function gameTicTacToe(){
//         var obj  = {};

//     }

//     */
//     initInterval();
//     $('.block').on('click', registerMoves);
// });

// function blockClickOff() {
//     $('.block').off();
// }

// function blockClickOn() {
//     setTimeout(function () {
//         $('.block').on('click', registerMoves);
//     }, 3000);
// }

// function registerMoves() {
//     if (game_player1 != game_player2) {
//         player1 = $('.player').text();
//         if (player1 == active_player) { //window.localStorage.getItem("player") == active_player
//             blockClickOff();
//             if (game_status == false) {
//                 data_id = $(this).attr("data-id");
//                 $.ajax({
//                     url: "/moves",
//                     type: "POST",
//                     data: {
//                         move: {
//                             step: data_id,
//                         }
//                     },
//                     dataType: "json",
//                     success: function () {

//                     }
//                 })
//             }
//             if (player1 == game_player1) {
//                 $(this).html("X");
//             } else {
//                 $(this).html("0");
//             }
//             blockClickOn();
//         }
//     }
// }

// function updateMoves(data) {
//     data.move.forEach(function (d) {
//         if (!all_moves.includes(d.step)) {
//             all_moves.push(d.step);
//             if (data.move.length % 2 != 0) {
//                 if (!player1_moves.includes(d.step) && !player2_moves.includes(d.step)) {
//                     player1_moves.push(d.step)
//                     console.log("player1" + player1_moves);
//                     if (player1_moves.length >= 1) {
//                         console.log("enter1");
//                         player1_moves.forEach(function (f) {
//                             $data_id = f;
//                             // $block = $('.block').attr("data-id", $data_id);
//                             $block = $(".block[data-id='" + $data_id + "']")[0];
//                             $($block).html("X");
//                         })
//                     }
//                     checkWinningStatus(player1_moves, data.player1, moves_count_player1);
//                     drawStatus();

//                 }
//             } else {
//                 if (!player2_moves.includes(d.step) && !player1_moves.includes(d.step)) {
//                     player2_moves.push(d.step)
//                     console.log("player2" + player2_moves)
//                     if (player2_moves.length >= 1) {
//                         player2_moves.forEach(function (f) {
//                             $data_id = f;
//                             // $block = $('.block').attr("data-id", $data_id);
//                             $block = $(".block[data-id='" + $data_id + "']")[0];
//                             $($block).html("0");
//                         })
//                     }
//                     checkWinningStatus(player2_moves, data.player2, moves_count_player2);
//                 }
//             }
//         }
//     })
// }

// function assignPlayer(player1, player2, activeplayer) {
//     $('#player').text(activeplayer)
//     active_player = activeplayer;
//     game_player1 = player1;
//     game_player2 = player2;
//     if (game_player1 == game_player2) {
//         $('.player-status').text("Waiting");
//     } else {
//         $('.player-status').text("Game Started");
//     }
// }

// function initInterval() {
//     setInterval(function () {
//         player1 = $('.player').text();

//         if (game_status == false) {
//             $.ajax({
//                 url: "/moves.json",
//                 success: function (data) {
//                     assignPlayer(data.all_data.player1, data.all_data.player2, data.all_data.active_player)
//                     registerMoves(data.all_data);
//                 }
//             })
//         }
//     }, 1000);
// }

// function checkWinningStatus(player_moves, player, count) {
//     for (var i = 0; i < 8; i++) {
//         count = 0;
//         for (var j = 0; j < 3; j++) {
//             if (player_moves.includes(goals[i][j])) {
//                 count++;
//             }
//         }
//         if (count == 3) {
//             game_status = true;
//             $('#player').hide();
//             $('#modal-btn').trigger("click");
//             $('.modal-title').text(player + " won");
//         }
//     }
// }

// function drawStatus() {
//     if (all_moves.length == 9 && game_status == false) {
//         $('#player').hide();
//         $('#modal-btn').trigger("click");
//         $('.modal-title').text("It's a draw");
//     }
// }

$(function () {
    function GameTicTacToe() {
        // sthis.registerMoves = this.registerMoves.bind(this);
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
        ];
        var moves_count_player1;
        var moves_count_player2;
        game_status = false;

        var assignPlayer = function (player1, player2, activeplayer) {
            $('#player').text(activeplayer)
            active_player = activeplayer;
            game_player1 = player1;
            game_player2 = player2;
            if (game_player1 == game_player2) {
                $('.player-status').text("Waiting");
            } else {
                $('.player-status').text("Game Started");
            }
        }

        var updateMoves = function (data) {
            data.move.forEach(function (d) {
                if (!all_moves.includes(d.step)) {
                    all_moves.push(d.step);
                    if (data.move.length % 2 != 0) {
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
                            checkWinningStatus(player1_moves, data.player1, moves_count_player1);
                            drawStatus();

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
                            checkWinningStatus(player2_moves, data.player2, moves_count_player2);
                        }
                    }
                }
            })
        }
        this.initInterval = function () {
            setInterval(function () {
                player1 = $('.player').text();

                if (game_status == false) {
                    $.ajax({
                        url: "/moves.json",
                        success: function (data) {
                            assignPlayer(data.all_data.player1, data.all_data.player2, data.all_data.active_player);
                            updateMoves(data.all_data);
                        }
                    })
                }
            }, 1000);
        }

        var checkWinningStatus = function (player_moves, player, count) {
            for (var i = 0; i < 8; i++) {
                count = 0;
                for (var j = 0; j < 3; j++) {
                    if (player_moves.includes(goals[i][j])) {
                        count++;
                    }
                }
                if (count == 3) {
                    game_status = true;
                    $('#player').hide();
                    $('#modal-btn').trigger("click");
                    $('.modal-title').text(player + " won");
                }
            }
        }

        var drawStatus = function () {
            if (all_moves.length == 9 && game_status == false) {
                $('#player').hide();
                $('#modal-btn').trigger("click");
                $('.modal-title').text("It's a draw");
            }
        }
        var blockClickOff = function () {
            $('.block').off();
        }

        var blockClickOn = function () {
            setTimeout(function () {
                $('.block').on('click', registerMoves);
            }, 3000);
        }

        var registerMoves = function (e) {
            debugger
            console.log(e);
            if (game_player1 != game_player2) {
                player1 = $('.player').text();
                debugger
                if (player1 == active_player) { //window.localStorage.getItem("player") == active_player
                    blockClickOff();
                    // debugger
                    // if (game_status == false) {
                    data_id = $(e.currentTarget).attr("data-id");
                    console.log(data_id);
                    $.ajax({
                        url: "/moves",
                        type: "POST",
                        dataType: "JSON",
                        data: {
                            move: {
                                step: data_id
                            }
                        },
                        success: function () {

                        }
                    })

                    if (player1 == game_player1) {
                        $(e.currentTarget).html("X");
                    } else {
                        $(e.currentTarget).html("0");
                    }
                    blockClickOn();
                }
            }
        }
        $('.block').on('click', registerMoves);
    }
    const newGame = new GameTicTacToe();
    newGame.initInterval();
})
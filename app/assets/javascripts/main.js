var player1_moves = [];
var player2_moves = [];

$(document).ready(function () {
            $.ajax({
                url: "games.json",
                success: function (data) {
                    console.log(data)
                    data.forEach(function (d) {
                            console.log(data.length)
                            if (data.length % 2 != 0) {
                                localStorage.setItem('myObject1', JSON.stringify(player1_moves)
                                }
                                else {
                                    localStorage.setItem('myObject2', JSON.stringify(player2_moves)
                                    }
                                })
                        }
                    })
            })


            var myObject = JSON.parse(localStorage.getItem('myObject1'));
            console.log(myObject)
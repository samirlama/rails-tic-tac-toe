class ActiveplayersController < ApplicationController
    def update
        @active_player = Activeplayer.last
        @active_player.update(active_player_params)
        byebug
    end

    private
    def active_player_params
        params.require(:activeplayer).permit(:active_player)
    end
end

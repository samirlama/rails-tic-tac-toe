class Activeplayer < ApplicationRecord
    def update
        @active_player = Activeplayer.last.update(active_player_params)
    end
    private
    def active_player_params
        params.require(:activeplayer).permit(:active_player)
    end
end

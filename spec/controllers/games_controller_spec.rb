require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    describe "GET #index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template: index
        end
    end

    describe "GET #show" do 
        it "renders show template" do
            game = Game.new
            get :show, id: game.id
            expect(response).to render_template: show
         end
    end
end

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
    describe "GET #index" do
    it "renders the index template" do
        get :index
        expect(response).to render_template :index
    end
end
    describe "POST #create" do 
        context "with valid attribute" do
            it "creates a new post" do
                expect{
                    post :create, params: {player: FactoryGirl.attributes_for(:player)}
            }.to change(Player, :count).by(1)
            end
            it "redirects_to new_gam_path" do
                post :create , params: {player: FactoryGirl.attributes_for(:player)}
                expect(response).to redirect_to new_game_path
            end
        end
    end
end
    
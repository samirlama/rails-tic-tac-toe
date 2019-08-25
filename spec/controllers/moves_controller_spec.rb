require 'rails_helper'

RSpec.describe MovesController, type: :controller do
    
    describe "GET #index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template :index
        end 
    end
    
    describe "POST #create" do 
        context "with valid attribute" do
            it "creates new post" do
                expect{
                    move :create , move: FactoryBot.attributes_for(:move)
                }
            end
        end
    end
end

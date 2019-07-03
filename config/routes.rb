Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "players#index"
  resources "players" , only:[:index , :create]
  resources "games" , only:[:index , :create , :new , :show]
  get 'newgame' => "games#newgame"
  get "endgame" => "games#endgame"
  get "create" => "games#create", as: :create_new
  resources "moves" , only:[:index , :new , :create , :destroy]

  
end

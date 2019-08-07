Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources "static_pages" , only:[:index]
  resources :players do 
    collection do 
      put :deactivate
      put :update_status
    end
  end
  resources "games" , only:[:index , :create , :new , :show]
  get 'newgame' => "games#newgame"
  get "endgame" => "games#endgame"
  # get "create" => "games#create", as: :create_new
  resources "moves" , only:[:index , :new , :create , :destroy]
  resources "activeplayers" , only: [:update]
end

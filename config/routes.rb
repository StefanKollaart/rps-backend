Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players
  resources :games do
    get :match_or_create, on: :collection
    get :play_options, on: :collection
  end
  resources :picks
  mount ActionCable.server => '/cable'
end

Rails.application.routes.draw do
  resources :baseball_cards
  root "baseball_cards#index"
end

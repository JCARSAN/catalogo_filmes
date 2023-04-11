Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :genres
  resources :directors
  resources :films
end

Rails.application.routes.draw do
  resources :games
  resources :users
  get 'application/home'
  root 'application#home'
end

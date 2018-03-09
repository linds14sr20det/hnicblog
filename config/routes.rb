Rails.application.routes.draw do

  root   'application#home'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'
  get    '/episodes/update_feed', to: 'episodes#update_feed'
  resources :users
  resources :posts
  resources :episodes, only: [:index, :show]
  resources :password_resets, only: [:new, :create, :edit, :update]
end

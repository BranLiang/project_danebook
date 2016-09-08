Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'timeline/:id', to: 'pages#timeline', as: 'timeline'
  resources :users, only: [:show, :edit, :update, :index]
  resources :posts, except: [:new, :index]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end

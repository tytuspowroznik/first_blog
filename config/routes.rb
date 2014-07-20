Rails.application.routes.draw do

  devise_for :users
root 'home#index'

resources :posts, except: :index
resources :comments
resources :authors, only: [:show, :index, :edit]
resources :users
resources :articles, only: [:show, :index]
end

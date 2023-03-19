Rails.application.routes.draw do
 
 
  devise_for :users
  resources :users, only: [:show]   
  get 'home/index' => 'home#index'
  get 'home/link' => 'home#link'
  resources :subjects do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources:illusts do
    resources :likes, only: [:create, :destroy]
    resources :commentis, only: [:create]
  end
  root 'home#index'
end
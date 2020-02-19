Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",

  }
  root to: "exhibitions#index"

 
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  
  resources :exhibitions,only: [:index, :new, :create, :show] do
    collection do
      get 'modal'
    end
  end

  resources :cards, only: [:new, :index, :show] do
    collection do
      # post 'index', to: 'cards#index'
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :buy ,only: :index
  resources :images ,only: :index


end

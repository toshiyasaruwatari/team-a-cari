Rails.application.routes.draw do
  devise_for :users

  # controllers: {
  #   confirmations: 'users/confirmations',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }

  # devise_scope :user do
  #   get 'sign_in', to: 'users/sessions#new'
  #   get 'sign_out', to: 'users/sessions#destroy'
  #   get 'sign_up', to: 'users/registrations#new'
  # end

  root to: 'items#index'

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  get 'items/:id/buy', to: 'items#buy'

  resources :users, only: [:show, :edit, :update, :destroy]
  get 'users/:id/identify', to: 'users#identify'
  get 'users/:id/pay_way', to: 'users#pay_way'
  get 'users/:id/add_card', to: 'users#add_card'

  # get '/a', to: 'items#card'
  # get '/b', to: 'items#card_add'
  # get '/c', to: 'items#detail'
  # get '/d', to: 'items#edit'
  # get '/e', to: 'items#identification'
  # get '/f', to: 'items#item_buy'
  # get '/g', to: 'items#logout'
  # get '/h', to: 'items#mypage'
  # get '/i', to: 'items#new'

end

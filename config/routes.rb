Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get ':id/identify', to: 'users#identify'
      get ':id/pay_way', to: 'users#pay_way'
      get ':id/add_card', to: 'users#add_card'
      get ':id/logout', to: 'users#logout'
    end
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get ':id/buy', to: 'items#buy'
    end
  end
end

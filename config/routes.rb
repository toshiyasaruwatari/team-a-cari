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

  resources :items do
    collection do
      get '/:id/buy_confirm', to: 'cards#buy_confirm'
      post '/:id/buy', to: 'cards#buy'
      get '/:id/change', to: 'items#change'
    end
  end

  resources :item_images, only:[:destroy]

  resources :users, only:[:show] do
    resources :cards, only:[:index,:new, :pay]
      collection do
        post '/pay', to: "cards#pay"
      end
  end
  get '/trade/sell', to: "items#trade_sell"
  get '/trade/now', to: "items#trade_now"
  get '/trade/sold', to: "items#trade_sold"
end


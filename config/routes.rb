Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  get '/a', to: 'items#card'
  get '/b', to: 'items#card_add'
  get '/c', to: 'items#detail'
  get '/d', to: 'items#edit'
  get '/e', to: 'items#identification'
  get '/f', to: 'items#item_buy'
  get '/g', to: 'items#logout'
  get '/h', to: 'items#mypage'
  get '/i', to: 'items#new'
  get '/j', to: 'items#membership'

end

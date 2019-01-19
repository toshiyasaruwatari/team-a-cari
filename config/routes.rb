Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/a' to: 'index#card'
  get '/b' to: 'index#card_add'
  get '/c' to: 'index#detail'
  get '/d' to: 'index#edit'
  get '/e' to: 'index#identification'
  get '/f' to: 'index#item_buy'
  get '/g' to: 'index#logout'
  get '/h' to: 'index#mypage'
  get '/i' to: 'index#new'

end

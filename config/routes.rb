Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get '/a', to: 'items#resist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

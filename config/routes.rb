Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  devise_for :users
  get '/set_locale', to: 'application#set_locale'
end

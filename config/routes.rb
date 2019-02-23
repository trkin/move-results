Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get 'sign-in-development/:id', to: 'pages#sign_in_development', as: :sign_in_development
  devise_for :users
  get '/set_locale', to: 'application#set_locale'
end

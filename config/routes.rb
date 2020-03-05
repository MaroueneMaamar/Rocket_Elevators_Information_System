Rails.application.routes.draw do
  get '/residential' => "pages#residential"
  get 'pages/corporate'
  get '/submissionform' => "pages#submissionform"
  get 'pages/privacy'
  get 'pages/404'
  get 'pages/tos' 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/index' => "pages#index"
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :posts

  devise_for :users do
    get  '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/index' => "pages#index"
  root 'pages#index'

  get '/residential' => "pages#residential"
  get '/corporate' => "pages#corporate"
  get '/submissionform' => "pages#submissionform"
  get '/privacy' => "pages#privacy"
  get '/404' => "pages#404"
  get '/tos'  => "pages#tos"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

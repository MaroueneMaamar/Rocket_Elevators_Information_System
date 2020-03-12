Rails.application.routes.draw do

  resources :quotes
  # resources :posts
  # resources :quotes

  # authenticate :user do
  # end

  # authenticate :user do
  #   resources :posts, :quotes, only: [:new, :create, :edit, :update, :destroy]
  # end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#index'

  post '/quotes' => "quotes#create"
  get '/index' => "pages#index"
  get '/residential' => "pages#residential"
  get '/corporate' => "pages#corporate"
  get '/submissionform' => "quotes#submissionform"
  get '/privacy' => "pages#privacy"
  get '/404' => "pages#404"
  get '/tos'  => "pages#tos"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

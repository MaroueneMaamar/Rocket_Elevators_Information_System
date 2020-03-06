Rails.application.routes.draw do

  resources :posts
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/index' => "pages#index"
  root 'pages#index'

  get '/residential' => "pages#residential"
  get '/corporate' => "pages#corporate"
  get '/submissionform' => "pages#submissionform"
  get '/privacy' => "pages#privacy"
  get '/404' => "pages#404"
  get '/tos'  => "pages#tos"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

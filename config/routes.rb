Rails.application.routes.draw do

  resources :posts
  
  devise_for :users do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_out" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
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

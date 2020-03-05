Rails.application.routes.draw do
  resources :posts
  devise_for :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



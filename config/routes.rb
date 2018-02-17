Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, module: :users
  devise_scope :user do
   get '/users/sign_out' => 'users/sessions#destroy'
 end

  devise_for :companies, module: :companies
  devise_scope :company do
   get '/companies/sign_out' => 'companies/sessions#destroy'
 end
 
end

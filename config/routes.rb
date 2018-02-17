Rails.application.routes.draw do
  devise_for :companies, module: :companies
  root 'pages#index'

  devise_for :users, module: :users
end

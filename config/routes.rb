Rails.application.routes.draw do

  get 'companies/index'

  get 'companies/show'

  get 'users/index'

  get 'users/show'

  get 'profile_comments/new'

  get 'topic_comments/new'

  get 'profiles/new'

  get 'topics/new'

  root 'pages#index'

  devise_for :users, module: :users
  devise_scope :user do
   get '/users/sign_out' => 'users/sessions#destroy'
 end
  resources 'users', :only => [:index, :show]

  devise_for :companies, module: :companies
  devise_scope :company do
   get '/companies/sign_out' => 'companies/sessions#destroy'
 end
 resources 'companies', :only => [:index, :show]

 resources 'topics'
 resources 'profiles'
 resources 'topic_favorites', :only => [:create, :index, :destroy]
 resources 'profile_favorites', :only => [:create, :index, :destroy]
 resources 'topic_comments', :only => [:new, :create, :destroy]
 resources 'profile_comments', :only => [:new, :create, :destroy]

end

Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # defaults to dashboard
  root :to => redirect('/login')

  # view routes
  get '/singleview' => 'singleview#index'

  # api routes
  get '/api/i18n/:locale' => 'api#i18n'


  #devise_for :users, skip: [:sessions]
  #as :user do
  #  get 'login', to: 'users/sessions#new', as: :new_user_session
  #  post 'login', to: 'users/sessions#create', as: :user_session
  #  match 'logout', to: 'users/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  #  get 'singup', to: 'users/registrations#new', as: :register_user
  #end


  devise_for :users, controllers: {
         sessions: 'users/sessions',
         registrations: 'users/registrations',
         confirmations: 'users/confirmations',
       }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end

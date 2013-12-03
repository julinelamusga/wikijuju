Wikijuju::Application.routes.draw do
  get "users/show"

  get "subscriptions/new"

  get "wiki/create"

  devise_for :users

  get "index" => "welcome#index"

  get "about" => "welcome#about"

  root to: 'welcome#index'

  resources :wikis, only: [:new, :create, :show, :index] do
    resources :pages, only: [:new, :create, :show]
  end

  resources :subscriptions, only: [:create]
  resources :users, only: [:show]

end

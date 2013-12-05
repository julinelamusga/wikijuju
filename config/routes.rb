Wikijuju::Application.routes.draw do
  get "collaborators/new"

  get "collaborators/create"

  get "users/show"

  get "subscriptions/new"

  get "wiki/create"

  devise_for :users

  get "index" => "welcome#index"

  get "about" => "welcome#about"

  root to: 'welcome#index'

  resources :wikis, only: [:new, :create, :show, :index] do
    resources :pages, only: [:new, :create, :show]
    resources :collaborators, only: [:new, :create]
  end

  resources :subscriptions, only: [:create]
  resources :users, only: [:show]

end

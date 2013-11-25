Wikijuju::Application.routes.draw do
  get "wiki/create"

  devise_for :users

  get "index" => "welcome#index"

  get "about" => "welcome#about"

  root to: 'welcome#index'

  resources :wikis, only: [:new, :create, :show]

end

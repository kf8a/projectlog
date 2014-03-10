Projectlog::Application.routes.draw do
  devise_for :users
  resources :entries

  resources :tags, only: :index

  root :to => "entries#index"
end

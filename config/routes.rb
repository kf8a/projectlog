Projectlog::Application.routes.draw do
  resources :entries

  resources :tags, only: :index

  root :to => "entries#index"
end

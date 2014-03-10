Projectlog::Application.routes.draw do
  devise_for :users
  resources :entries do
    member do
      get 'tag'
    end
  end


  resources :tags, only: :index

  root :to => "entries#index"
end

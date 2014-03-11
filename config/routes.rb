Projectlog::Application.routes.draw do
  resources :categories do
    member do
      get 'tag'
    end
  end

  devise_for :users
  resources :entries do
    member do
      get 'tag'
    end
  end

  root :to => "entries#index"
end

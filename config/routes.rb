Projectlog::Application.routes.draw do
  devise_for :users
  resources :entries do
    member do
      get 'tag'
    end
  end

  root :to => "entries#index"
end

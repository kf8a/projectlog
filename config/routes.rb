Projectlog::Application.routes.draw do
  resources :categories do
    member { get 'tag' }
  end

  devise_for :users
  resources :entries do
    member { get 'tag' }
  end

  root to: 'entries#index'
end

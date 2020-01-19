Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show]
  resources :teams do
    resources :players
  end

  resources :players, only: [:show] do
    resources :moves, only: [:create, :new]
  end

  namespace 'api' do
    resources :players, only: [:create, :show]
    resources :moves, only:   [:create]
  end

  root to: 'games#index'
end

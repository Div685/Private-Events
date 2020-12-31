Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new', as: 'login'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users, only: [:index, :new, :create, :show]
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks, only: [:index, :show, :new, :edit]
  get 'signup', to: 'users#new'
  resources :users
  resources :toppages, only: [:index]
  resources :sessions, only: [:new]
end

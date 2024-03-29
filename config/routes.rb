Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets, only: %i[create edit update show destroy]

  resources :tweets, only: %i[create edit update show destroy] do
    post '/reply', to: 'tweets#create_reply'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  resources :users, only: %i[show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

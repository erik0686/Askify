Rails.application.routes.draw do
  devise_for :users

  resources :answer_ratings
  resources :questions
  resources :users
  resources :home, only: [:index]
  resources :topics, only: [:index]
  resources :categories, only: [:index]

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
